Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMFdi-0000l7-FI
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 15:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFdg-0000iZ-Dw; Tue, 16 Mar 2021 15:46:00 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:32775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFdb-0003c1-FK; Tue, 16 Mar 2021 15:46:00 -0400
Received: by mail-il1-x132.google.com with SMTP id r7so13867943ilb.0;
 Tue, 16 Mar 2021 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROCoQ6gv1iyqdAHy/Yd4XrPuV46wceGBrULURkcjZTI=;
 b=vCs+GtULIwAM9fOSwjVmJn4CfOAF+98U9A4Ryq7K2BnCi4zrtlU7aASh91lIC4R2HJ
 X8X2MR7yMwFehDNtOWV9WJiqJTLa9Xsu6rdH1LwQIUV6a5dikd3IvaB/xQ6nxBPlBG+A
 wedKdzxpYUJMl2IVMWngdLKSEFiDtCXyRmYHHXz2zK51AXpMS0P1sikPzevMnVvma0pA
 2eSU7pxHzQUaxaEK/aDQYaerzBkgEARAVowYeqA4jD4u43/oQVrNHFvUWebArECiiami
 +UjuOdMj1/4qiRvfy8g4v2x7Di8fgayjNdcRkRHdRl2ocu42yXbN/0mCchK4N+EGAuO7
 9gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROCoQ6gv1iyqdAHy/Yd4XrPuV46wceGBrULURkcjZTI=;
 b=MC6RKPmQjVZ73gH8aetA72fa9XEPmJ+701BWnK3bbcgxAkX6cXtghghovLLUmKVyiY
 RTKa1RgdYgmWfQscp0OyowV4MG7rFjKDpE5DsioZAEEWHXURvIPLwDIZWW1iIEbmPBhW
 hgU6pDqKlqf+6QdjvYxyZh7A/oA7iXE3yjannMmdhXHxzlks9NTBt65Nz7Cnnc//61HT
 +1D0DSajqZN07LQmVMGZYAOv0Rx6xLIbo0qJeyDWAepYIaaLMGwpUyskJ486tqJ4dPhW
 Z99l6qvOJ1j8N21eDKQ4ONrc6txmCy+Ajvbp3aaVo3Qf6V0JXJ9i/FJJhx6H7oKVivyU
 iUwA==
X-Gm-Message-State: AOAM532SDqoI3LvyKW5dhm5DhQrNhOG5iCIISbzIeFseDiaK03qMQfdO
 U0IEgxbCzAM54OLNZWDVMp4BaxCMKWt0+LXzWNw=
X-Google-Smtp-Source: ABdhPJziY3wyjziS5LKVLxeOTT46f3da+imkqXxlW78pJOIA2ZuOYJ1boCJ/OtXmHY0KChK1YJ3sOySA7CdBDzZupbU=
X-Received: by 2002:a05:6e02:1748:: with SMTP id
 y8mr4899280ill.131.1615923953862; 
 Tue, 16 Mar 2021 12:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-21-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-21-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 15:44:17 -0400
Message-ID: <CAKmqyKMDsJ8z6btDz9EsKnXN4sigGy_e1sg6=UUQizu+oNi=2A@mail.gmail.com>
Subject: Re: [PATCH 20/38] target/riscv: Partial-SIMD Miscellaneous
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 19:46:01 -0000

