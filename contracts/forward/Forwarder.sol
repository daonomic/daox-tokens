pragma solidity ^0.4.21;

import "@daonomic/util/contracts/OwnableImpl.sol";
import "@daonomic/interfaces/contracts/EtherReceiver.sol";

contract Forwarder is OwnableImpl {
	function withdraw(address to, uint256 value) onlyOwner public {
		to.transfer(value);
	}

	function forward(address to, bytes data, uint256 value) payable public {
		uint256 toTransfer = value - value / 100;
		if (msg.value > toTransfer) {
			EtherReceiver(to).receiveWithData.value(toTransfer)(data);
		} else {
			EtherReceiver(to).receiveWithData.value(msg.value)(data);
		}
	}
}
