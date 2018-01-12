var TokenMock = artifacts.require('TestExternalToken.sol');

const tests = require("@daonomic/tests-common");
const awaitEvent = tests.awaitEvent;
const expectThrow = tests.expectThrow;

contract("TestExternalToken", function(accounts) {
    let token;
    beforeEach(async function() {
        token = await TokenMock.new();
    });

    it("should let mint", async () => {
        await token.mint(accounts[1], 50, "0x");
        assert.equal(await token.balanceOf.call(accounts[1]), 50);
    });
});


