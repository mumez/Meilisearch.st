converting
asDictionary
    | dict |
    dict := Dictionary new.
    self limit ifNotNil: [:v | dict at: 'limit' put: v].
    self from ifNotNil: [:v | dict at: 'from' put: v].
    self uids ifNotNil: [:v | dict at: 'uids' put: v].
    self statuses ifNotNil: [:v | dict at: 'statuses' put: v].
    self types ifNotNil: [:v | dict at: 'types' put: v].
    self indexUids ifNotNil: [:v | dict at: 'indexUids' put: v].
    self canceledBy ifNotNil: [:v | dict at: 'canceledBy' put: v].
    self beforeEnqueuedAt ifNotNil: [:v | dict at: 'beforeEnqueuedAt' put: v asString].
    self beforeStartedAt ifNotNil: [:v | dict at: 'beforeStartedAt' put: v asString].
    self beforeFinishedAt ifNotNil: [:v | dict at: 'beforeFinishedAt' put: v asString].
    self afterEnqueuedAt ifNotNil: [:v | dict at: 'afterEnqueuedAt' put: v asString].
    self afterStartedAt ifNotNil: [:v | dict at: 'afterStartedAt' put: v asString].
    self afterFinishedAt ifNotNil: [:v | dict at: 'afterFinishedAt' put: v asString].
    ^ dict
