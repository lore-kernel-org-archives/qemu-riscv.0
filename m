Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oFBfW-0002fO-7T
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jul 2022 05:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oFBfU-0002f2-Db
 for qemu-riscv@nongnu.org; Sat, 23 Jul 2022 05:43:28 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oFBfS-0004Z4-K2
 for qemu-riscv@nongnu.org; Sat, 23 Jul 2022 05:43:28 -0400
Received: by mail-ed1-x533.google.com with SMTP id c12so962410ede.3
 for <qemu-riscv@nongnu.org>; Sat, 23 Jul 2022 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ffHabsiMlXNwoM965pA456V2X+9On0E0OZY7hx1m624=;
 b=doXVFIO16rSkgsMkloM7korx4AQSgd/yGjPIJzCRAukhhZm5uSW7GLgcYORuGB4pUB
 ecJciQN2fH051bmIsCDTbwz0E8NvqLonSzLMb6T15S/pzfKqe4DC4m7f5LnYcyhSgFwo
 FyCbZA/BsD5aa7kfb9zzpL9q7NsoI3k25ws3AjdQQdr25fAzr5if1u9++H0SH3knmoLB
 it1FdWUpUaYl+UNaBVf+icei7eYKVKxQdTF/uPa9Sy4rzsnWQ6CWY03XxWoJ7nx0bgW7
 wa/WOJKh/d6gdRXiY5bM3rjqESRkH+/0EjVEeRLmjc9FVgGKYg4Q+0ECX41TpOVLFFfD
 KXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ffHabsiMlXNwoM965pA456V2X+9On0E0OZY7hx1m624=;
 b=GsiCNhFhiXYTJMAi2wsnCHX5IQ7hHMUyGcYc+fLNSHIHvixa+pC1D5yCCFGXIjkORm
 ODNMaxyoWUbGFnxYX73lv/uihj/E0HXjMsaaOz0InKvgiy0Nh2qpmby/GGxwgP7IF8yN
 YUUJPYjk0uA/TvPLeoinlgsVGfIp+XoUitRdvcyRGpJdPNSKPDFJwU8H/HZ7GUVHOKA3
 5wCRiNr4krp1Tr5RCYv0XXVQzaMdDb5/eiuo4bHf1hJ8IVAqBUUgyL8iOnxqykF2qauG
 TDUVLK3luUSJ4sEv92wS78ASxgmR5tgJRQy3LRaY0CMSNjqkLtpePb7DPmL+CrZxhg7T
 Yn3Q==
X-Gm-Message-State: AJIora+xl/7FDQa2F3/Ov4sG2UkNBBFhP+rFJeQAMlYBuc1ayBI3hh85
 t8gPoSE+VSyLafMywwwKSvE6Rg==
X-Google-Smtp-Source: AGRyM1sghCwqr1FRdNGmTDj8gFdi7Be7oiAx01XFpeXds1MwtaGxlJbZcxBIs10B7MdyqQ2d/IP3AQ==
X-Received: by 2002:a05:6402:5191:b0:43b:d047:dcb5 with SMTP id
 q17-20020a056402519100b0043bd047dcb5mr3642743edd.390.1658569404249; 
 Sat, 23 Jul 2022 02:43:24 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a17090632d400b0072f32a84e75sm2914279ejk.110.2022.07.23.02.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 02:43:23 -0700 (PDT)
Date: Sat, 23 Jul 2022 11:43:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v6  1/3] hw/intc: Move mtimer/mtimecmp to aclint
Message-ID: <20220723094323.f3rsmdqwf7mno6wu@kamzik>
References: <20220722010046.343744-1-atishp@rivosinc.com>
 <20220722010046.343744-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722010046.343744-2-atishp@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 23 Jul 2022 09:43:28 -0000

