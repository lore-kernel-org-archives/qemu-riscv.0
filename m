Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSRjO-0000xd-Cj
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 19:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSRjM-0000xU-LF
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 19:02:32 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSRjK-0007qG-29
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 19:02:32 -0500
Received: by mail-ej1-x636.google.com with SMTP id qb15so1210931ejc.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PAefcUOnzj1B/nFgdkM9POAquJhLrIgi9JYQYtMQaRw=;
 b=6Cp3w10V858cvAtyvuAOu1nJyy0Tjc7tg+zXZjynxS/bb70YaLfQdvWwNtPhK2plmG
 w2iYjnaN7adAQqV5V6vDBfbNEy7hGvb7IPuxx8h0A3tyF3c9DcPB78IHd5T6rNwdro0u
 D0+V4rW6gtuAKLET1jQTTXlP5fCL88cUOiYKH/8FBUSDvwcjdQRksEe88+Mab114qhW2
 g93EZeATITfg3EAiUp2cX1s1/yvtXxigy1Bl0slkE6XzSiWgeJDxKt6pV2gCMV7aFA2X
 Ew1ieLcHqNwYN57tlom55pd3pvyLCP2/QI0hbYt8yp13SZcYXO7wwiZQcPPMcCfskGvp
 atMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PAefcUOnzj1B/nFgdkM9POAquJhLrIgi9JYQYtMQaRw=;
 b=5mUZGIKxGS9Dk9tfg8sgisxeNBbrvMUr+E37hEDt+j+rqk13b7v/CM0h0z4ZyCARb7
 7bUJpR1++664tO9MLlyAzIQj5emeJu3rAbWRA+r98Gq1DSRLIwRInBa0qchOkuaJATjY
 MTczF0WiSOsA2NP0ZIU67/dGAcIq+/RKv4Jh5ckpmMsKm6bgzV/0A8cHxc5n338LF0nL
 gLX6qO30wZDg4Em1U44CIZbhTdhtXKTKoKr51Nbw4/xBhxFjq9HK+XFYnyF4tGYUNqL1
 1xaqJ0RXAguvQ4K1vmhaU74xdydSfw1GV7YhRqh7538V966vom/YjYeSrCMeVxjMAJjw
 +lfA==
X-Gm-Message-State: AO0yUKVmTEK4KPrK67+L4jEl+J/Meo2sRcCYSeaJMD4nOOlNwNcUrbKj
 9JuI9h/jwHro0fShwfGW2VBSWt0JwWppHj2PD9RqHQ==
X-Google-Smtp-Source: AK7set/j4xGQ3NqrP4fTT9HIiQ8Qq0VNFyJ3+27mTY4ohc4UEwHLcNnOtdDs5bBUYKxE/PfeDmd4lX+ZnXQ/hUkLUxg=
X-Received: by 2002:a17:906:af10:b0:877:747c:373e with SMTP id
 lx16-20020a170906af1000b00877747c373emr1907922ejb.6.1676505748302; Wed, 15
 Feb 2023 16:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-8-debug@rivosinc.com>
 <adabbb03-aafe-5a3c-1ecb-6dddd6132be1@linux.alibaba.com>
In-Reply-To: <adabbb03-aafe-5a3c-1ecb-6dddd6132be1@linux.alibaba.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 16:02:08 -0800
Message-ID: <CAKC1njRVF8hxC+sWxZH7+2bWCgGbdSm6mOPLmVNhgM-eG7x3Rg@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 7/9] target/riscv: Tracking indirect
 branches (fcfi) using TCG
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, 
 Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Feb 2023 00:02:32 -0000

