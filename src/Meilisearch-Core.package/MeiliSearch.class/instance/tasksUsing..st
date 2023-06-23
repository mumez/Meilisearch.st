actions
tasksUsing: optionsBuilder
	| opts |
	opts := MsTasksReadOptions new.
	optionsBuilder value: opts.
	^ self tasksWithOptions: opts asDictionary