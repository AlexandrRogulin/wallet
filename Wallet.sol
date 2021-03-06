
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Wallet {
    /*
     Exception codes:
      100 - message sender is not a wallet owner.
      101 - invalid transfer value.
     */

    /// @dev Contract constructor.
    constructor() public {
        // check that contract's public key is set
        require(tvm.pubkey() != 0, 101);
        // Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }


    // Modifier that allows function to accept external call only if it was signed
    // with contract owner's public key.
    modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 100);

		tvm.accept();
		_;
	}

    /// @dev Allows to transfer tons to the destination account.
    /// @param dest Transfer target address.
    /// @param amount Nanotons value to transfer.
    /// @param bounce Flag that enables bounce message in case of target contract error.

    function sendWithComission(address dest, uint128 amount, bool bounce) public pure checkOwnerAndAccept {
        dest.transfer(amount, bounce, 1);
    }

    function sendWithoutComission(address dest, uint128 amount, bool bounce) public pure checkOwnerAndAccept {
        dest.transfer(amount, bounce, 0);
    }

    function sendAndDelete(address dest, uint128 amount, bool bounce) public pure checkOwnerAndAccept {
        dest.transfer(amount, bounce, 160);
    }
}