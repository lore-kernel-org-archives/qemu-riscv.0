Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9gIk-0000jq-7P
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gIU-0000fr-Ob; Mon, 17 Jan 2022 23:40:44 -0500
Received: from [2607:f8b0:4864:20::d33] (port=39656
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gIR-00062y-EU; Mon, 17 Jan 2022 23:40:42 -0500
Received: by mail-io1-xd33.google.com with SMTP id v6so24114713iom.6;
 Mon, 17 Jan 2022 20:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgpYUMlfqEsr/1r85yz0nVExIfRkevAQzk72hnuhV00=;
 b=SdOSBsQpzhFS2CXFny6IWoL/gNtSuN0sq4f6hsWTGwiVzW4e1+RhKUBUmCg4kMez+G
 LTA/Y/lrwZ3AoTRhq5P3EuKr6UymIhZOf56INdb5bzRtmPsOCVHqmRVBcxHP5R5vugrw
 a9Se/yR6DUno6Hws9GXBSNVpqbVSyzm1S7DLVM4jcYMFcZeaRIsQleZhHoFvnssv0V9n
 FGZpkQZfIQyyM20ji2Orla37wMXU1lzA6s0eQBZ4kiAF8i4c3bNuxEc5sgPRHp8TLm9q
 VEz5QYKE159/CNx2nOEYo2AZYaJqt9pRx+lLVMVFQ1tbWELOpzB9vwEAefhp8sCADSRz
 anNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgpYUMlfqEsr/1r85yz0nVExIfRkevAQzk72hnuhV00=;
 b=SMItaQwVSKtG4AnA7qGE+ejlPZ2ESC1C+jYRQybjbw5XzOElAukjaN1qX0zBp4j3jO
 u9S2XW7DiNsJ0pZ4/8qzQAaTldB2Z+4J3us+2LwSMqOTWjXz5Z9+7X9igIn5Uyb810+K
 3sC7lSWGDiixYCIzvwYezcLV6qCB4oE9bqoiCgHKcbNk7+ayiSSgdCvoiCp/ssM28eec
 8PF/QuVpOmHXuQc49FmkwMc+HlQMa1yNAjTalJEJI4HZcVVGlUbEmfEV03hXuuysZAit
 0yO4fuX15DZ9mtEhyEU30v0G6mF+5c0JGPhEy8mtXPEBCy/RH1ofP7qKCKhx2xHod/is
 LNzg==
X-Gm-Message-State: AOAM530NxPb+NxBmxZudYicP6NCruUZXXcLgCrmfrZq6jGTZTjFNXlUm
 HmHpfUJQMD6+IwX+KcOzOrGciWGkWuYpnfSHRaI=
X-Google-Smtp-Source: ABdhPJzK0Vu/SREcQRY2v2JQu1e4XJ5xbqWjKdAogL5nSpzfkptzyX9d867DC97+rSgR3gwDhaACQ2iXk9MvVF//Sns=
X-Received: by 2002:a02:5d84:: with SMTP id
 w126mr10153996jaa.169.1642480836539; 
 Mon, 17 Jan 2022 20:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220111035124.9468-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:40:10 +1000
Message-ID: <CAKmqyKNT7vHzLbWK3wQAqp7VJ0qMWiBXCGvkv9_oSYAku=WCZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: rvk: add implementation of
 instructions for Zbk*
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 04:40:50 -0000

On Tue, Jan 11, 2022 at 1:56 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>    - reuse partial instructions of Zbb/Zbc extensions
>    - add brev8, packh, unzip, zip, etc.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/bitmanip_helper.c          |  74 ++++++++++++++
>  target/riscv/helper.h                   |   5 +
>  target/riscv/insn32.decode              |  52 ++++++----
>  target/riscv/insn_trans/trans_rvb.c.inc | 127 +++++++++++++++++++++---
>  target/riscv/translate.c                |   7 ++
>  5 files changed, 234 insertions(+), 31 deletions(-)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index f1b5e5549f..dc3dcf685a 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -49,3 +49,77 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
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
> +    x = do_swap(x, 0x5555555555555555ull, 1);
> +    x = do_swap(x, 0x3333333333333333ull, 2);
> +    x = do_swap(x, 0x0f0f0f0f0f0f0f0full, 4);
> +    return x;
> +}
> +
> +static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
> +                                    uint32_t sz_log2)
> +{
> +    target_ulong r = 0;
> +    target_ulong sz = 1LL << sz_log2;
> +    target_ulong mask = (1LL << sz) - 1;
> +    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
> +        target_ulong pos = ((rs2 >> i) & mask) << sz_log2;
> +        if (pos < sizeof(target_ulong) * 8) {
> +            r |= ((rs1 >> pos) & mask) << i;
> +        }
> +    }
> +    return r;
> +}
> +
> +target_ulong HELPER(xperm4)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_xperm(rs1, rs2, 2);
> +}
> +
> +target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_xperm(rs1, rs2, 3);
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
> +    x |= ((src << shift) & maskL) | ((src >> shift) & maskR);
> +    return x;
> +}
> +
> +target_ulong HELPER(unzip)(target_ulong rs1)
> +{
> +    target_ulong x = rs1;
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
> +    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
> +    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
> +    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
> +    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
> +    return x;
> +}
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 6cf6d6ce98..2bd6ac8280 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -66,6 +66,11 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
>  /* Bitmanip */
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
> +DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
> +DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
>
>  /* Floating Point - Half Precision */
>  DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..7491b2d562 100644
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

