## Evaluation_database_UML

#Naming convention :

Tables begins by its shortname,often composed of a few first letters, then followed by the full name of it.
Simple attributes columns are named like so : [table’ShortName]_[own_descriptive _name].

Columns with foreign keys are named : fk_[ReferencingTable’ShortName]_[ReferencedTable’ShortName] 
ex : ‘fk_res_cli’ for reservation table referencing a client
