// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {ZKERC20} from "../src/ZKERC20.sol";
import {Groth16Verifier} from "../src/ZKPVerifier.sol";

contract DeployZKERC20 is Script {
    function run() external returns (ZKERC20, Groth16Verifier) {
        vm.startBroadcast(msg.sender);

        ZKERC20 token = new ZKERC20();
        Groth16Verifier verifier = new Groth16Verifier();

        vm.stopBroadcast();

        return (token, verifier);
    }
}
