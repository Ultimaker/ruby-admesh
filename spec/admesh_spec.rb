describe Admesh::Admesh do
  describe "::help" do
    it "runs the admesh binary with the --help flag" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:exec).with "/path/to/admesh --help"

      Admesh::Admesh.help
    end
  end
end
