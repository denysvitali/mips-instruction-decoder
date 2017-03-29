module Mips::Instruction::Decoder
  class Function
    FUNCTIONS = {
      "20" => "add",
      "22" => "sub",
      "21" => "addu",
      "23" => "subu",
      "18" => "mult",
      "1a" => "div",
      "19" => "multu",
      "1b" => "divu",
      "10" => "mfhi",
      "12" => "mflo",
      "24" => "and",
      "25" => "or",
      "27" => "nor",
      "26" => "xor",
      "0" => "sll",
      "2" => "srl",
      "3" => "sra",
      "4" => "sllv",
      "6" => "srlv",
      "7" => "srav",
      "2a" => "slt",
      "2b" => "sltu",
      "8" => "jr",
      "9" => "jalr",
      "c" => "syscall"
    }
  end
end
