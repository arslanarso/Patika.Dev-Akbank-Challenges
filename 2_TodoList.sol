// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {

    struct Todo {
        string text;
        bool completed;
    }

    event NewTodo(string _text, address creator);
    event TaskCompeleted(uint _index);

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
        emit NewTodo(_text, msg.sender);

    }

    function updateText(uint _index, string calldata _text) external {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function get(uint _index) external view returns(string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // marking as completed/incompleted function
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
        emit TaskCompeleted(_index);

    }
}