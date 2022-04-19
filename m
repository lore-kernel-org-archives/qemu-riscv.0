Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngiWP-0005Bq-Ea
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 03:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ngiWE-00058I-OL
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 03:43:29 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1ngiWC-0002zs-GA
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 03:43:26 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id p65so29536492ybp.9
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sUBtKgaDDO5gsavpfTA6knsKOiOHEoIstaV1p4FqyZ0=;
 b=UbwFpDJv7hY2eFYXQl7bVcai0nP1bQbVsZKsJKrVH3GKpvMZ2KS0FRyolJ/Pt7h0Rq
 znQksJdtGzXz32S1hz8goPgZ5ny1AbppwKwJTShp1is5vYkRcvYZ35muDhpYOrGuv5yp
 nTnoMs7GPS4KBPSL/3IpGNe7M9VWYek3H0MD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sUBtKgaDDO5gsavpfTA6knsKOiOHEoIstaV1p4FqyZ0=;
 b=cTSW2YiqIxuKsskWa1KsrhmlH1nU2XhaqNvofF3Rk2uSGMxCjlDGhTHc74cp2aypn9
 J/+c9chIkAT2gRKImBfQpvrXmJqxfLVIcsEWmXCufM3IVHNkxElF2nTcq8o6BNaFjV5+
 YNzUDs/30E23IdatjSgCsGPndTYTwsmYtJFoeiWWVFSRi0vP3PFECfxo624xfrJgp7WH
 bujsiA2Mo1sOjM/h5Q1Mf6Qz6/lQLhT0v4Q7gbnhbSvCtO0y7oP5urmKnLGse9fIeuzz
 EiICszvtQYoh6qRIIkVcbooz+SDmcwtZE2foTYSeGfsw4953r07u+NiUdlqkoWvZoOhc
 kvvA==
X-Gm-Message-State: AOAM5324Nh0hGTogb9bPKJVeT4ZKncnK1L2G/ff/uv90Gj7QwzjANa1v
 ezGWq9t7I7pQmEkqmvysoP14dX5g2ZXOo9da0pud
X-Google-Smtp-Source: ABdhPJxUXod2qiC8y1YJaRwTI/mw/v6uygQ8RcxInJBOdcN6ihj+scy4p7UUANf8hPeYryEXtVgBHUp8ty6OnaiKK3A=
X-Received: by 2002:a25:db8c:0:b0:642:876d:2e4b with SMTP id
 g134-20020a25db8c000000b00642876d2e4bmr13938620ybf.405.1650354203085; Tue, 19
 Apr 2022 00:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220401125948.79292-1-richard.henderson@linaro.org>
 <20220401125948.79292-3-richard.henderson@linaro.org>
 <CAKmqyKNX_JyT0k92tKgZtiC9ZbLJVtZS2RXSoAQONnDg07dHsg@mail.gmail.com>
In-Reply-To: <CAKmqyKNX_JyT0k92tKgZtiC9ZbLJVtZS2RXSoAQONnDg07dHsg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Apr 2022 00:43:12 -0700
Message-ID: <CAOnJCUK98J1DMJXqaSzPdGrP75s5O432cVpvXYmzu_WtM3pKFw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Mark amo insns during translation
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Tue, 19 Apr 2022 07:43:29 -0000

On Thu, Apr 7, 2022 at 11:17 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Apr 1, 2022 at 11:04 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Atomic memory operations perform both reads and writes as part
> > of their implementation, but always raise write faults.
> >
> > Use TARGET_INSN_START_EXTRA_WORDS to mark amo insns in the
> > opcode stream, and force the access type to write at the
> > point of raising the exception.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

This results in the following segfault in 5.17
Qemu tree: riscv-to-apply.next

