pragma solidity ^0.4.18;

import "@daonomic/interfaces/contracts/EtherReceiver.sol";

contract EtherReceiverMock is EtherReceiver {
	event EtherReceived(address sender, uint256 value, bytes data);

	function receiveWithData(bytes _data) payable public {
		EtherReceived(msg.sender, msg.value, _data);
	}
}
