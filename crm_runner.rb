require_relative "database"

class CrmRunner

	def self.run
		@database = Database.new

		while true

			puts "Enter your choice: 'add', 'display all', 'modify', 'display attribute', 'display contact, 'delete' 'exit'"

			choice = gets.chomp
			case choice
			when "add"
				@database.add_contact
			when "display all"
				@database.display_all_contacts
			when "modify"
				@database.modify_contact
			when "display attribute"
				@database.display_by_attribute
			when "display contact"
				@database.display_particular_contact
			when "delete"
				@database.delete_contact
			end
		
			if choice == "exit"
				break
			end
		end
	end
end

CrmRunner.run