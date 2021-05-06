Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leTNv-0006pJ-Bw
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 22:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leTNt-0006oo-Iz; Wed, 05 May 2021 22:05:01 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leTNr-0005Sp-Bl; Wed, 05 May 2021 22:05:01 -0400
Received: by mail-io1-xd32.google.com with SMTP id b10so3482539iot.4;
 Wed, 05 May 2021 19:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qZlRz6/4Is4yLewzU/9WdTXLNZrZuJ75lgS1ZNHD3hI=;
 b=Pc7PNAzGUTItQbBdUBdTUP1kBknVEntzshMcqesKNq4lSXEzeP7gXvYX9WJ7jsvhAo
 rber4G6Z3lYQWZq68epcp/ZSW110yxiRoK4FmGNfuFDl1eLQ8XBizpiQt0SjgcJEl8a8
 3TOpnOVgyvRWaWqD6yYSZVMVzvjLq4Iztbovr10tQI+m7qfZjndj3OhCYlUfE/ju7CIY
 CcvJbsRUSnxzVf0Go7vrtplGTEChLDQ9XXNvmL5Z5avtYY+JPanA9PLYFBcB6B8+aUTn
 czKO619TTEaCSYX8NscrflWEePRIRJzYWrkenyQg66p24KSxl6tjZTylkSknPm24IXbA
 JALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qZlRz6/4Is4yLewzU/9WdTXLNZrZuJ75lgS1ZNHD3hI=;
 b=swWLziS6sBp99qGSPFUMa/vknIjv0Ksq/oUxHN6fb8jP5FI/W+GIk+ytOywr4Td/Q4
 rUI/nGBLyXxm7SN/CMNCdHSMJPREw23uFr7JVF+OIbfyxLFIN3IoYmeZgsNrVP9fxArI
 ocHjc9oD5RsB4EuegXhcDx0Ia8jbBAuPEiiBbYeeBOB3iJ851wD+eFWRsQOy6Ldw5OnT
 cjRsDTFawJ95MO4LvUw6DdVYxJm6fJur+zhx4lD4F11qW3q25E1kb9acGo2RRDI42q+j
 vf5inn5J2F+3tm1nUbPB1IIxerFxBMzFS3BIFknZqqHjH+0MXkOSvXQ06w+6Zi4m+ccv
 8qXA==
X-Gm-Message-State: AOAM533v+NHpB3BUuI7OvJa3z0ODLb4UAQ0KpW+WB8VcJsxq8EURCqdv
 mXNH9HNc/N1zV4MDXTexOQWMJ607jB8kwwntWoA=
X-Google-Smtp-Source: ABdhPJy1g4C3QMLnyDxfGTLuHJzu2IwJIumTVUh/xTUdNUu5y+F3LCdiy1nZ6X2+yzdFGBL2H4JfZBTBAOG3XSm+mms=
X-Received: by 2002:a6b:c857:: with SMTP id y84mr1237357iof.118.1620266697727; 
 Wed, 05 May 2021 19:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
 <20210505160620.15723-3-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 May 2021 12:04:31 +1000
Message-ID: <CAKmqyKMx00GWC-Ap77OTKPvmOJWPoTv__4Gf-46fzh3ziQOeYg@mail.gmail.com>
Subject: Re: [PATCH v6 02/17] target/riscv: rvb: count leading/trailing zeros
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Thu, 06 May 2021 02:05:02 -0000

On Thu, May 6, 2021 at 2:24 AM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn32.decode              | 11 ++++++-
>  target/riscv/insn_trans/trans_rvb.c.inc | 44 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 38 +++++++++++++++++++++
>  4 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7e879fb9ca5..f95bcbd8e10 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -67,6 +67,7 @@
>  #define RVS RV('S')
>  #define RVU RV('U')
>  #define RVH RV('H')
> +#define RVB RV('B')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index f75642bb0d2..9a2ffab1504 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -41,6 +41,7 @@
>  &i    imm rs1 rd
>  &j    imm rd
>  &r    rd rs1 rs2
> +&r2   rd rs1
>  &s    imm rs1 rs2
>  &u    imm rd
>  &shift     shamt rs1 rd
> @@ -68,7 +69,7 @@
>  @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
>  @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
>  @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
> -@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
> +@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
>  @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
>  @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
>  @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
> @@ -657,3 +658,11 @@ vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
>  vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
>  vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
>  vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
> +
> +# *** RV32B Standard Extension ***
> +clz        011000 000000 ..... 001 ..... 0010011 @r2
> +ctz        011000 000001 ..... 001 ..... 0010011 @r2
> +
> +# *** RV64B Standard Extension (in addition to RV32B) ***
> +clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> +ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> new file mode 100644
> index 00000000000..157b4e3c41d
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -0,0 +1,44 @@
> +/*
> + * RISC-V translation routines for the RVB Standard Extension.
> + *
> + * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
> + * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
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
> +static bool trans_clz(DisasContext *ctx, arg_clz *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_clz);
> +}
> +
> +static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_ctz);
> +}
> +
> +static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_clzw);
> +}
> +
> +static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_ctzw);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e945352bca3..60fac0fe27e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -548,6 +548,19 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
>      return true;
>  }
>
> +static void gen_ctzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
> +    tcg_gen_ctzi_tl(ret, ret, 64);
> +}
> +
> +static void gen_clzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ext32u_tl(ret, arg1);
> +    tcg_gen_clzi_tl(ret, ret, 64);
> +    tcg_gen_subi_tl(ret, ret, 32);
> +}
> +
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
>                        void(*func)(TCGv, TCGv, TCGv))
>  {
> @@ -593,6 +606,30 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>      return cpu_ldl_code(env, pc);
>  }
>
> +static void gen_ctz(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
> +}
> +
> +static void gen_clz(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> +}
> +
> +static bool gen_unary(DisasContext *ctx, arg_r2 *a,
> +                      void(*func)(TCGv, TCGv))
> +{
> +    TCGv source = tcg_temp_new();
> +
> +    gen_get_gpr(source, a->rs1);
> +
> +    (*func)(source, source);
> +
> +    gen_set_gpr(a->rd, source);
> +    tcg_temp_free(source);
> +    return true;
> +}
> +
>  /* Include insn module translation function */
>  #include "insn_trans/trans_rvi.c.inc"
>  #include "insn_trans/trans_rvm.c.inc"
> @@ -601,6 +638,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvd.c.inc"
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
> +#include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
> --
> 2.17.1
>
>

