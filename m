Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm6uc-0006Zy-36
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 20:01:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm6uW-0006Xh-EB
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 20:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm6uU-0001h8-M1
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 20:00:56 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gm6uU-0001fd-BX; Tue, 22 Jan 2019 20:00:54 -0500
Received: by mail-lf1-x143.google.com with SMTP id a8so326859lfk.5;
	Tue, 22 Jan 2019 17:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SQEXRUuzGf8T7SbIQm2t5JIDBTvb4WqvdkNso8PKVAU=;
	b=lbVaSkthXKNj0e/oBnZ5dEyGDGORVh1k5klTGGeEEnWbPiKbkXsNm5ITmCd+QGTYGk
	ViAYQeMTOia50ERMeuI4LrDYQyQIPS2J4FdqoDoVAQH3ofnjEvwB+1BFxkH9f/Cbnq6B
	JXpmiUMi9za2pg555pT5daAP2bCd0Xa4Z0KL1bwmjUwZbWtFLkpJ8ItxHLRi90xo1VLb
	0O20haWuMwNO6DL+oAjOGzDiUPNEmH6IKBdE9d0VJIg1el6wL/HY/axrv7mEkSPoFqDd
	q2rr+ef4OZW49BGYe1UqvYg/d0sqBehY21UCnuX1O+bvyBSLhQNbhyGe+SPntAfO8n8m
	k19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SQEXRUuzGf8T7SbIQm2t5JIDBTvb4WqvdkNso8PKVAU=;
	b=pYH8LbNMyCoIDPAFpmUNFIqaHEn++YHSHhsT/ybi7Cp5sMGLX/1CyPECEqnybN5IEZ
	z6VeehF8BRnSDgL7FvAjHluiqw8OqeDqZusjgusNolfWTHV0NfQblxrOlu1epYwpvacM
	31iS0OID554icqJhR5ig1YCMtIVr9Uk2qPpycRmDUZPyjbmLXY2/cmVGCLxEKGhTQu2l
	vx2+GMplHffLLSljRzODIHOEHZAKs4U5bSbtcMvFbgSbDELGsq+ml//JTtUOYMEbFn/o
	76m7OgHV1GI+eFb5gl/W4WvFIVdfTWrYYYir+CF2sfJqAANwC7w8TgYx2LHR3D4jY/EL
	n4FQ==
X-Gm-Message-State: AJcUukcwgHhRLV6c9CjuXAIpXX/fLECiGPWd6+Qs41fVacDA5UZpMd1G
	CDL2TBWdYUcNYV/lZFBVdGgTIxrrvd0UNiS5Fc8=
X-Google-Smtp-Source: ALg8bN7YwBKpeLxMlTd0Nos29LBqoec2lwqSWBQ07/HPqy0LPtt0TBTNH6bWT52pLmd/CNu/JfUIrir12jNOLmbNw0s=
X-Received: by 2002:a19:d486:: with SMTP id l128mr124497lfg.114.1548205250318; 
	Tue, 22 Jan 2019 17:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<20190122092909.5341-17-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20190122092909.5341-17-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jan 2019 17:00:23 -0800
Message-ID: <CAKmqyKNAoWr=XonMsD2PH51fe6TBd13dwntwRfVof6c+=z+a4Q@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org, 
	peer.adelt@hni.uni-paderborn.de, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 16/35] target/riscv:
 Convert RV priv insns to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2019 01:01:00 -0000

