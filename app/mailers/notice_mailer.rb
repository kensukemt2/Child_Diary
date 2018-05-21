class NoticeMailer < ApplicationMailer
  def notice_mail(notice)
    @notice = notice
    @mail_sender = notice.user.followers
    mail to: @mail_sender.pluck(:email), subject: "更新のお知らせ"
  end
end
