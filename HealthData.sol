// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthRecord {
    
    struct  Patient {
        string  name;
        uint256 age;
        string gender;
        string diagnosis;
        string drugs;
    }
        // Public visibility 
    Patient public ijeoma;

    // Internal visibility 
    Patient internal mercy;

    // Private visibility 
    Patient private sirAbims;

    constructor() {
        ijeoma= Patient("Ijeoma", 30 , "Female", "Malaria", "Armatem");
        mercy = Patient("Mercy", 25 , "Female" , "Malaria", "Lonart");
        sirAbims = Patient("SirAbims", 34, "Male","Stress" , "Bedrest");
    }

    function getPublicPatient() public view returns (string memory, uint256) {
        return (ijeoma.name, ijeoma.age);
    }

    function getInternalPatient() public view returns (string memory, uint256) {
        return (mercy.name, mercy.age);

    }
    function getPrivatePatient() public view returns (string memory, uint256) {
        return (sirAbims.name, sirAbims.age);
    }

}