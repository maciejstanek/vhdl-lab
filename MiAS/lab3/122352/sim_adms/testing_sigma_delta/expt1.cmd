* Command file for design: testing_sigma_delta
* Top Spice file: ..\..\genhdl\testing_sigma_delta\testing_sigma_delta.cir
.op
.tran 0 2 0
* .ac dec 100  
.plot tran SG(clk) SG(out2_d) SG(out_d) V(decim2_a) V(decim_a) V(in_a) V(int_sum) V(int_sum2_a) V(int_sum3_a) V(out2_a) V(out_a) V(scaled_int_sum2_a) V(sum2_a) V(sum3_a) V(sum_a)
* .plot ac V(decim2_a) V(decim_a) V(in_a) V(int_sum) V(int_sum2_a) V(int_sum3_a) V(out2_a) V(out_a) V(scaled_int_sum2_a) V(sum2_a) V(sum3_a) V(sum_a)
.option eps=1.0e-5
.option hmin=0.9e-9

.option print_dc=2
* save tr toplevel
* save ac toplevel
* save ba

.save file=testing_sigma_delta.iic end no_save_wdb
* .plot dc V(intx) V(x)
.include ..\..\genhdl\testing_sigma_delta\testing_sigma_delta.cir