Why move these?

Alistair

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
> @@ -755,13 +761,25 @@ rorw       0110000 .......... 101 ..... 0111011 @r
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
> -# *** RV32 Zbc Standard Extension ***
> +# *** RV32 Zbc/Zbkc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
>  clmulh     0000101 .......... 011 ..... 0110011 @r
> +# *** RV32 extra Zbc Standard Extension ***
>  clmulr     0000101 .......... 010 ..... 0110011 @r
>
> +# *** RV32 Zbkx Standard Extension ***
> +xperm4     0010100 .......... 010 ..... 0110011 @r
> +xperm8     0010100 .......... 100 ..... 0110011 @r
> +
>  # *** RV32 Zbs Standard Extension ***
>  bclr       0100100 .......... 001 ..... 0110011 @r
>  bclri      01001. ........... 001 ..... 0010011 @sh
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 810431a1d6..a7fb34fb65 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -1,5 +1,5 @@
>  /*
> - * RISC-V translation routines for the Zb[abcs] Standard Extension.
> + * RISC-V translation routines for the Zb[abcs] and Zbk[bcx] Standard Extension.
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> @@ -42,6 +42,18 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_ZBKB(ctx) do {                   \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbkb) {     \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
> +#define REQUIRE_ZBKX(ctx) do {                   \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbkx) {     \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  static void gen_clz(TCGv ret, TCGv arg1)
>  {
>      tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
> @@ -85,19 +97,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
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
> @@ -247,7 +259,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static bool trans_ror(DisasContext *ctx, arg_ror *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw, NULL);
>  }
>
> @@ -264,7 +276,7 @@ static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
>
>  static bool trans_rori(DisasContext *ctx, arg_rori *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
>                                     tcg_gen_rotri_tl, gen_roriw, NULL);
>  }
> @@ -289,7 +301,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
>
>  static bool trans_rol(DisasContext *ctx, arg_rol *a)
>  {
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw, NULL);
>  }
>
> @@ -301,14 +313,14 @@ static void gen_rev8_32(TCGv ret, TCGv src1)
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
> @@ -403,7 +415,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      ctx->ol = MXL_RV32;
>      return gen_shift(ctx, a, EXT_NONE, gen_rorw, NULL);
>  }
> @@ -411,7 +423,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      ctx->ol = MXL_RV32;
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
>  }
> @@ -419,7 +431,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>  static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_ZBB(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
>      ctx->ol = MXL_RV32;
>      return gen_shift(ctx, a, EXT_NONE, gen_rolw, NULL);
>  }
> @@ -483,7 +495,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>
>  static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
>  {
> -    REQUIRE_ZBC(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
>      return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul, NULL);
>  }
>
> @@ -495,7 +507,7 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
>
>  static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
>  {
> -    REQUIRE_ZBC(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
>      return gen_arith(ctx, a, EXT_NONE, gen_clmulh, NULL);
>  }
>
> @@ -504,3 +516,90 @@ static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
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
> +    tcg_gen_ext8u_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext16s_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
> +    tcg_temp_free(t);
> +}
> +
> +static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    gen_helper_brev8(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
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
> +    gen_helper_unzip(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_zip(DisasContext *ctx, arg_zip *a)
> +{
> +    REQUIRE_ZBKB(ctx);
> +    REQUIRE_32BIT(ctx);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    gen_helper_zip(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_xperm4(DisasContext *ctx, arg_xperm4 *a)
> +{
> +    REQUIRE_ZBKX(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm4, NULL);
> +}
> +
> +static bool trans_xperm8(DisasContext *ctx, arg_xperm8 *a)
> +{
> +    REQUIRE_ZBKX(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm8, NULL);
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

