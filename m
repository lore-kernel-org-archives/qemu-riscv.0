Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQb1E-000886-EC
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 17:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQb1C-00087T-3V; Tue, 23 Aug 2022 17:01:03 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQb12-0000rO-WA; Tue, 23 Aug 2022 17:00:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id m2so13909961pls.4;
 Tue, 23 Aug 2022 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JiPPSdPG7/pWwzFBVfDgncVAJjx846uufAHJZCdEiyQ=;
 b=a/+3VCvXElFzw1y3qaenenM+F5Qw5Py3pEydmhxoDwLvlFm3xlWIaLXknSjzrU2jAb
 rJscl4mO+HIpTDxhIM1Jk7wTS4fpzlYTJ1LBlvbAABDNZwAQ+d4/nzPqq8GK1NQrHk4g
 H7y4bxQ7aSGWZzVMHDHZonnZSKgFBAChZFjSrb27kdmlLWkJd76knHyhXiVRAlURZ9X7
 I4AiwgwqigX0X9BCOLn++CQnbY3jgEUgOTkafsdXR1KG2Oh7l+V/waDS+ioexGOjLhmW
 6FFgvvJCN33KsenzjwgBQOPvEF4I4AI6A1XWI6m+HlO3KwuXUT2/+g3rbNlxADLo6p0u
 1lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JiPPSdPG7/pWwzFBVfDgncVAJjx846uufAHJZCdEiyQ=;
 b=FQj0Y9KV5Y08yZnkzdYlAEMxjaeFnS4V4lE2ciefvMGC+eqjDMXEW6dtJ6UvW1z5DT
 MPKxSaxhAndc0f85U2kFFIy/onsV1VDX9bjrFH/joYM5O+F0WfbbF4g8gDVvnQ680JsF
 eb2x0ZlCimJFI7JV97wlB7rzkcBf4993GYgpvxiKldBu42BKarp3PfBBH30MBl/9kb2g
 24rfVrGxGSIgZKUDBOE1cAgqdEStpjA4ryJ5qoIix5gei/+vSnAENiUCz0QHPyCtlCcB
 z56/gcDTet6HBXylwBeP9XTIDx2gZydtil1nWEI9nFSGf4vX021tMkQOgxD7i5aI0jou
 jaNQ==
X-Gm-Message-State: ACgBeo2vJAPJyZnqP3rBdn7ldJvnrOy2Qvx9FGAYElSXKubaetX1z7vQ
 XfquBB02jj53VZAHB1GfqSX934jgxE5iAqRMJwk=
X-Google-Smtp-Source: AA6agR7UoktjrlVDTwlmQo2+R8RjaEzI8bvNawC+O2lHAj7ax4xh4wv5WMkqqRk4Mujqn1Sm1Ex7xYmJ+l/fWXpqxZU=
X-Received: by 2002:a17:903:2281:b0:172:f8e3:6f07 with SMTP id
 b1-20020a170903228100b00172f8e36f07mr7086649plh.121.1661288450614; Tue, 23
 Aug 2022 14:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220816232321.558250-1-atishp@rivosinc.com>
 <20220816232321.558250-4-atishp@rivosinc.com>
 <CAKmqyKOZzv6gxn7ntaK=FXKe5KosN4oJFJf55n_F7rsKz2TZWw@mail.gmail.com>
 <CAHBxVyHSOCtG+aJMRe5_Som+Y1DfyEDyCje458eGDnAaLCfMrA@mail.gmail.com>
In-Reply-To: <CAHBxVyHSOCtG+aJMRe5_Som+Y1DfyEDyCje458eGDnAaLCfMrA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Aug 2022 07:00:24 +1000
Message-ID: <CAKmqyKOw0Nn1sB+xN-wW1kP9qMgo6wAoNTX58=J5hCN9vwE58A@mail.gmail.com>
Subject: Re: [PATCH v13 3/6] target/riscv: Add few cache related PMU events
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 23 Aug 2022 21:01:03 -0000

