class Application
 
  # def initialize
  #   # Start with an empty array of contacts.
  #   # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
  #   #@contacts = []
  # end
 
  def run
    create_stub_data # temporary
    # set_quit = false

    while true
      show_main_menu
      input = get_input

      #binding.pry

      abort("Have a nice day!") if input == "quit"

      if input == "new"
        new_contact_creation
      elsif input == "list"
        Contact.all.each do |record|
          print record.first_name + " "
          print record.last_name + " "
          puts record.email 
        end 
      elsif input == "show"
        #puts Contact.all
        #Contact.to_s
        puts "Which id?"
        id_selected = get_input.to_i
        current_contact = Contact.find_by id: id_selected
        #contact = Contact.get(id_selected)
        puts "Contact details below:"
        print current_contact.id.to_s + " " + current_contact.first_name + " " 
        puts current_contact.last_name + " " + current_contact.email
        puts "Do you want to edit this contact? y or n?"
        if get_input == "y"
          puts "What do you want to edit? fname, lname, or email?"
          choice = get_input

          case choice
            when "fname"
              puts "New first name?"
              new_first_name = get_input
              current_contact.update(:first_name => new_first_name)
            when "lname"
              puts "New last name?"
              new_last_name = get_input
              current_contact.update(:last_name => new_last_name)
            when "email"
              puts "New email?"
              new_email = get_input
              current_contact.update(:email => new_email)
          end

        end
      elsif input == "delete"
        puts "Which id?"
        id_selected = get_input.to_i
        Contact.delete(id_selected)
      elsif input == "importance"
        Contact.where(importance: [1,2,3,4,5]).order("importance").each do |record|
        #Contact.all.each do |record|
          print record.importance.to_s + " "
          print record.first_name + " "
          print record.last_name + " "
          puts record.email 
        end
      elsif input == "search"
        puts "What do you want to search by? fname, lname, or email?"
        search_option = get_input
        case search_option
          when "fname"
            puts "Enter the first name."
            search_first_name = get_input
            found_contact = Contact.find_by first_name: search_first_name
            puts "Contact details below:"
            print found_contact.id.to_s + " " + found_contact.first_name + " " 
            puts found_contact.last_name + " " + found_contact.email
          when "lname"
            puts "Enter the last name."
            search_last_name = get_input
            found_contact = Contact.find_by last_name: search_last_name
            puts "Contact details below:"
            print found_contact.id.to_s + " " + found_contact.first_name + " " 
            puts found_contact.last_name + " " + found_contact.email
          when "email"
            puts "Enter the email."
            search_email = get_input
            found_contact = Contact.find_by email: search_email
            puts "Contact details below:"
            print found_contact.id.to_s + " " + found_contact.first_name + " " 
            puts found_contact.last_name + " " + found_contact.email
        end
        
      end
    end

  end

  private 

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new        - Create a new contact"
    puts " list       - List all contacts"
    puts " show :id   - Display contact details"
    puts " delete: id - Deletes contact record"
    puts " importance - sorted list by importance"
    puts " search     - search for contact"
    puts " quit       - Quit the application"
    print "> "
  end

  def get_contact_information
    puts "What is the first name?"
    first_name = get_input

    puts "What is the last name?"
    last_name = get_input

    puts "What is the email?"
    email = get_input

    puts "Level of importance? (1-5)"
    importance = get_input

    [first_name, last_name, email, importance]
  end

  def new_contact_creation
    first_name, last_name, email, importance = get_contact_information
    Contact.create(first_name: first_name, last_name: last_name, email: email, importance: importance)
  end

  def create_stub_data
  end

  def get_input
    gets.chomp.strip
  end
 
end