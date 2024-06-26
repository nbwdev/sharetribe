module TransactionHelper

  def icon_for(status)
    case status
    when "confirmed"
      "ss-check"
    when "rejected"
      "ss-delete"
    when "canceled"
      "ss-delete"
    when "accepted"
      "ss-check"
    when "paid"
      "ss-check"
    when "preauthorized"
      "ss-check"
    when "pending_ext"
      "ss-alert"
    when "accept_preauthorized"
      "ss-check"
    when "reject_preauthorized"
      "ss-delete"
    when "errored"
      "ss-delete"
    end
  end

  # Give `status`, `is_author` and `other_party` and get back icon and text for current status
  # rubocop:disable all
  def conversation_icon_and_status(status, is_author, other_party_name, waiting_feedback, status_meta)
    icon_waiting_you = icon_tag("alert", ["icon-fix-rel", "waiting-you"])
    icon_waiting_other = icon_tag("clock", ["icon-fix-rel", "waiting-other"])

    # Split "confirmed" status into "waiting_feedback" and "completed"
    status = if waiting_feedback
      "waiting_feedback"
    else
      "completed"
    end if status == "confirmed"

    status_hash = {
      pending: ->() {
        ActiveSupport::Deprecation.warn("Transaction state 'pending' is deprecated and will be removed in the future.")
        {
          author: {
            icon: icon_waiting_you,
            text: t("conversations.status.waiting_for_you_to_accept_request") 
          },
          starter: {
            icon: icon_waiting_other,
            text: t("conversations.status.waiting_for_listing_author_to_accept_request", listing_author_name: other_party_name)
          }
        } },
      preauthorized: ->() { {
        author: {
          icon: icon_waiting_you,
          text: t("conversations.status.waiting_for_you_to_accept_request") 
        },
        starter: {
          icon: icon_waiting_other,
          text: t("conversations.status.waiting_for_listing_author_to_accept_request", listing_author_name: other_party_name)
        }
      } },
      accepted: ->() {
        ActiveSupport::Deprecation.warn("Transaction state 'accepted' is deprecated and will be removed in the future.")
          {
          author: {
            icon: icon_waiting_other,
            text: t("conversations.status.waiting_payment_from_requester", requester_name: other_party_name)
          },
          starter: {
            icon: icon_waiting_you,
            text: t("conversations.status.waiting_payment_from_you")
          }
        } },
      pending_ext: ->() {
        case status_meta[:paypal_pending_reason]
        when "multicurrency"
          {
            author: {
              icon: icon_waiting_you,
              # Make this aware of the reason
              text: t("conversations.status.pending_external_inbox.paypal.multicurrency")
            },
            starter: {
              icon: icon_waiting_other,
              text: t("conversations.status.waiting_for_listing_author_to_accept_request", listing_author_name: other_party_name)
            }
          }
        when "intl"
          {
            author: {
              icon: icon_waiting_you,
              # Make this aware of the reason
              text: t("conversations.status.pending_external_inbox.paypal.intl")
            },
            starter: {
              icon: icon_waiting_other,
              text: t("conversations.status.waiting_for_listing_author_to_accept_request", listing_author_name: other_party_name)
            }
          }
        when "verify"
          {
            author: {
              icon: icon_waiting_you,
              # Make this aware of the reason
              text: t("conversations.status.pending_external_inbox.paypal.verify")
            },
            starter: {
              icon: icon_waiting_other,
              text: t("conversations.status.waiting_for_listing_author_to_accept_request", listing_author_name: other_party_name)
            }
          }
        else # some pending_ext reason we don't have special message for
          {
            author: {
              icon: icon_waiting_you,
              text: t("conversations.status.pending_external_inbox.paypal.unknown_reason")
            },
            starter: {
              icon: icon_waiting_other,
              text: t("conversations.status.waiting_for_listing_author_to_accept_request", listing_author_name: other_party_name)
            }
          }
        end
      },

      rejected: -> () { {
        both: {
          icon: icon_tag("cross", ["icon-fix-rel", "rejected"]),
          text: t("conversations.status.request_rejected")
        }
      } },

      paid: ->() { {
        author: {
          icon: icon_waiting_other,
          text: t("conversations.status.waiting_confirmation_from_requester", requester_name: other_party_name)
        },
        starter: {
          icon: icon_waiting_you,
          text: t("conversations.status.waiting_confirmation_from_you")
        }
      } },

      waiting_feedback: ->() { {
        both: {
          icon: icon_waiting_you,
          text: t("conversations.status.waiting_feedback_from_you")
        }
      } },

      completed: ->() { {
        both: {
          icon: icon_tag("check", ["icon-fix-rel", "confirmed"]),
          text: t("conversations.status.request_confirmed")
        }
      } },

      canceled: ->() { {
        both: {
          icon: icon_tag("cross", ["icon-fix-rel", "canceled"]),
          text: t("conversations.status.request_canceled")
        }
      } },

      disputed: ->() { {
        both: {
          icon: icon_tag("clock", ["icon-fix-rel", "canceled"]),
          text: t("conversations.status.waiting_for_marketplace_review")
        }
      } },

      errored: ->() { {
        both: {
          icon: icon_tag("cross", ["icon-fix-rel", "canceled"]),
          text: t("conversations.status.payment_errored")
         }
      } },

      refunded: ->() { {
        both: {
          icon: icon_tag("refund", ["icon-fix-rel", "confirmed"]),
          text: t("conversations.status.refunded")
         }
      } },

      dismissed: ->() { {
        both: {
          icon: icon_tag("dismiss", ["icon-fix-rel", "confirmed"]),
          text: t("conversations.status.dismissed")
         }
      } },
    }

    Maybe(status_hash)[status.to_sym]
      .map { |s| s.call }
      .map { |s| Maybe(is_author ? s[:author] : s[:starter]).or_else { s[:both] } }
      .values
      .get
  end
  # rubocop:enable all

  #
  # Returns statuses in Hash format
  # statuses = [
  #   {
  #     type: :status_info,
  #     content: {
  #       info_text_part: 'msg',
  #       info_icon_tag: ''               # e.g. icon_tag("testimonial", ["icon-with-text"])
  #     }
  #   },
  #   {
  #     type: :status_info,
  #     content: {
  #       info_text_part: 'msg',
  #       info_icon_part_classes: 'class1 class2'
  #     }
  #   },
  #   {
  #     type: :status_links,
  #     content: [{
  #         link_href: "/path/to/somewhere" # url
  #         link_classes: '[if-any]'
  #         link_data: {},                  # e.g. {:method => "put", :remote => "true"}
  #         link_icon_tag: '[some-tag]>',   # OR link_icon_with_text_classes: icon_for("accepted")
  #         link_text_with_icon: 'Something'
  #       },
  #       {}
  #     ]
  #   }
  # }
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def get_conversation_statuses(conversation, is_author)
    statuses = if conversation.listing && !conversation.status.eql?("free")
      status_hash = {
        paid: -> { {
          author: [
            status_info(t("conversations.status.request_paid"), icon_classes: icon_for("paid")),
            delivery_status(conversation),
            payment_will_arrive(conversation)
          ],
          starter: [
            status_info(t("conversations.status.request_paid"), icon_classes: icon_for("paid")),
            delivery_status(conversation),
            paid_status(conversation)
          ]
        }
              },
        preauthorized: -> { {
          author: [
            status_info(t("conversations.status.seller_request_preauthorized"), icon_classes: icon_for("preauthorized"),
              additional_text:t("conversations.status.seller_request_preauthorized_additional", end_date: get_expiry_date_time(conversation))),
            preauthorized_status(conversation)
          ],
          starter: [
            status_info(t("conversations.status.buyer_request_preauthorized"), icon_classes: icon_for("preauthorized")),
            preauthorized_status(conversation)
          ]
        }
                       },
        pending_ext: -> {
          ## This is so wrong place to call services...
          #TODO Deprecated call, update to use PaypalService::API:Api.payments.get_payment
          paypal_payment = PaypalService::Store::PaypalPayment.for_transaction(conversation.id)

          reason = Maybe(conversation).transaction_transitions.last.metadata["paypal_pending_reason"]

          case reason
          when Some("multicurrency")
            {
              author: [
                status_info(t("conversations.status.pending_external.paypal.multicurrency", currency: paypal_payment[:payment_total].currency, paypal_url: link_to("https://www.paypal.com", "https://www.paypal.com")).html_safe, icon_classes: icon_for("pending_ext"))
              ],
              starter: [
                status_info(t("conversations.status.buyer_request_preauthorized"), icon_classes: icon_for("preauthorized")),
                preauthorized_status(conversation)
              ]
            }
          when Some("intl")
            {
              author: [
                status_info(t("conversations.status.pending_external.paypal.intl", paypal_url: link_to("https://www.paypal.com", "https://www.paypal.com")).html_safe, icon_classes: icon_for("pending_ext"))
              ],
              starter: [
                status_info(t("conversations.status.buyer_request_preauthorized"), icon_classes: icon_for("preauthorized")),
                preauthorized_status(conversation)
              ]
            }
          when Some("verify")
            {
              author: [
                status_info(t("conversations.status.pending_external.paypal.verify", paypal_url: link_to("https://www.paypal.com", "https://www.paypal.com")).html_safe, icon_classes: icon_for("pending_ext"))
              ],
              starter: [
                status_info(t("conversations.status.buyer_request_preauthorized"), icon_classes: icon_for("preauthorized")),
                preauthorized_status(conversation)
              ]
            }
          end
        },
        confirmed: -> { {
          both: [
            status_info(t("conversations.status.request_confirmed"), icon_classes: icon_for("confirmed")),
            feedback_status(conversation)
          ]
        }
                   },
        canceled: -> {
          {
            both: [
              status_info(t("conversations.status.request_canceled"), icon_classes: icon_for("canceled")),
              feedback_status(conversation)
            ]
          }
                  },
        disputed: -> {
          contact_link = link_to t("conversations.status.contact_them"), new_user_feedback_path
          {
            both: [
              status_info(t("conversations.status.order_canceled"), icon_classes: icon_for("canceled")),
              status_info(t("conversations.status.waiting_for_marketplace_review"), icon_classes: 'ss-clock'),
              status_info(t("conversations.status.marketplace_notified", contact_link: contact_link).html_safe, icon_classes: 'ss-mail'),
            ]
          }
                  },
        rejected: -> { {
          both: [
            status_info(t("conversations.status.request_rejected"), icon_classes: icon_for(conversation.status))
          ]
        }
                  },
        errored: -> { {
          author: [
            status_info(t("conversations.status.payment_errored_author", starter_name: conversation.starter.name(conversation.community)), icon_classes: icon_for("errored"))
          ],
          starter: [
            status_info(t("conversations.status.payment_errored_starter"), icon_classes: icon_for("errored"))
          ]
        }
                 },
        refunded: -> {
          contact_link = link_to t("conversations.status.contact_the_marketpalce_team"), new_user_feedback_path
          {
          author: [
            status_info(t("conversations.status.order_refunded"), icon_classes: icon_class('refund')),
            status_info(t('conversations.status.do_you_disagree', contact_link: contact_link).html_safe, icon_classes: icon_class('mail')),
            feedback_status(conversation)
          ],
          starter: [
            status_info("#{t('conversations.status.order_refunded')} #{t('conversations.status.you_should_receive_refund_soon')}", icon_classes: icon_class('refund')),
            status_info(t('conversations.status.issue_with_the_refund', contact_link: contact_link).html_safe, icon_classes: icon_class('mail')),
            feedback_status(conversation)

          ]
          }
                  },
        dismissed: -> {
          contact_link = link_to t("conversations.status.contact_the_marketpalce_team"), new_user_feedback_path
          {
          author: [
            status_info(t("conversations.status.order_cancellation_dismissed"), icon_classes: icon_class('dismiss')),
            status_info(t('conversations.status.do_you_disagree', contact_link: contact_link).html_safe, icon_classes: icon_class('mail')),
            feedback_status(conversation)
          ],
          starter: [
            status_info(t("conversations.status.order_cancellation_dismissed"), icon_classes: icon_class('dismiss')),
            status_info(t('conversations.status.do_you_disagree', contact_link: contact_link).html_safe, icon_classes: icon_class('mail')),
            feedback_status(conversation)
          ]
          }
                   }
      }

      Maybe(status_hash)[conversation.status.to_sym]
        .map { |s| s.call }
        .map { |s| Maybe(is_author ? s[:author] : s[:starter]).or_else { s[:both] } }
        .or_else([])
    else
      []
    end

    statuses.flatten.compact
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  private

  def paid_status(conversation)
    if conversation.seller == @current_user
      waiting_for_buyer_to_confirm(conversation)
    else
      waiting_for_current_user_to_confirm(conversation)
    end
  end

  def delivery_status(conversation)
    if current_user?(conversation.author)
      status_info(
        t("conversations.status.waiting_for_current_user_to_deliver_listing",
          :listing_title => link_to(conversation.listing.title, conversation.listing),
          :requester_name => PersonViewUtils.person_display_name(conversation.other_party(@current_user), conversation.community)
        ).html_safe,
        icon_classes: "ss-clockwise"
      )
    else
      status_info(
        t("conversations.status.waiting_for_listing_author_to_deliver_listing",
          :listing_title => link_to(conversation.listing.title, conversation.listing),
          :listing_author_name => link_to(PersonViewUtils.person_display_name(conversation.author, conversation.community))
        ).html_safe,
        icon_classes: "ss-clockwise"
      )
    end
  end

  def payment_will_arrive(conversation)
    if current_user?(conversation.author)
      status_info(
        t("conversations.status.waiting_for_current_user_to_deliver_listing_2",
          :listing_title => link_to(conversation.listing.title, conversation.listing),
          :requester_name => PersonViewUtils.person_display_name(conversation.other_party(@current_user), conversation.community)
        ).html_safe,
        icon_classes: "ss-clockwise"
      )
    end
  end

  def preauthorized_status(transaction)
    if current_user?(transaction.listing.author)
      waiting_for_current_user_to_accept_preauthorized(transaction)
    else
      waiting_for_author_to_accept_preauthorized(transaction)
    end
  end

  def feedback_status(conversation)
    if conversation.has_feedback_from?(@current_user)
      feedback_given_status
    elsif conversation.feedback_skipped_by?(@current_user)
      feedback_skipped_status
    else
      feedback_pending_status(conversation)
    end
  end

  def waiting_for_current_user_to_confirm(conversation)
    status_links([
      {
        link_href: confirm_person_message_path(@current_user, :id => conversation.id),
        link_classes: "confirm",
        link_icon_with_text_classes: icon_for("confirmed"),
        link_text_with_icon: link_text_with_icon(conversation, "confirm")
      },
      {
        link_href: cancel_person_message_path(@current_user, :id => conversation.id),
        link_classes: "cancel",
        link_icon_with_text_classes: icon_for("canceled"),
        link_text_with_icon: link_text_with_icon(conversation, "cancel")
      }
    ])
  end

  def waiting_for_current_user_to_accept_preauthorized(transaction)
    status_links([])
  end

  def feedback_pending_status(conversation)
    status_links([
      {
        link_href: new_person_message_feedback_path(@current_user, :message_id => conversation.id),
        link_classes: "accept",
        link_icon_tag: icon_tag("testimonial", ["icon-with-text"]),
        link_text_with_icon: t("conversations.status.give_feedback")
      },
      {
        link_href: skip_person_message_feedbacks_path(@current_user, :message_id => conversation.id),
        link_classes: "cancel",
        link_icon_with_text_classes: "ss-skipforward",
        link_text_with_icon: t("conversations.status.skip_feedback"),
        link_data: { :method => "put", :remote => "true"}
      }
    ])
  end

  def status_links(content)
    {
      type: :status_links,
      content: content
    }
  end

  def link_text_with_icon(conversation, status_link_name)
    if ["accept", "reject", "accept_preauthorized", "reject_preauthorized"].include?(status_link_name)
      t("conversations.status_link.#{status_link_name}_request")
    else
      t("conversations.status_link.#{status_link_name}")
    end
  end

  def waiting_for_buyer_to_confirm(conversation)
    key = conversation.payment_gateway == :stripe ? "conversations.status.stripe.waiting_confirmation_from_requester" : "conversations.status.waiting_confirmation_from_requester"
    link = t(key,
      :requester_name => link_to(
        PersonViewUtils.person_display_name(conversation.other_party(@current_user), conversation.community),
        conversation.other_party(@current_user)
      )
    ).html_safe

    status_info(link, icon_classes: 'ss-clock')
  end

  def waiting_for_author_to_accept_preauthorized(transaction)
    text = t("conversations.status.waiting_for_listing_author_to_accept_request",
      listing_author_name: link_to(
        PersonViewUtils.person_display_name(transaction.author, transaction.community),
        transaction.author
      )
    ).html_safe

    status_info(text, icon_classes: 'ss-clock')
  end

  # This should very much be in the Transaction class
  def get_expiry_date_time(transaction)
    payment_type = transaction.payment_gateway.to_sym
    gateway_expires = TransactionService::Transaction.authorization_expiration_period(payment_type)

    expires = Maybe(transaction).booking.end_on.map { |booking_end|
      TransactionService::Transaction.preauth_expires_at(gateway_expires.days.from_now, booking_end)
    }.or_else(gateway_expires.days.from_now)

    buffer = 1.minute # Add a small buffer (it might take a couple seconds until the email is sent)
    expires_at = date_format(expires + buffer)
    #expires_in = TimeUtils.time_to(expires_at)
  end

  def feedback_given_status
    status_info(t("conversations.status.feedback_given"), icon_tag: icon_tag("testimonial", ["icon-part"]))
  end

  def feedback_skipped_status
    status_info(t("conversations.status.feedback_skipped"), icon_classes: "ss-skipforward")
  end

  def status_info(text, icon_tag: nil, icon_classes: nil, additional_text: nil)
    hash = {
      type: :status_info,
      content: {
        info_text_part: text,
        additional_info_text: additional_text
      }
    }

    if icon_tag
      hash.deep_merge(content: {info_icon_tag: icon_tag})
    elsif icon_classes
      hash.deep_merge(content: {info_icon_part_classes: icon_classes})
    else
      hash
    end
  end
end
