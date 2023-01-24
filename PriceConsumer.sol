// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "hardhat/console.sol";

contract PriceConsumerV3 {
    AggregatorV3Interface public priceFeed;
    constructor() public {
        priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    }

    function getLatestPrice() public view returns (int) {
        (,int price,,,) = priceFeed.latestRoundData();
        return(price);
    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = uint256(getLatestPrice());
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 100000000;
        return ethAmountInUSD; 
    }
}
