function punishmentNumber(n: number): number {
    let i = 1 // n index

    let matchArr = []

    while (i <= n) {
        const iSq = n**2 // squared pointer
        const part = iSq.toString().split("") // partition e.g. [1,2,9,6]
        const partL = part.length

        let mw = new Array(partL).fill(1) // moving window
        // Basically from the pointer, we will have permutations according to the window length arr.
        // 1 + 2 + 9 + 6 will have the mw of [1,1,1,1]
        // 12 + 9 + 6 will have the mw of = [2,1,1]
        // 129 + 6 will have the mw of = [3,1]
        // @condition true ∑n <= i
        // @condition the sum of the subsums cannot exceed t

        // @permutations
        // [1,1,1,1] iPivot = 0
        // [2,1,1] iPivot = 0
        // [3,1] iPivot = 0
        // [4] iPivot = 0
        // [1,2,1] iPivot = 1
        // [1,3] iPivot = 1
        // [1,1,2] iPivot = 2, end
        
        let iPivot = 0 // pivot index for the partition permutations

        // e.g.
        // n = 36
        // go through all possibilities of e.g. 1 + 29 + 6
        // [1,2,9,6]
        // 1 + 2 + 9 + 6 = 18
        // 12 + 9 + 6 = 27
        // 129 > 36, break
        // 12 + 96, where 96 > 36, break
        // 1 + 29 + 6 = 36, accepted, return

        if (i === partL - 1) {
           break
            

        }

        i++
    }

        // we sum up matchArr
    return matchArr.reduce((a, b) => a + b, 0)
};
