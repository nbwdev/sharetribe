class ConfirmConversationsController < ApplicationController

  before_action do |controller|
    controller.ensure_logged_in t("layouts.notifications.you_must_log_in_to_confirm_or_cancel")
  end

  before_action :set_presenter
  before_action :ensure_is_starter

  def confirm
    unless @presenter.in_valid_pre_state?
      return redirect_to person_transaction_path(person_id: @current_user.id, message_id: @presenter.transaction.id)
    end

    @presenter.action_type_confirm!
  end

  def cancel
    unless @presenter.in_valid_pre_state?
      return redirect_to person_transaction_path(person_id: @current_user.id, message_id: @presenter.transaction.id)
    end

    @presenter.action_type_cancel!
    render :confirm
  end

  def send_message
    TransactionService::Store::Transaction.add_message(community_id: @current_community.id,
      transaction_id: service.transaction.id,
      message: params[:message][:content],
      sender_id: @current_user.id)
    flash[:notice] = sent_msg
    redirect_to person_transaction_path(:person_id => @current_user.id, :id => service.transaction.id)
  end

  def message_form
    @message_form = Message.new({sender_id: @current_user.id, conversation_id: @conversation.id})
  end

  # Handles confirm and cancel forms
  def confirmation
    set_buyer_dispute_notes

    if params[:transaction][:status] == 'send_message'
      send_message

    elsif service.process
      flash[:notice] = service.flash_notice

      redirect_path =
        if service.give_feedback
          new_person_message_feedback_path(:person_id => @current_user.id, :message_id => service.transaction.id)
        else
          person_transaction_path(:person_id => @current_user.id, :id => service.transaction.id)
        end

      redirect_to redirect_path
    else
      flash[:error] = t("layouts.notifications.something_went_wrong")
      redirect_to person_transaction_path(person_id: @current_user.id, message_id: service.transaction.id)
    end
  end

  private

  def ensure_is_starter
    unless @presenter.transaction.starter == @current_user
      flash[:error] = "Only listing starter can perform the requested action"
      redirect_to (session[:return_to_content] || root)
    end
  end

  def set_presenter
    @presenter = Person::TransactionConfirmationPresenter.new(
      community: @current_community,
      user: @current_user,
      message_form: @message_form,
      params: params)
  end

  def service
    @service ||= TransactionService::Confirmation.new(
      community: @current_community,
      user: @current_user,
      params: params)
  end

  def sent_msg
    t("layouts.notifications.message_sent")
  end

  def set_buyer_dispute_notes
    if params[:message].present? && params[:message][:content].present? && params[:transaction][:status] == 'cancel'
      params[:buyer_dispute_notes] = params[:message][:content]
    end
  end
end
