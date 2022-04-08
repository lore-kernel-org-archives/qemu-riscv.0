Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nchwF-0000sD-Ij
	for mharc-qemu-riscv@gnu.org; Fri, 08 Apr 2022 02:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nchw1-0000pE-Rr; Fri, 08 Apr 2022 02:17:30 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:45771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nchvy-0004aH-4F; Fri, 08 Apr 2022 02:17:29 -0400
Received: by mail-il1-x12c.google.com with SMTP id t4so5790014ilo.12;
 Thu, 07 Apr 2022 23:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQ4WHZWYKR8oxQ4XjqX5oEEa7vFfwyab6dIO0L3Hgbg=;
 b=XfTXW97pex3wrFylreDDV75EueWRZ+P/qSgjZH6VV3Y/ku9YijULX1VZFI7460k6fj
 QNv3dknP7PrPWxNZYNtbM/N1cQDM1KZ514trZorEsQ3zm2RGodU0pvxJUJCQ4SXwWx/T
 CxStIggqYUJH6hXl56Fo+EHBptYndxkbcf7gxeOOh/O9j5ZFX3HImVdDBAWsH1vz3UU1
 Ac+ono9NJos4wZpD3buKOpmHw64X7jHpXDsbwYvWyz/bWmsj+sCwhAvT9MLeTc/xuxiv
 DPra0DljzEa8fKSVNdlecH42jSHLL337CobiKZV2xk5RPq/wx9CAeUAzdGMVEzSumbPJ
 2icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQ4WHZWYKR8oxQ4XjqX5oEEa7vFfwyab6dIO0L3Hgbg=;
 b=bs3uefBaP6iiUcMpNdWInoA/DH/xrrR91OrbdoIUeIqYBR7ibufym4a014DWrQ2Gpu
 Tw+k9yRTuZjsgGX7tSJHZPut/CnNZvz+JLI9MC2josQkzSZCDBQ+i0/do5QTJu69leJj
 AhLb6r2JinidMJwchFyehIaa7kaHwmcpsrV5I7q1DvlOIA1k7e9X9oLpCTVw+9Ptle1H
 mEAYR5X8j5uZvepafX7w3qEiVIpE3zQdQTqj5zmPz2m5cFBhBSL1JQKPVPnlGktC9mEA
 ldYIRdmMv3ahBirSw6fpsFHCQzLQ5ZphTZJ1TMqx8AZzRI4dkNBmKs26lrpJtIKk/pXp
 gAqQ==
X-Gm-Message-State: AOAM5314Ztkem+2Tr+j7DkZyPuH2SwO0xljFq5di5q3433wm3xcuT/73
 uGpQ1I7lG0y57JcMA9PsE3LrNE/0j70c9sPB2KGqclHxNp734Q==
X-Google-Smtp-Source: ABdhPJyFTloDMHVplm7LrvlLqwXMFUWLi+u9F5mXHG1UELS+9eXLheeY0yN5vhazkT6e15XADI5OZFlWFD0SrBqXns0=
X-Received: by 2002:a05:6e02:219c:b0:2c9:a936:7a1 with SMTP id
 j28-20020a056e02219c00b002c9a93607a1mr7879529ila.55.1649398642035; Thu, 07
 Apr 2022 23:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220401125948.79292-1-richard.henderson@linaro.org>
 <20220401125948.79292-3-richard.henderson@linaro.org>
In-Reply-To: <20220401125948.79292-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Apr 2022 16:16:55 +1000
Message-ID: <CAKmqyKNX_JyT0k92tKgZtiC9ZbLJVtZS2RXSoAQONnDg07dHsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Mark amo insns during translation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Fri, 08 Apr 2022 06:17:41 -0000

