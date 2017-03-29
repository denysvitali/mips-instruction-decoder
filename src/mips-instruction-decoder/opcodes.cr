module Mips::Instruction::Decoder
  class Opcode
    OPCODES = {
      "8" => ["addi", "I"],
      "9" => ["addiu", "I"],
      "23" => ["lw", "I"],
      "21" => ["lh", "I"],
      "25" => ["lhu", "I"],
      "20" => ["lb", "I"],
      "24" => ["lbu", "I"],
      "2B" => ["sw", "I"],
      "29" => ["sh", "I"],
      "28" => ["sb", "I"],
      "F" => ["lui", "I"],
      "C" => ["andi", "I"],
      "D" => ["ori", "I"],
      "E" => ["xori", "I"],
      "A" => ["slti", "I"],
      "4" => ["beq", "I"],
      "5" => ["bneq", "I"],
      "2" => ["j", "J"],
      "jal" => ["3", "J"],
      "0" => ["", "R"],
    }
  end
end
