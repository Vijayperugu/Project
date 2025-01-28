// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {
    struct Product {
        string uuid;
        address manufacturer;
        string metadata;
        bool isGenuine;
    }

    mapping(string => Product) public products;
    event ProductRegistered(string uuid, address manufacturer);

    function registerProduct(string memory _uuid, string memory _metadata) public {
        require(products[_uuid].manufacturer == address(0), "Product already exists");
        products[_uuid] = Product(_uuid, msg.sender, _metadata, true);
        emit ProductRegistered(_uuid, msg.sender);
    }

    function verifyProduct(string memory _uuid) public view returns (bool) {
        require(products[_uuid].manufacturer != address(0), "Product not found");
        return products[_uuid].isGenuine;
    }
}