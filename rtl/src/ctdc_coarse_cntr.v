///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
//   CCCCC  HH   HH RRRRRR   OOOOO  NN   NN  OOOOO   SSSSS          TTTTTT DDDDD     CCCCC   //
//  CC    C HH   HH RR   RR OO   OO NNN  NN OO   OO SS                TT   DD  DD   CC    C  //
//  CC      HHHHHHH RRRRRR  OO   OO NN N NN OO   OO  SSSSS            TT   DD   DD  CC       //
//  CC    C HH   HH RR  RR  OO   OO NN  NNN OO   OO      SS           TT   DD  DD   CC    C  //
//   CCCCC  HH   HH RR   RR  OOOO0  NN   NN  OOOO0   SSSSS  _______   TT   DDDDD     CCCCC   //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
// MIT License                                                                               //
//                                                                                           //
// Copyright (c) 2022 DEEPAK J PUTHUKKADEN                                                   //
//                                                                                           //
// Permission is hereby granted, free of charge, to any person obtaining a copy of this      //
// software and associated documentation files (the "Software"), to deal in the Software     //
// without restriction, including without limitation the rights to use, copy, modify, merge, //
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit        //
// persons to whom the Software is furnished to do so, subject to the following conditions:  //
//                                                                                           //
// The above copyright notice and this permission notice shall be included in all copies or  //
// substantial portions of the Software.                                                     //
//                                                                                           //
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,       //
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  //
// PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE //
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      //
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    //
// DEALINGS IN THE SOFTWARE.                                                                 //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                           //
// https://mit-license.org/                                                                  //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------------------------------------------------------------------
// Block              : ctdc_coarse_cntr
// Author             : Deepak J Puthukkaden
// Created            : 18/03/2022
// Description        : Coarse Counter Block
//                      Used to generate time-stamps
//---------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------

// `include "packet.vh"
// `include "common.vh"



module ctdc_coarse_cntr
(

  //clk,rst,idle
  input                           arst_n     ,
  input                           clk        ,

  //Timestamp output
  output [`COARSE_CNTR_WIDTH-1:0] timestamp
);



//Wires and Reg
  reg [`COARSE_CNTR_WIDTH-1:0] count;



//Logic

/*================================================================================================*/
/*                                            Counter                                             */
/*================================================================================================*/

  //Counter
    always @ ( posedge clk or posedge arst_n ) begin
      if ( arst_n ) begin
        count[`COARSE_CNTR_WIDTH-1:0] <= {16{1'b0}};
      end
      else begin
      count[`COARSE_CNTR_WIDTH-1:0] <= count + 1'd1;
      end
    end

    assign timestamp = count;


/*------------------------------------------------------------------------------------------------*/



endmodule
