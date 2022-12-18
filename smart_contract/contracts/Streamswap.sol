// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/utils/Strings.sol';
import 'AggregatorV3Interface.sol';
import 'StblCoinUpgradeable.sol';

contract EthSwap {
    address immutable public owner;

    StblCoinUpgradeable private USD;

    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy.");
        locked = true;
        _;
        locked = false;
    }

    event TokenSwap(address account, uint256 tokenGiven, uint256 tokenTaken);

    constructor() {
        // Owner set
        owner = msg.sender;
        
        // ETH: 0x3Fd66c900d75CB7F6e2dA4745B47C4946d45Da5a;
        // USDC: 0x3Fd66c900d75CB7F6e2dA4745B47C4946d45Da5a;
    }

    receive() external payable {}

    function getLatestPrice(address _tokenAddress) internal view returns (int price) {
        AggregatorV3Interface oracle = AggregatorV3Interface(_tokenAddress);

        (
            ,
            price,
            ,
            ,
            
        ) = oracle.latestRoundData();
    }

    function swapEthForToken(address _token, uint256 _amount) public payable {
        uint256 price = getLatestPrice(_token);
        if (price > 1e12) {
            uint value = 1e13 / price;
            _amount = _amount * value;
        }
    }

    function swapForEth(address _token, uint256 eth) public payable  {
        
    }

}