[    1.134496] Run /init as init process
[    1.329796] mount[61]: unhandled signal 11 code 0x2 at
0x00000000000c29c6 in busybox[10000+159000]
[    1.331185] CPU: 2 PID: 61 Comm: mount Not tainted 5.17.0 #59
[    1.331632] Hardware name: riscv-virtio,qemu (DT)
[    1.332053] epc : 00000000000c29c6 ra : 00000000000a03f2 sp :
00007fffd6707ae0
[    1.332350]  gp : 000000000016c408 tp : 00000000001707a0 t0 :
0000000000001000
[    1.332575]  t1 : 0000000000000000 t2 : 0000000000080000 s0 :
0000000000163398
[    1.332797]  s1 : 0000000000163398 a0 : 0000000000000000 a1 :
0000000000000000
[    1.333018]  a2 : 0000000000171590 a3 : 0000000000000000 a4 :
0000000000000001
[    1.333371]  a5 : 0000000000000001 a6 : fffffffffbada498 a7 :
000000000000003f
[    1.333607]  s2 : 0000000000000004 s3 : 0000000000000001 s4 :
0000000000000000
[    1.333829]  s5 : 0000000000000003 s6 : 0000000000000000 s7 :
000000000016c280
[    1.334052]  s8 : 0000000000000001 s9 : 0000000000170828 s10:
0000000000000000
[    1.334275]  s11: 0000000000000001 t3 : 0000000000000000 t4 :
00000000001410f0
[    1.334500]  t5 : 0000000000000005 t6 : ffffffffffffffff
[    1.334669] status: 0000000200004020 badaddr: 00000000000c29c6
cause: 000000000000000f
Segmentation fault



