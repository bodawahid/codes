int count_units = 0 ;
int count_tenth = 0 ;
short flag = 0 ;
void interrupt()
{
     if(intf_bit == 1)
     {
                 intf_bit = 0 ;
                 while(portb.B0 == 1) {
                                   if(portb.b5 == 1)
                                   {
                                           if((portc.b0 ==1) || (portc.b1 == 1))
                                           {
                                                       if(portc.b0 == 1)
                                                                   portc = 0b00010010 ;
                                                       porta.b0 = 1 ;
                                                       porta.b1 = 0 ;
                                                        for(count_units = 3 ; count_units >= 0 ; count_units--)
                                                        {
                                                            portd = count_units ;
                                                            delay_ms(500) ;
                                                        }
                                                        porta.B1 = 1 ;
                                                        portc = 0b01000100 ;
                                                        flag = 3 ;
                                                       while(portb.B0 == 1 && portb.b5 ==1) ;
                                           }
                                           else if(portc.b6 == 1 || portc.b5 ==1)
                                           {
                                                            if(portc.b6 == 1)
                                                                        portc = 0b00100100 ;
                                                            porta.B1 = 1 ;
                                                            porta.b0 = 0 ;
                                                             for(count_units = 3 ; count_units >= 0 ; count_units--)
                                                             {
                                                                             portd = count_units ;
                                                                             delay_ms(500) ;
                                                             }
                                                              porta.b0 = 1 ;
                                                              portc = 0b00010001 ;
                                                              flag = 2  ;
                                                              while(portb.B0 == 1 && portb.b5 ==1) ;
                                           }
                                   }
                 }
     }
}
void main() {
     ADCON1 =  6  ;
     trisa = 0 ;
     porta = 0 ;
     trisc = 0 ;
     portc = 0;
     trisd = 0 ;
     portd = 255 ;
     trisb.b0 = 1 ;
     trisb.b5 = 1 ;
     while(portb.b0) ;
     while(1)
     {
                 if(flag == 0 || flag == 2)
                 {
                   porta = 0 ;
                   portc.b4 = 1 ;
                   portc.b0 = 1 ;
                   for(count_tenth = 35 ; count_tenth >= 0 ; count_tenth -- )
                   {
                                   if(count_tenth <= 31 && count_tenth >= 26 || (count_tenth <= 15 && count_tenth >= 10))
                                                  continue ;
                                   if( count_tenth == 0x03)
                                   {
                                        portc.b0 = 0 ;
                                        portc.b1 = 1 ;
                                   }
                                   portd = count_tenth ;
                                   flag = 1 ;
                                   delay_ms(500) ;
                                   if(portb.b0 == 1)
                                   {
                                              INTE_BIT = 1;
                                              INTEDG_BIT = 1 ;
                                              GIE_BIT = 1;
                                   }
                                    if(flag != 1)
                                                      break ;
                   }
                 }
                 else if(flag == 1 || flag == 3)
                 {
                 porta =  0 ;
                 portc = 0 ;
                 portc.b6 =1 ;
                 portc.b2 = 1 ;
                   for(count_tenth = 21 ; count_tenth >= 0 ; count_tenth -- )
                   {
                                   if(count_tenth <= 15 && count_tenth >= 10)
                                                  continue ;
                                   if( count_tenth == 0x03)
                                   {
                                       portc.B6 = 0 ;
                                       portc.B5 = 1 ;
                                   }
                                   portd = count_tenth ;
                                   flag = 0 ;
                                   delay_ms(500) ;
                                   if(portb.b0 == 1)
                                   {
                                              INTE_BIT = 1;
                                              INTEDG_BIT = 1 ;
                                              GIE_BIT = 1;
                                   }
                                    if(flag != 0)
                                                      break ;
                   }
             }
             portc = 0 ;
             }
}