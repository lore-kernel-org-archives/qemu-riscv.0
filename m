Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXDXk-0007xl-Dq
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 22:49:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nXDXf-0007xV-KQ; Wed, 23 Mar 2022 22:49:42 -0400
Received: from [2607:f8b0:4864:20::d33] (port=46003
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nXDXb-0000uy-HH; Wed, 23 Mar 2022 22:49:39 -0400
Received: by mail-io1-xd33.google.com with SMTP id h63so3966816iof.12;
 Wed, 23 Mar 2022 19:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PaNTuQLp8WNnofTesjDQCSEyN8gF0ttZQbKZS8RD/1A=;
 b=W/wxvlpT/U7YJ3p76Q5zUfwPnzRKM5fpGjVxCAI3NGZdkF+sqQQaO59Dx6RsKFCZH2
 +HMERYRd6+lF3eBc/BfyPtjrclVRpL12CLdci/sfhD3A+q8Au/aG7+rYLCSnqzvszQJp
 gKq2u5dE1auksjHJ+8u8tNvezVdkgzSGHKaVzed8CY6JfkmXZziMiPT4gvu1x97Tdw4u
 EtL7i4DxbeI+jN6VyckChsIP3d76NSxpJVlE88a3WE0ticifWyZXO8zN6Py/nigqKLbq
 9xWd04G1/PquWzsA/maJf5WEgYETbHVPXNq1zcQmcfb/Ffwoo9xl7ekWMvUN0EfHsv5N
 4XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PaNTuQLp8WNnofTesjDQCSEyN8gF0ttZQbKZS8RD/1A=;
 b=Fjquv1MT7msJbEmRZ7EVmXdNiC+yxhjBCf1BxPGsXMXdXq42GBgNi3c2hwOXdm4y1S
 M5TDy3El0icAiwjGrWBapijJXqe8/RiShLX9JX8Q8bRfiJKjApWgELmPBE7L/42OAW7R
 AKNnU/LyhqJ9e+V98pty1cILPskHZuKm72HXkG7TisxV4C7CXMEikAqTQQOIdq/0VCGq
 aRiuvLapyJRGeNtdbTwfNl7jPB8whMubGlqGKy/A3WmqlPupRuuSzqQAg32sQwvtpVsw
 SDGhEET+2xMjR67oJRTlzziu1C5S0lKMnBPGS7aAR1nkSTtd/3f+uTxaAY+Jdm5G/JcO
 j0XQ==
X-Gm-Message-State: AOAM530moZJqtN8gBMFTJc/WIoO5qZvcn7fTOpXr7y1KLs5YWIb0byD/
 dmkLI5CV8CbrNmiOZ+daW6jq4xUwwZ+/Aa6DrGE=
X-Google-Smtp-Source: ABdhPJz8I90g7EqBHmH9VL6zizz/wT3uSFM6r9j64P4R+HFFHIO4EK0vR8h/RZwE80KZlgcr0pCXEtbsNB4m2SWdFAk=
X-Received: by 2002:a05:6602:45b:b0:645:bdc2:fe13 with SMTP id
 e27-20020a056602045b00b00645bdc2fe13mr1670181iov.114.1648090173329; Wed, 23
 Mar 2022 19:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
 <20220318041944.19859-12-liweiwei@iscas.ac.cn>
In-Reply-To: <20220318041944.19859-12-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Mar 2022 12:49:07 +1000
Message-ID: <CAKmqyKNyYm-kzxR+hDHekC+PDQCLXXcSQrBs1-AkToA+XPv51A@mail.gmail.com>
Subject: Re: [PATCH v9 11/14] target/riscv: rvk: add support for zksed/zksh
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Thu, 24 Mar 2022 02:49:43 -0000

On Fri, Mar 18, 2022 at 2:29 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add sm3p0, sm3p1, sm4ed and sm4ks instructions
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/crypto_helper.c            | 28 ++++++++++++
>  target/riscv/helper.h                   |  3 ++
>  target/riscv/insn32.decode              |  6 +++
>  target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
>  4 files changed, 95 insertions(+)
>
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index cb4783a1e9..2ef30281b1 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -271,4 +271,32 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
>
>      return result;
>  }
> +
> +target_ulong HELPER(sm4ed)(target_ulong rs1, target_ulong rs2,
> +                           target_ulong shamt)
> +{
> +    uint32_t sb_in = (uint8_t)(rs2 >> shamt);
> +    uint32_t sb_out = (uint32_t)sm4_sbox[sb_in];
> +
> +    uint32_t x = sb_out ^ (sb_out << 8) ^ (sb_out << 2) ^ (sb_out << 18) ^
> +                 ((sb_out & 0x3f) << 26) ^ ((sb_out & 0xC0) << 10);
> +
> +    uint32_t rotl = rol32(x, shamt);
> +
> +    return sext32_xlen(rotl ^ (uint32_t)rs1);
> +}
> +
> +target_ulong HELPER(sm4ks)(target_ulong rs1, target_ulong rs2,
> +                           target_ulong shamt)
> +{
> +    uint32_t sb_in = (uint8_t)(rs2 >> shamt);
> +    uint32_t sb_out = sm4_sbox[sb_in];
> +
> +    uint32_t x = sb_out ^ ((sb_out & 0x07) << 29) ^ ((sb_out & 0xFE) << 7) ^
> +                 ((sb_out & 0x01) << 23) ^ ((sb_out & 0xF8) << 13);
> +
> +    uint32_t rotl = rol32(x, shamt);
> +
> +    return sext32_xlen(rotl ^ (uint32_t)rs1);
> +}
>  #undef sext32_xlen
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 0df0a05b11..863e0edd84 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1129,3 +1129,6 @@ DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(aes64ks2, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(aes64ks1i, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
> +
> +DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> +DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index d9ebb138d1..4033565393 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -873,3 +873,9 @@ sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
>  sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
>  sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
>  sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
> +# *** RV32 Zksh Standard Extension ***
> +sm3p0       00 01000 01000 ..... 001 ..... 0010011 @r2
> +sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
> +# *** RV32 Zksed Standard Extension ***
> +sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
> +sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> index b1ce4f27cf..b5e946566a 100644
> --- a/target/riscv/insn_trans/trans_rvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -35,6 +35,18 @@
>      }                                           \
>  } while (0)
>
> +#define REQUIRE_ZKSED(ctx) do {                 \
> +    if (!ctx->cfg_ptr->ext_zksed) {             \
> +        return false;                           \
> +    }                                           \
> +} while (0)
> +
> +#define REQUIRE_ZKSH(ctx) do {                  \
> +    if (!ctx->cfg_ptr->ext_zksh) {              \
> +        return false;                           \
> +    }                                           \
> +} while (0)
> +
>  static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
>                            void (*func)(TCGv, TCGv, TCGv, TCGv))
>  {
> @@ -320,3 +332,49 @@ static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
>      REQUIRE_ZKNH(ctx);
>      return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 14, 18, 41);
>  }
> +
> +/* SM3 */
> +static bool gen_sm3(DisasContext *ctx, arg_r2 *a, int32_t b, int32_t c)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv_i32 t0 = tcg_temp_new_i32();
> +    TCGv_i32 t1 = tcg_temp_new_i32();
> +
> +    tcg_gen_trunc_tl_i32(t0, src1);
> +    tcg_gen_rotli_i32(t1, t0, b);
> +    tcg_gen_xor_i32(t1, t0, t1);
> +    tcg_gen_rotli_i32(t0, t0, c);
> +    tcg_gen_xor_i32(t1, t1, t0);
> +    tcg_gen_ext_i32_tl(dest, t1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    tcg_temp_free_i32(t0);
> +    tcg_temp_free_i32(t1);
> +    return true;
> +}
> +
> +static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
> +{
> +    REQUIRE_ZKSH(ctx);
> +    return gen_sm3(ctx, a, 9, 17);
> +}
> +
> +static bool trans_sm3p1(DisasContext *ctx, arg_sm3p1 *a)
> +{
> +    REQUIRE_ZKSH(ctx);
> +    return gen_sm3(ctx, a, 15, 23);
> +}
> +
> +/* SM4 */
> +static bool trans_sm4ed(DisasContext *ctx, arg_sm4ed *a)
> +{
> +    REQUIRE_ZKSED(ctx);
> +    return gen_aes32_sm4(ctx, a, gen_helper_sm4ed);
> +}
> +
> +static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
> +{
> +    REQUIRE_ZKSED(ctx);
> +    return gen_aes32_sm4(ctx, a, gen_helper_sm4ks);
> +}
> --
> 2.17.1
>
>

