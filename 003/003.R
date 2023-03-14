

bond_strength <- load_file(
    path = "https://raw.githubusercontent.com/gaboraszabo/datasets-for-sherlock/main/bond_strength_multivari.csv", 
    filetype = ".csv")


bond_strength %>% View()
View(bond_strength)

# 
bond_strength %>% glimpse()
glimpse(bond_strength)


bond_strength %>% 
    head()







bond_strength$Bond_Strength

bond_strength$Bond_Strength[1]


# 4. PLOT 
bond_strength



bond_strength %>% 
    draw_categorical_scatterplot(y_var = `Bond Strength`)

bond_strength %>% 
    draw_categorical_scatterplot(y_var = `Bond Strength`, 
                                 grouping_var_1 = `Bonding Station`,
                                 plot_means     = TRUE)
bond_strength %>% 
    draw_categorical_scatterplot(y_var = `Bond Strength`, 
                                 grouping_var_1 = `Bonding Station`, 
                                 grouping_var_2 = `Stopcock Mold Cavity Number`, 
                                 size = 3,
                                 jitter = FALSE)





bond_strength %>% 
    group_by(Line) %>% 
    summarize(mean_bond_stregnth = mean(Bond_Strength))


bond_strength %>% 
    mutate(Bond_Strength_N = Bond_Strength * 4.44822) %>% 
    select(index, Bond_Strength, Bond_Strength_N, everything())