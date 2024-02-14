
class sr_coverage extends uvm_subscriber #(sr_sequence_item);

  `uvm_component_utils(sr_coverage)
 
  sr_sequence_item txn;
  real coverage;

  covergroup cg;
    option.per_instance= 1;
    option.comment     = "coverage for SR";
    option.name        = "functional cov";
    option.auto_bin_max= 4;
    
   S:coverpoint txn.s { 
      bins b1[] ={0,1};
    }

    R:coverpoint txn.r { 
        bins b2[] ={0,1};
    }
    SxR:cross S,R;
  endgroup



function new(string name="sr_coverage",uvm_component parent);
    super.new(name,parent);
    cg=new();
  endfunction

  
  function void write(sr_sequence_item t);
    txn=t;
    cg.sample();
  endfunction
  
  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    coverage=cg.get_coverage();
  endfunction
  


  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(),$sformatf("Coverage is %f",coverage),UVM_MEDIUM)
  endfunction
  
endclass
