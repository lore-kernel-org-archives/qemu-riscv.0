Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kLwJM-0000ch-FO
	for mharc-qemu-riscv@gnu.org; Fri, 25 Sep 2020 18:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kLwJK-0000cS-KV; Fri, 25 Sep 2020 18:35:26 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kLwJI-0002C0-LM; Fri, 25 Sep 2020 18:35:26 -0400
Received: by mail-io1-xd41.google.com with SMTP id r9so4805845ioa.2;
 Fri, 25 Sep 2020 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pNtNvcOuGt+SPK/6lhoKXJMO4Y7Ko+SCJhv8pRJRxsM=;
 b=QaUFdDENHBNjqIPP7ItxLHd61OTAGDYPcJ+FsNNPYb8z6n3qeLjuH552YP1ebK6wHJ
 dOznhkcmkq6jTHn7Pynno9l+V0LcyZO8fSXiWbMcYgY+xu8z6pVgofMUvtufG1/75JSB
 GRFZYgAsRc9lrGDNHpbesFedMquEf3BSDh3l+tpXGBfxB7U/q8rNzHnmvjW+2cX6MpZV
 YjLd2UG9L4wISZ9Hijt789rdB9N43hog1vW0+3Niph6ypSGzZHvSP3eKPxJ3jTPo6877
 B/AfXUtEc3r42vXlI/pE06QC4SICV/GYbLQxfYXmAaVUyXfJ10BDcaTYHbRQDHjO/LTL
 Zw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNtNvcOuGt+SPK/6lhoKXJMO4Y7Ko+SCJhv8pRJRxsM=;
 b=aZR3tmJwuk8NCgeQky1gV9ZO4OmRFpBF/eQhF2h823My69yvXGPXBOtv3Yk24d7Hpa
 Lr4Yz2Teb9kheYWS75RegSgk9m1PW5g03H+SNQr9A/1+uNaUjnbGDALCJMUhcD/+6511
 tz73aJAdputUkpxnIrBubggHcFWjkHgGMqU/Dw8xGufhUKKDLL7xdjDhwsi0GWGDWFlu
 otLOWN5UdX3akRsrINuyyrg0niq8FZxohxIoNR+9nYwoz+koy4FxCs26q5Qt23zdh++N
 5t7dSzlQaJRDayS7BW623ESAW+WHLcV4SjtiVi5BcCl1of2BNQm1yRiUWmGBR9m0UTp2
 c33g==
X-Gm-Message-State: AOAM532XkgdaSH0IDGtY7n+XnY6FIgvVQYgGPKY5XPqXU/BYGsibsW1Z
 bzMnZlpaKxROPaSkboeSJ2wCtB/Gnf8obEgLvP8=
X-Google-Smtp-Source: ABdhPJxVdykndFYyguF7SxGRfdmHkeWEhj+Z/f+u1KlCL5jQVxKZARnnrMnqiaS5ERkiffEaqO0MZpFKSZPY26HTjPc=
X-Received: by 2002:a05:6602:2f88:: with SMTP id
 u8mr542921iow.175.1601073323102; 
 Fri, 25 Sep 2020 15:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200824084158.1769-1-jiangyifei@huawei.com>
In-Reply-To: <20200824084158.1769-1-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Sep 2020 15:24:04 -0700
Message-ID: <CAKmqyKOAAzhBqosJCFq9ww0T44EUZV1zqG+T1UPYAuebYbR1KQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: raise exception to HS-mode at
 get_physical_address
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 zhang.zhanghailiang@huawei.com, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 victor.zhangxiaofeng@huawei.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng1@huawei.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, wu.wubin@huawei.com, 
 "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Sep 2020 22:35:27 -0000

On Mon, Aug 24, 2020 at 1:43 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> VS-stage translation at get_physical_address needs to translate pte
> address by G-stage translation. But the G-stage translation error
> can not be distinguished from VS-stage translation error in
> riscv_cpu_tlb_fill. On migration, destination needs to rebuild pte,
> and this G-stage translation error must be handled by HS-mode. So
> introduce TRANSLATE_STAGE2_FAIL so that riscv_cpu_tlb_fill could
> distinguish and raise it to HS-mode.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Thanks for the patch!

Sorry for the delay here.

> ---
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_helper.c | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a804a5d0ba..8b3b368d6a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -85,6 +85,7 @@ enum {
>  #define TRANSLATE_FAIL 1
>  #define TRANSLATE_SUCCESS 0
>  #define MMU_USER_IDX 3
> +#define TRANSLATE_G_STAGE_FAIL 4
>
>  #define MAX_RISCV_PMPS (16)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index fd1d373b6f..1635b09c41 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -440,7 +440,10 @@ restart:
>                                                   mmu_idx, false, true);
>
>              if (vbase_ret != TRANSLATE_SUCCESS) {
> -                return vbase_ret;
> +                env->guest_phys_fault_addr = (base |
> +                                              (addr &
> +                                               (TARGET_PAGE_SIZE - 1))) >> 2;

Can we set guest_phys_fault_addr in riscv_cpu_tlb_fill() instead?

> +                return TRANSLATE_G_STAGE_FAIL;
>              }
>
>              pte_addr = vbase + idx * ptesize;
> @@ -728,12 +731,17 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          ret = get_physical_address(env, &pa, &prot, address, access_type,
>                                     mmu_idx, true, true);
>
> +        if (ret == TRANSLATE_G_STAGE_FAIL) {
> +            first_stage_error = false;
> +            access_type = MMU_DATA_LOAD;
> +        }
> +
>          qemu_log_mask(CPU_LOG_MMU,
>                        "%s 1st-stage address=%" VADDR_PRIx " ret %d physical "
>                        TARGET_FMT_plx " prot %d\n",
>                        __func__, address, ret, pa, prot);
>
> -        if (ret != TRANSLATE_FAIL) {
> +        if (ret != TRANSLATE_FAIL && ret != TRANSLATE_G_STAGE_FAIL) {

Otherwise this patch looks correct.

Alistair

>              /* Second stage lookup */
>              im_address = pa;
>
> --
> 2.19.1
>
>
>

