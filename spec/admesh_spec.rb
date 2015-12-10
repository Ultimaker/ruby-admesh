describe Admesh::Admesh do
  describe "::help" do
    it "runs the admesh binary with the --help flag" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:run).with "/path/to/admesh --help"

      Admesh::Admesh.help
    end
  end

  describe "::perform" do
    it "runs the admesh binary with the options and the provided file" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:run).with "/path/to/admesh --flag --integer=3 --string=foo\\ bar foobar.stl"

      Admesh::Admesh.perform "foobar.stl", flag: true, integer: 3, string: "foo bar"
    end

    it "dasherizes keys" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:run).with "/path/to/admesh --multi-word-flag foobar.stl"

      Admesh::Admesh.perform "foobar.stl", multi_word_flag: true
    end

    it "raises an error when the command is not succesful" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      allow(Admesh::Admesh).to receive(:perform) { Admesh::Admesh.send(:run, "ls /no/directory")}

      expect { Admesh::Admesh.perform("foobar.stl") }.to raise_error(RuntimeError)
    end
  end
end
