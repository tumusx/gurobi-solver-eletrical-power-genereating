\ Model Geracao de energia Eletrica
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  - 4200 qtdGertp[0,0] - 2100 qtdGertp[0,1] - 4200 qtdGertp[0,2]
   - 2100 qtdGertp[0,3] - 4200 qtdGertp[0,4] + 5850 qtdGertp[1,0]
   + 2925 qtdGertp[1,1] + 5850 qtdGertp[1,2] + 2925 qtdGertp[1,3]
   + 5850 qtdGertp[1,4] - 9000 qtdGertp[2,0] - 4500 qtdGertp[2,1]
   - 9000 qtdGertp[2,2] - 4500 qtdGertp[2,3] - 9000 qtdGertp[2,4]
   + 2000 totalMwtp[0,0] + 2000 totalMwtp[0,1] + 2000 totalMwtp[0,2]
   + 2000 totalMwtp[0,3] + 2000 totalMwtp[0,4] + 1000 totalMwtp[1,0]
   + 1000 totalMwtp[1,1] + 1000 totalMwtp[1,2] + 1000 totalMwtp[1,3]
   + 1000 totalMwtp[1,4] + 500 totalMwtp[2,0] + 500 totalMwtp[2,1]
   + 500 totalMwtp[2,2] + 500 totalMwtp[2,3] + 500 totalMwtp[2,4]
   + 12 startupTp[0,0] + 6 startupTp[0,1] + 12 startupTp[0,2]
   + 6 startupTp[0,3] + 12 startupTp[0,4] + 7.8 startupTp[1,0]
   + 3.9 startupTp[1,1] + 7.8 startupTp[1,2] + 3.9 startupTp[1,3]
   + 7.8 startupTp[1,4] + 18 startupTp[2,0] + 9 startupTp[2,1]
   + 18 startupTp[2,2] + 9 startupTp[2,3] + 18 startupTp[2,4]
