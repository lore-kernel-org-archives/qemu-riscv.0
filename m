Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIXzf-0001Ru-OP
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 11:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIXzd-0001RD-Nc
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 11:42:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIXza-0007ZK-He
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 11:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674146542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEI7l5ms6HIUjyJ+u9iD/hHdz4tVBVNn2Ky4AfTnhHA=;
 b=enkph6nlx881YFZSBoLQ+suPcG97DSjLPzsefb6PEAWA2RIA6EW7ZJmRryXbi8C8Bs5bxi
 EgmHkSzQEwRIFaaK15o0wu49PgL/MCnkBb9IVxI6hI0Dd6kPY/nYLxx8qxx13iRCtFCUno
 rk8NotZaQLPcXWq+h5mHu9XGhC7I6to=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-MOhusnXYM--Tflrmc5WuoQ-1; Thu, 19 Jan 2023 11:42:17 -0500
X-MC-Unique: MOhusnXYM--Tflrmc5WuoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADE32101A521;
 Thu, 19 Jan 2023 16:42:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 879152026D76;
 Thu, 19 Jan 2023 16:42:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 65E6621E6A28; Thu, 19 Jan 2023 17:42:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 kevans@freebsd.org,  berrange@redhat.com,  groug@kaod.org,
 qemu_oss@crudebyte.com,  mst@redhat.com,  philmd@linaro.org,
 peter.maydell@linaro.org,  alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 quintela@redhat.com,  dgilbert@redhat.com,  michael.roth@amd.com,
 kkostiuk@redhat.com,  tsimpson@quicinc.com,  palmer@dabbelt.com,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
