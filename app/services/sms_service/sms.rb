class SmsService::Sms
	include HTTParty
	base_uri 'https://smschef.com'
	def initialize(phone_number,msg)
    @options = { query: { key: AppConfig['sms_api_key'], phone: phone_number, message:msg } }
  end

  def send
    response = self.class.get("/system/api/send", @options)
    return response
  end

end
