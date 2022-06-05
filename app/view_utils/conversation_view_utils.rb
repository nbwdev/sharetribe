module ConversationViewUtils

  Conversation = EntityUtils.define_builder(
    [:id, :fixnum, :mandatory],
    [:title, :string],
    [:starter, :string, :mandatory],
    [:recipient, :string, :mandatory],
    [:started_on, :time, :mandatory],
    [:messages, :array, :mandatory]
  )

  module_function

  def conversations(conversations, community, conversations_service)
    conversations.map{
        |conversation|
        Conversation.call(
            id: conversation.id,
            title: conversation.title,
            starter: PersonViewUtils.person_display_name(conversation.starter, community),
            recipient: PersonViewUtils.person_display_name(conversation.recipient, community),
            started_on: conversation.created_at,
            messages: TransactionViewUtils.conversation_messages(conversations_service.find_conversation_with_id(conversation.id).messages.latest, community.name_display_type) 
        )
    }
  end
end
