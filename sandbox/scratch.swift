#!/usr/bin/swift

func isUnique(_ s:String ) -> Bool {
	return s.count == Set(s).count
} 


print (" matt  \(isUnique("matt")) " )
print (" mark  \(isUnique("mark")) " )
print (" jeff  \(isUnique("jeff")) " )
