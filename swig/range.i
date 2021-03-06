%ignore rangeset_t::count;
%ignore rangeset_t::lower_bound;
%ignore rangeset_t::upper_bound;
%ignore rangeset_t::move_chunk;
%ignore rangeset_t::check_move_args;

%template(rangevec_base_t) qvector<range_t>;
%template(array_of_rangesets) qvector<rangeset_t>;

%inline %{
//<inline(py_range)>
//</inline(py_range)>
%}

%extend rangeset_t {
   %pythoncode {
     def __getitem__(self, idx):
         return self.getrange(idx)

     __len__ = nranges
     __iter__ = ida_idaapi._bounded_getitem_iterator
   }
};

%extend range_t {
   %pythoncode {
     startEA = ida_idaapi._make_badattr_property("startEA", "start_ea")
     endEA = ida_idaapi._make_badattr_property("endEA", "end_ea")
   }
};

%pythoncode %{
#<pycode(py_range)>
#</pycode(py_range)>
%}

%include "range.hpp"
