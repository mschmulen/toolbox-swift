#!/usr/bin/swift

func fib(_ n:Int) -> Int {
	if n <= 2 { return 1 }
	else {	return fib(n-2) + fib(n-1) }	
}

let arg = CommandLine.arguments[1]

//if let n = Int(CommandLine.arguments[1] ) {
//	print( "\(n) \(fib(n)))" )
//} 
//else {
	print( "fib 3: \(fib(3))")
	print( "fib 10: \(fib(10))")
	print( "fib 22: \(fib(22))")
//}
