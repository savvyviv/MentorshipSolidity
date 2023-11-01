// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthRecord {
    
    struct  Patient {
        string  name;
        uint256 age;
        string gender;
        Race race;
        uint weightKg;
        Diagnosis diagnosis;
    }

    enum Diagnosis {
        malaria,typhoid,hiv,diabetes,hypertension,pcos,renal_failure,covid
    }
    enum Race{
        african,european,asian
    }

// Public visibility
    Patient[] public patients;
    function createPatient( string memory _name, uint256 _age, string memory _gender, Race _race,uint _weightKg, Diagnosis _diagnosis) public  {
        Patient memory patient;
        patient.name = _name;
        patient.age = _age;
        patient.gender = _gender;
        patient.race = _race;
        patient.weightKg = _weightKg;
        patient.diagnosis = _diagnosis;
        patients.push(patient);
    }

    //internal visibility

    Patient[] internal patients1;
    function createInternalPatient( string memory _name, uint256 _age, string memory _gender, Race _race,uint _weightKg, Diagnosis _diagnosis) public  {
        Patient memory patient;
        patient.name = _name;
        patient.age = _age;
        patient.gender = _gender;
        patient.race = _race;
        patient.weightKg = _weightKg;
        patient.diagnosis = _diagnosis;
        patients1.push(patient);


    }

    //private visibility

    Patient[] private patients2;
    function createPrivatePatient( string memory _name, uint256 _age, string memory _gender, Race _race,uint _weightKg, Diagnosis _diagnosis) public  {
        Patient memory patient;
        patient.name = _name;
        patient.age = _age;
        patient.gender = _gender;
        patient.race = _race;
        patient.weightKg = _weightKg;
        patient.diagnosis = _diagnosis;
        patients2.push(patient);


    }


      

    

    function getPublicPatients() public view returns (string memory , uint256) {
        return (patients[0].name, patients[0].age);
    }

    function getInternalPatients() public view returns (string memory, uint256) {
        return (patients1[0].name, patients1[0].age);

    }
    function getPrivatePatients() public view returns (string memory, uint256) {
        return (patients2[0].name, patients2[0].age);
    }

}

