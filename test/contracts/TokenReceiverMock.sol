pragma solidity ^0.4.0;


import '@daonomic/interfaces/contracts/TokenReceiver.sol';


contract TokenReceiverMock is TokenReceiver {
    event EventTokenTransfer(address from, uint256 value, bytes data);

    function onTokenTransfer(address _from, uint256 _value, bytes _data) public {
        EventTokenTransfer(_from, _value, _data);
    }
}
