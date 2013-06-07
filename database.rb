require_relative "contact"

class Database

	attr_accessor :database_array
	
	def initialize
		@database_array = []
	end

	def add_contact
		
		puts "Enter first name"
		first_name = gets.chomp
		puts "Enter last name"
		last_name = gets.chomp
		puts "Enter email"
		email = gets.chomp
		puts "Enter any notes"
		notes = gets.chomp
		@database_array << Contact.new(first_name,last_name,email,notes)

	end

	# can modify any of the five contact attributes for a given contact
	def modify_contact

		puts "\nAttribute to modify (ID, first name, last name, email): "
		attribute_to_modify = gets.chomp

		puts "are you sure? (yes/no)"
		user_answer = gets.chomp

			if user_answer == "yes"

				puts "Which contact do you want modified?"
				contact_to_modify = gets.chomp

				puts "Please enter new value"
				new_value = gets.chomp
					if attribute_to_modify == "id" 
						@database_array[@database_array.index {|x| 
							x.id||x.first_name||x.last_name||x.email == contact_to_modify}].new_name = new_value

					elsif attribute_to_modify == "first name" 
					 	@database_array[@database_array.index {|x| 
					 		x.id || x.first_name || x.last_name || x.email == contact_to_modify}].first_name = new_value

					elsif attribute_to_modify == "last name" 
						@database_array[@database_array.index {|x| 
							x.id || x.first_name || x.last_name || x.email == contact_to_modify}].last_name = new_value				

					elsif attribute_to_modify == "email" 
						@database_array[@database_array.index {|x| 
							x.id || x.first_name || x.last_name || x.email == contact_to_modify}].email = new_value

					else
						puts "Please try again!\n"
					end
			end
	end

	# displays all contacts in the database with complete information
	def display_all_contacts
		for i in 0..@database_array.length-1
			puts ""
			@database_array[i].display_contacts
			puts ""
		end
			
	end

	# displays only one specific contact
	def display_particular_contact
		puts "Which contact would you like displayed? (ID, first name, last name, email):"
		contact_display = gets.chomp.downcase
			@database_array.each do |x|
				if contact_display == x.id || contact_display == x.first_name ||
					contact_display == x.last_name || contact_display ==x.email
					x.display_contacts
				end
			end
	end

	# display all instances of a specific attribute in the database
	def display_by_attribute
		puts "\nEnter attribute to display (ID, first name, last name, email):"
		attribute = gets.chomp.downcase

		if attribute == "id"
			@database_array.each {|x| puts x.id}

		elsif attribute == "first name"
			@database_array.each {|x| puts x.first_name}

		elsif attribute == "last name"
			@database_array.each {|x| puts x.last_name}

		elsif attribute == "email"
			@database_array.each {|x| puts x.email}

		else
			puts "Please try again!"
		end		
	end

	def delete_contact
		puts "Select a contact to delete (ID, first name, last name, email):"
		contact_to_delete = gets.chomp.downcase
		index = @database_array.index do |x| 
			x.id||x.first_name||x.last_name||x.email == contact_to_delete
		end

		@database_array[index].display_contacts
		puts "Is this the contact you want to delete? (yes/no)"
		confirmation = gets.chomp.downcase
		if confirmation == "yes"
			@database_array.delete_at(index)
		end

	end


end