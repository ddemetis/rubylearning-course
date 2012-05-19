old_inventory = File.readlines('old_inventory.txt').collect {|item| item.chomp}
new_inventory = File.readlines('new_inventory.txt').collect {|item| item.chomp}


files_deleted = old_inventory - new_inventory
files_added = new_inventory - old_inventory
files_moved = []

#find if any files deleted and added could be same file thus possibly moved
files_added.each do |added_file|
  files_deleted.each do |deleted_file|
    files_moved << deleted_file if File.basename(deleted_file) == File.basename(added_file)
  end
end


puts "Files deleted: #{files_deleted}"
puts "Files added: #{files_added}"
puts "Files possibly moved: #{files_moved}"

