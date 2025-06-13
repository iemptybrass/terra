ffi.cdef ( [[ struct dirent {
            uint64_t d_ino;
            int64_t  d_off;
            unsigned short d_reclen;
            unsigned char d_type;
            char d_name[256]; }; ]] )
ffi.cdef ( [[ struct dirent *readdir ( DIR *dirp ); ]] )
ffi.cdef ( [[ void rewinddir ( DIR *dirp ); ]] )

local fail =
  { "invalid handle",
    "invalid directory pointer", }

return ( function ( handle )
  assert ( handle, fail[1] )
  assert ( handle._dir, fail[2] )
  local entry = ffi.C.readdir ( handle._dir )
  if entry == nil
    then
      ffi.C.rewinddir ( handle._dir )
      return nil
  end
  return ffi.string ( entry.d_name ), tostring ( entry.d_type )
end )
