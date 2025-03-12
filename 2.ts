
import {
<<<<<<< HEAD
  type RecurringContractStatusOption,
  useRCList$,
  useRNWPage$,
} from './_stores'
// import { BUSINESS_UNIT_ID } from '../../_constants'
import { fAmt } from '@ifca-ui/core/src/utils/fAmt'
import { genStagedID } from '@ifca/std/src/fns/id'
import { type TGetTOpts } from '@ifca/std/src/ui/components/StdList/models'
import { AdapterDateFns } from '@mui/x-date-pickers/AdapterDateFnsV3'
import { DatePicker } from '@mui/x-date-pickers/DatePicker'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { useBackNavStack$ } from 'app/_stores/useBackNavStack$'
import { __SM_BUID_SL_RNW_SLT_ID_ACT } from 'app/Sales/_routes/patterns'
import { add, addMonths, format } from 'date-fns'
import { enGB } from 'date-fns/locale'
=======
  EmptyState,
  FloatButton,
  Loader,
  ListItem,
  ListItemText,
} from '@ifca-ui/core'
import { fAmt } from '@ifca-ui/core/src/utils/fAmt'
import { fAmt as fFullAmt } from '../../../../utils/CurrencyConverter'
import { type TGetTOpts } from '@ifca/std/src/ui/components/StdList/models'
import { formatDate } from '../../../../utils/FormatDate'
import { useBackNavStack$ } from 'app/_stores/useBackNavStack$'
import { __SM_BUID_RNW_ID_ACT } from 'app/Sales/_routes/patterns'
import { genStagedID } from '@ifca/std/src/fns/id'
import { format, addMonths, add } from 'date-fns'
>>>>>>> origin/ix-sc
import {
  _tempLoggedInUserSelector,
  useUserStore,
} from '../../../_stores/useUserStore'
<<<<<<< HEAD
import {
  currentMonthLabel,
  currMYLabel,
  nextMonthLabel,
  nextMYLabel,
  nextNextMonthLabel,
  nextNextMYLabel,
} from '../_utils/infolineLabels'
import { RNWLI } from './_components/li'
import { MenuItemText } from 'app/_components/MenuItemText'
import { stateTupleSelector } from '@ifca/std/src/ui/stores/state/StdStateStore/createStdStateStore'
=======
import { AdapterDateFns } from '@mui/x-date-pickers/AdapterDateFnsV3'
import { DatePicker } from '@mui/x-date-pickers/DatePicker'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { enGB } from 'date-fns/locale'
>>>>>>> origin/ix-sc
