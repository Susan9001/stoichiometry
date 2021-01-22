## Copyright (C) 2021 铁铁（ming）
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} plot_SH_index (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 铁铁（ming） <铁铁（ming）@LAPTOP-B527JMVS>
## Created: 2021-01-06

function plot_SH_index (filename)
  
     S = load(filename,"options","DateStr","Close_Price");
     
     DateStr = S.DateStr(2:end);
     Close_Price = S.Close_Price(2:end);
     
     DateStr = flipud(DateStr);
     Close_Price = flipud(Close_Price);
     
     nRow = size(Close_Price,1);
     all_each_days = 1:nRow;
     
     figure(1),clf('reset');
     plot(all_each_days,Close_Price);
     xlabel('Date of exchange','fontsize',15);
     ylabel('Shanghai Index','fontsize',15);
     
     [PKS,LOC,EXTRA]= findpeaks(Close_Price,"MinPeakDistance",1800);
     
     hold on
     
     plot(LOC(1),PKS(1),'o',"markersize",15);
     plot(LOC(2),PKS(2),'o',"markersize",15);
     
     date_str_1 = DateStr(LOC(1)){1};
     date_str_2 = DateStr(LOC(2)){1};
     
     max_1_str = ['(' date_str_1 ' , ' num2str(PKS(1)) ')'];
     max_2_str = ['(' date_str_2 ' , ' num2str(PKS(2)) ')'];
     
     text(LOC(1)-1500,PKS(1)+450,max_1_str, 'fontsize',15);
     text(LOC(2)-1500,PKS(2)+450,max_2_str, 'fontsize',15);
endfunction


%!demo
%! filename = "SH_index.mat";
%! plot_SH_index(filename);
