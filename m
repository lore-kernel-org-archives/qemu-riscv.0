Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxIkA-0001kd-H0
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 21:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxIk9-0001kQ-DL; Mon, 21 Nov 2022 21:10:37 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxIk5-0002kA-Kl; Mon, 21 Nov 2022 21:10:37 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id p4so13114881vsa.11;
 Mon, 21 Nov 2022 18:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/s755ozho7Z/iEuV++mUmX0vxusGXK+KQCcFWUF1NrQ=;
 b=bxjZDLLC81loKPUoE9w7tDLzvEKL/y9oc89fgToTVtGBnUboaBcvh14D/RKIG5J1Qy
 yRSnbKJNJAm0ZSywKpcp3KqfkAUsWQ1wete/lb78qIK+Wk5a58spj7nAvSAIHMcen2Y5
 xxHmTgQEH0q5kE2wnimynn3nmneo5md17OWRIolaIxFFrl60wW+FjSi9TqUzq2qqrAe7
 +UIoqcRQVM0gzcDWJvSoaMADPSF4hmKNBBrhhnyITIq3xpU85Ak65afzgBprgpgJNgRr
 PUlxpCqNJtFiT+ENKSh/EEogTPFOzWdz8yyk8k93x+Uz9f4wlmBmb7i4PKvyjSMiI50D
 maxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/s755ozho7Z/iEuV++mUmX0vxusGXK+KQCcFWUF1NrQ=;
 b=P7jvPtlAFtvbV2oR9gd6Qtj4FAqNg5EL5EsMzoWiEgfqTd+ugd8X/TqsAaU5JSQH5q
 MwL5VyZREqdJlmhhRs1sVxZNxHKBd81cQYa+EwUyqKLtdFnVK+zOm3a8Xq968Oe8cx/A
 iA3+bN5rXpB+EfaS/OCoMdTdgWVYPqoDt76hVmTzxGp1WnxfGD8HrqWi4DN9VXtPDARu
 HydoxbspndWrqz68DGETxPBZI9l5ZnTtLBHZxTQ7SZnRulPNbL7kM9nKEGvhwxrZC3F2
 T+3UalMnS2uSGoFb8BlGYs7RENCfPjmNabZl75xlGgIlmPuDAnTxqv3uFq1EIDXOxlLZ
 nJzA==
X-Gm-Message-State: ANoB5pnmqoCYzetyWi9Dg0QWjggIQlUds1CVUvCtEO5AU2K7OZkaVeKK
 WKkR3fRtvDzr8ZdRgq31wfsIN0xdv7myNtvgqNM=
X-Google-Smtp-Source: AA0mqf7dsW8KmAHDwHW6QttQ60p+we/kVK6oGhiVS8IvZlJvvrXxZb5vY6f4RX2qxLYxn/8hUhKa9P2A8SYEWYYYT0Y=
X-Received: by 2002:a67:f7d8:0:b0:358:3594:dfad with SMTP id
 a24-20020a67f7d8000000b003583594dfadmr1166012vsp.54.1669083031115; Mon, 21
 Nov 2022 18:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Nov 2022 12:10:04 +1000
Message-ID: <CAKmqyKNi2JNkPWhO8ZAcyLLCVGhFGeeABuEvP6bCVY47KAwLxA@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] target/riscv: add support for Zcb extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
X-List-Received-Date: Tue, 22 Nov 2022 02:10:37 -0000

