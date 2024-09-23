interface User {
	id: number
	name: string
	uplineID: number | null
  salesCount: number
  downlineIDs: number[]
}

const flatList: Omit<User, 'downlineIDs'>[] = [
	{
		id: 1,
		name: 'Aaron',
		uplineID: null,
    salesCount: 1
	},
  {
    id: 2,
    name: 'Bobby',
    uplineID: 1,
    salesCount: 123
  },
  {
    id: 3,
    name: 'Charlie',
    uplineID: 2,
    salesCount: 11
  },
  {
    id: 4,
    name: 'David',
    uplineID: 2,
    salesCount: 12
  },
  {
    id: 5,
    name: 'Edward',
    uplineID: 4,
    salesCount: 13
  },
  {
    id: 6,
    name: 'Frank',
    uplineID: 4,
    salesCount: 14
  }
]

const flatListRec = flatList.reduce((acc, user) => {
  const foundUser = acc?.[user.id]

  // if user is not found in the accumulator, add it
  if (!foundUser) {
    acc[user.id] = {
      ...user,
      downlineIDs: []
    }
  } else {
    // if user is found in the accumulator, update the user with her proper data
    // because she might have been updated with just the id and downlines
    acc[user.id] = {
      ...user,
      ...foundUser,
    }
  }

  const uplineID = user?.uplineID
  // if user has no upline, return the accumulator and end
  if (!uplineID) { return acc }

  const foundUplineUser = acc?.[uplineID]
  // if upline user is not found in the accumulator, add it
  if (!foundUplineUser) {
    acc[uplineID] = {
      id: uplineID,
      name: '',
      uplineID: null,
      downlineIDs: [],
      salesCount: 0
    }
  } else {
    acc[uplineID] = {
      ...user,
      ...foundUplineUser,
      downlineIDs: [
        ...foundUplineUser.downlineIDs,
        user.id
      ]
    }
  }

  return acc
}, {} as Record<User['id'], User>)


