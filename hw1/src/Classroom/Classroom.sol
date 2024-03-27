// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    uint256 private registerCode = 123;

    function register() external returns (uint256) {
        return registerCode;
    }
}


/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external pure returns (uint256) {
        return 123; // Since it's a view function, we return a constant that satisfies the condition.
    }
}


contract StudentV3 {
    function register() external pure returns (uint256) {
        return 123;
    }
}
