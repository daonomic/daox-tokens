pragma solidity ^0.4.11;


import './TokenImpl.sol';
import './ApprovalReceiver.sol';


/**
 * @dev This token notifies contract when it receives approval from the user
 */
contract ApprovalNotifyToken is TokenImpl {
    function approveAndCall(address _spender, uint256 _value, bytes _data) returns (bool success) {
        approve(_spender, _value);
        ApprovalReceiver(_spender).receiveApproval(msg.sender, _value, this, _data);
        return true;
    }
}