module Arrow

using Mmap
import Dates
using DataAPI, Tables, SentinelArrays, PooledArrays, CodecLz4, CodecZstd

using Base: @propagate_inbounds
import Base: ==

const ALIGNMENT = 8
const FILE_FORMAT_MAGIC_BYTES = b"ARROW1"
const CONTINUATION_INDICATOR_BYTES = 0xffffffff

# vendored flatbuffers code for now
include("FlatBuffers/FlatBuffers.jl")
using .FlatBuffers

include("metadata/Flatbuf.jl")
using .Flatbuf; const Meta = Flatbuf

include("arrowtypes.jl")
using .ArrowTypes
include("utils.jl")
include("arraytypes.jl")
include("eltypes.jl")
include("table.jl")
include("write.jl")

end  # module Arrow
