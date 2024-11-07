// SPDX-License-Identifier: MIT
//0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99
pragma solidity ^0.8.0;

contract StudentData {
    // Structure to store student information
    struct Student {
        uint256 id;
        string name;
        uint8 age;
        string course;
    }

    // Array to store all students
    Student[] public students;

    // Function to add a new student
    function addStudent(uint256 _id, string memory _name, uint8 _age, string memory _course) public {
        for (uint i = 0; i < students.length; i++) {
            require(students[i].id != _id, "Student ID already exists");
        }
        students.push(Student(_id, _name, _age, _course));
    }

    // Function to get the total number of students
    function getTotalStudents() public view returns (uint256) {
        return students.length;
    }

    // Receive Ether function to accept plain Ether transfers
    receive() external payable {
        // Logic for receiving ether if needed
    }

    // Fallback function for any other invalid calls
    fallback() external payable {
        revert("Invalid function call");
    }
}
