control "inspec_attributes" do
    desc "Terraform sftp endpoint output"
    sftp_id = attribute("sftp_id")
    describe attribute("sftp_endpoint") do
        it { should eq "#{sftp_id}.server.transfer.eu-west-1.amazonaws.com" }
    end
end
