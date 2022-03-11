Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSUzW-0003lO-Md
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 21:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSUzM-0003i0-0T; Thu, 10 Mar 2022 21:26:45 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=33352
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSUzJ-0003Oa-BA; Thu, 10 Mar 2022 21:26:43 -0500
Received: by mail-io1-xd2b.google.com with SMTP id 195so8775745iou.0;
 Thu, 10 Mar 2022 18:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wf2UXCVMSQukxPmc7EC0b1uZk4qeoNh+M8T0SFcyVcc=;
 b=i9se3NMuyP/khDkp9L8Ee337hLbEsISiSCOi7xH1gDhWWpvCptrpun9FGT6CqsGgD2
 KkwhpP/8n/T5GQF82YmPhX8bDZTcpwtFbyX3gg1+H4WeOrDKoBjHb5WxmGtfluJW6K6T
 NNLQYW3mf474JnjW+VxJM+hko9fGr5J6d27fKKd1F7UJN9ttodw6TT2IB4vPKv4S7TDh
 bz69qPG1r61TcxV7B8gyckIwjEXqVmGDqKKqp2/n8roV98sAF1t3K0QpbYGPTagyOz0h
 LwN+SuKy19lu5sYTdPlWoK5eCCzaNhYMA1BCHlnZHHT3NeCr5gSERBrLKv98hWleh5L6
 WALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wf2UXCVMSQukxPmc7EC0b1uZk4qeoNh+M8T0SFcyVcc=;
 b=mG69hcphL0ISU2sTk8GgceA9+3Kf1QF2RqbwRDK3IXX04xUhlNC/L5s0Il4g3w/z3Y
 aTwNp/3RIJ9AdM5p9RrPuXLcVHbJh/zoR6t9qmFceFdGj3L0SFisgPbAknAyTL6henB9
 JEcL7gU18/xNcWfzqMiLj9LNi89UNhOtWoOAYLqkVL7a1GwVhfu14+nkeuur1B5FJ0M0
 syYJ6VxXAKbDTkyYzyrtTlvsBCKD3adKqf1uT5xDoWnCcgRykNJ1OoNF5uM5mv0BH78c
 lmZZVQhnfrd3wIfu9XpNCJ4ocJs0Ia4hbiKcLkWn9V/4BvNkrUgSGivcaJ8Ei6MiC/jK
 i4LA==
X-Gm-Message-State: AOAM533pA4gETLj+36beOT6ZwwwBkush2UrCY0x4dqmxEgIU0iiskM9b
 GWV0CeU9D0ETSe7qPB8E9WIqYgRUU5SCt53SdZg=
X-Google-Smtp-Source: ABdhPJxzJirnzhIhN28ap93uYoZkuj0hzhvqGKV7FCVIqHG+FVQbZDfE2/5g2lQWFEmgAnHpKpIgUO353P+JUPC/dYI=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr6265465iov.93.1646965599674; Thu, 10
 Mar 2022 18:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20220301115828.355-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 12:26:13 +1000