Date: Thu, 19 Jan 2023 17:42:14 +0100
In-Reply-To: <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 (Warner Losh's message of "Thu, 19 Jan 2023 07:42:46 -0700")
Message-ID: <87r0vqpjbt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2023 16:42:25 -0000

Warner Losh <imp@bsdimp.com> writes:

> On Thu, Jan 19, 2023 at 12:00 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Clean up includes so that osdep.h is included first and headers
>> which it implies are not included manually.
>>
>> This commit was created with scripts/clean-includes.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  bsd-user/bsd-proc.h               | 4 ----
>>  bsd-user/qemu.h                   | 1 -
>>  bsd-user/arm/signal.c             | 1 +
>>  bsd-user/arm/target_arch_cpu.c    | 2 ++
>>  bsd-user/freebsd/os-sys.c         | 1 +
>>  bsd-user/i386/signal.c            | 1 +
>>  bsd-user/i386/target_arch_cpu.c   | 3 +--
>>  bsd-user/main.c                   | 4 +---
>>  bsd-user/strace.c                 | 1 -
>>  bsd-user/x86_64/signal.c          | 1 +
>>  bsd-user/x86_64/target_arch_cpu.c | 3 +--
>>  11 files changed, 9 insertions(+), 13 deletions(-)
>>
>> diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
>> index 68b66e571d..a1061bffb8 100644
>> --- a/bsd-user/bsd-proc.h
>> +++ b/bsd-user/bsd-proc.h
>> @@ -20,11 +20,7 @@
>>  #ifndef BSD_PROC_H_
>>  #define BSD_PROC_H_
>>
>> -#include <sys/types.h>
>> -#include <sys/stat.h>
>> -#include <sys/time.h>
>>  #include <sys/resource.h>
>>
>
> Did you test this on FreeBSD 12? FreeBSD 13 has started to climb the hill
> where all includes are independent, but much of that hasn't been merged to
> 12 yet. sys/types.h, at least, is documented as a prereq for both
> sys/stat.h and sys/resource.h.
>
> I know many of these are in os-dep.h, and I've had trouble in the bsd-user
> fork with that and the layout of the code which has arguably way too much
> in the .h files.

No, I didn't test on FreeBSD 12.

Any .c must include qemu/osdep.h *first*.  Any further inclusions of
headers qemu/osdep.h includes already are no-ops unless the headers in
question lack multiple inclusion guards.

> Also, why didn't you move sys/resource.h and other such files to os-dep.h?
> I'm struggling to understand the rules around what is or isn't included
> where?

This series is "run scripts/clean-includes, split it into reviewable
chunks, tidy up blank lines".  Moving more includes into qemu/osdep.h is
out of scope.

I sympathize with your complaint that QEMU does too much in headers in
general, and in qemu/osdep.h in particular.

>> -#include <unistd.h>
>>
>>  /* exit(2) */
>>  static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
>> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
>> index be6105385e..0ceecfb6df 100644
>> --- a/bsd-user/qemu.h
>> +++ b/bsd-user/qemu.h
>> @@ -17,7 +17,6 @@
>>  #ifndef QEMU_H
>>  #define QEMU_H
>>
>> -#include "qemu/osdep.h"
>>  #include "cpu.h"
>>  #include "qemu/units.h"
>>  #include "exec/cpu_ldst.h"
>> diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
>> index 2b1dd745d1..9734407543 100644
>> --- a/bsd-user/arm/signal.c
>> +++ b/bsd-user/arm/signal.c
>> @@ -17,6 +17,7 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> +#include "qemu/osdep.h"
>>  #include "qemu.h"
>>
>>  /*
>> diff --git a/bsd-user/arm/target_arch_cpu.c
>> b/bsd-user/arm/target_arch_cpu.c
>> index 02bf9149d5..fe38ae2210 100644
>> --- a/bsd-user/arm/target_arch_cpu.c
>> +++ b/bsd-user/arm/target_arch_cpu.c
>> @@ -16,6 +16,8 @@
>>   *  You should have received a copy of the GNU General Public License
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>> +
>> +#include "qemu/osdep.h"
>>  #include "target_arch.h"
>>
>>  void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
>> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
>> index 309e27b9d6..1676ec10f8 100644
>> --- a/bsd-user/freebsd/os-sys.c
>> +++ b/bsd-user/freebsd/os-sys.c
>> @@ -17,6 +17,7 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> +#include "qemu/osdep.h"
>>  #include "qemu.h"
>>  #include "target_arch_sysarch.h"
>>
>> diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
>> index 5dd975ce56..a3131047b8 100644
>> --- a/bsd-user/i386/signal.c
>> +++ b/bsd-user/i386/signal.c
>> @@ -17,6 +17,7 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> +#include "qemu/osdep.h"
>>  #include "qemu.h"
>>
>>  /*
>> diff --git a/bsd-user/i386/target_arch_cpu.c
>> b/bsd-user/i386/target_arch_cpu.c
>> index d349e45299..2a3af2ddef 100644
>> --- a/bsd-user/i386/target_arch_cpu.c
>> +++ b/bsd-user/i386/target_arch_cpu.c
>> @@ -17,9 +17,8 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> -#include <sys/types.h>
>> -
>>  #include "qemu/osdep.h"
>> +
>>  #include "cpu.h"
>>  #include "qemu.h"
>>  #include "qemu/timer.h"
>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>> index 6f09180d65..41290e16f9 100644
>> --- a/bsd-user/main.c
>> +++ b/bsd-user/main.c
>> @@ -18,12 +18,10 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> -#include <sys/types.h>
>> -#include <sys/time.h>
>> +#include "qemu/osdep.h"
>>  #include <sys/resource.h>
>>  #include <sys/sysctl.h>
>>
>> -#include "qemu/osdep.h"
>>  #include "qemu/help-texts.h"
>>  #include "qemu/units.h"
>>  #include "qemu/accel.h"
>> diff --git a/bsd-user/strace.c b/bsd-user/strace.c
>> index a77d10dd6b..96499751eb 100644
>> --- a/bsd-user/strace.c
>> +++ b/bsd-user/strace.c
>> @@ -20,7 +20,6 @@
>>  #include <sys/select.h>
>>  #include <sys/syscall.h>
>>  #include <sys/ioccom.h>
>> -#include <ctype.h>
>>
>>  #include "qemu.h"
>>
>> diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
>> index c3875bc4c6..46cb865180 100644
>> --- a/bsd-user/x86_64/signal.c
>> +++ b/bsd-user/x86_64/signal.c
>> @@ -16,6 +16,7 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> +#include "qemu/osdep.h"
>>  #include "qemu.h"
>>
>>  /*
>> diff --git a/bsd-user/x86_64/target_arch_cpu.c
>> b/bsd-user/x86_64/target_arch_cpu.c
>> index be7bd10720..1d32f18907 100644
>> --- a/bsd-user/x86_64/target_arch_cpu.c
>> +++ b/bsd-user/x86_64/target_arch_cpu.c
>> @@ -17,9 +17,8 @@
>>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> -#include <sys/types.h>
>> -
>>  #include "qemu/osdep.h"
>> +
>>  #include "cpu.h"
>>  #include "qemu.h"
>>  #include "qemu/timer.h"
>>
>
> I suppose these are fine. How do I run the cleanup script? I have 2x the
> number of files not upstream in the bsd-user fork that I'd like to cleanup
> as well and they are likely a bigger mess and I'll just upstream them in
> the messy state unless I understand how to keep the neat :).

I used

    $ scripts/clean-includes --check-dup-head --all

Which resulted in a big mess I didn't dare to submit for review :)  So I
split it up.  Easiest way was to identify useful sets of files, add
files that include headers from the set, transitively, then run

    $ scripts/clean-includes FILES...

--check-dup-head reports possible duplicate inclusions.  It is prone to
false positives.  That's why it merely reports them.  You may want to
not use it for now.

There's a big usage comment at the beginning of the script.

Hope this helps!


