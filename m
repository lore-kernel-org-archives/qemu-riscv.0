Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nnzpj-00022m-IS
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 05:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzpX-000217-Fn; Mon, 09 May 2022 05:37:31 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzpV-0002Wa-P7; Mon, 09 May 2022 05:37:27 -0400
Received: by mail-io1-xd2e.google.com with SMTP id r27so14679015iot.1;
 Mon, 09 May 2022 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USepnwSZYd/p3ckpqZ1PumgUEOBX1C1Mr70dvmKOCMU=;
 b=NCGKAyai+GNj/fudKbmEx8q2i2Yj4bfyjHuzuOz0QvIY54dlsJP6iFaKdPaDMyuocq
 5flSyXSjrz93vOyh61h9xV+eu4h0m0ESnQtW46zWEV2o7zvK6gif/eukf4NLGKc1In9a
 cnm8xUi23zTbxJV5Nti3BbWrXNlrZbUJGSYI4doQhS1UOgE6GDZmJAuTGBL1wap/UJEt
 Ev+AIrWS0XiQAJ3vxYtuYM8Z0hXzbGgolhmq4FWdzGLQ9khRT8Bc6G7WfDtrt6cWoKgK
 GfB8tIEbwGHVmmpE33z8J6d795gvL/36nfqx7ohv/pFyV17rxWYRYivByOy13Qk8PehO
 5ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USepnwSZYd/p3ckpqZ1PumgUEOBX1C1Mr70dvmKOCMU=;
 b=B2wqq6oAfA6X3qGI7LHcMifGUilf8SpNNRCQaCmlvNz7AGYpni4cAUcPz+M1h4f1Ng
 dtBDbXQ9CzBnfTwYyDxiuF4DVuj9p6Ee8Dh1DVH7m+L/+OzQwFofTULlYQmBnYqiIcyV
 HlcHUYpSAKLSBgefEv2agIK24sSSwFIiDZMJR7FJj2T7TRlO8imILb+smAPxYDH/ZjHa
 Te/ds1VYWiWJh8+UJlMOqHFQfPAdotmm9XV6hJugt9Xlusjni2iPZkjJgBfPPFvrzLGQ
 nLuhAgfga9f3mP/LLXWoce2dHbTgs91Uzxx+v2+/yILc/FAp4BUIYNAxmLGJ7eqbanF/
 V/cw==
X-Gm-Message-State: AOAM5329nttqM8Rrd6yfld8d6xArMEmytDIlq7L4Xa/5pNlXX1wILaiH
 t1vVuuUioiTEY4wmGcfOhcNatH7kWqImCC4DaXs=
X-Google-Smtp-Source: ABdhPJwSclbDqwKvJ5c56VUQ7QO4DDo69f6YJ16KMDj9hvEkeCPNGN+PFc2ToWOYJuzglUMogl1JyvE2uAjMX7ezguI=
X-Received: by 2002:a05:6638:dc7:b0:32b:a483:16b8 with SMTP id
 m7-20020a0566380dc700b0032ba48316b8mr7070000jaj.66.1652089042873; Mon, 09 May
 2022 02:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-4-apatel@ventanamicro.com>
In-Reply-To: <20220429033409.258707-4-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 11:36:56 +0200
Message-ID: <CAKmqyKO_=Wsj+zrG96_rrd_N9rKcKrJZpJ9SmtP=Xg15GY88nA@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Set [m|s]tval for both illegal and
 virtual instruction traps
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Mon, 09 May 2022 09:37:33 -0000

On Fri, Apr 29, 2022 at 5:36 AM Anup Patel <apatel@ventanamicro.com> wrote:>
> Currently, the [m|s]tval CSRs are set with trapping instruction encoding
> only for illegal instruction traps taken at the time of instruction
> decoding.
>
> In RISC-V world, a valid instructions might also trap as illegal or
> virtual instruction based to trapping bits in various CSRs (such as
> mstatus.TVM or hstatus.VTVM).
>
> We improve setting of [m|s]tval CSRs for all types of illegal and
> virtual instruction traps.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu.h        |  8 +++++++-
>  target/riscv/cpu_helper.c |  1 +
>  target/riscv/translate.c  | 17 +++++++++++++----
>  4 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dff4606585..f0a702fee6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -406,6 +406,7 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
>      } else {
>          env->pc = data[0];
>      }
> +    env->bins = data[1];
>  }
>
>  static void riscv_cpu_reset(DeviceState *dev)
> @@ -445,6 +446,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mcause = 0;
>      env->miclaim = MIP_SGEIP;
>      env->pc = env->resetvec;
> +    env->bins = 0;
>      env->two_stage_lookup = false;
>
>      /* Initialized default priorities of local interrupts. */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fe6c9a2c92..a55c918274 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -30,6 +30,12 @@
>
>  #define TCG_GUEST_DEFAULT_MO 0
>
> +/*
> + * RISC-V-specific extra insn start words:
> + * 1: Original instruction opcode
> + */
> +#define TARGET_INSN_START_EXTRA_WORDS 1
> +
>  #define TYPE_RISCV_CPU "riscv-cpu"
>
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
> @@ -140,7 +146,7 @@ struct CPUArchState {
>      target_ulong frm;
>
>      target_ulong badaddr;
> -    uint32_t bins;
> +    target_ulong bins;
>
>      target_ulong guest_phys_fault_addr;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d83579accf..bba4fce777 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1371,6 +1371,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              tval = env->badaddr;
>              break;
>          case RISCV_EXCP_ILLEGAL_INST:
> +        case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
>              tval = env->bins;
>              break;
>          default:
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0cd1d9ee94..55a4713af2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -107,6 +107,8 @@ typedef struct DisasContext {
>      /* PointerMasking extension */
>      bool pm_mask_enabled;
>      bool pm_base_enabled;
> +    /* TCG of the current insn_start */
> +    TCGOp *insn_start;
>  } DisasContext;
>
>  static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -236,9 +238,6 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
>
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
> -    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> -                   offsetof(CPURISCVState, bins));
> -
>      generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>  }
>
> @@ -1017,6 +1016,13 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  /* Include decoders for factored-out extensions */
>  #include "decode-XVentanaCondOps.c.inc"
>
> +static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
> +{
> +    assert(ctx->insn_start != NULL);
> +    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
> +    ctx->insn_start = NULL;
> +}
> +
>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>  {
>      /*
> @@ -1033,6 +1039,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>
>      /* Check for compressed insn */
>      if (extract16(opcode, 0, 2) != 3) {
> +        decode_save_opc(ctx, opcode);
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
> @@ -1047,6 +1054,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>          opcode32 = deposit32(opcode32, 16, 16,
>                               translator_lduw(env, &ctx->base,
>                                               ctx->base.pc_next + 2));
> +        decode_save_opc(ctx, opcode32);
>          ctx->opcode = opcode32;
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
>
> @@ -1113,7 +1121,8 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
> -    tcg_gen_insn_start(ctx->base.pc_next);
> +    tcg_gen_insn_start(ctx->base.pc_next, 0);
> +    ctx->insn_start = tcg_last_op();
>  }
>
>  static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> --
> 2.34.1
>
>

