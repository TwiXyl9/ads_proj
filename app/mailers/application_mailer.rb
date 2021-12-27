class ApplicationMailer < ActionMailer::Base
  default 'Content-Transfer-Encoding' => '7bit'
  default from: "from@example.com"
  layout "mailer"
end