On Thu, Jul 21, 2022 at 06:00:44PM -0700, Atish Patra wrote:
> Historically, The mtime/mtimecmp has been part of the CPU because
> they are per hart entities. However, they actually belong to aclint
> which is a MMIO device.
> 
> Move them to the ACLINT device. This also emulates the real hardware
> more closely.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  hw/intc/riscv_aclint.c         | 41 ++++++++++++++++++++++++----------
>  hw/timer/ibex_timer.c          | 18 ++++++---------
>  include/hw/intc/riscv_aclint.h |  2 ++
>  include/hw/timer/ibex_timer.h  |  2 ++
>  target/riscv/cpu.h             |  2 --
>  target/riscv/machine.c         |  5 ++---
>  6 files changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index e7942c4e5a32..47f355224612 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -32,6 +32,7 @@
>  #include "hw/intc/riscv_aclint.h"
>  #include "qemu/timer.h"
>  #include "hw/irq.h"
> +#include "migration/vmstate.h"
>  
>  typedef struct riscv_aclint_mtimer_callback {
>      RISCVAclintMTimerState *s;
> @@ -65,8 +66,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>  
>      uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
>  
> -    cpu->env.timecmp = value;
> -    if (cpu->env.timecmp <= rtc_r) {
> +    mtimer->timecmp[hartid] = value;
> +    if (mtimer->timecmp[hartid] <= rtc_r) {
>          /*
>           * If we're setting an MTIMECMP value in the "past",
>           * immediately raise the timer interrupt
> @@ -77,7 +78,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>  
>      /* otherwise, set up the future timer interrupt */
>      qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
> -    diff = cpu->env.timecmp - rtc_r;
> +    diff = mtimer->timecmp[hartid] - rtc_r;
>      /* back to ns (note args switched in muldiv64) */
>      uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
>  
> @@ -102,7 +103,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>          next = MIN(next, INT64_MAX);
>      }
>  
> -    timer_mod(cpu->env.timer, next);
> +    timer_mod(mtimer->timers[hartid], next);
>  }
>  
>  /*
> @@ -133,11 +134,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>                            "aclint-mtimer: invalid hartid: %zu", hartid);
>          } else if ((addr & 0x7) == 0) {
>              /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
> -            uint64_t timecmp = env->timecmp;
> +            uint64_t timecmp = mtimer->timecmp[hartid];
>              return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
> -            uint64_t timecmp = env->timecmp;
> +            uint64_t timecmp = mtimer->timecmp[hartid];
>              return (timecmp >> 32) & 0xFFFFFFFF;
>          } else {
>              qemu_log_mask(LOG_UNIMP,
> @@ -177,7 +178,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>          } else if ((addr & 0x7) == 0) {
>              if (size == 4) {
>                  /* timecmp_lo for RV32/RV64 */
> -                uint64_t timecmp_hi = env->timecmp >> 32;
> +                uint64_t timecmp_hi = mtimer->timecmp[hartid] >> 32;
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
>                      timecmp_hi << 32 | (value & 0xFFFFFFFF));
>              } else {
> @@ -188,7 +189,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>          } else if ((addr & 0x7) == 4) {
>              if (size == 4) {
>                  /* timecmp_hi for RV32/RV64 */
> -                uint64_t timecmp_lo = env->timecmp;
> +                uint64_t timecmp_lo = mtimer->timecmp[hartid];
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
>                      value << 32 | (timecmp_lo & 0xFFFFFFFF));
>              } else {
> @@ -234,7 +235,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>              }
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
>                                                mtimer->hartid_base + i,
> -                                              env->timecmp);
> +                                              mtimer->timecmp[i]);
>          }
>          return;
>      }
> @@ -284,6 +285,8 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
>      s->timer_irqs = g_new(qemu_irq, s->num_harts);
>      qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
>  
> +    s->timers = g_malloc0(s->num_harts * sizeof(QEMUTimer));

It looks like we're overallocating the space here, since we want an
array of QEMUTimer pointers, not QEMUTimer objects. Also, QEMU
prefers g_new to g_malloc (see docs/devel/style.rst).

Thanks,
drew

