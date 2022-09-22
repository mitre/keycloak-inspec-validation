# -*- encoding : utf-8 -*-
control "KEYC-01-000057" do
  title "Keycloak must be configured with a minimum granularity of one second to record time stamps for audit records."
  desc  "
    Without sufficient granularity of time stamps, it is not possible to adequately determine the chronological order of records. 
    
    Time stamps generated by the application include date and time. Granularity of time measurements refers to the degree of synchronization between information system clocks and reference clocks.
  "
  desc  "rationale", ""
  desc  "check", "
    Verify Keycloak are configured with a minimum granularity of one second to record time stamps for audit records.
    
    If Keycloak are not configured with a minimum granularity of one second to record time stamps for audit records, this is a finding.
    
    To confirm this setting is configured using the Keycloak admin CLI, after logging in with a privileged account, which can be done by running:
    
    kcadm.sh config credentials --server [server location] --realm master --user [username] --password [password]
    
    then run the following command:
    
    kcadm.sh get events/config -r [realm]
    
    If the results are not as follows, then it is a finding.
    
    \"eventsEnabled\" : true, 
    \"eventsListeners\" : [ \"jboss-logging\" ],
    \"enabledEventTypes\" : [ APPROPRIATE EVENT TYPES ],
    \"adminEventsEnabled\" : true,
    \"adminEventsDetailsEnabled\" : true
    
    Then inspect recorded time from log messages. If the recorded messages does not use a minimum granularity of one second to record time stamps for audit records entry, this is a finding. 
    
    Then check keycloak configuration file, keycloak.conf. If the file does not contain the following key-value pairs, it is a finding. 
    
    spi-events-listener-jboss-logging-success-level=info
    spi-events-listener-jboss-logging-error-level=error
    log-console-format=\"'%d{[TIME FORMATTING WITH MINIMUM GRANULARITY OF ONE SECOND]} [OTHER FORMATTING SYMBOLS]'\"
  "
  desc  "fix", "
    Configure Keycloak with a minimum granularity of one second to record time stamps for audit records.
    
    To configure this setting using the Keycloak admin CLI, do the following from a privileged account:
    
    kcadm.sh update events/config -r [realm] -s eventsEnabled=true -s eventsListeners=[\"jboss-logging\"] -s adminEventsEnabled=true -s adminEventsDetailsEnabled=true
    
    Then create or update Keycloak logging format with the following line in your keycloak configuration file, keycloak.conf:
    
    spi-events-listener-jboss-logging-success-level=info
    spi-events-listener-jboss-logging-error-level=error
    log-console-format=\"'%d{yyyy-MM-dd HH:mm:ss,SSS} [OTHER FORMATTING SYMBOLS]'\"
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: "SRG-APP-000375-AAA-000330"
  tag gid: nil
  tag rid: nil
  tag stig_id: "KEYC-01-000057"
  tag cci: ["CCI-001889"]
  tag nist: ["AU-8 b"]

  test_command = "#{input('executable_path')}kcadm.sh get events/config -r #{input('keycloak_realm')}"

  describe json(content: command(test_command).stdout) do
	  its('eventsEnabled') { should eq true }
	  # TODO: Should this be tested as below in case of other possible eventsListeners?
	  its('eventsListeners') { should eq ["jboss-logging"] }
	  its('adminEventsEnabled') { should eq true }
	  its('adminEventsDetailsEnabled') { should eq true }
  end

  # comment that more enabledEventTypes can be added, this is a minimum
  describe 'JSON content' do
	  it 'enabledEventTypes is expected to include enabled_event_types listed in inspec.yml' do
		  actual_events_enabled = json(content: command(test_command).stdout)['enabledEventTypes']
		  missing = actual_events_enabled - input('enabled_event_types')
		  failure_message = "The generated JSON output does not include: #{missing}"
		  expect(missing).to be_empty, failure_message
	  end
  end

  # describe 'JSON content' do
  #   it 'eventsListeners is expected to include events_listeners listed in inspec.yml' do
  # 	  actual_events_listeners = json(content: command(test_command).stdout)['eventsListeners']
  # 	  missing = actual_events_listeners - input('events_listeners')
  # 	  failure_message = "The generated JSON output does not include: #{missing}"
  # 	  expect(missing).to be_empty, failure_message
  #   end
  # end

  describe file('/opt/keycloak/conf/keycloak.conf') do
	  it { should exist }
	  its('content') { should match(%r{^spi-events-listener-jboss-logging-success-level=info}) }
	  its('content') { should match(%r{^spi-events-listener-jboss-logging-error-level=error}) }
	  # TODO:  inspec.yml has var waiting to be filled for log_console_format
	  # TODO: this syntax has not been tested
	  # its('content') { should match(%r{^log-console-format=#{input('log_console_format')}}) }
  end
end