On Wed, Aug 24, 2022 at 5:19 AM Atish Kumar Patra <atishp@rivosinc.com> wrote:
>
>
>
> On Mon, Aug 22, 2022 at 5:38 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Wed, Aug 17, 2022 at 9:24 AM Atish Patra <atishp@rivosinc.com> wrote:
>> >
>> > From: Atish Patra <atish.patra@wdc.com>
>> >
>> > Qemu can monitor the following cache related PMU events through
>> > tlb_fill functions.
>> >
>> > 1. DTLB load/store miss
>> > 3. ITLB prefetch miss
>> >
>> > Increment the PMU counter in tlb_fill function.
>> >
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> > Tested-by: Heiko Stuebner <heiko@sntech.de>
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>
>> This patch causes a number of test failures.
>>
>> On some boots I see lots of these errors printed:
>>
>> qemu-system-riscv64: GLib: g_hash_table_lookup: assertion 'hash_table
>> != NULL' failed
>>
>> and I'm unable to boot Linux.
>>
>> The command line is:
>>
>> qemu-system-riscv64 \
>>     -machine sifive_u \
>>     -serial mon:stdio -serial null -nographic \
>>     -append "root=/dev/ram rw highres=off console=ttySIF0 ip=dhcp
>> earlycon=sbi" \
>>     -smp 5 \
>>     -d guest_errors \
>>     -kernel ./images/qemuriscv64/Image \
>>     -initrd ./images/qemuriscv64/buildroot/rootfs.cpio \
>>     -bios default -m 256M
>>
>> I see that faiulre with the 5.19-rc7 kernel and OpenSBI 1.1.
>>
>> I also see the same messages on other machines when running baremetal
>> code. I'm going to drop these patches from my tree
>>
>
> Sorry for the breakage.  This should fix the issue. We just need to add few sanity checks
> for the platforms that don't support these events.
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index ad33b81b2ea0..0a473010cadd 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -187,6 +187,9 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
>      CPURISCVState *env = &cpu->env;
>      gpointer value;
>
> +    if (!cpu->cfg.pmu_num)
> +        return 0;
> +
>      value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
>                                  GUINT_TO_POINTER(event_idx));
>      if (!value) {
> @@ -221,6 +224,9 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>      }
>
>      cpu = RISCV_CPU(env_cpu(env));
> +    if (!cpu->pmu_event_ctr_map)
> +        return false;
> +
>      event_idx = RISCV_PMU_EVENT_HW_INSTRUCTIONS;
>      ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
>                                 GUINT_TO_POINTER(event_idx)));
> @@ -243,6 +249,9 @@ bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
>      }
>
>      cpu = RISCV_CPU(env_cpu(env));
> +    if (!cpu->pmu_event_ctr_map)
> +        return false;
> +
>      event_idx = RISCV_PMU_EVENT_HW_CPU_CYCLES;
>      ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
>                                 GUINT_TO_POINTER(event_idx)));
> @@ -280,7 +289,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>      uint32_t event_idx;
>      RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
>
> -    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
>          return -1;
>      }
>
> Should I respin the series or send this as a fix ?

Can you wait till tomorrow, rebase on my branch and then send a new
series? I'm just chasing down another issue today

Alistair

>
>> Alistair
>>
>> > ---
>> >  target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
>> >  1 file changed, 25 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> > index 1e4faa84e839..81948b37dd9a 100644
>> > --- a/target/riscv/cpu_helper.c
>> > +++ b/target/riscv/cpu_helper.c
>> > @@ -21,11 +21,13 @@
>> >  #include "qemu/log.h"
>> >  #include "qemu/main-loop.h"
>> >  #include "cpu.h"
>> > +#include "pmu.h"
>> >  #include "exec/exec-all.h"
>> >  #include "instmap.h"
>> >  #include "tcg/tcg-op.h"
>> >  #include "trace.h"
>> >  #include "semihosting/common-semi.h"
>> > +#include "cpu_bits.h"
>> >
>> >  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>> >  {
>> > @@ -1188,6 +1190,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>> >      cpu_loop_exit_restore(cs, retaddr);
>> >  }
>> >
>> > +
>> > +static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
>> > +{
>> > +    enum riscv_pmu_event_idx pmu_event_type;
>> > +
>> > +    switch (access_type) {
>> > +    case MMU_INST_FETCH:
>> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
>> > +        break;
>> > +    case MMU_DATA_LOAD:
>> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
>> > +        break;
>> > +    case MMU_DATA_STORE:
>> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
>> > +        break;
>> > +    default:
>> > +        return;
>> > +    }
>> > +
>> > +    riscv_pmu_incr_ctr(cpu, pmu_event_type);
>> > +}
>> > +
>> >  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>> >                          MMUAccessType access_type, int mmu_idx,
>> >                          bool probe, uintptr_t retaddr)
>> > @@ -1286,6 +1310,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>> >              }
>> >          }
>> >      } else {
>> > +        pmu_tlb_fill_incr_ctr(cpu, access_type);
>> >          /* Single stage lookup */
>> >          ret = get_physical_address(env, &pa, &prot, address, NULL,
>> >                                     access_type, mmu_idx, true, false, false);
>> > --
>> > 2.25.1
>> >
>> >