On Wed, Feb 15, 2023 at 12:55 AM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/2/9 14:24, Deepak Gupta wrote:
> > zisslpcfi protects forward control flow (if enabled) by enforcing all
> > indirect call and jmp must land on a landing pad instruction `lpcll`
> > short for landing pad and check lower label value. If target of an
> > indirect call or jmp is not `lpcll` then cpu/hart must raise an illegal
> > instruction exception.
> >
> > This patch implements the mechanism using TCG. Target architecture branch
> > instruction must define the end of a TB. Using this property, during
> > translation of branch instruction, TB flag = FCFI_LP_EXPECTED can be set.
> > Translation of target TB can check if FCFI_LP_EXPECTED flag is set and a
> > flag (fcfi_lp_expected) can be set in DisasContext. If `lpcll` gets
> > translated, fcfi_lp_expected flag in DisasContext can be cleared. Else
> > it'll fault.
> >
> > This patch also also adds flag for forward and backward cfi in
> > DisasContext.
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > Signed-off-by: Kip Walker  <kip@rivosinc.com>
> > ---
> >   target/riscv/cpu.h        |  3 +++
> >   target/riscv/cpu_helper.c | 12 +++++++++
> >   target/riscv/translate.c  | 52 +++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 67 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 8803ea6426..98b272bcad 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -644,6 +644,9 @@ FIELD(TB_FLAGS, VMA, 25, 1)
> >   /* Native debug itrigger */
> >   FIELD(TB_FLAGS, ITRIGGER, 26, 1)
> >
> > +/* Zisslpcfi needs a TB flag to track indirect branches */
> > +FIELD(TB_FLAGS, FCFI_LP_EXPECTED, 27, 1)
> > +
> >   #ifdef TARGET_RISCV32
> >   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> >   #else
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 63377abc2f..d15918f534 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -129,6 +129,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> >           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> >       }
> >
> > +    if (cpu->cfg.ext_cfi) {
> > +        /*
> > +         * For Forward CFI, only the expectation of a lpcll at
> > +         * the start of the block is tracked (which can only happen
> > +         * when FCFI is enabled for the current processor mode). A jump
> > +         * or call at the end of the previous TB will have updated
> > +         * env->elp to indicate the expectation.
> > +         */
> > +        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED,
> > +                           env->elp != NO_LP_EXPECTED);
> > +    }
> > +
> >   #ifdef CONFIG_USER_ONLY
> >       flags |= TB_FLAGS_MSTATUS_FS;
> >       flags |= TB_FLAGS_MSTATUS_VS;
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index df38db7553..7d43d20fc3 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -41,6 +41,7 @@ static TCGv load_val;
> >   /* globals for PM CSRs */
> >   static TCGv pm_mask;
> >   static TCGv pm_base;
> > +static TCGOp *cfi_lp_check;
> >
> >   #include "exec/gen-icount.h"
> >
> > @@ -116,6 +117,10 @@ typedef struct DisasContext {
> >       bool itrigger;
> >       /* TCG of the current insn_start */
> >       TCGOp *insn_start;
> > +    /* CFI extension */
> > +    bool bcfi_enabled;
> > +    bool fcfi_enabled;
> > +    bool fcfi_lp_expected;
> >   } DisasContext;
> >
> >   static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> > @@ -1166,11 +1171,44 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> >       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
> >       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> >       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> > +    ctx->bcfi_enabled = cpu_get_bcfien(env);
> > +    ctx->fcfi_enabled = cpu_get_fcfien(env);
> This is wrong.  If you ctx->bcfi_enabled in the translation and don't
> put it in a tb flags field, the translated tb will
> be misused.

TLB for shadow stack index is flushed on privilege transfers.
All TLBs is flushed whenever enable/disable bits for shadow stack are toggled.
Can you elaborate a bit more how this can be misused?

>
>
> Zhiwei
>
> > +    ctx->fcfi_lp_expected = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
> >       ctx->zero = tcg_constant_tl(0);
> >   }
> >
> >   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> >   {
> > +    DisasContext *ctx = container_of(db, DisasContext, base);
> > +
> > +    if (ctx->fcfi_lp_expected) {
> > +        /*
> > +         * Since we can't look ahead to confirm that the first
> > +         * instruction is a legal landing pad instruction, emit
> > +         * compare-and-branch sequence that will be fixed-up in
> > +         * riscv_tr_tb_stop() to either statically hit or skip an
> > +         * illegal instruction exception depending on whether the
> > +         * flag was lowered by translation of a CJLP or JLP as
> > +         * the first instruction in the block.
> > +         */
> > +        TCGv_i32 immediate;
> > +        TCGLabel *l;
> > +        l = gen_new_label();
> > +        immediate = tcg_temp_local_new_i32();
> > +        tcg_gen_movi_i32(immediate, 0);
> > +        cfi_lp_check = tcg_last_op();
> > +        tcg_gen_brcondi_i32(TCG_COND_EQ, immediate, 0, l);
> > +        tcg_temp_free_i32(immediate);
> > +        gen_exception_illegal(ctx);
> > +        gen_set_label(l);
> > +        /*
> > +         * Despite the use of gen_exception_illegal(), the rest of
> > +         * the TB needs to be generated. The TCG optimizer will
> > +         * clean things up depending on which path ends up being
> > +         * active.
> > +         */
> > +        ctx->base.is_jmp = DISAS_NEXT;
> > +    }
> >   }
> >
> >   static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> > @@ -1225,6 +1263,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> >   static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
> >   {
> >       DisasContext *ctx = container_of(dcbase, DisasContext, base);
> > +    CPURISCVState *env = cpu->env_ptr;
> >
> >       switch (ctx->base.is_jmp) {
> >       case DISAS_TOO_MANY:
> > @@ -1235,6 +1274,19 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
> >       default:
> >           g_assert_not_reached();
> >       }
> > +
> > +    if (ctx->fcfi_lp_expected) {
> > +        /*
> > +         * If the "lp expected" flag is still up, the block needs to take an
> > +         * illegal instruction exception.
> > +         */
> > +        tcg_set_insn_param(cfi_lp_check, 1, tcgv_i32_arg(tcg_constant_i32(1)));
> > +    } else {
> > +        /*
> > +        * LP instruction requirement was met, clear up LP expected
> > +        */
> > +        env->elp = NO_LP_EXPECTED;
> > +    }
> >   }
> >
> >   static void riscv_tr_disas_log(const DisasContextBase *dcbase,

