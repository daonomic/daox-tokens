pragma solidity ^0.4.18;

import "@daonomic/util/contracts/OwnableImpl.sol";
import "@daonomic/interfaces/contracts/EtherReceiver.sol";

contract Forwarder is OwnableImpl {
	function withdraw(address to, uint256 value) onlyOwner public {
		to.transfer(value);
	}

	function forward(address to, bytes data) payable public {
		uint256 commission = msg.value / 100;
		EtherReceiver(to).receiveWithData.value(msg.value - commission)(data);
	}
}
