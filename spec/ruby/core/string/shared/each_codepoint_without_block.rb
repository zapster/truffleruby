# -*- encoding: binary -*-
describe :string_each_codepoint_without_block, shared: true do
  describe "when no block is given" do
    it "returns an Enumerator" do
      "".send(@method).should be_an_instance_of(enumerator_class)
    end

    it "returns an Enumerator even when self has an invalid encoding" do
      s = "\xDF".force_encoding(Encoding::UTF_8)
      s.valid_encoding?.should be_false
      s.send(@method).should be_an_instance_of(enumerator_class)
    end

    describe "returned Enumerator" do
      describe "size" do
        it "should return the size of the string" do
          str = "hello"
          str.send(@method).size.should == str.size
          str = "ola"
          str.send(@method).size.should == str.size
          before = $KCODE
          $KCODE = "UTF-8"
          str = "\303\207\342\210\202\303\251\306\222g"
          str.send(@method).size.should == str.size
          $KCODE = before
        end

        it "should return the size of the string even when the string has an invalid encoding" do
          s = "\xDF".force_encoding(Encoding::UTF_8)
          s.valid_encoding?.should be_false
          s.send(@method).size.should == 1
        end
      end
    end
  end
end
