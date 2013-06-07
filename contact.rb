class Contact

	@@new_id = 0
	attr_accessor :id, :first_name, :last_name, :email, :notes
	
	def initialize(first,last,email,notes)
		# id will increment each time a new contact is created
		@id = id_counter
		@first_name = first
		@last_name = last
		@email = email
		@notes = notes
	end

	def display_contacts
		puts "ID: #{@id}"
		puts "First name: #{@first_name}"
		puts "Last name: #{@last_name}"
		puts "Email: #{@email}"
		puts "Notes: #{@notes}"
	end

	#increments id when the add_contact method is called from class Database
	def id_counter
		@@new_id += 1
	end

end