On Fri, Nov 18, 2022 at 10:44 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Add encode and trans* functions support for Zcb instructions
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn16.decode                |  24 ++++++
>  target/riscv/insn_trans/trans_rvzce.c.inc | 100 ++++++++++++++++++++++
>  target/riscv/translate.c                  |   2 +
>  3 files changed, 126 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index b62664b6af..47603ec1e0 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -43,6 +43,8 @@
>  %imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
>  %imm_lui       12:s1 2:5             !function=ex_shift_12
>
> +%zcb_b_uimm  5:1 6:1
> +%zcb_h_uimm  5:1                     !function=ex_shift_1
>
>  # Argument sets imported from insn32.decode:
>  &empty                  !extern
> @@ -53,6 +55,7 @@
>  &b         imm rs2 rs1  !extern
>  &u         imm rd       !extern
>  &shift     shamt rs1 rd !extern
> +&r2        rd rs1       !extern
>
>
>  # Formats 16:
> @@ -89,6 +92,13 @@
>
>  @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
>
> +@zcb_unary    ... ...  ... .. ... ..  &r2                  rs1=%rs1_3 rd=%rs1_3
> +@zcb_binary   ... ...  ... .. ... ..  &r  rs2=%rs2_3       rs1=%rs1_3 rd=%rs1_3
> +@zcb_lb       ... . .. ... .. ... ..  &i  imm=%zcb_b_uimm  rs1=%rs1_3 rd=%rs2_3
> +@zcb_lh       ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
> +@zcb_sb       ... . .. ... .. ... ..  &s  imm=%zcb_b_uimm  rs1=%rs1_3 rs2=%rs2_3
> +@zcb_sh       ... . .. ... .. ... ..  &s  imm=%zcb_h_uimm  rs1=%rs1_3 rs2=%rs2_3
> +
>  # *** RV32/64C Standard Extension (Quadrant 0) ***
>  {
>    # Opcode of all zeros is illegal; rd != 0, nzuimm == 0 is reserved.
> @@ -180,3 +190,17 @@ sw                110 .  .....  ..... 10 @c_swsp
>    sd              111 .  .....  ..... 10 @c_sdsp
>    c_fsw           111 .  .....  ..... 10 @c_swsp
>  }
> +
> +# *** RV64 and RV32 Zcb Extension ***
> +c_zext_b          100 111  ... 11 000 01 @zcb_unary
> +c_sext_b          100 111  ... 11 001 01 @zcb_unary
> +c_zext_h          100 111  ... 11 010 01 @zcb_unary
> +c_sext_h          100 111  ... 11 011 01 @zcb_unary
> +c_zext_w          100 111  ... 11 100 01 @zcb_unary
> +c_not             100 111  ... 11 101 01 @zcb_unary
> +c_mul             100 111  ... 10 ... 01 @zcb_binary
> +c_lbu             100 000  ... .. ... 00 @zcb_lb
> +c_lhu             100 001  ... 0. ... 00 @zcb_lh
> +c_lh              100 001  ... 1. ... 00 @zcb_lh
> +c_sb              100 010  ... .. ... 00 @zcb_sb
> +c_sh              100 011  ... 0. ... 00 @zcb_sh
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
> new file mode 100644
> index 0000000000..de96c4afaf
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -0,0 +1,100 @@
> +/*
> + * RISC-V translation routines for the Zcb Standard Extension.
> + *
> + * Copyright (c) 2021-2022 PLCT Lab
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
> +#define REQUIRE_ZCB(ctx) do {   \
> +    if (!ctx->cfg_ptr->ext_zcb) \
> +        return false;           \
> +} while (0)
> +
> +static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8u_tl);
> +}
> +
> +static bool trans_c_zext_h(DisasContext *ctx, arg_c_zext_h *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16u_tl);
> +}
> +
> +static bool trans_c_sext_b(DisasContext *ctx, arg_c_sext_b *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
> +}
> +
> +static bool trans_c_sext_h(DisasContext *ctx, arg_c_sext_h *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
> +}
> +
> +static bool trans_c_zext_w(DisasContext *ctx, arg_c_zext_w *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZCB(ctx);
> +    REQUIRE_ZBA(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext32u_tl);
> +}
> +
> +static bool trans_c_not(DisasContext *ctx, arg_c_not *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, tcg_gen_not_tl);
> +}
> +
> +static bool trans_c_mul(DisasContext *ctx, arg_c_mul *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    REQUIRE_M_OR_ZMMUL(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
> +}
> +
> +static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_load(ctx, a, MO_UB);
> +}
> +
> +static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_load(ctx, a, MO_UW);
> +}
> +
> +static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_load(ctx, a, MO_SW);
> +}
> +
> +static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_store(ctx, a, MO_UB);
> +}
> +
> +static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
> +{
> +    REQUIRE_ZCB(ctx);
> +    return gen_store(ctx, a, MO_UW);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index ee24b451e3..ca01da3309 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1069,6 +1069,8 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>
>  /* Include the auto-generated decoder for 16 bit insn */
>  #include "decode-insn16.c.inc"
> +#include "insn_trans/trans_rvzce.c.inc"
> +
>  /* Include decoders for factored-out extensions */
>  #include "decode-XVentanaCondOps.c.inc"
>
> --
> 2.25.1
>
>

