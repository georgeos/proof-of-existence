// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProofOfExistence {
    mapping(bytes32 => bool) private proofs;

    /// @notice store a proof of existence in the contract state
    /// @param proof to store
    function storeProof(bytes32 proof) internal {
        proofs[proof] = true;
    }

    /// @notice calculate and store the proof for a document
    /// @param document to store
    function notarize(string calldata document) external {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    /// @notice helper function to get a document's sha256
    /// @param document to validate
    /// @return document hash
    function proofFor(string memory document) public pure returns (bytes32) {
        return keccak256(bytes(document));
    }

    /// @notice check if a document has been notarized
    /// @param document to validate
    /// @return proof of existence
    function checkDocument(string memory document) public view returns (bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    /// @notice returns true if proof is stored
    /// @param proof to validate
    /// @return proof of existence
    function hasProof(bytes32 proof) internal view returns (bool) {
        return proofs[proof];
    }
}
