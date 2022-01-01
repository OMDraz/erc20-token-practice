// contracts/Ourtoken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    uint256 public publicSaleStartTimestamp;

    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }

    modifier whenPublicSaleActive() {
        require(isPublicSaleOpen(), "Public sale is not open");
        _;
    }

    modifier whenEarlyAccessActive() {
        require(isEarlyAccessOpen(), "Early access not open");
        _;
    }

    function isPublicSaleOpen() public view returns (bool) {
        return
            block.timestamp >= publicSaleStartTimestamp &&
            publicSaleStarttimestamp != 0;
    }

    function isEarlyAccessOpen() public view returns (bool) {
        return
            !isPublicSaleOPen() &&
            block.timestamp >= earlyAccessStartTimestamp &&
            earlyAccessStartTimestamp != 0;
    }

    function setPublicSaletimestamp(uint256 timestamp) external onlyOwner {
        publicSaleStartTimestamp = timestamp;
    }
}