> Alistair
>
> > ---
> >  target/riscv/cpu.h                      | 15 ++++++
> >  target/riscv/cpu.c                      |  3 ++
> >  target/riscv/cpu_helper.c               | 62 +++++++++++++++++--------
> >  target/riscv/translate.c                |  9 ++++
> >  target/riscv/insn_trans/trans_rva.c.inc | 11 ++++-
> >  5 files changed, 79 insertions(+), 21 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index c069fe85fa..3de4da3fa1 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -290,6 +290,13 @@ struct CPUArchState {
> >      /* True if in debugger mode.  */
> >      bool debugger;
> >
> > +    /*
> > +     * True if unwinding through an amo insn.  Used to transform a
> > +     * read fault into a store_amo fault; only valid immediately
> > +     * after cpu_restore_state().
> > +     */
> > +    bool unwind_amo;
> > +
> >      /*
> >       * CSRs for PointerMasking extension
> >       */
> > @@ -517,6 +524,14 @@ FIELD(TB_FLAGS, XL, 20, 2)
> >  FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
> >  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> >
> > +#ifndef CONFIG_USER_ONLY
> > +/*
> > + * RISC-V-specific extra insn start words:
> > + * 1: True if the instruction is AMO, false otherwise.
> > + */
> > +#define TARGET_INSN_START_EXTRA_WORDS 1
> > +#endif
> > +
> >  #ifdef TARGET_RISCV32
> >  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> >  #else
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ddda4906ff..3818d5ba80 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -396,6 +396,9 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
> >      } else {
> >          env->pc = data[0];
> >      }
> > +#ifndef CONFIG_USER_ONLY
> > +    env->unwind_amo = data[1];
> > +#endif
> >  }
> >
> >  static void riscv_cpu_reset(DeviceState *dev)
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 126251d5da..b5bbe6fc39 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1139,26 +1139,11 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> >      CPURISCVState *env = &cpu->env;
> >
> > -    if (access_type == MMU_DATA_STORE) {
> > -        cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> > -    } else if (access_type == MMU_DATA_LOAD) {
> > -        cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> > -    } else {
> > -        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
> > +    cpu_restore_state(cs, retaddr, true);
> > +    if (env->unwind_amo) {
> > +        access_type = MMU_DATA_STORE;
> >      }
> >
> > -    env->badaddr = addr;
> > -    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> > -                            riscv_cpu_two_stage_lookup(mmu_idx);
> > -    cpu_loop_exit_restore(cs, retaddr);
> > -}
> > -
> > -void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> > -                                   MMUAccessType access_type, int mmu_idx,
> > -                                   uintptr_t retaddr)
> > -{
> > -    RISCVCPU *cpu = RISCV_CPU(cs);
> > -    CPURISCVState *env = &cpu->env;
> >      switch (access_type) {
> >      case MMU_INST_FETCH:
> >          cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
> > @@ -1172,10 +1157,43 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> >      default:
> >          g_assert_not_reached();
> >      }
> > +
> >      env->badaddr = addr;
> >      env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> >                              riscv_cpu_two_stage_lookup(mmu_idx);
> > -    cpu_loop_exit_restore(cs, retaddr);
> > +    cpu_loop_exit(cs);
> > +}
> > +
> > +void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> > +                                   MMUAccessType access_type, int mmu_idx,
> > +                                   uintptr_t retaddr)
> > +{
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +    CPURISCVState *env = &cpu->env;
> > +
> > +    cpu_restore_state(cs, retaddr, true);
> > +    if (env->unwind_amo) {
> > +        access_type = MMU_DATA_STORE;
> > +    }
> > +
> > +    switch (access_type) {
> > +    case MMU_INST_FETCH:
> > +        cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
> > +        break;
> > +    case MMU_DATA_LOAD:
> > +        cs->exception_index = RISCV_EXCP_LOAD_ADDR_MIS;
> > +        break;
> > +    case MMU_DATA_STORE:
> > +        cs->exception_index = RISCV_EXCP_STORE_AMO_ADDR_MIS;
> > +        break;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +
> > +    env->badaddr = addr;
> > +    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
> > +                            riscv_cpu_two_stage_lookup(mmu_idx);
> > +    cpu_loop_exit(cs);
> >  }
> >
> >  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > @@ -1307,11 +1325,15 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >      } else if (probe) {
> >          return false;
> >      } else {
> > +        cpu_restore_state(cs, retaddr, true);
> > +        if (env->unwind_amo) {
> > +            access_type = MMU_DATA_STORE;
> > +        }
> >          raise_mmu_exception(env, address, access_type, pmp_violation,
> >                              first_stage_error,
> >                              riscv_cpu_virt_enabled(env) ||
> >                                  riscv_cpu_two_stage_lookup(mmu_idx));
> > -        cpu_loop_exit_restore(cs, retaddr);
> > +        cpu_loop_exit(cs);
> >      }
> >
> >      return true;
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index fac998a6b5..ae4b0d1524 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -107,6 +107,10 @@ typedef struct DisasContext {
> >      /* PointerMasking extension */
> >      bool pm_mask_enabled;
> >      bool pm_base_enabled;
> > +#ifndef CONFIG_USER_ONLY
> > +    /* TCG op of the current insn_start.  */
> > +    TCGOp *insn_start;
> > +#endif
> >  } DisasContext;
> >
> >  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> > @@ -1105,7 +1109,12 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> >  {
> >      DisasContext *ctx = container_of(dcbase, DisasContext, base);
> >
> > +#ifdef CONFIG_USER_ONLY
> >      tcg_gen_insn_start(ctx->base.pc_next);
> > +#else
> > +    tcg_gen_insn_start(ctx->base.pc_next, 0);
> > +    ctx->insn_start = tcg_last_op();
> > +#endif
> >  }
> >
> >  static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> > diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> > index 45db82c9be..66faa8f1da 100644
> > --- a/target/riscv/insn_trans/trans_rva.c.inc
> > +++ b/target/riscv/insn_trans/trans_rva.c.inc
> > @@ -37,6 +37,13 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
> >      return true;
> >  }
> >
> > +static void record_insn_start_amo(DisasContext *ctx)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    tcg_set_insn_start_param(ctx->insn_start, 1, 1);
> > +#endif
> > +}
> > +
> >  static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
> >  {
> >      TCGv dest, src1, src2;
> > @@ -73,6 +80,7 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
> >       */
> >      tcg_gen_movi_tl(load_res, -1);
> >
> > +    record_insn_start_amo(ctx);
> >      return true;
> >  }
> >
> > @@ -85,8 +93,9 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
> >      TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> >
> >      func(dest, src1, src2, ctx->mem_idx, mop);
> > -
> >      gen_set_gpr(ctx, a->rd, dest);
> > +
> > +    record_insn_start_amo(ctx);
> >      return true;
> >  }
> >
> > --
> > 2.25.1
> >
> >
>


-- 
Regards,
Atish

