control "inspec_attributes" do
    desc "Terraform sftp endpoint output"

    describe attribute("sftp_endpoint") do
        it { should eq ".server.transfer.eu-west-1.amazonaws.com" }
    end

    describe attribute("sftp_endpoint") do
        it { should eq ".server.transfer.eu-west-1.amazonaws.com" }
    end

    describe attribute("sftp_endpoint") do
        it { should eq ".server.transfer.eu-west-1.amazonaws.com" }
    end
end
