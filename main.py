import gurobipy as gp
import pandas as pd
from gurobipy import GRB

tiposGeradores = 3
quantidadeDePeriodoTempo = 5
maxstart0 = 5

## definindo os valores dos parametro
qtdGers = [12, 10, 5]
p_h = [6, 3, 6, 3, 6]
demandp = [15000, 30000, 25000, 40000, 27000]
min_load = [850, 1250, 1500]
max_load = [2000, 1750, 4000]
base_cost = [1000, 2600, 3000]
mw_cost = [2, 1.3, 3]
cost_init = [2000, 1000, 500]

model = gp.Model('Geracao de energia Eletrica')

# colocando as variaveis de decisao
qtdGertp = model.addVars(tiposGeradores, quantidadeDePeriodoTempo, vtype=GRB.INTEGER, name="qtdGertp")
totalMwtp = model.addVars(tiposGeradores, quantidadeDePeriodoTempo, vtype=GRB.INTEGER, name="totalMwtp")
startupTp = model.addVars(tiposGeradores, quantidadeDePeriodoTempo, vtype=GRB.CONTINUOUS, name="startupTp")

# adicionando as variaveis de restricao
qtdGer = model.addConstrs(qtdGertp[type, period] <= qtdGers[type]
                          for type in range(tiposGeradores) for period in range(quantidadeDePeriodoTempo))

# fazendo com que seja respeitado o mínimo e o máximo de cada saída do gerador por tipo

min_mw = model.addConstrs((startupTp[type, period] >= min_load[type] * qtdGertp[type, period])
                          for type in range(tiposGeradores) for period in range(quantidadeDePeriodoTempo))

max_mw = model.addConstrs((startupTp[type, period] <= max_load[type] * qtdGertp[type, period])
                          for type in range(tiposGeradores) for period in range(quantidadeDePeriodoTempo))
# pegando a demanda
meet_demand = model.addConstrs(gp.quicksum(startupTp[type, period] for type in range(tiposGeradores)) >= demandp[period]
                               for period in range(quantidadeDePeriodoTempo))

# providenciando a reserva
reservaMW = model.addConstrs(
    gp.quicksum(max_load[type] * qtdGertp[type, period] for type in range(tiposGeradores)) >= 1.15 * demandp[period]
    for period in range(quantidadeDePeriodoTempo))

initStart = model.addConstrs((qtdGertp[type, 0] <= maxstart0 + totalMwtp[type, 0])
                             for type in range(tiposGeradores))

startup = model.addConstrs((qtdGertp[type, period] <= qtdGertp[type, period - 1] + totalMwtp[type, period])
                           for type in range(tiposGeradores) for period in range(1, quantidadeDePeriodoTempo))

# # cada variavel dessa representa uma parte da função objetivo. no caso, a gente segregou aqui a função objetivo em
# 3 partes e depois juntaremos somando o resultado de # cada uma

gerActive = gp.quicksum(base_cost[type] * p_h[period] * qtdGertp[type, period]
                        for type in range(tiposGeradores) for period in range(quantidadeDePeriodoTempo))

value_per_mw = gp.quicksum(
    mw_cost[type] * p_h[period] * (startupTp[type, period] - min_load[type] * qtdGertp[type, period])
    for type in range(tiposGeradores) for period in range(quantidadeDePeriodoTempo))

startup_obj = gp.quicksum(cost_init[type] * totalMwtp[type, period]
                          for type in range(tiposGeradores) for period in range(quantidadeDePeriodoTempo))

model.setObjective(gerActive + value_per_mw + startup_obj)
model.optimize()

rows = ["Tipo " + str(t) for t in range(tiposGeradores)]
units = pd.DataFrame(columns=range(quantidadeDePeriodoTempo), index=rows, data=0.0)

for t in range(tiposGeradores):
    for p in range(quantidadeDePeriodoTempo):
        units.loc["Tipo " + str(t), p] = qtdGertp[t, p].x
units
print("----resultado----")

print(units)
