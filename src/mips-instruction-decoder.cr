require "./mips-instruction-decoder/*"

module Mips::Instruction::Decoder

  registers = Mips::Instruction::Decoder::Register::REGISTERS
  functions = Mips::Instruction::Decoder::Function::FUNCTIONS

  puts "Insert MIPS instruction:"
  inst = STDIN.gets("\n")
  if !(inst =~ /^0x[0-9A-F]{8}/) || !inst
    puts "Input is invalid"
    exit
  end

  match = inst.match /^0x([0-9A-F]{8})/
  if !match
    exit
  end

  puts

  hex = match[1]
  binary = hex.hexbytes.map { |x| "%08b" % x }.join()
  opcode = binary[0,6].to_i(2).to_s(16)

  instruction = Mips::Instruction::Decoder::Opcode::OPCODES[opcode]

  if instruction[1] == "I"
    # op (6), rs (5), rt (5), imm (16)
    rs = registers[binary[6,5].to_i(2)];
    rt = registers[binary[11,5].to_i(2)];
    imm = binary[16,16].to_i(2);

    puts "#{instruction[0]} #{rt}, #{rs}, #{imm}"
  elsif instruction[1] == "R"
    # op (6), rs (5), rt (5), rd (5), shamt (5), funct (6)
    funct = functions[binary[26,6].to_i(2).to_s(16)];

    if funct == "jr"
      rs = registers[binary[6,5].to_i(2)]
      puts "#{funct} #{rs}"
    else
      rs = registers[binary[6,5].to_i(2)];
      rt = registers[binary[11,5].to_i(2)];
      rd = registers[binary[16,5].to_i(2)];
      shamt = binary[21,5].to_i;

      puts "#{funct} #{rd}, #{rs}, #{rt} % shmt: #{shamt}"
    end
  elsif instruction[1] == "J"
    # op(6), addr (26)
    addr = binary[6,26]
    puts "#{instruction[0]} 0x#{addr.to_i(2).to_s(16)}"
  end

end
