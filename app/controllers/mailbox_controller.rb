class MailboxController < ApplicationController
	before_action :authenticate_user!

	def inbox
		@inbox = mailbox.inbox
		@active = :inbox
	end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

end
