// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {safelog} from "src/safelog.sol";

/// @author philogy <https://github.com/philogy>
contract safelogTest is Test {
    function testLog() public {
        uint[] memory wordsBefore = new uint[](32);
        for (uint i; i < wordsBefore.length; i++) {
            uint word;
            assembly {
                word := mload(mul(i, 0x20))
            }
            wordsBefore[i] = word;
        }
        safelog.log("hello (%s)", 30);
        for (uint i; i < wordsBefore.length; i++) {
            uint word;
            assembly {
                word := mload(mul(i, 0x20))
            }
            assertEq(wordsBefore[i], word);
        }
    }
}
