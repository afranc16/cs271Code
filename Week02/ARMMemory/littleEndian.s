
.data

@allocate 2 words with given hex values
word1:      .word    0xAABBCCDD
word2:      .word    0xEEFF0011

.space 8    @padding between items

@allocate 4 bytes with given values
bytes1:     .byte    0xAA, 0xBB, 0xCC, 0xDD
chunk:      .hword   0xEEEE 
bytes2:     .byte    0x00, 0x11

