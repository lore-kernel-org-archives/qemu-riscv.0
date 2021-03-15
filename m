Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLulg-0001FA-7E
	for mharc-qemu-riscv@gnu.org; Mon, 15 Mar 2021 17:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLuld-0001Ce-UX; Mon, 15 Mar 2021 17:28:49 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLula-0006TY-0u; Mon, 15 Mar 2021 17:28:49 -0400
Received: by mail-io1-xd29.google.com with SMTP id f20so34954454ioo.10;
 Mon, 15 Mar 2021 14:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Z6P6x3XsQewbnhEt86KwNeXgIt8ow7g1uUD4q7Moig=;
 b=qsvc3JabhtAUbVzIFEtgWbTBm/CRc0/SZC/fOyfeM4F6LUytAoe4ztSy3ARZUSElGN
 0snJ6grt4Wep5utffJ1v9nkRhUFTK1IG3ho+YKMZxWxjsB8b0pDG9qy5kECmX1+OOEIK
 GaKMB522gLFuRl/DrwqgoOlKudW3A6bqnzRSTxS3lnCimVckoYuQOQUsdLR9J0241gXl
 6E76vN5H38Lp3tGqgNFx8drb+LmqODtr1dZcqdIL1HX34b47zbq++Jv6sEPMc0YyHk4T
 rsk/B3Dh0Qd08y+JtGQXyhhOGSObwva64P6tjNYKrpkkzi1vFJQ4alKvw/hMDIwSmYTN
 MPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Z6P6x3XsQewbnhEt86KwNeXgIt8ow7g1uUD4q7Moig=;
 b=Ye4ugk6MmYMEG2LFNrkHCNrPY61qtrBzD9WtvR1s7kTjwsvu3l6ouH/lhjgaPO6lS+
 udqsv6tvj2oAszsoG5Z6+tV4tj8gjC5+Rpra8HDnDshrRBc8EiU3au4AKmrtgfyp58Oa
 wLLzWGMoVc5+OjIJZWKAQL76+vHDbXjkjaWAOWsAgqnh7kgA+9Q9bqnWv8V3JXeisZpp
 li6M0WM4EKEaauBbqS+tKekx0M+szkgiBt2h2QDvuKplY/zbiVV1FG/fctiPU4RYe4ca
 YjR6/xnLi0KNuY2v1C2viq1bq5JvYEJlw05mYBy15H9+Z4u2JfjiwS6JhohTz4gcFL9a
 mwEg==
X-Gm-Message-State: AOAM533bNioDhMtwN/JEmqkgktq6EP0dZMMoEm+giQAf+eN/q50+AYuY
 /F/i8rBqcPhm9zdNmYw0XYHy5ehfzijhsZ8B2k4=
X-Google-Smtp-Source: ABdhPJxERiSzoyc9PSEEVX8JgTXyrURg4bgUIrx9M/+KKU0DFEwQyQ9NRH26pjEQlH0L3B5IxqXprble5q2xHtMLENE=
X-Received: by 2002:a5d:854b:: with SMTP id b11mr1093787ios.105.1615843723372; 
 Mon, 15 Mar 2021 14:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-8-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-8-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:27:03 -0400
Message-ID: <CAKmqyKPOiec2WEN_UV31Bh-mVZvwyOZV_=EOSx1PE8sKueSVBw@mail.gmail.com>
Subject: Re: [PATCH 07/38] target/riscv: SIMD 8-bit Shift Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Mon, 15 Mar 2021 21:28:50 -0000

