#######################################################################
# stream -  Infrastructure for Data Stream Mining
# Copyright (C) 2013 Michael Hahsler, Matthew Bolanos, John Forrest 
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


## wrapper for recluster functions

recluster <- function(macro, dsc, type="auto", ...) UseMethod("recluster")

recluster.DSC <- function(macro, dsc, type="auto", ...) {
    stop(gettextf("recluster not implemented for class '%s'.", 
		    paste(class(macro), collapse=", ")))
}

### reclustering is done with a DSC_Macro object!
recluster.DSC_Macro <- function(macro, dsc, type="auto", ...) {
    cen <- get_centers(dsc, type=type)
    dsd <- DSD_Memory(cen)
    weight <- get_weights(dsc, scale=NULL, type=type)
    update(macro, dsd, n=nrow(cen), weight=weight, ...)
}

