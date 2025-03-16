/**
  Example 2:

  Input: n = 37
  Output: 1478
  Explanation: There are exactly 4 integers i in the range [1, 37] that satisfy the conditions in the statement:
  - 1 since 1 * 1 = 1. 
  - 9 since 9 * 9 = 81 and 81 can be partitioned into 8 + 1. 
  - 10 since 10 * 10 = 100 and 100 can be partitioned into 10 + 0. 
  - 36 since 36 * 36 = 1296 and 1296 can be partitioned into 1 + 29 + 6.
  Hence, the punishment number of 37 is 1 + 81 + 100 + 1296 = 1478
  */

function punishmentNumber(n: number): number {
    let nI = 1 // n index

    let matchArr = []

    while (nI <= n) {
        const iSq = n**2 // squared pointer
        const part = iSq.toString().split("") // partition e.g. [1,2,9,6]
        const partL = part.length

        let mw = new Array(partL).fill(1) // moving window
        // Basically from the pointer, we will have permutations according to the window length arr.
        // 1 + 2 + 9 + 6 will have the mw of [1,1,1,1]
        // 12 + 9 + 6 will have the mw of = [2,1,1]
        // 129 + 6 will have the mw of = [3,1]

        // @permutations
        // [1,1,1,1] pivotI = 0
        // [2,1,1] pivotI = 0
        // [3,1] pivotI = 0
        // [4] pivotI = 0
        // [1,2,1] pivotI = 1
        // [1,3] pivotI = 1
        // [1,1,2] pivotI = 2, end
        // @challenge I have to come up with an algo that generates these permutations
        // @challenge then I have to to check the permutations to see if they can be equal to iSq.toString()
        

        let pivotI = 0 // pivot index for the partition permutations
        let perm: number[][] = [new Array(partL).fill(1)] // default permutation
        // now we have to fill up the permutations
      //

        while (pivotI < partL - 1) { 
          // as long as we're not at the final index (which means no more permutations)
          // we can keep permutating
          
          // first we use the current permutation's string to see if there's a match.
          // we shall use string subsets to join the strings
          let currStr = ''
          let partI = 0 // pointer to get the next partition string
          
          while (partI < partL - 1) {
            currStr += part.slice(i, c).join("")

          }

           break
            

        }

        nI++
    }

    // we sum up matchArr
    return matchArr.reduce((a, b) => a + b, 0)
};
