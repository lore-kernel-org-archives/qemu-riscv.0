Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAhUf-0002Wp-Cq
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 19:09:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhUX-0002VF-6J; Thu, 20 Jan 2022 19:09:22 -0500
Received: from [2607:f8b0:4864:20::130] (port=43779
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhUU-0000Ae-Ot; Thu, 20 Jan 2022 19:09:20 -0500
Received: by mail-il1-x130.google.com with SMTP id d3so6358718ilr.10;
 Thu, 20 Jan 2022 16:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/lepUQDQIefB8Ed2g0sI2XxGjI1uLD764BmP0tZa/8g=;
 b=P/YbBh3dlMJmOLmfEICFKCjbkJXlcJdVuPv0QSIsaVP2DQuAjVWlW2BIhGmhzNg7oG
 Rkn9mifIJsZ9pCcisMYyh2LdTGfhNgnDf1YvL2xXxw4EbihndrBGr5nFWN5l2WjRy3qX
 oP5pnL8RMb4f47gMxilCMciFjX7pv09vX4Dzt+h/4ZUs/Zrz+rMdMswJsqVffsoi0pSv
 nrmYdDKxUI8go9AA5Qa0dGs4TBWIji5tu/hjvhXT+ARvlshgP+esh2gffgNcyG9ZkR78
 HuciuALoaURoRhJ7BAyz88OaQ85GvgVzLCVdxqDk2CutG3PagrFa8vUMsYAWZ1jASWCD
 bkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lepUQDQIefB8Ed2g0sI2XxGjI1uLD764BmP0tZa/8g=;
 b=WAn+g/kT61GrlP7iKS9NMw389dW3Q9aKqj49G5Lvc3+MIBlfYBTGyZWRe/yNOCFHGy
 XcCD4GEx4vJmAC8KrNRah+2snleABeBCsJpW9KjcVoXK0O3cd+gDMl4E9+/+4Xe3ASEt
 UkwKCgZPTHj6cuU1k7gJJ+vWB67N5X2u8LwTqqK9r0zv6ons3CW2+b+hQsXoXK3UoS/8
 aRxsDXeQQ5jHihofndQYvKUlMK87OwkKkFd1arvL/pS1kBO8cYtGTyYj2eQr6lz9o3ga
 3EojWloXvnTUkm2/2KzdAlhLJ1vgp5rDVsZrOK0Yi3cFJFMaJwfIgMZ9ApYwEq9UPgeL
 bo2w==
X-Gm-Message-State: AOAM5339gC5aartdWNyB8bGaAU9Nf9Chm5WJ5VI0/ccx/q48dwFPs4Hl
 uzjY1dWun7dDT4Xb5lglEtZ3M8WJGezL6bde1VE=
X-Google-Smtp-Source: ABdhPJyd+yeRyBJDrXJJn8v/SVfFGTSu4f9e3Fdiql9g1OVEbZXvOkLQCQhuLjjkWdTpSwWrYahDc7ygNFdsEwnZ+RA=
X-Received: by 2002:a05:6e02:148b:: with SMTP id
 n11mr791180ilk.208.1642723757160; 
 Thu, 20 Jan 2022 16:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
 <20220119113754.20323-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220119113754.20323-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 10:08:50 +1000
Message-ID: <CAKmqyKPhfcqwKEor4Yz8yUU9xorP-LFy_dYPKYHfBOorZUJ=gg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 02/14] target/riscv: rvk: add support for zbkb
 extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 21 Jan 2022 00:09:22 -0000

