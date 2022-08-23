Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQHwZ-0006Wg-Ff
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 20:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQHwX-0006VX-HY; Mon, 22 Aug 2022 20:38:57 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQHwV-0000sM-Q3; Mon, 22 Aug 2022 20:38:57 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f17so5801543pfk.11;
 Mon, 22 Aug 2022 17:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=QWJSG1mCato7fy35HOi31fuuqUpRw6UFFtGTADi6+EY=;
 b=co6Axs2GITqGBdiEiM8nvOH0i4TD0P8d8DgL8T5TzzgMMzw+g5cigYQFBLrUyZ6d2z
 +CssZpBh6mRA14inSnmlys9gVT+hgvPUBUKJZz4vg/ketbFJNImTV4R6yuXFjuJwCnT9
 JXW237tBumitZaMtwt09/FICrexDKA76E13yio4wXCZqclrrVA0+dXIZqAf4D5R/DG4L
 mgnPUp05e2BJwMnlhScPgHJ3FZ3ln/CqRkaLtYkuaFfPhCwdQVy+yhI/KogD0UNgrsjs
 1H9qr+o6J57RiGAN4yALEfdRoKdXbXpOZWn+0Z2JbKMq83ySWwyfXPN0EazeTg1G9n1v
 /UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=QWJSG1mCato7fy35HOi31fuuqUpRw6UFFtGTADi6+EY=;
 b=krBGWcFcwPwWcTRJCP5R1CYn4tsRuxCB5vLlNdp/YkMmjU+t81SMcv/yNGTBJbDFwo
 OdaDX75dPD6hd2WWKod5L40E3g/g0M23linGT0FfoLLcWvgIE5tr/+Ksf9TusWbYusvj
 b4ZWgl6Kecpd6OTMoWvOb5TbZ5H+dvMWByRmgustA4mJFO9ngWriiCm/awY0YLmGdQFd
 D7gg7mss8hVTlN5WdfctmpBtmuyuj6sw1vp+0z4HOWV9u8E0jOpRlyYVXCRh2VA6U9yc
 T3TMIwTAywkOmlaZbXt9oo4Rs+vTErRJvdgiTDHNuiPM7NbtiWhpNKUQ7Pv2BRELqliF
 sYMQ==
X-Gm-Message-State: ACgBeo24hMbGf9V1dIT8bwW95qT7+DLgAkZfKCv+R/7gQAcA91uiti/a
 d/zFu7HMnaCCkWIGa8r1atnX7zpCnSxEIydOc5A=
X-Google-Smtp-Source: AA6agR7ahsF7H1DeHY66UxmPeMKJPFBcP8doPadHZpdcWitDIGuAwSdJ35uYUJ3Gv0o80shAjS4AQv8s8qQlMRiBJ+g=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr22631806pfj.83.1661215133438; Mon, 22
 Aug 2022 17:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220816232321.558250-1-atishp@rivosinc.com>
 <20220816232321.558250-4-atishp@rivosinc.com>
In-Reply-To: <20220816232321.558250-4-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Aug 2022 10:38:27 +1000
Message-ID: <CAKmqyKOZzv6gxn7ntaK=FXKe5KosN4oJFJf55n_F7rsKz2TZWw@mail.gmail.com>
Subject: Re: [PATCH v13 3/6] target/riscv: Add few cache related PMU events
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Tue, 23 Aug 2022 00:38:57 -0000

On Wed, Aug 17, 2022 at 9:24 AM Atish Patra <atishp@rivosinc.com> wrote:
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
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

This patch causes a number of test failures.

On some boots I see lots of these errors printed:

qemu-system-riscv64: GLib: g_hash_table_lookup: assertion 'hash_table
!= NULL' failed

and I'm unable to boot Linux.

The command line is:

qemu-system-riscv64 \
    -machine sifive_u \
    -serial mon:stdio -serial null -nographic \
    -append "root=/dev/ram rw highres=off console=ttySIF0 ip=dhcp
earlycon=sbi" \
    -smp 5 \
    -d guest_errors \
    -kernel ./images/qemuriscv64/Image \
    -initrd ./images/qemuriscv64/buildroot/rootfs.cpio \
    -bios default -m 256M

I see that faiulre with the 5.19-rc7 kernel and OpenSBI 1.1.

I also see the same messages on other machines when running baremetal
code. I'm going to drop these patches from my tree

Alistair

> ---
>  target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1e4faa84e839..81948b37dd9a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -21,11 +21,13 @@
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> +#include "pmu.h"
>  #include "exec/exec-all.h"
>  #include "instmap.h"
>  #include "tcg/tcg-op.h"
>  #include "trace.h"
>  #include "semihosting/common-semi.h"
> +#include "cpu_bits.h"
>
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  {
> @@ -1188,6 +1190,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      cpu_loop_exit_restore(cs, retaddr);
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
> @@ -1286,6 +1310,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              }
>          }
>      } else {
> +        pmu_tlb_fill_incr_ctr(cpu, access_type);
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                     access_type, mmu_idx, true, false, false);
> --
> 2.25.1
>
>