On Tue, Jan 22, 2019 at 1:55 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode                    |  15 +++
>  .../riscv/insn_trans/trans_privileged.inc.c   | 110 ++++++++++++++++++
>  target/riscv/translate.c                      |  57 +--------
>  3 files changed, 126 insertions(+), 56 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e64b2b5e34..ecc46a50cc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -57,6 +57,21 @@
>  @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
>  @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
>
> +@sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
> +@sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> +
> +
> +# *** Privileged Instructions ***
> +ecall      000000000000     00000 000 00000 1110011
> +ebreak     000000000001     00000 000 00000 1110011
> +uret       0000000    00010 00000 000 00000 1110011
> +sret       0001000    00010 00000 000 00000 1110011
> +hret       0010000    00010 00000 000 00000 1110011
> +mret       0011000    00010 00000 000 00000 1110011
> +wfi        0001000    00101 00000 000 00000 1110011
> +sfence_vma 0001001    ..... ..... 000 00000 1110011 @sfence_vma
> +sfence_vm  0001000    00100 ..... 000 00000 1110011 @sfence_vm
> +
>  # *** RV32I Base Instruction Set ***
>  lui      ....................       ..... 0110111 @u
>  auipc    ....................       ..... 0010111 @u
> diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
> new file mode 100644
> index 0000000000..fb2da8f5f0
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_privileged.inc.c
> @@ -0,0 +1,110 @@
> +/*
> + * RISC-V translation routines for the RISC-V privileged instructions.
> + *
> + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
> + *                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
> +{
> +    /* always generates U-level ECALL, fixed in do_interrupt handler */
> +    generate_exception(ctx, RISCV_EXCP_U_ECALL);
> +    tcg_gen_exit_tb(NULL, 0); /* no chaining */
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +    return true;
> +}
> +
> +static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
> +{
> +    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    tcg_gen_exit_tb(NULL, 0); /* no chaining */
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +    return true;
> +}
> +
> +static bool trans_uret(DisasContext *ctx, arg_uret *a)
> +{
> +    return false;
> +}
> +
> +static bool trans_sret(DisasContext *ctx, arg_sret *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +
> +    if (riscv_has_ext(ctx->env, RVS)) {
> +        gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
> +        tcg_gen_exit_tb(NULL, 0); /* no chaining */
> +        ctx->base.is_jmp = DISAS_NORETURN;
> +    } else {
> +        return false;
> +    }
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> +static bool trans_hret(DisasContext *ctx, arg_hret *a)
> +{
> +    return false;
> +}
> +
> +static bool trans_mret(DisasContext *ctx, arg_mret *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +    gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
> +    tcg_gen_exit_tb(NULL, 0); /* no chaining */
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> +static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> +    gen_helper_wfi(cpu_env);
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> +static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (ctx->env->priv_ver == PRIV_VERSION_1_10_0) {
> +        gen_helper_tlb_flush(cpu_env);
> +        return true;
> +    }
> +#endif
> +    return false;
> +}
> +
> +static bool trans_sfence_vm(DisasContext *ctx, arg_sfence_vm *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (ctx->env->priv_ver <= PRIV_VERSION_1_09_1) {
> +        gen_helper_tlb_flush(cpu_env);
> +        return true;
> +    }
> +#endif
> +    return false;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 4dda78d7c1..ff15e0f7ed 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -689,26 +689,8 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>  static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>                        int rd, int rs1, int csr)
>  {
> -    TCGv source1, dest;
> -    source1 = tcg_temp_new();
> -    dest = tcg_temp_new();
> -    gen_get_gpr(source1, rs1);
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>
> -#ifndef CONFIG_USER_ONLY
> -    /* Extract funct7 value and check whether it matches SFENCE.VMA */
> -    if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
> -        if (env->priv_ver == PRIV_VERSION_1_10_0) {
> -            /* sfence.vma */
> -            /* TODO: handle ASID specific fences */
> -            gen_helper_tlb_flush(cpu_env);
> -            return;
> -        } else {
> -            gen_exception_illegal(ctx);
> -        }
> -    }
> -#endif
> -
>      switch (opc) {
>      case OPC_RISC_ECALL:
>          switch (csr) {
> @@ -723,50 +705,12 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>              tcg_gen_exit_tb(NULL, 0); /* no chaining */
>              ctx->base.is_jmp = DISAS_NORETURN;
>              break;
> -#ifndef CONFIG_USER_ONLY
> -        case 0x002: /* URET */
> -            gen_exception_illegal(ctx);
> -            break;
> -        case 0x102: /* SRET */
> -            if (riscv_has_ext(env, RVS)) {
> -                gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
> -                tcg_gen_exit_tb(NULL, 0); /* no chaining */
> -                ctx->base.is_jmp = DISAS_NORETURN;
> -            } else {
> -                gen_exception_illegal(ctx);
> -            }
> -            break;
> -        case 0x202: /* HRET */
> -            gen_exception_illegal(ctx);
> -            break;
> -        case 0x302: /* MRET */
> -            gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
> -            tcg_gen_exit_tb(NULL, 0); /* no chaining */
> -            ctx->base.is_jmp = DISAS_NORETURN;
> -            break;
> -        case 0x7b2: /* DRET */
> -            gen_exception_illegal(ctx);
> -            break;
> -        case 0x105: /* WFI */
> -            tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -            gen_helper_wfi(cpu_env);
> -            break;
> -        case 0x104: /* SFENCE.VM */
> -            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> -                gen_helper_tlb_flush(cpu_env);
> -            } else {
> -                gen_exception_illegal(ctx);
> -            }
> -            break;
> -#endif
>          default:
>              gen_exception_illegal(ctx);
>              break;
>          }
>          break;
>      }
> -    tcg_temp_free(source1);
> -    tcg_temp_free(dest);
>  }
>
>  static void decode_RV32_64C0(DisasContext *ctx)
> @@ -1063,6 +1007,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
>  #include "insn_trans/trans_rva.inc.c"
>  #include "insn_trans/trans_rvf.inc.c"
>  #include "insn_trans/trans_rvd.inc.c"
> +#include "insn_trans/trans_privileged.inc.c"
>
>  static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>  {
> --
> 2.20.1
>
>

