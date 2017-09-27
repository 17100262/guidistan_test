class BasicMailer < ApplicationMailer
    def send_email(email)
        
        # mg_client = Mailgun::Client.new ENV['api_key']
        # message_params = {:from    => ENV['gmail_username'],
        #                   :to      => @user.email,
        #                   :subject => 'Sample Mail using Mailgun API',
        #                   :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
        # mg_client.send_message ENV['domain'], message_params
        
        RestClient.post "https://api:key-99bda9ea3ee959427139207059c14ea6"\
        "@api.mailgun.net/v3/guidistan.com/messages",
        :from => "Guidistan <noreply@guidistan.com>",
        :to => email,
        :subject => "Welcome",
        :text => "Hello! \n Welcome to an amazing place, welcome to Guidistan."
        
    end
    
    
    # default from: 'notifications@example.com'
 
    def welcome_email(user)
        @user = user
        # @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to Guidistan')
    end
    
end
