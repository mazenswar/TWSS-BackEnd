class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        @conversation = Conversation.find(message_params[:conversation_id])
        @user = User.find(message_params[:user_id])
        if @message.save
            @user_convo = UserConvo.create(user: @user, conversation: @conversation)
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
                MessageSerializer.new(@message)
            ).serializable_hash
            MessagesChannel.broadcast_to @conversation, serialized_data
            head :ok
        end
    end

    def message_params
        params.require(:message).permit(:content, :conversation_id, :user_id)
    end

end
