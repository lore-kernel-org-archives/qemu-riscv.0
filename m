Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPYW4-0001hM-Dp
	for mharc-qemu-riscv@gnu.org; Wed, 02 Mar 2022 18:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPYW2-0001dw-Ef; Wed, 02 Mar 2022 18:36:18 -0500
Received: from [2607:f8b0:4864:20::d33] (port=43571
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPYW0-00081X-SN; Wed, 02 Mar 2022 18:36:18 -0500
Received: by mail-io1-xd33.google.com with SMTP id m185so3766363iof.10;
 Wed, 02 Mar 2022 15:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVOvdwxstt+1MpzXpXVO6EZPRzK64u6vMw9Lfg6a27k=;
 b=QTq6uYJaNYrs3xOxteT9k1kvSsdMphSRQimfzvSnTLD+A/UhRNYnCUKDXVFf2dEMOP
 Mt2SjQh7W1y/jzBYp1ON9eG2rjXQhxwmebOphVy9g0Bo0F0umMVJOH+u2XM/5DQMalQM
 v38HWKI1kNM9us/Qns6AbknO/MZoDDgzlXHBUMKe8g+lbB4tNV7cVCEQ5ctNj8PAPt6e
 Y86CCCCqugZtjmvkjVsQdwIArSXkoe2LDHJuURUPmgOsJplG56YRIfZ4+B+XvxDulxy2
 DAJLtU+VKUyTTg0VoKnbQsqD6JZ5kMorukbpcvU/0mI+SymMYhNGfb0VP3uDWK4YOYGO
 ET0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVOvdwxstt+1MpzXpXVO6EZPRzK64u6vMw9Lfg6a27k=;
 b=Nd3tmYQw9tGYz6gNTcfDQMwq6rd9ZhyLL2Tei2F1RBjMeF+pdxlBUqrqGtrNi2nb/j
 pFbgbxReldBNuBj0uh7yiLb9SdZWrJn43Mdu7uwMwLnZBjXgqFrKxopHI97b87CmjTCW
 InuRfrNiLNLJ3NTpTyDupD9AIOIOUWnOVrSP7i3sd6lOIr0ExQwGJRoR6equfqhjS4oT
 SLs0TKOyDkXvUMPR/77nc1slZsubUcl8ywagZ2mr842BJImUk7A4uJlOXpHIxUMZ5IKy
 IReVoWKIjlsPzP9WAVdXJEnYqY6/3H0AGJZsTrUjc3l14G4i9V1k49r1H/59wk+jru8k
 6sOA==
X-Gm-Message-State: AOAM532ZQ3IeRLvuJa1NiubHeJPF5Zc+VmXnYPUrneZBtWGxFXWRvLuC
 hjALn1MoGqG5woQrePaR8kpNexA5SdmWsGUJDD1wDTm8rY1xaava
X-Google-Smtp-Source: ABdhPJxIeImXeGcEUcgFs2e9dp/FZnXuKxAPSESMQKMXzdRtxRrhhqG4eFKLjIxSCKwnkBW31yEAgxySbJ/BT2VBGKw=
X-Received: by 2002:a6b:d60a:0:b0:63a:be64:c652 with SMTP id
 w10-20020a6bd60a000000b0063abe64c652mr25028432ioa.27.1646264175249; Wed, 02
 Mar 2022 15:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
 <20220219002518.1936806-11-atishp@rivosinc.com>
In-Reply-To: <20220219002518.1936806-11-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Mar 2022 09:35:49 +1000
Message-ID: <CAKmqyKO2KetER00Oz+M_YTwVubpdY5EY-53QSjCZMEHpF5TNsg@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] target/riscv: Add few cache related PMU events
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Mar 2022 23:36:19 -0000

On Sat, Feb 19, 2022 at 10:33 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> Qemu can monitor the following cache related PMU events through
> tlb_fill functions.
>
> 1. DTLB load/store miss
> 3. ITLB prefetch miss
>
> Increment the PMU counter in tlb_fill function.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 746335bfd6b9..094d41ba07f7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -21,10 +21,13 @@
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> +#include "pmu.h"
>  #include "exec/exec-all.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
> +#include "cpu.h"
> +#include "cpu_bits.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
> @@ -1174,6 +1177,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      riscv_raise_exception(env, cs->exception_index, retaddr);
>  }
>
> +
> +static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
> +{
> +    enum riscv_pmu_event_idx pmu_event_type;
> +
> +    switch (access_type) {
> +    case MMU_INST_FETCH:
> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
> +        break;
> +    case MMU_DATA_LOAD:
> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
> +        break;
> +    case MMU_DATA_STORE:
> +        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
> +        break;
> +    default:
> +        return;
> +    }
> +
> +    riscv_pmu_incr_ctr(cpu, pmu_event_type);
> +}
> +
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr)
> @@ -1270,6 +1295,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              }
>          }
>      } else {
> +        pmu_tlb_fill_incr_ctr(cpu, access_type);
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                     access_type, mmu_idx, true, false, false);
> --
> 2.30.2
>
>

