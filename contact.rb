require 'active_record'
class Contact < ActiveRecord::Base

  #validates :importance, inclusion: { in: %w(nil 1 2 3 4 5), message: "%{value} is not a valid importance level" }
  #validates :email, uniqueness: true

  #@@instances = []

  # Contact.having_email?(email)
  # class method
  def self.email_taken?(email)
    #@@instances.detect { |contact| contact.email == email }
    Contact.all.detect { |contact| contact.email == email }
  end

  # Contact.create
  #def self.create(first, last, email)
  #   unless email_taken?(email)
  #     contact = new(first, last, email)
  #     #@@instances << contact
  #     Contact << contact
  #   end
  # end

  # def self.get(id)
  #         #@@instances[id.to_i]
  #         Contact.find_by(id: id.to_i)
  # end

  # def self.all
  #         #@@instances
  #         Contact.all
  # end

  # def self.count
  #         #@@instances.size
  #         Contact.size
  # end

  # def self.instances
  #         #@@instances
  #         Contact
  # end

  def to_s
    "id: #{@id} #{@first_name} #{@last_name} (#{@email})\n"
  end

  private

  # private methods here
  
end