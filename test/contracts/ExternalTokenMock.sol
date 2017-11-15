pragma solidity ^0.4.0;


import "../../contracts/external/ExternalTokenImpl.sol";


contract ExternalTokenMock is ExternalTokenImpl {
    address public minter;

    function ExternalTokenMock() public {
        minter = msg.sender;
    }

    function checkMinter() internal {
        require(msg.sender == minter);
    }
}
