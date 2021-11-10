class Customer < ActiveRecord::Base
  acts_as_tenant(:store_configuration)
  has_many :sales
  def full_name
  	"#{first_name} #{last_name}"
  end

  def full_name_with_phone
    "#{first_name} #{last_name} (#{phone_number})"
  end

  def full_name_with_phone_city
    "#{full_name_with_phone} (#{self.city})"
  end

  def full_name_with_id
  end

  def international_phone_format
    '92'+self.phone_number[1..11]
  end

  def city_address
    self.city+' '+self.address if city.present?
  end

  def balance
    self.sales.sum(:remaining_amount)
  end
end
