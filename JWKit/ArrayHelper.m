//
//  ArrayHelper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ArrayHelper.h"

@implementation ArrayHelper

-(NSArray *)brazilStatesOnlyAcronym {
    
    NSArray *statesOnlyAcronym = [[NSArray alloc] initWithObjects:@"AC",@"AL",@"AP",@"AM",@"BA",@"CE",@"DF",@"ES",@"GO",@"MA",@"MT",@"MS",@"MG",@"PA",@"PB",@"PR",@"PE",@"PI",@"RJ",@"RN",@"RS",@"RO",@"RR",@"SC",@"SP",@"SE",@"TO", nil];
    
    return statesOnlyAcronym;
    
}

-(NSArray *)brazilStatesOnlyName {
    
    NSArray *statesOnlyName = [[NSArray alloc] initWithObjects:@"Acre",@"Alagoas",@"Amapá",@"Amazonas",@"Bahia",@"Ceará",@"Distrito Federal",@"Espírito Santo",@"Goiás",@"Maranhão",@"Mato Grosso",@"Mato Grosso do Sul",@"Minas Gerais",@"Pará",@"Paraíba",@"Paraná",@"Pernambuco",@"Piauí",@"Rio de Janeiro",@"Rio Grande do Norte",@"Rio Grande do Sul",@"Rondônia",@"Roraima",@"Santa Catarina",@"São Paulo",@"Sergipe",@"Tocantins", nil];
    
    return statesOnlyName;
    
}

@end
