# -*- encoding : utf-8 -*-
control "KEYC-01-000031" do
  title "Keycloak must be configured to enforce password complexity by requiring that at least one upper-case character be used."
  desc  "Password complexity, or strength, is a measure of the effectiveness of a password in resisting attempts at guessing and brute-force attacks. Use of a complex password helps to increase the time and resources required to compromise the password. The more complex the password is, the greater the number of possible combinations that need to be tested before the password is compromised."
  desc  "rationale", ""
  desc  "check", "
    If Keycloak rely on directory services for user account management, this is not applicable and the connected directory services must perform this function.
    
    Where passwords (to include randomly assigned passwords, shared secrets, and pre-shared keys) are used, verify Keycloak are configured to enforce password complexity by requiring that at least one upper-case character be used. This requirement may be verified by demonstration or configuration review.
    
    If Keycloak are not configured to require that at least one upper-case character be used, this is a finding.
    
    To confirm this setting is configured using the Keycloak admin CLI, after logging in with a privileged account, which can be done by running:
    
    kcadm.sh config credentials --server [server location] --realm master --user [username] --password [password]
    
    then run the following command:
    
    kcadm.sh get realms/[YOUR REALM] | grep 'upperCase'
    
    If configured correctly, this command should return password policy information.
    If the command returns with any empty string or null, this is a finding.
  "
  desc  "fix", "
    Configure Keycloak to enforce password complexity by requiring that at least one upper-case character be used. This includes randomly assigned passwords, shared secrets, and pre-shared keys.
    
    To configure this settings using the Keycloak admin CLI, do the following from a privileged account:
    First, find the current setting for upperCase: 
    
    kcadm.sh get realms/[YOUR REALM] | grep 'upperCase'
    
    Next, concatenate the string 'upperCase' to the current setting or update the upperCase setting if it is already set. If there is no password policy set, you can set it for the first time using the same process.
    Finally, update the password policy in corresponding to the current settings with requirement of at least one upper-case character.
    
    kcadm.sh update realms/[YOUR REALM] -s 'passwordPolicy=\"[content from current password policy] and upperCase\"'
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000166-AAA-000460"
  tag gid: nil
  tag rid: nil
  tag stig_id: "KEYC-01-000031"
  tag cci: ["CCI-000192"]
  tag nist: ["IA-5 (1) (a)"]

  test_command = "#{input('executable_path')}kcadm.sh get realms/#{input('keycloak_realm')} | grep 'upperCase'"

  describe command(test_command) do
	  its('stdout') { should_not be_empty }
  end
end