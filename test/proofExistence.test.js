var ProofOfExistence = artifacts.require("./ProofOfExistence.sol")

contract('ProofOfExistence', function () {

    beforeEach(async () => {
        instance = await ProofOfExistence.new()
    })

    it("should store document", async () => {
        await instance.notarize("Hello world!")

        const proof = await instance.checkDocument("Hello world!")
        assert(proof, 'document doesnt exist')
    });

});