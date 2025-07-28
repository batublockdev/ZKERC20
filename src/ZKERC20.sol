// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ZKERC20 is ERC20 {
    constructor() ERC20("sERC20", "sERC20") {}

    function mint(
        address account,
        uint256 balanceHashed,
        uint256 newBalanceHash,
        uint256[8] memory _proof,
        uint256 msgTransfer
    ) external {
        _mint(account, balanceHashed, newBalanceHash, _proof, msgTransfer);
    }

    function burn(
        address account,
        uint256 newBalanceHash,
        uint256[8] memory _proof,
        uint256 msgTransfer
    ) external {
        _burn(account, newBalanceHash, _proof, msgTransfer);
    }
}
