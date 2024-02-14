// Code your testbench here
// or browse Examples
`include "interface.sv" 
`include "tb_pkg.sv" 

module top; 

  import uvm_pkg::*; 
  import tb_pkg::*; 

   
  //---------------------------------------------------------------------------- 

  intf i_intf(); 

  //---------------------------------------------------------------------------- 

 //---------------------------------------------------------------------------- 

  sr DUT(.s(i_intf.s), 

         .r(i_intf.r), 

         .q(i_intf.q), 

         .qbar(i_intf.qbar) 

        ); 

  //----------------------------------------------------------------------------                

   

  //---------------------------------------------------------------------------- 

  initial begin 

    $dumpfile("dumpfile.vcd"); 

    $dumpvars; 

  end 

  //---------------------------------------------------------------------------- 

 

  //---------------------------------------------------------------------------- 

  initial begin 

    uvm_config_db#(virtual intf)::set(uvm_root::get(),"","vif",i_intf); 

  end 

  //---------------------------------------------------------------------------- 

 

  //---------------------------------------------------------------------------- 

  initial begin 

    run_test("sr_test"); 

  end 

  //---------------------------------------------------------------------------- 

endmodule 