Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m9Lm7-0006Gd-RL
	for mharc-qemu-riscv@gnu.org; Fri, 30 Jul 2021 02:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m9Lm6-0006FI-9r; Fri, 30 Jul 2021 02:13:38 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m9Lm4-0005T7-DH; Fri, 30 Jul 2021 02:13:37 -0400
Received: by mail-il1-x131.google.com with SMTP id d10so8292124ils.7;
 Thu, 29 Jul 2021 23:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KhohUam7iMysqtuYcPVUjeyX1prd6dKUzB7eDRsXSE=;
 b=lBWP6CmVsz2hw0si+O3jjOx7Y8d0ZN8tfgvdpAcTRi6BITJTZ2+P81mhqw8Fc+Saus
 cglXRoeBrn9vPO23TIQ8Ehh8bw0O0C1ju/pfF46dThPINRX68BQ+momOyzx6cB1C5XAH
 xwTXk5brDVo2Tg1lbvC5Br7yn8/8DvCMADf7+iDXlkuGirQSSDanGnUWdy8efkcHvzwm
 H1uxFs9Kjirh+b39/ZsseTaMYkWWs22SGts9jluWtTpgmHoQfVdh+NxT2CJ/yPcoTo+5
 etIVLBROXdOil02qs24gMXde1gOE+mk3G546ig1FUloUIvxOX9sXlSGRxMrl0qzomYkY
 MczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KhohUam7iMysqtuYcPVUjeyX1prd6dKUzB7eDRsXSE=;
 b=hkpD2viFpkQhe0F32fGLRe+UJlPuDoD6ZNGsgjAY79tCXpCfcjh7rKR8nuvDQkn16v
 nFKd8ni2UAQFqjinN3GrI/R2mbz28b+MDjcj9pCWfTbNkvf/wFvCotBSx0QvR7uUZZBx
 jxJ2flARufC1Auq2t5N21X4IHVm4Xt1CEv/H6e8EkQhsR5FriQGZo/e60Aj866Cb9Ugr
 2mkCrO9GmKm+oMBeuLy6BaIPrTZz3TeF79rHSkamEkpLN+F94WpFgBSFEfXHIIFU3BuK
 Oi5dQiLsyQHlAyLTHM86m3yPiZQE9wqMl2fHUTtDelPewhUzgW7md/ZCu/Xr0zfIyT76
 ErMA==
X-Gm-Message-State: AOAM530PJq2qoG1ZkqZjqhEgtsSLlzejkHeWj0cx9+vcRgzxborVfbaB
 DFhM7Vt/8L//yRP+ACzt352bhkAcHZkhmiZ5fvk=
X-Google-Smtp-Source: ABdhPJx0wMaXVHOl93Qtrl1+Hq1xD7SIXPWBTRghxEnfxKogiSnOXpYFUJ2UYO4endyErDtTwtw/3KXFXzFAK33ejl4=
X-Received: by 2002:a92:d8cf:: with SMTP id l15mr738834ilo.227.1627625613438; 
 Thu, 29 Jul 2021 23:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-10-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-10-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 30 Jul 2021 16:13:07 +1000
Message-ID: <CAKmqyKMZyVZ_OUVCsdh8BEBhb0pUKzEBLHxX+W4gHV+6m-96og@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/43] target/riscv: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Fri, 30 Jul 2021 06:13:38 -0000

On Thu, Jul 29, 2021 at 10:55 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/riscv/cpu_loop.c | 7 +++++++
>  target/riscv/cpu.c          | 2 +-
>  target/riscv/cpu_helper.c   | 8 +++++++-
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 74a9628dc9..0428140d86 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -92,6 +92,13 @@ void cpu_loop(CPURISCVState *env)
>              sigcode = TARGET_SEGV_MAPERR;
>              sigaddr = env->badaddr;
>              break;
> +        case RISCV_EXCP_INST_ADDR_MIS:
> +        case RISCV_EXCP_LOAD_ADDR_MIS:
> +        case RISCV_EXCP_STORE_AMO_ADDR_MIS:
> +            signum = TARGET_SIGBUS;
> +            sigcode = TARGET_BUS_ADRALN;
> +            sigaddr = env->badaddr;
> +            break;
>          case RISCV_EXCP_SEMIHOST:
>              env->gpr[xA0] = do_common_semihosting(cs);
>              env->pc += 4;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..591d17e62d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -644,11 +644,11 @@ static const struct TCGCPUOps riscv_tcg_ops = {
>      .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
>      .tlb_fill = riscv_cpu_tlb_fill,
> +    .do_unaligned_access = riscv_cpu_do_unaligned_access,
>
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = riscv_cpu_do_interrupt,
>      .do_transaction_failed = riscv_cpu_do_transaction_failed,
> -    .do_unaligned_access = riscv_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 968cb8046f..a440b2834f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -727,6 +727,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                              riscv_cpu_two_stage_lookup(mmu_idx);
>      riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                     MMUAccessType access_type, int mmu_idx,
> @@ -734,6 +735,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> +
>      switch (access_type) {
>      case MMU_INST_FETCH:
>          cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
> @@ -748,11 +750,15 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>          g_assert_not_reached();
>      }
>      env->badaddr = addr;
> +
> +#ifdef CONFIG_USER_ONLY
> +    cpu_loop_exit_restore(cs, retaddr);
> +#else
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
>      riscv_raise_exception(env, cs->exception_index, retaddr);
> +#endif
>  }
> -#endif /* !CONFIG_USER_ONLY */
>
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
> --
> 2.25.1
>
>