Message-ID: <CAKmqyKNgeE5-K3GbRLMcA2Xtw+vicsgFuco9A8bF1S0xKJe6hA@mail.gmail.com>
Subject: Re: [PATCH v8 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 11 Mar 2022 02:26:45 -0000

On Tue, Mar 1, 2022 at 10:03 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i instructions
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/crypto_helper.c            | 169 ++++++++++++++++++++++++
>  target/riscv/helper.h                   |   8 ++
>  target/riscv/insn32.decode              |  12 ++
>  target/riscv/insn_trans/trans_rvk.c.inc |  47 +++++++
>  4 files changed, 236 insertions(+)
>
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index 220d51c742..cb4783a1e9 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -102,4 +102,173 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
>  {
>      return aes32_operation(shamt, rs1, rs2, false, false);
>  }
> +
> +#define BY(X, I) ((X >> (8 * I)) & 0xFF)
> +
> +#define AES_SHIFROWS_LO(RS1, RS2) ( \
> +    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
> +    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
> +    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
> +    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
> +
> +#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
> +    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
> +    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
> +    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
> +    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
> +
> +#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
> +    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
> +    AES_GFMUL(BY(COL, B0), 2))
> +
> +#define AES_MIXCOLUMN(COL) ( \
> +    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
> +    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
> +    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << 0)
> +
> +#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
> +    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
> +    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
> +
> +#define AES_INVMIXCOLUMN(COL) ( \
> +    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
> +    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
> +    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
> +    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
> +
> +static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
> +                                           bool enc, bool mix)
> +{
> +    uint64_t RS1 = rs1;
> +    uint64_t RS2 = rs2;
> +    uint64_t result;
> +    uint64_t temp;
> +    uint32_t col_0;
> +    uint32_t col_1;
> +
> +    if (enc) {
> +        temp = AES_SHIFROWS_LO(RS1, RS2);
> +        temp = (((uint64_t)AES_sbox[(temp >> 0) & 0xFF] << 0) |
> +                ((uint64_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
> +                ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
> +                ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
> +                ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
> +                ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
> +                ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
> +                ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56));
> +        if (mix) {
> +            col_0 = temp & 0xFFFFFFFF;
> +            col_1 = temp >> 32;
> +
> +            col_0 = AES_MIXCOLUMN(col_0);
> +            col_1 = AES_MIXCOLUMN(col_1);
> +
> +            result = ((uint64_t)col_1 << 32) | col_0;
> +        } else {
> +            result = temp;
> +        }
> +    } else {
> +        temp = AES_INVSHIFROWS_LO(RS1, RS2);
> +        temp = (((uint64_t)AES_isbox[(temp >> 0) & 0xFF] << 0) |
> +                ((uint64_t)AES_isbox[(temp >> 8) & 0xFF] << 8) |
> +                ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
> +                ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
> +                ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
> +                ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
> +                ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
> +                ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56));
> +        if (mix) {
> +            col_0 = temp & 0xFFFFFFFF;
> +            col_1 = temp >> 32;
> +
> +            col_0 = AES_INVMIXCOLUMN(col_0);
> +            col_1 = AES_INVMIXCOLUMN(col_1);
> +
> +            result = ((uint64_t)col_1 << 32) | col_0;
> +        } else {
> +            result = temp;
> +        }
> +    }
> +
> +    return result;
> +}
> +
> +target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, true, true);
> +}
> +
> +target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, true, false);
> +}
> +
> +target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, false, false);
> +}
> +
> +target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, false, true);
> +}
> +
> +target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
> +{
> +    uint64_t RS1 = rs1;
> +    uint64_t RS2 = rs2;
> +    uint32_t rs1_hi = RS1 >> 32;
> +    uint32_t rs2_lo = RS2;
> +    uint32_t rs2_hi = RS2 >> 32;
> +
> +    uint32_t r_lo = (rs1_hi ^ rs2_lo);
> +    uint32_t r_hi = (rs1_hi ^ rs2_lo ^ rs2_hi);
> +    target_ulong result = ((uint64_t)r_hi << 32) | r_lo;
> +
> +    return result;
> +}
> +
> +target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
> +{
> +    uint64_t RS1 = rs1;
> +    static const uint8_t round_consts[10] = {
> +        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
> +    };
> +
> +    uint8_t enc_rnum = rnum;
> +    uint32_t temp = (RS1 >> 32) & 0xFFFFFFFF;
> +    uint8_t rcon_ = 0;
> +    target_ulong result;
> +
> +    if (enc_rnum != 0xA) {
> +        temp = ror32(temp, 8); /* Rotate right by 8 */
> +        rcon_ = round_consts[enc_rnum];
> +    }
> +
> +    temp = ((uint32_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
> +           ((uint32_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
> +           ((uint32_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
> +           ((uint32_t)AES_sbox[(temp >> 0) & 0xFF] << 0);
> +
> +    temp ^= rcon_;
> +
> +    result = ((uint64_t)temp << 32) | temp;
> +
> +    return result;
> +}
> +
> +target_ulong HELPER(aes64im)(target_ulong rs1)
> +{
> +    uint64_t RS1 = rs1;
> +    uint32_t col_0 = RS1 & 0xFFFFFFFF;
> +    uint32_t col_1 = RS1 >> 32;
> +    target_ulong result;
> +
> +    col_0 = AES_INVMIXCOLUMN(col_0);
> +    col_1 = AES_INVMIXCOLUMN(col_1);
> +
> +    result = ((uint64_t)col_1 << 32) | col_0;
> +
> +    return result;
> +}
>  #undef sext32_xlen
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index d31bfadb3e..0df0a05b11 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1121,3 +1121,11 @@ DEF_HELPER_FLAGS_3(aes32esmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
>  DEF_HELPER_FLAGS_3(aes32esi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
>  DEF_HELPER_FLAGS_3(aes32dsmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
>  DEF_HELPER_FLAGS_3(aes32dsi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> +
> +DEF_HELPER_FLAGS_2(aes64esm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(aes64es, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(aes64ds, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(aes64ks2, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(aes64ks1i, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 0f2e661583..0b800b4093 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -36,6 +36,7 @@
>  %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
>  %imm_u    12:s20                 !function=ex_shift_12
>  %imm_bs   30:2                   !function=ex_shift_3
> +%imm_rnum 20:4
>
>  # Argument sets:
>  &empty
> @@ -92,6 +93,7 @@
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
>
>  @k_aes   .. ..... ..... .....  ... ..... ....... &k_aes  shamt=%imm_bs   %rs2 %rs1 %rd
> +@i_aes   .. ..... ..... .....  ... ..... ....... &i      imm=%imm_rnum        %rs1 %rd
>
>  # Formats 64:
>  @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
> @@ -842,6 +844,16 @@ hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
>  # *** RV32 Zknd Standard Extension ***
>  aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
>  aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
> +# *** RV64 Zknd Standard Extension ***
> +aes64dsm    00 11111 ..... ..... 000 ..... 0110011 @r
> +aes64ds     00 11101 ..... ..... 000 ..... 0110011 @r
> +aes64im     00 11000 00000 ..... 001 ..... 0010011 @r2
>  # *** RV32 Zkne Standard Extension ***
>  aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
>  aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
> +# *** RV64 Zkne Standard Extension ***
> +aes64es     00 11001 ..... ..... 000 ..... 0110011 @r
> +aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
> +# *** RV64 Zkne/zknd Standard Extension ***
> +aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
> +aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 @i_aes
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> index 74f9f826b9..b86f931b13 100644
> --- a/target/riscv/insn_trans/trans_rvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -65,3 +65,50 @@ static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
>      REQUIRE_ZKND(ctx);
>      return gen_aes32_sm4(ctx, a, gen_helper_aes32dsi);
>  }
> +
> +static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64es, NULL);
> +}
> +
> +static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64esm, NULL);
> +}
> +
> +static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)
> +{
> +    REQUIRE_ZKND(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64ds, NULL);
> +}
> +
> +static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
> +{
> +    REQUIRE_ZKND(ctx);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64dsm, NULL);
> +}
> +
> +static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
> +{
> +    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
> +    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64ks2, NULL);
> +}
> +
> +static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
> +{
> +    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
> +
> +    if (a->imm > 0xA) {
> +        return false;
> +    }
> +
> +    return gen_arith_imm_tl(ctx, a, EXT_NONE, gen_helper_aes64ks1i, NULL);
> +}
> +
> +static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
> +{
> +    REQUIRE_ZKND(ctx);
> +    return gen_unary(ctx, a, EXT_NONE, gen_helper_aes64im);
> +}
> --
> 2.17.1
>
>

