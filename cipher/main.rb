def caesar_cipher(msg, offset)
    msg_arr = []
  
    msg.chars.each do |m_char| 
      if m_char.match(/[A-Z]/)
        # wraps around 26 alphabets, mod 26
        msg_arr.push((m_char.ord + offset - 'A'.ord) % 26 + 'A'.ord)
      elsif m_char.match(/[a-z]/)
        msg_arr.push((m_char.ord + offset - 'a'.ord) % 26 + 'a'.ord)
      else
        msg_arr.push(m_char)
      end
    end
  
    encrypted_msg = msg_arr.map {|m_char| m_char.chr}
    return encrypted_msg.join
end
  
