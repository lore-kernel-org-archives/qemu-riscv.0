Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZeD0-0007WW-Sr
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 15:42:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZeCz-0007UE-E7
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 15:42:21 -0400
Received: from [2607:f8b0:4864:20::b35] (port=35610
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZeCx-0002C3-R4
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 15:42:21 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o5so38569125ybe.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pPla5jbd/vF+yXoPUVfyiSRE3nZYFOO3dlhEcnKVkGk=;
 b=nhGBye3Woty8y4k9TiKcLwrRxhpXsTuOY8CErcdChS8Pv+y7sFGvXvLsbKZLa3eHrc
 6d5fzk+u8C4/zBGf/c+NdLQu2g8zJDChXdSaPWkRYXAzY680jQuHN8ec6n09EHoCD76J
 1Cpy678ztLtoTJ+DYQNJvEQOC7SCHLhhtUbs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pPla5jbd/vF+yXoPUVfyiSRE3nZYFOO3dlhEcnKVkGk=;
 b=QAA2pqAdFLlOrFq0Ok+DnOgMD9cn0eAiCZIRi8W9/V1GFA3FTJh73uIVZfGPOdzDmN
 XwfefcBHZP35hlSz2lfE3hRIDmQfHMNA47zIRffaDBYdjdB14zvJr8lDe3UEvgLc2dKu
 EBdmPURW7GeY54wSoKJMVUBO12V+cPRcDqL91LhhIw/EqhFR1ywvp7JErRVncvv0sd+f
 Xnj/jOLNMRHpVFXyOV4Zc0Fspv2jrjz5agKiVIUQjwjyh1DM3p56qW1dFd4mEYAlQqH0
 SOu4QHP4KxhyX4eJl4b9tJX48mww+iow1k6yeLhK7SmEeKGxmdralKbbUF0D4qvPHl7s
 aujw==
X-Gm-Message-State: AOAM5309pCw2/f2Oc617DuAU8FApPTVcA55dU5uOQaAx4AcjwwZrqR2Q
 bmkQ2PTDGhdRNW4KRqUogvFd0czg8o+qFBp+ClmP
X-Google-Smtp-Source: ABdhPJxR3AtU+o2KTUn02tK0/GLuvUSvRGy+nuERa5agvI2Fi51vWMMGsZCLbcxawyFdoiwqWaP5dUW+nIk++15YyxY=
X-Received: by 2002:a25:38ce:0:b0:633:cd30:58ac with SMTP id
 f197-20020a2538ce000000b00633cd3058acmr1262079yba.405.1648669338864; Wed, 30
 Mar 2022 12:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220303235440.638790-1-atishp@rivosinc.com>
 <20220303235440.638790-11-atishp@rivosinc.com>
 <CANzO1D3nJmpcBCpH_ih2uDmrfKYVZ17XMvJCLGqKo-L1uy459g@mail.gmail.com>
In-Reply-To: <CANzO1D3nJmpcBCpH_ih2uDmrfKYVZ17XMvJCLGqKo-L1uy459g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 30 Mar 2022 12:42:08 -0700
Message-ID: <CAOnJCULUUxyXuzNrFUbqC+WxhijG7c7VTPwi_Q7fL-5Qcn8miQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/12] target/riscv: Add few cache related PMU events
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 19:42:21 -0000

On Tue, Mar 15, 2022 at 2:26 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Fri, Mar 4, 2022 at 8:11 AM Atish Patra <atishp@rivosinc.com> wrote:
>>
>> From: Atish Patra <atish.patra@wdc.com>
>>
>> Qemu can monitor the following cache related PMU events through
>> tlb_fill functions.
>>
>> 1. DTLB load/store miss
>> 3. ITLB prefetch miss
>>
>> Increment the PMU counter in tlb_fill function.
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>  target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 1c60fb2e8057..72ae1a612ae8 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -21,10 +21,13 @@
>>  #include "qemu/log.h"
>>  #include "qemu/main-loop.h"
>>  #include "cpu.h"
>> +#include "pmu.h"
>>  #include "exec/exec-all.h"
>>  #include "tcg/tcg-op.h"
>>  #include "trace.h"
>>  #include "semihosting/common-semi.h"
>> +#include "cpu.h"
>
>
> Redundant: #include "cpu.h"
>

Thanks for catching it. Fixed.

> Regards,
> Frank Chang
>
>>
>> +#include "cpu_bits.h"
>>
>>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>>  {
>> @@ -1178,6 +1181,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>>      riscv_raise_exception(env, cs->exception_index, retaddr);
>>  }
>>
>> +
>> +static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
>> +{
>> +    enum riscv_pmu_event_idx pmu_event_type;
>> +
>> +    switch (access_type) {
>> +    case MMU_INST_FETCH:
>> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
>> +        break;
>> +    case MMU_DATA_LOAD:
>> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
>> +        break;
>> +    case MMU_DATA_STORE:
>> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
>> +        break;
>> +    default:
>> +        return;
>> +    }
>> +
>> +    riscv_pmu_incr_ctr(cpu, pmu_event_type);
>> +}
>> +
>>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>                          MMUAccessType access_type, int mmu_idx,
>>                          bool probe, uintptr_t retaddr)
>> @@ -1274,6 +1299,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>              }
>>          }
>>      } else {
>> +        pmu_tlb_fill_incr_ctr(cpu, access_type);
>>          /* Single stage lookup */
>>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>>                                     access_type, mmu_idx, true, false, false);
>> --
>> 2.30.2
>>
>>


-- 
Regards,
Atish