Subject To
 R0: qtdGertp[0,0] <= 12
 R1: qtdGertp[0,1] <= 12
 R2: qtdGertp[0,2] <= 12
 R3: qtdGertp[0,3] <= 12
 R4: qtdGertp[0,4] <= 12
 R5: qtdGertp[1,0] <= 10
 R6: qtdGertp[1,1] <= 10
 R7: qtdGertp[1,2] <= 10
 R8: qtdGertp[1,3] <= 10
 R9: qtdGertp[1,4] <= 10
 R10: qtdGertp[2,0] <= 5
 R11: qtdGertp[2,1] <= 5
 R12: qtdGertp[2,2] <= 5
 R13: qtdGertp[2,3] <= 5
 R14: qtdGertp[2,4] <= 5
 R15: - 850 qtdGertp[0,0] + startupTp[0,0] >= 0
 R16: - 850 qtdGertp[0,1] + startupTp[0,1] >= 0
 R17: - 850 qtdGertp[0,2] + startupTp[0,2] >= 0
 R18: - 850 qtdGertp[0,3] + startupTp[0,3] >= 0
 R19: - 850 qtdGertp[0,4] + startupTp[0,4] >= 0
 R20: - 1250 qtdGertp[1,0] + startupTp[1,0] >= 0
 R21: - 1250 qtdGertp[1,1] + startupTp[1,1] >= 0
 R22: - 1250 qtdGertp[1,2] + startupTp[1,2] >= 0
 R23: - 1250 qtdGertp[1,3] + startupTp[1,3] >= 0
 R24: - 1250 qtdGertp[1,4] + startupTp[1,4] >= 0
 R25: - 1500 qtdGertp[2,0] + startupTp[2,0] >= 0
 R26: - 1500 qtdGertp[2,1] + startupTp[2,1] >= 0
 R27: - 1500 qtdGertp[2,2] + startupTp[2,2] >= 0
 R28: - 1500 qtdGertp[2,3] + startupTp[2,3] >= 0
 R29: - 1500 qtdGertp[2,4] + startupTp[2,4] >= 0
 R30: - 2000 qtdGertp[0,0] + startupTp[0,0] <= 0
 R31: - 2000 qtdGertp[0,1] + startupTp[0,1] <= 0
 R32: - 2000 qtdGertp[0,2] + startupTp[0,2] <= 0
 R33: - 2000 qtdGertp[0,3] + startupTp[0,3] <= 0
 R34: - 2000 qtdGertp[0,4] + startupTp[0,4] <= 0
 R35: - 1750 qtdGertp[1,0] + startupTp[1,0] <= 0
 R36: - 1750 qtdGertp[1,1] + startupTp[1,1] <= 0
 R37: - 1750 qtdGertp[1,2] + startupTp[1,2] <= 0
 R38: - 1750 qtdGertp[1,3] + startupTp[1,3] <= 0
 R39: - 1750 qtdGertp[1,4] + startupTp[1,4] <= 0
 R40: - 4000 qtdGertp[2,0] + startupTp[2,0] <= 0
 R41: - 4000 qtdGertp[2,1] + startupTp[2,1] <= 0
 R42: - 4000 qtdGertp[2,2] + startupTp[2,2] <= 0
 R43: - 4000 qtdGertp[2,3] + startupTp[2,3] <= 0
 R44: - 4000 qtdGertp[2,4] + startupTp[2,4] <= 0
 R45: startupTp[0,0] + startupTp[1,0] + startupTp[2,0] >= 15000
 R46: startupTp[0,1] + startupTp[1,1] + startupTp[2,1] >= 30000
 R47: startupTp[0,2] + startupTp[1,2] + startupTp[2,2] >= 25000
 R48: startupTp[0,3] + startupTp[1,3] + startupTp[2,3] >= 40000
 R49: startupTp[0,4] + startupTp[1,4] + startupTp[2,4] >= 27000
 R50: 2000 qtdGertp[0,0] + 1750 qtdGertp[1,0] + 4000 qtdGertp[2,0]
   >= 17250
 R51: 2000 qtdGertp[0,1] + 1750 qtdGertp[1,1] + 4000 qtdGertp[2,1]
   >= 34500
 R52: 2000 qtdGertp[0,2] + 1750 qtdGertp[1,2] + 4000 qtdGertp[2,2]
   >= 28750
 R53: 2000 qtdGertp[0,3] + 1750 qtdGertp[1,3] + 4000 qtdGertp[2,3]
   >= 46000
 R54: 2000 qtdGertp[0,4] + 1750 qtdGertp[1,4] + 4000 qtdGertp[2,4]
   >= 31050
 R55: qtdGertp[0,0] - totalMwtp[0,0] <= 5
 R56: qtdGertp[1,0] - totalMwtp[1,0] <= 5
 R57: qtdGertp[2,0] - totalMwtp[2,0] <= 5
 R58: - qtdGertp[0,0] + qtdGertp[0,1] - totalMwtp[0,1] <= 0
 R59: - qtdGertp[0,1] + qtdGertp[0,2] - totalMwtp[0,2] <= 0
 R60: - qtdGertp[0,2] + qtdGertp[0,3] - totalMwtp[0,3] <= 0
 R61: - qtdGertp[0,3] + qtdGertp[0,4] - totalMwtp[0,4] <= 0
 R62: - qtdGertp[1,0] + qtdGertp[1,1] - totalMwtp[1,1] <= 0
 R63: - qtdGertp[1,1] + qtdGertp[1,2] - totalMwtp[1,2] <= 0
 R64: - qtdGertp[1,2] + qtdGertp[1,3] - totalMwtp[1,3] <= 0
 R65: - qtdGertp[1,3] + qtdGertp[1,4] - totalMwtp[1,4] <= 0
 R66: - qtdGertp[2,0] + qtdGertp[2,1] - totalMwtp[2,1] <= 0
 R67: - qtdGertp[2,1] + qtdGertp[2,2] - totalMwtp[2,2] <= 0
 R68: - qtdGertp[2,2] + qtdGertp[2,3] - totalMwtp[2,3] <= 0
 R69: - qtdGertp[2,3] + qtdGertp[2,4] - totalMwtp[2,4] <= 0
Bounds
Generals
 qtdGertp[0,0] qtdGertp[0,1] qtdGertp[0,2] qtdGertp[0,3] qtdGertp[0,4]
 qtdGertp[1,0] qtdGertp[1,1] qtdGertp[1,2] qtdGertp[1,3] qtdGertp[1,4]
 qtdGertp[2,0] qtdGertp[2,1] qtdGertp[2,2] qtdGertp[2,3] qtdGertp[2,4]
 totalMwtp[0,0] totalMwtp[0,1] totalMwtp[0,2] totalMwtp[0,3] totalMwtp[0,4]
 totalMwtp[1,0] totalMwtp[1,1] totalMwtp[1,2] totalMwtp[1,3] totalMwtp[1,4]
 totalMwtp[2,0] totalMwtp[2,1] totalMwtp[2,2] totalMwtp[2,3] totalMwtp[2,4]
End
