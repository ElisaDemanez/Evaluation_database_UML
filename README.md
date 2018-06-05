## Evaluation_database_UML

# Thoughts behind the database : 

You can have multiple types of accounts, like client and admin for exemple. That's why the link to the client entry is not mandatory. 

One reservation is for one room, so every room can have a custom length of stay.

All numerics datas like floor space come unit-less.

Datas like bed size or room type are char(1) in order to use "c" for "chambre" or "s" for "suite", for example. 


# Changes between the UML and the .sql : 

// Dropped acc_account_type, and added acc_type in acc_account with an ENUM type
Added a comment field for reservations
# Naming convention :

Tables begins by its shortname,often composed of a few first letters, then followed by the full name of it.
Simple attributes columns are named like so : [table’ShortName]_[own_descriptive _name].

Columns with foreign keys are named : fk_[ReferencingTable’ShortName]_[ReferencedTable’ShortName] 
ex : ‘fk_res_cli’ for reservation table referencing a client
