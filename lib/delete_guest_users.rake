desc 'Delete guest users'
task :delete_guest_users => :environment do
    guest_users = User.where("username like ?", "%Guest%")

    guest_users.each do |guest| 
        guest.lists.each do |list|
            list.todos.delete_all
        end
    end

    guest_users.each do |guest| 
        guest.lists.delete_all
    end

    guest_users.delete_all
end