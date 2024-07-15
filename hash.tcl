
namespace eval ::hash {
 
  namespace export hash
 
  set version 1.0
  
}
 
proc ::hash::hget {d k {def ""}} { 
  if {[dict exists $d $k]} {
    dict get $d $k 
  } else {
    return $def
  }
}

proc ::hash::hset {d k v} {
  upvar $d d_
  dict set d_ $k $v
}

proc ::hash::hcount {d} { dict size $d }

proc ::hash::hcontains {d k} { dict exists $d $k }

proc ::hash::hash {var args} { 
  upvar $var var_ 
  set var_ [dict create {*}$args]
}



package provide hash $hash::version
package require Tcl 8.0