On Wed, Jan 19, 2022 at 9:52 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - reuse partial instructions of zbb extension, update extension check for them
>  - add brev8, pack, packh, packw, unzip, zip instructions
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/bitmanip_helper.c          |  53 +++++++++++
>  target/riscv/helper.h                   |   3 +
>  target/riscv/insn32.decode              |  45 ++++++----
>  target/riscv/insn_trans/trans_rvb.c.inc | 115 +++++++++++++++++++++---
>  target/riscv/translate.c                |   7 ++
>  5 files changed, 195 insertions(+), 28 deletions(-)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index f1b5e5549f..e003e8b25b 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -49,3 +49,56 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
>
>      return result;
>  }
> +
> +static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
> +{
> +    return ((x & mask) << shift) | ((x & ~mask) >> shift);
> +}
> +
> +target_ulong HELPER(brev8)(target_ulong rs1)
> +{
> +    target_ulong x = rs1;
> +
> +    x = do_swap(x, 0x5555555555555555ull, 1);
> +    x = do_swap(x, 0x3333333333333333ull, 2);
> +    x = do_swap(x, 0x0f0f0f0f0f0f0f0full, 4);
> +    return x;
> +}
> +
> +static const uint64_t shuf_masks[] = {
> +    dup_const(MO_8, 0x44),
> +    dup_const(MO_8, 0x30),
> +    dup_const(MO_16, 0x0f00),
> +    dup_const(MO_32, 0xff0000)
> +};
> +
> +static inline target_ulong do_shuf_stage(target_ulong src, uint64_t maskL,
> +                                         uint64_t maskR, int shift)
> +{
> +    target_ulong x = src & ~(maskL | maskR);
> +
> +    x |= ((src << shift) & maskL) | ((src >> shift) & maskR);
> +    return x;
> +}
> +
> +target_ulong HELPER(unzip)(target_ulong rs1)
> +{
> +    target_ulong x = rs1;
> +
> +    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
> +    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
> +    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
> +    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
> +    return x;
> +}
> +
> +target_ulong HELPER(zip)(target_ulong rs1)
> +{
> +    target_ulong x = rs1;
> +
> +    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
> +    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
> +    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
> +    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
> +    return x;
> +}
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 6cf6d6ce98..547dfa86bc 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -66,6 +66,9 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
>  /* Bitmanip */
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
> +DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
> +DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
>
>  /* Floating Point - Half Precision */
>  DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..bf080cb489 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -717,8 +717,22 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
>  sh3add_uw  0010000 .......... 110 ..... 0111011 @r
>  slli_uw    00001 ............ 001 ..... 0011011 @sh
>
> -# *** RV32 Zbb Standard Extension ***
> +# *** RV32 Zbb/Zbkb Standard Extension ***
>  andn       0100000 .......... 111 ..... 0110011 @r
> +rol        0110000 .......... 001 ..... 0110011 @r
> +ror        0110000 .......... 101 ..... 0110011 @r
> +rori       01100 ............ 101 ..... 0010011 @sh
> +# The encoding for rev8 differs between RV32 and RV64.
> +# rev8_32 denotes the RV32 variant.
> +rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
> +# The encoding for zext.h differs between RV32 and RV64.
> +# zext_h_32 denotes the RV32 variant.
> +{
> +  zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
> +  pack       0000100 ..... ..... 100 ..... 0110011 @r
> +}
> +xnor       0100000 .......... 100 ..... 0110011 @r
> +# *** RV32 extra Zbb Standard Extension ***
>  clz        011000 000000 ..... 001 ..... 0010011 @r2
>  cpop       011000 000010 ..... 001 ..... 0010011 @r2
>  ctz        011000 000001 ..... 001 ..... 0010011 @r2
> @@ -728,23 +742,15 @@ min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
>  orc_b      001010 000111 ..... 101 ..... 0010011 @r2
>  orn        0100000 .......... 110 ..... 0110011 @r
> -# The encoding for rev8 differs between RV32 and RV64.
> -# rev8_32 denotes the RV32 variant.
> -rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
> -rol        0110000 .......... 001 ..... 0110011 @r
> -ror        0110000 .......... 101 ..... 0110011 @r
> -rori       01100 ............ 101 ..... 0010011 @sh
>  sext_b     011000 000100 ..... 001 ..... 0010011 @r2
>  sext_h     011000 000101 ..... 001 ..... 0010011 @r2
> -xnor       0100000 .......... 100 ..... 0110011 @r
> -# The encoding for zext.h differs between RV32 and RV64.
> -# zext_h_32 denotes the RV32 variant.
> -zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
> +# *** RV32 extra Zbkb Standard Extension ***
> +brev8      0110100 00111 ..... 101 ..... 0010011 @r2  #grevi
> +packh      0000100  .......... 111 ..... 0110011 @r
> +unzip      0000100 01111 ..... 101 ..... 0010011 @r2  #unshfl
> +zip        0000100 01111 ..... 001 ..... 0010011 @r2  #shfl
>
> -# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
> -clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> -ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> -cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
> +# *** RV64 Zbb/Zbkb Standard Extension (in addition to RV32 Zbb/Zbkb) ***
>  # The encoding for rev8 differs between RV32 and RV64.
>  # When executing on RV64, the encoding used in RV32 is an illegal
>  # instruction, so we use different handler functions to differentiate.
> @@ -755,7 +761,14 @@ rorw       0110000 .......... 101 ..... 0111011 @r
>  # The encoding for zext.h differs between RV32 and RV64.
>  # When executing on RV64, the encoding used in RV32 is an illegal
>  # instruction, so we use different handler functions to differentiate.
> -zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
> +{
> +  zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
> +  packw      0000100 ..... ..... 100 ..... 0111011 @r
> +}
> +# *** RV64 extra Zbb Standard Extension (in addition to RV32 Zbb) ***
> +clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> +ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> +cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
>
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 810431a1d6..7590c0538e 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -1,5 +1,5 @@
>  /*
> - * RISC-V translation routines for the Zb[abcs] Standard Extension.
> + * RISC-V translation routines for the Zb[abcs] and Zbk[bcx] Standard Extension.
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> @@ -42,6 +42,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_ZBKB(ctx) do {                   \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbkb) {     \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  static void gen_clz(TCGv ret, TCGv arg1)
>  {
>      tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> @@ -85,19 +91,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
>
>  static bool trans_andn(DisasContext *ctx, arg_andn *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_logic(ctx, a, tcg_gen_andc_tl);
>  }
>
>  static bool trans_orn(DisasContext *ctx, arg_orn *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_logic(ctx, a, tcg_gen_orc_tl);
>  }
>
>  static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_logic(ctx, a, tcg_gen_eqv_tl);
>  }
>
> @@ -247,7 +253,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static bool trans_ror(DisasContext *ctx, arg_ror *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw, NULL);
>  }
>
> @@ -264,7 +270,7 @@ static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
>
>  static bool trans_rori(DisasContext *ctx, arg_rori *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
>                                     tcg_gen_rotri_tl, gen_roriw, NULL);
>  }
> @@ -289,7 +295,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static bool trans_rol(DisasContext *ctx, arg_rol *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw, NULL);
>  }
>
> @@ -301,14 +307,14 @@ static void gen_rev8_32(TCGv ret, TCGv src1)
>  static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
>  {
>      REQUIRE_32BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
>  }
>
>  static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
>  }
>
> @@ -403,7 +409,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      ctx->ol = MXL_RV32;
>      return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
>  }
> @@ -411,7 +417,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      ctx->ol = MXL_RV32;
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
>  }
> @@ -419,7 +425,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>  static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      ctx->ol = MXL_RV32;
>      return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
>  }
> @@ -504,3 +510,88 @@ static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
>      REQUIRE_ZBC(ctx);
>      return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr, NULL);
>  }
> +
> +static void gen_pack(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    tcg_gen_deposit_tl(ret, src1, src2,
> +                       TARGET_LONG_BITS / 2,
> +                       TARGET_LONG_BITS / 2);
> +}
> +
> +static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    tcg_gen_ext8u_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +
> +    tcg_gen_ext16s_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
> +    tcg_temp_free(t);
> +}
> +
> +static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_brev8(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool trans_pack(DisasContext *ctx, arg_pack *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_pack, NULL);
> +}
> +
> +static bool trans_packh(DisasContext *ctx, arg_packh *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_packh, NULL);
> +}
> +
> +static bool trans_packw(DisasContext *ctx, arg_packw *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZBKB(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_packw, NULL);
> +}
> +
> +static bool trans_unzip(DisasContext *ctx, arg_unzip *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_unzip(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool trans_zip(DisasContext *ctx, arg_zip *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_zip(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 615048ec87..f3e37ddcd2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -525,6 +525,13 @@ EX_SH(12)
>      }                                  \
>  } while (0)
>
> +#define REQUIRE_EITHER_EXT(ctx, A, B) do {       \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_##A &&      \
> +        !RISCV_CPU(ctx->cs)->cfg.ext_##B) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  static int ex_rvc_register(DisasContext *ctx, int reg)
>  {
>      return 8 + reg;
> --
> 2.17.1
>
>

