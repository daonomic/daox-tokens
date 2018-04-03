pragma solidity ^0.4.21;


import './ExternalTokenImpl.sol';


contract TestExternalToken is ExternalTokenImpl {
    address public minter;

    function TestExternalToken() public {
        minter = msg.sender;
    }

    function checkMinter() internal {
        require(msg.sender == minter);
    }
}
