pragma solidity ^0.4.21;


import '@daonomic/interfaces/contracts/TokenReceiver.sol';


contract TokenReceiverMock is TokenReceiver {
    event EventTokenTransfer(address from, uint256 value, bytes data);

    function onTokenTransfer(address _from, uint256 _value, bytes _data) public {
        emit EventTokenTransfer(_from, _value, _data);
    }
}
