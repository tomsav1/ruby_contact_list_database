require 'active_record'
class Contact < ActiveRecord::Base

  @@instances = []

  # Contact.having_email?(email)
  # class method
  def self.email_taken?(email)
    @@instances.detect { |contact| contact.email == email }
  end

  # Contact.create
  def self.create(first, last, email)
    unless email_taken?(email)
      contact = new(first, last, email)
      @@instances << contact
    end
  end

  def self.get(id)
          @@instances[id.to_i]
  end

  def self.all
          @@instances
  end

  def self.count
          @@instances.size
  end

  def self.instances
          @@instances
  end

  def to_s
    "id: #{@id} #{@first_name} #{@last_name} (#{@email})\n"
  end

  private

  # private methods here
  
end