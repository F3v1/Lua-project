print("---------------------------------------------------------")
print("------------------Notes-program by F3v1------------------")
print("---------------------------------------------------------")
print("")

local notes = {}

local function showMenu()
    print("\nNotes App")
    print("1. Add a Note")
    print("2. Show All Notes")
    print("3. Delete a Note")
    print("4. Exit")
    io.write("Choose an option: ")
end

local function addNote()
    io.write("Enter your note: ")
    local note = io.read()
    if note and note ~= "" then
        table.insert(notes, note)
        print("Note added successfully!")
    else
        print("Empty note was not added.")
    end
end

local function listNotes()
    if #notes == 0 then
        print("No notes available.")
    else
        print("\nYour Notes:")
        for i, note in ipairs(notes) do
            print(i .. ". " .. note)
        end
    end
end

local function deleteNote()
    listNotes()
    if #notes == 0 then return end
    io.write("Enter the number of the note to delete: ")
    local input = io.read()
    local index = tonumber(input)
    if index and index >= 1 and index <= #notes then
        table.remove(notes, index)
        print("Note deleted successfully!")
    else
        print("Invalid number.")
    end
end

local running = true
while running do
    showMenu()
    local choice = io.read()
    if choice == "1" then
        addNote()
    elseif choice == "2" then
        listNotes()
    elseif choice == "3" then
        deleteNote()
    elseif choice == "4" then
        running = false
        print("Exiting Notes App. Goodbye!")
    else
        print("Invalid choice, please try again.")
    end
end
