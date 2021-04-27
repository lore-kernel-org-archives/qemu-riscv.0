Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbGnv-0001L9-2o
	for mharc-qemu-riscv@gnu.org; Tue, 27 Apr 2021 02:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGnj-0001KO-Ct; Tue, 27 Apr 2021 02:02:27 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lbGnc-0007gE-Hx; Tue, 27 Apr 2021 02:02:26 -0400
Received: by mail-il1-x12b.google.com with SMTP id r5so8461183ilb.2;
 Mon, 26 Apr 2021 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lARzkG6VAqCWa51MmHPOuZ0d/wpcND5eL+uX8oCNfH0=;
 b=A+geeyWQ5raJEBMX2bBHw5BJREz1UQwMSnHEH30orLUi4dutlo5koJTtriml+2cSfQ
 Ci+Mt9pbLUh/zpNIUP4dQ14kpBnyyy8N0Mkzup/sbn86iN7mquq91msJ0DGtgWiToEEU
 3vBudVkxN54/BM807Gw2lfZNI+7PE8dWAChrv9kap+Gh2K0Oiogv6R6JnVjy6EH4RpjR
 8SdVfrnQK2bO+GZXacgkKyigXTFeFUGQdQzvgiJ5GmrAwgLfzER9WL9iqTkeP11Yqums
 4UT2m/eTuB3YJCeovNZtm7Gs94GwMRhDLTwRZ6JL8iDwHCps7pREykW/KYqYE4s+BTr6
 sgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lARzkG6VAqCWa51MmHPOuZ0d/wpcND5eL+uX8oCNfH0=;
 b=kZRpTYdnkA7qjRIjVUhdz6o36N+M6qFDZJPEkX641zGGe114scbIJnMkaDvyKgntdo
 DZfngmZUsCWdv4tBVIAHB9P7+0FZ9lhUleq00zhdoBIs8bPMYDRR0YEVCc0DT5F549Ps
 mhrZzel4ME8/j3nU254oOJOFI5b2rq0MvxBSbQnhO3XrxnCxUbSICmqL6O92fx98W5DS
 1wnSdOTH2RGjs36/BSb+k9uAKUX1wmtPgH1jf4nOhck5MUmtRFpO7xQbFFlOmqSTg6bJ
 8uTaiWTie0gj+IHQQW8+hYGaeTtC10a8760kYZkQG7eNgAf420grwT0ux5/DH2ymqJM0
 85+Q==
X-Gm-Message-State: AOAM532p3nDwi7iCi2aGpuxfmjnbmCdY2ygKo/lX1tfaVoog7O/KhFdM
 iI3X8JPAxmthDt6itgBeguIM0WXbdCLUh/dbbP4=
X-Google-Smtp-Source: ABdhPJwsToH10p/+aXOMtIgA6C83MNGW1v76lliOKmibsH50Er849LQkdt3XRu6BPRQshuanuQbiWa8p+h2OtjYO5MI=
X-Received: by 2002:a92:d90f:: with SMTP id s15mr16933460iln.227.1619503338444; 
 Mon, 26 Apr 2021 23:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210421041400.22243-1-frank.chang@sifive.com>
 <20210421041400.22243-3-frank.chang@sifive.com>
In-Reply-To: <20210421041400.22243-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Apr 2021 16:01:52 +1000
Message-ID: <CAKmqyKNVc6gRz5NZEYEWLJdqZ99MJ9=CVuk7Q0fmJhVb_rDhNA@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] target/riscv: rvb: count leading/trailing zeros
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Tue, 27 Apr 2021 06:02:29 -0000

On Wed, Apr 21, 2021 at 2:14 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn32-64.decode           |  4 +++
>  target/riscv/insn32.decode              |  7 +++-
>  target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++++++++
>  target/riscv/translate.c                | 42 ++++++++++++++++++++++
>  4 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc
>
> diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
> index 8157dee8b7c..f4c42720fc7 100644
> --- a/target/riscv/insn32-64.decode
> +++ b/target/riscv/insn32-64.decode
> @@ -86,3 +86,7 @@ fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
>  hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
>  hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
>  hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
> +
> +# *** RV64B Standard Extension (in addition to RV32B) ***
> +clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> +ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3823b3ea800..8fe838cf0d0 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -40,6 +40,7 @@
>  &i    imm rs1 rd
>  &j    imm rd
>  &r    rd rs1 rs2
> +&r2   rd rs1
>  &s    imm rs1 rs2
>  &u    imm rd
>  &shift     shamt rs1 rd
> @@ -67,7 +68,7 @@
>  @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
>  @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
>  @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
> -@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
> +@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
>  @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
>  @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
>  @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
> @@ -592,3 +593,7 @@ vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
>
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> +
> +# *** RV32B Standard Extension ***
> +clz        011000 000000 ..... 001 ..... 0010011 @r2
> +ctz        011000 000001 ..... 001 ..... 0010011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> new file mode 100644
> index 00000000000..76788c2f353
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -0,0 +1,47 @@
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
> +/* RV64-only instructions */
> +#ifdef TARGET_RISCV64
> +
> +static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_clzw);
> +}
> +
> +static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, gen_ctzw);
> +}
> +
> +#endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 2f9f5ccc621..4648c422f42 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -536,6 +536,23 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
>
>  #endif
>
> +#ifdef TARGET_RISCV64

Thanks for the patches!

Unfortunately this will need to be rebased and updated. We don't want
any more #ifdef's on the RISC-V xlen. The idea is to make the XLEN not
just a compile time constant.

The latest riscv-to-apply.next tree has changes to allow you to do
this. See this commit for what this will look like:
https://github.com/alistair23/qemu/commit/4965ae3f6f3838e651d1a33050b15b4ca3d822a0

The changes should be in master after the 6.0 release.

Alistair

> +
> +static void gen_ctzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
> +    tcg_gen_ctzi_i64(ret, ret, 64);
> +}
> +
> +static void gen_clzw(TCGv ret, TCGv arg1)
> +{
> +    tcg_gen_ext32u_i64(ret, arg1);
> +    tcg_gen_clzi_i64(ret, ret, 64);
> +    tcg_gen_subi_i64(ret, ret, 32);
> +}
> +
> +#endif
> +
>  static bool gen_arith(DisasContext *ctx, arg_r *a,
>                        void(*func)(TCGv, TCGv, TCGv))
>  {
> @@ -581,6 +598,30 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
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
> @@ -589,6 +630,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
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

