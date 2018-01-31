var Forwarder = artifacts.require('Forwarder.sol');
var ReceiverMock = artifacts.require('EtherReceiverMock.sol');

const tests = require("@daonomic/tests-common");
const awaitEvent = tests.awaitEvent;
const expectThrow = tests.expectThrow;
const randomAddress = tests.randomAddress;

contract("Forwarder", function(accounts) {
    let forwarder;
    let receiver;
    beforeEach(async function() {
		forwarder = await Forwarder.new();
		receiver = await ReceiverMock.new();
    });

    it("should forward with 1% fee", async () => {
		var Event = receiver.EtherReceived({});
		await forwarder.forward(receiver.address, "0xffff", 1000, {value: 995});
		assert.equal(await web3.eth.getBalance(receiver.address), 990);
		assert.equal(await web3.eth.getBalance(forwarder.address), 5);

		var event = await awaitEvent(Event);
		assert.equal(event.args.sender, forwarder.address);
		assert.equal(event.args.value, 990);
		assert.equal(event.args.data, "0xffff");
    });

    it("should let withdraw ether", async () => {
        var address = randomAddress();

		await forwarder.forward(receiver.address, "0xffff", 1000, {value: 1000});
        await forwarder.withdraw(address, 2);
        assert.equal(await web3.eth.getBalance(forwarder.address), 8);
        assert.equal(await web3.eth.getBalance(address), 2);
    });
});