On Fri, Apr 1, 2022 at 11:04 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Atomic memory operations perform both reads and writes as part
> of their implementation, but always raise write faults.
>
> Use TARGET_INSN_START_EXTRA_WORDS to mark amo insns in the
> opcode stream, and force the access type to write at the
> point of raising the exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      | 15 ++++++
>  target/riscv/cpu.c                      |  3 ++
>  target/riscv/cpu_helper.c               | 62 +++++++++++++++++--------
>  target/riscv/translate.c                |  9 ++++
>  target/riscv/insn_trans/trans_rva.c.inc | 11 ++++-
>  5 files changed, 79 insertions(+), 21 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c069fe85fa..3de4da3fa1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -290,6 +290,13 @@ struct CPUArchState {
>      /* True if in debugger mode.  */
>      bool debugger;
>
> +    /*
> +     * True if unwinding through an amo insn.  Used to transform a
> +     * read fault into a store_amo fault; only valid immediately
> +     * after cpu_restore_state().
> +     */
> +    bool unwind_amo;
> +
>      /*
>       * CSRs for PointerMasking extension
>       */
> @@ -517,6 +524,14 @@ FIELD(TB_FLAGS, XL, 20, 2)
>  FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>
> +#ifndef CONFIG_USER_ONLY
> +/*
> + * RISC-V-specific extra insn start words:
> + * 1: True if the instruction is AMO, false otherwise.
> + */
> +#define TARGET_INSN_START_EXTRA_WORDS 1
> +#endif
> +
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
>  #else
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..3818d5ba80 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -396,6 +396,9 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
>      } else {
>          env->pc = data[0];
>      }
> +#ifndef CONFIG_USER_ONLY
> +    env->unwind_amo = data[1];
> +#endif
>  }
>
>  static void riscv_cpu_reset(DeviceState *dev)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 126251d5da..b5bbe6fc39 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1139,26 +1139,11 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
>
> -    if (access_type == MMU_DATA_STORE) {
> -        cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> -    } else if (access_type == MMU_DATA_LOAD) {
> -        cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> -    } else {
> -        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
> +    cpu_restore_state(cs, retaddr, true);
> +    if (env->unwind_amo) {
> +        access_type = MMU_DATA_STORE;
>      }
>
> -    env->badaddr = addr;
> -    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> -                            riscv_cpu_two_stage_lookup(mmu_idx);
> -    cpu_loop_exit_restore(cs, retaddr);
> -}
> -
> -void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   MMUAccessType access_type, int mmu_idx,
> -                                   uintptr_t retaddr)
> -{
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    CPURISCVState *env = &cpu->env;
>      switch (access_type) {
>      case MMU_INST_FETCH:
>          cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
> @@ -1172,10 +1157,43 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      default:
>          g_assert_not_reached();
>      }
> +
>      env->badaddr = addr;
>      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
>                              riscv_cpu_two_stage_lookup(mmu_idx);
> -    cpu_loop_exit_restore(cs, retaddr);
> +    cpu_loop_exit(cs);
> +}
> +
> +void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                   MMUAccessType access_type, int mmu_idx,
> +                                   uintptr_t retaddr)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    cpu_restore_state(cs, retaddr, true);
> +    if (env->unwind_amo) {
> +        access_type = MMU_DATA_STORE;
> +    }
> +
> +    switch (access_type) {
> +    case MMU_INST_FETCH:
> +        cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
> +        break;
> +    case MMU_DATA_LOAD:
> +        cs->exception_index = RISCV_EXCP_LOAD_ADDR_MIS;
> +        break;
> +    case MMU_DATA_STORE:
> +        cs->exception_index = RISCV_EXCP_STORE_AMO_ADDR_MIS;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    env->badaddr = addr;
> +    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> +                            riscv_cpu_two_stage_lookup(mmu_idx);
> +    cpu_loop_exit(cs);
>  }
>
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> @@ -1307,11 +1325,15 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      } else if (probe) {
>          return false;
>      } else {
> +        cpu_restore_state(cs, retaddr, true);
> +        if (env->unwind_amo) {
> +            access_type = MMU_DATA_STORE;
> +        }
>          raise_mmu_exception(env, address, access_type, pmp_violation,
>                              first_stage_error,
>                              riscv_cpu_virt_enabled(env) ||
>                                  riscv_cpu_two_stage_lookup(mmu_idx));
> -        cpu_loop_exit_restore(cs, retaddr);
> +        cpu_loop_exit(cs);
>      }
>
>      return true;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fac998a6b5..ae4b0d1524 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -107,6 +107,10 @@ typedef struct DisasContext {
>      /* PointerMasking extension */
>      bool pm_mask_enabled;
>      bool pm_base_enabled;
> +#ifndef CONFIG_USER_ONLY
> +    /* TCG op of the current insn_start.  */
> +    TCGOp *insn_start;
> +#endif
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -1105,7 +1109,12 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
> +#ifdef CONFIG_USER_ONLY
>      tcg_gen_insn_start(ctx->base.pc_next);
> +#else
> +    tcg_gen_insn_start(ctx->base.pc_next, 0);
> +    ctx->insn_start = tcg_last_op();
> +#endif
>  }
>
>  static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 45db82c9be..66faa8f1da 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -37,6 +37,13 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      return true;
>  }
>
> +static void record_insn_start_amo(DisasContext *ctx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    tcg_set_insn_start_param(ctx->insn_start, 1, 1);
> +#endif
> +}
> +
>  static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
>      TCGv dest, src1, src2;
> @@ -73,6 +80,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       */
>      tcg_gen_movi_tl(load_res, -1);
>
> +    record_insn_start_amo(ctx);
>      return true;
>  }
>
> @@ -85,8 +93,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>      TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>
>      func(dest, src1, src2, ctx->mem_idx, mop);
> -
>      gen_set_gpr(ctx, a->rd, dest);
> +
> +    record_insn_start_amo(ctx);
>      return true;
>  }
>
> --
> 2.25.1
>
>

