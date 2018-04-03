pragma solidity ^0.4.21;

import "@daonomic/interfaces/contracts/EtherReceiver.sol";

contract EtherReceiverMock is EtherReceiver {
	event EtherReceived(address sender, uint256 value, bytes data);

	function receiveWithData(bytes _data) payable public {
		emit EtherReceived(msg.sender, msg.value, _data);
	}
}