On Fri, Feb 12, 2021 at 10:18 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   9 +++
>  target/riscv/insn32.decode              |  17 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  16 ++++
>  target/riscv/packed_helper.c            | 102 ++++++++++++++++++++++++
>  4 files changed, 144 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 20bf400ac2..0ecd4d53f9 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1193,3 +1193,12 @@ DEF_HELPER_3(sll16, tl, env, tl, tl)
>  DEF_HELPER_3(ksll16, tl, env, tl, tl)
>  DEF_HELPER_3(kslra16, tl, env, tl, tl)
>  DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
> +
> +DEF_HELPER_3(sra8, tl, env, tl, tl)
> +DEF_HELPER_3(sra8_u, tl, env, tl, tl)
> +DEF_HELPER_3(srl8, tl, env, tl, tl)
> +DEF_HELPER_3(srl8_u, tl, env, tl, tl)
> +DEF_HELPER_3(sll8, tl, env, tl, tl)
> +DEF_HELPER_3(ksll8, tl, env, tl, tl)
> +DEF_HELPER_3(kslra8, tl, env, tl, tl)
> +DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6f053bfeb7..cc782fcde5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -24,6 +24,7 @@
>
>  %sh10    20:10
>  %sh4    20:4
> +%sh3    20:3
>  %csr    20:12
>  %rm     12:3
>  %nf     29:3                     !function=ex_plus_1
> @@ -61,6 +62,7 @@
>
>  @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
>  @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
> +@sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
>
>  @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> @@ -652,3 +654,18 @@ ksll16     0110010  ..... ..... 000 ..... 1111111 @r
>  kslli16    0111010  1.... ..... 000 ..... 1111111 @sh4
>  kslra16    0101011  ..... ..... 000 ..... 1111111 @r
>  kslra16_u  0110011  ..... ..... 000 ..... 1111111 @r
> +
> +sra8       0101100  ..... ..... 000 ..... 1111111 @r
> +sra8_u     0110100  ..... ..... 000 ..... 1111111 @r
> +srai8      0111100  00... ..... 000 ..... 1111111 @sh3
> +srai8_u    0111100  01... ..... 000 ..... 1111111 @sh3
> +srl8       0101101  ..... ..... 000 ..... 1111111 @r
> +srl8_u     0110101  ..... ..... 000 ..... 1111111 @r
> +srli8      0111101  00... ..... 000 ..... 1111111 @sh3
> +srli8_u    0111101  01... ..... 000 ..... 1111111 @sh3
> +sll8       0101110  ..... ..... 000 ..... 1111111 @r
> +slli8      0111110  00... ..... 000 ..... 1111111 @sh3
> +ksll8      0110110  ..... ..... 000 ..... 1111111 @r
> +kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
> +kslra8     0101111  ..... ..... 000 ..... 1111111 @r
> +kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 848edab7e5..12a64849eb 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -353,3 +353,19 @@ GEN_RVP_SHIFTI(slli16, sll16, tcg_gen_vec_shl16i_i64);
>  GEN_RVP_SHIFTI(srai16_u, sra16_u, NULL);
>  GEN_RVP_SHIFTI(srli16_u, srl16_u, NULL);
>  GEN_RVP_SHIFTI(kslli16, ksll16, NULL);
> +
> +/* SIMD 8-bit Shift Instructions */
> +GEN_RVP_SHIFT(sra8, tcg_gen_gvec_sars, 0);
> +GEN_RVP_SHIFT(srl8, tcg_gen_gvec_shrs, 0);
> +GEN_RVP_SHIFT(sll8, tcg_gen_gvec_shls, 0);
> +GEN_RVP_R_OOL(sra8_u);
> +GEN_RVP_R_OOL(srl8_u);
> +GEN_RVP_R_OOL(ksll8);
> +GEN_RVP_R_OOL(kslra8);
> +GEN_RVP_R_OOL(kslra8_u);
> +GEN_RVP_SHIFTI(srai8, sra8, tcg_gen_vec_sar8i_i64);
> +GEN_RVP_SHIFTI(srli8, srl8, tcg_gen_vec_shr8i_i64);
> +GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
> +GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
> +GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
> +GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 7e31c2fe46..ab9ebc472b 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -529,3 +529,105 @@ static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(kslra16_u, 1, 2);
> +
> +/* SIMD 8-bit Shift Instructions */
> +static inline void do_sra8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(sra8, 1, 1);
> +
> +static inline void do_srl8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(srl8, 1, 1);
> +
> +static inline void do_sll8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] << shift;
> +}
> +
> +RVPR(sll8, 1, 1);
> +
> +static inline void do_sra8_u(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] =  vssra8(env, 0, a[i], shift);
> +}
> +
> +RVPR(sra8_u, 1, 1);
> +
> +static inline void do_srl8_u(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] =  vssrl8(env, 0, a[i], shift);
> +}
> +
> +RVPR(srl8_u, 1, 1);
> +
> +static inline void do_ksll8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, result;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +
> +    result = a[i] << shift;
> +    if (shift > (clrsb32(a[i]) - 24)) {
> +        env->vxsat = 0x1;
> +        d[i] = (a[i] & INT8_MIN) ? INT8_MIN : INT8_MAX;
> +    } else {
> +        d[i] = result;
> +    }
> +}
> +
> +RVPR(ksll8, 1, 1);
> +
> +static inline void do_kslra8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
> +
> +    if (shift >= 0) {
> +        do_ksll8(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 8) ? 7 : shift;
> +        d[i] = a[i] >> shift;
> +    }
> +}
> +
> +RVPR(kslra8, 1, 1);
> +
> +static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
> +
> +    if (shift >= 0) {
> +        do_ksll8(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 8) ? 7 : shift;
> +        d[i] =  vssra8(env, 0, a[i], shift);
> +    }
> +}
> +
> +RVPR(kslra8_u, 1, 1);
> --
> 2.17.1
>

