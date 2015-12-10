describe Admesh do
  it "should provide the right path to the compiled executable" do
    executable_dir = File.dirname(Admesh.send(:executable_path))
    expect(Dir.exists?(executable_dir)).to eq true
  end

  describe "::help" do
    it "runs the admesh binary with the --help flag" do
      allow(Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh).to receive(:run).with "/path/to/admesh --help"

      Admesh.help
    end
  end

  describe "::perform" do
    it "runs the admesh binary with the options and the provided file" do
      allow(Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh).to receive(:run).with "/path/to/admesh --flag --integer=3 --string=foo\\ bar foobar.stl"

      Admesh.perform "foobar.stl", flag: true, integer: 3, string: "foo bar"
    end

    it "dasherizes keys" do
      allow(Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      expect(Admesh).to receive(:run).with "/path/to/admesh --multi-word-flag foobar.stl"

      Admesh.perform "foobar.stl", multi_word_flag: true
    end

    it "raises an error when the command is not succesful" do
      allow(Admesh).to receive(:executable_path).and_return "/path/to/admesh"
      allow(Admesh).to receive(:perform) { Admesh.send(:run, "ls /no/directory")}

      expect { Admesh.perform("foobar.stl") }.to raise_error(RuntimeError)
    end
  end
end
