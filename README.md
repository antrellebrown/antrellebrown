## [AnTrelle Brown's](https://github.com/antrellebrown/antrellebrown) Cybersecurity Project Portfolio 


[Vulnerability Management Simulation Project](https://github.com/antrellebrown/vulnerability-management/blob/main/README.md)<br>
Documented the end-to-end implementation of a Vulnerability Management (VM) Program for a fictional cloud-native organization.<br>

Objective: integrate Tenable into an Azure environment to identify, prioritize, and remediate software and OS-level vulnerabilities, directly reducing the organization’s attack surface and overall risk profile.

Technical Stack: 
- Microsoft Azure (Virtual Machines, VNETs, Network Security Groups)
- Scanning Engine: Tenable
- Compliance Framework: NIST 800-53
- Remediation: Automated Patching using PowerShell scripts & Manual Configuration Hardening

This simulated project takes a look at what it could take to implement a comprehensive vulnerability management program from inception to completion, including: creating the Vulnerability Management Policy Draft, initial asset scan, assessing and prioritizing vulnerabilities, provided example of remediation scripts that would be helpful to assisting the Server team with rememdiation. 

---

Hands On Labs:

[Tenable DISA STIG Scan and Remediation Activities](https://github.com/antrellebrown/antrellebrown/tree/main/STIGs)
<br>DISA STIGs - what are they? why are they important? who uses these? <br>

Defense Information Systems Agency (DISA) Security Technical Implementation Guide (STIG) are a set of guidelines the U.S. Department of Defense uses for securing systems and networks. DISA STIGs are mandatory for systems in the DoD Information Network and for DoD contractors. They are essentially detailed checklists used to assist administrators in configuring IT assets securely and cover multiple products and systmes including OS, databases, applications and network devices. 

My hands on practice for this section involved spinning up a Windows 11 virtual machine in our Azure environment, creating a new scan in Tenable with the DISA/STIG scan template then scanning the VM and using the noted failures in the scans Audits tab for remediation with PowerShell. 





  

<!--
**antrellebrown/antrellebrown** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
