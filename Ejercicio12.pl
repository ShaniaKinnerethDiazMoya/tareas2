   0:# INIT TABLES
   3:# 
   4:# ======= START RUNG 1 =======
   5:LabelRung1:
   6:
   7:set bit '$rung_top'
   9:# start series [
  10:# ELEM_CONTACTS
  11:if 'XB1' {
  12:    clear bit '$rung_top'
  13:}
  15:# ELEM_COIL
  16:let bit 'YLED1' := '$rung_top'
  18:# ] finish series
  19:LabelRung2:
  20:
  21:# Latest INT_OP here
