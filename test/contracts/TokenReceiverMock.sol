pragma solidity ^0.4.0;


import "../../contracts/standard/TokenReceiver.sol";


contract TokenReceiverMock is TokenReceiver {
    event EventTokenTransfer(address from, uint256 value, bytes data);

    function onTokenTransfer(address _from, uint256 _value, bytes _data) {
        EventTokenTransfer(_from, _value, _data);
    }
}
