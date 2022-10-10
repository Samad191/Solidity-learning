// STORAGE
// storage type is state level and is written on the blockchain and state is persisted
// It is a pointer
// If a value 'a' is assigned to a value 'b' which is storage type so both will have
// the same pointer and if one is changed the other changes as well
// Like a computer hard drive

// MEMORY
// It is used in variable in a function or as parameter and is destroyed when the
// function execution is completed 
// It creates a copy
// It does not changes if assigned to another as creates a copy
// Like a RAM
// Can be modified

// CALLDATA
// It is used as parameter type on function with type external
// Is used with external type functions
// Similar to memory
// Low gas cost
// If a function argument type is calldata the value cannot be changed
// Like a USB (external data)
// Cannot be modified