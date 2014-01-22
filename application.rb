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
        Contact.all.each do |thing|
          print thing
        end 
      elsif input == "show"
        #puts Contact.all
        #Contact.to_s
        puts "Which id?"
        id_selected = get_input
.to_i
        contact = Contact.get(id_selected)
        puts "Contact details below:"
        puts contact # automatic conversion to string
        puts "Do you want to edit this contact? y or n?"
        if get_input == "y"
          puts "What do you want to edit? fname, lname, or email?"
          choice = get_input

          case choice
            when "fname"
              puts "New first name?"
              new_first_name = get_input

              contact.first_name  = new_first_name
            when "lname"
              puts "New last name?"
              new_last_name = get_input

              contact.last_name  = new_last_name
            when "email"
              puts "New email?"
              new_email = get_input

              contact.email = new_email
          end
        end
      end
    end

  end

  private 

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show :id - Display contact details"
    puts " quit     - Quit the application"
    print "> "
  end

  def get_contact_information
    puts "What is the first name?"
    first_name = get_input

    puts "What is the last name?"
    last_name = get_input

    puts "What is the email?"
    email = get_input

    [first_name, last_name, email]
  end

  def new_contact_creation
    first_name, last_name, email = get_contact_information
    Contact.create(first_name, last_name, email)
  end

  def create_stub_data

  end

  def get_input
    gets.chomp.strip
  end
 
end