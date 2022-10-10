pragma solidity ^0.8.0;

contract ToDo {

    struct Todo {
        string text;
        bool completed;
    }

    Todo [] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({ text: _text, completed: false }));
    }

    function updateText(uint index, string calldata _text) external {
        todos[index].text = _text;

        //  Both are the same thing but second is expensive
        // Todo storage todo = todos[index];
        // todo.text = _text;
    }

    function get(uint index) external view returns(string memory, bool) {
        Todo memory todo = todos[index];
        return (todo.text, todo.completed);
    }

}