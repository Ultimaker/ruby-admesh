describe Admesh::Admesh do
  describe "::help" do
    it "runs the admesh binary with the --help flag" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:exec).with "/path/to/admesh --help"

      Admesh::Admesh.help
    end
  end

  describe "::perform" do
    it "runs the admesh binary with the options and the provided file" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:exec).with "/path/to/admesh --flag --integer=3 --string=foo\\ bar foobar.stl"

      Admesh::Admesh.perform "foobar.stl", flag: true, integer: 3, string: "foo bar"
    end

    it "dasherizes keys" do
      allow(Admesh::Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh::Admesh).to receive(:exec).with "/path/to/admesh --multi-word-flag foobar.stl"

      Admesh::Admesh.perform "foobar.stl", multi_word_flag: true
    end
  end
end