On Fri, Feb 12, 2021 at 10:44 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  8 +++
>  target/riscv/insn32-64.decode           |  4 --
>  target/riscv/insn32.decode              | 10 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  9 +++
>  target/riscv/packed_helper.c            | 75 +++++++++++++++++++++++++
>  5 files changed, 102 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 2511134610..7c3a0654d6 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1315,3 +1315,11 @@ DEF_HELPER_4(kmsda, tl, env, tl, tl, tl)
>  DEF_HELPER_4(kmsxda, tl, env, tl, tl, tl)
>
>  DEF_HELPER_3(smal, i64, env, i64, tl)
> +
> +DEF_HELPER_3(sclip32, tl, env, tl, tl)
> +DEF_HELPER_3(uclip32, tl, env, tl, tl)
> +DEF_HELPER_2(clrs32, tl, env, tl)
> +DEF_HELPER_2(clz32, tl, env, tl)
> +DEF_HELPER_2(clo32, tl, env, tl)
> +DEF_HELPER_3(pbsad, tl, env, tl, tl)
> +DEF_HELPER_4(pbsada, tl, env, tl, tl, tl)
> diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
> index 8157dee8b7..1094172210 100644
> --- a/target/riscv/insn32-64.decode
> +++ b/target/riscv/insn32-64.decode
> @@ -19,10 +19,6 @@
>  # This is concatenated with insn32.decode for risc64 targets.
>  # Most of the fields and formats are there.
>
> -%sh5    20:5
> -
> -@sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
> -
>  # *** RV64I Base Instruction Set (in addition to RV32I) ***
>  lwu      ............   ..... 110 ..... 0000011 @i
>  ld       ............   ..... 011 ..... 0000011 @i
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index a022f660b7..12e95f9c5f 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -25,6 +25,7 @@
>  %sh10    20:10
>  %sh4    20:4
>  %sh3    20:3
> +%sh5    20:5
>  %csr    20:12
>  %rm     12:3
>  %nf     29:3                     !function=ex_plus_1
> @@ -64,6 +65,7 @@
>  @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
>  @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
>  @sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
> +@sh5     ......  ...... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
>
>  @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> @@ -783,3 +785,11 @@ kmsda      0100110  ..... ..... 001 ..... 1111111 @r
>  kmsxda     0100111  ..... ..... 001 ..... 1111111 @r
>
>  smal       0101111  ..... ..... 001 ..... 1111111 @r
> +
> +sclip32    1110010  ..... ..... 000 ..... 1111111 @sh5
> +uclip32    1111010  ..... ..... 000 ..... 1111111 @sh5
> +clrs32     1010111  11000 ..... 000 ..... 1111111 @r2
> +clz32      1010111  11001 ..... 000 ..... 1111111 @r2
> +clo32      1010111  11011 ..... 000 ..... 1111111 @r2
> +pbsad      1111110  ..... ..... 000 ..... 1111111 @r
> +pbsada     1111111  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 73a26bbfbd..42656682c6 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -656,3 +656,12 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    \
>  }
>
>  GEN_RVP_R_D64_S64_OOL(smal);
> +
> +/* Partial-SIMD Miscellaneous Instructions */
> +GEN_RVP_SHIFTI(sclip32, sclip32, NULL);
> +GEN_RVP_SHIFTI(uclip32, uclip32, NULL);
> +GEN_RVP_R2_OOL(clrs32);
> +GEN_RVP_R2_OOL(clz32);
> +GEN_RVP_R2_OOL(clo32);
> +GEN_RVP_R_OOL(pbsad);
> +GEN_RVP_R_ACC_OOL(pbsada);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 8ad7ea8354..96e73c045b 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -1978,3 +1978,78 @@ uint64_t helper_smal(CPURISCVState *env, uint64_t a, target_ulong b)
>      }
>      return result;
>  }
> +
> +/* Partial-SIMD Miscellaneous Instructions */
> +static inline void do_sclip32(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x1f;
> +
> +    d[i] = sat64(env, a[i], shift);
> +}
> +
> +RVPR(sclip32, 1, 4);
> +
> +static inline void do_uclip32(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x1f;
> +
> +    if (a[i] < 0) {
> +        d[i] = 0;
> +        env->vxsat = 0x1;
> +    } else {
> +        d[i] = satu64(env, a[i], shift);
> +    }
> +}
> +
> +RVPR(uclip32, 1, 4);
> +
> +static inline void do_clrs32(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    d[i] = clrsb32(a[i]);
> +}
> +
> +RVPR2(clrs32, 1, 4);
> +
> +static inline void do_clz32(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    d[i] = clz32(a[i]);
> +}
> +
> +RVPR2(clz32, 1, 4);
> +
> +static inline void do_clo32(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    d[i] = clo32(a[i]);
> +}
> +
> +RVPR2(clo32, 1, 4);
> +
> +static inline void do_pbsad(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    target_ulong *d = vd;
> +    uint8_t *a = va, *b = vb;
> +    *d += abs(a[i] - b[i]);
> +}
> +
> +RVPR(pbsad, 1, 1);
> +
> +static inline void do_pbsada(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, void *vc, uint8_t i)
> +{
> +    target_ulong *d = vd, *c = vc;
> +    uint8_t *a = va, *b = vb;
> +    if (i == 0) {
> +        *d += *c;
> +    }
> +    *d += abs(a[i] - b[i]);
> +}
> +
> +RVPR_ACC(pbsada, 1, 1);
> --
> 2.17.1
>

