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
## @deftypefn {} {@var{retval} =} show_SH_index (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 铁铁（ming） <铁铁（ming）@LAPTOP-B527JMVS>
## Created: 2021-01-06

function [DateStr,Close_Price] = show_SH_index (filename)
 
         DateStr = [];
         Close_Price = [];
         
         [DateStr,tmp1,tmp2,Close_Price,tmp3] = textread(filename,"%s,%s,%s,%f,%s");
 
endfunction
%!demo
%! ##filename = "temp1.csv";
%! filename = "SH001.csv";
%! [DateStr,Close_Price] = show_SH_index (filename);
%! size(DateStr)
%! size(Close_Price)
%! save -6 ../TEACHER/SH_index.mat DateStr Close_Price