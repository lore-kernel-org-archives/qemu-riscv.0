Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMCAD-00036Y-Ge
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 12:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMCAB-00032x-I5; Tue, 16 Mar 2021 12:03:19 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:35327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMCA3-0001lx-Ns; Tue, 16 Mar 2021 12:03:19 -0400
Received: by mail-io1-xd2a.google.com with SMTP id g27so37754126iox.2;
 Tue, 16 Mar 2021 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xoHTc/4f+/0821WW5UOYRemUq0nLrrUafrge9Mdp1s=;
 b=pMu5OnIz6UUBu+c/xyodFoG/l79daKhwWytaTxJ5nvx7HRN9UfqlXEMZ/h3kX7qoqY
 uIrJB/ujrtnrY9yH3HAUB2nDK5WJNu/kJWHn1kvoz/JiQeFv/EMJUwcb9lY77Tt5qIIJ
 ZIWGXzVJWbAGnZ0IDvRYp451Z8jsx4fNuBLcffjHLuhLYG6MNybaj4KQu1FVC8MAU9CL
 w7bhZOe3ylqj2P5kasWGEJlOg1lAodHqbJqqd+OXXx5p25TxcKyUtgZ60A6HCrzBHxmL
 TjEgfmK4jGsbi3q3uzo+rSqD3MSeS26824ekNwmMTTDTVwTCnzEsnOeALI1eONq4Kwci
 5oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xoHTc/4f+/0821WW5UOYRemUq0nLrrUafrge9Mdp1s=;
 b=jv+tdL2Seo+E47J71ZKhawQFuMmbmMWHl35NmEMYx/aFPT/GmnhWo0Ap8xLysiJwLw
 3QNEtJ2Wn4e+53WD7eD7DyZJQRLP4fI8zY5l/fVK10Qq37i41cMR7F3mPqde89X5V0Uk
 CSTWSTkxJdDh1Kuxbp13bljETQZ3sm+PWlIfPBMWHCjU5+UsZmKnIXYkDPvk/8kfSUt8
 3NWK2pEgS9I/L97qLKOTv0tsAXFT0PS79gRrd7H4DfVy0efNnewtnVmk65zc/Mv/gKWF
 KjIOwvPOuW/ydaVrpazOFPH3xyUmuwfyAgkCxKUMHSOf18T8qfZLjVt336SlIkZLIMKb
 ezQQ==
X-Gm-Message-State: AOAM533SbK7SQFwRXqQEuc6nyrVLubnAEk5yUm7N558fXxvQ6enqIdoG
 VcZ2dLu9IawORRIWBTPsoVDBHUmFkPGF4cVQnQ4=
X-Google-Smtp-Source: ABdhPJwIwmBn2GbKDyidmrLx0Ygi/McnaODtZH1JAFTVUiqlzL5yPyfBdcrh4CFfNiRXvKHAhLO4PCcJU5X6Ldtxyio=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr15086519jah.8.1615910589919; 
 Tue, 16 Mar 2021 09:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-18-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-18-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 12:01:33 -0400
Message-ID: <CAKmqyKN54Tu2TKLf9Tq0anusS_73JMPS6PwA4yMYwZD+XKf1Mg@mail.gmail.com>
Subject: Re: [PATCH 17/38] target/riscv: Signed MSW 32x16 Multiply and Add
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 16:03:20 -0000

On Fri, Feb 12, 2021 at 10:38 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  17 ++
>  target/riscv/insn32.decode              |  17 ++
>  target/riscv/insn_trans/trans_rvp.c.inc |  18 ++
>  target/riscv/packed_helper.c            | 208 ++++++++++++++++++++++++
>  4 files changed, 260 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 0bd21c8514..25aa07a7ff 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1277,3 +1277,20 @@ DEF_HELPER_4(kmmsb, tl, env, tl, tl, tl)
>  DEF_HELPER_4(kmmsb_u, tl, env, tl, tl, tl)
>  DEF_HELPER_3(kwmmul, tl, env, tl, tl)
>  DEF_HELPER_3(kwmmul_u, tl, env, tl, tl)
> +
> +DEF_HELPER_3(smmwb, tl, env, tl, tl)
> +DEF_HELPER_3(smmwb_u, tl, env, tl, tl)
> +DEF_HELPER_3(smmwt, tl, env, tl, tl)
> +DEF_HELPER_3(smmwt_u, tl, env, tl, tl)
> +DEF_HELPER_4(kmmawb, tl, env, tl, tl, tl)
> +DEF_HELPER_4(kmmawb_u, tl, env, tl, tl, tl)
> +DEF_HELPER_4(kmmawt, tl, env, tl, tl, tl)
> +DEF_HELPER_4(kmmawt_u, tl, env, tl, tl, tl)
> +DEF_HELPER_3(kmmwb2, tl, env, tl, tl)
> +DEF_HELPER_3(kmmwb2_u, tl, env, tl, tl)
> +DEF_HELPER_3(kmmwt2, tl, env, tl, tl)
> +DEF_HELPER_3(kmmwt2_u, tl, env, tl, tl)
> +DEF_HELPER_4(kmmawb2, tl, env, tl, tl, tl)
> +DEF_HELPER_4(kmmawb2_u, tl, env, tl, tl, tl)
> +DEF_HELPER_4(kmmawt2, tl, env, tl, tl, tl)
> +DEF_HELPER_4(kmmawt2_u, tl, env, tl, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e0be2790dc..6e63bab2d9 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -745,3 +745,20 @@ kmmsb      0100001  ..... ..... 001 ..... 1111111 @r
>  kmmsb_u    0101001  ..... ..... 001 ..... 1111111 @r
>  kwmmul     0110001  ..... ..... 001 ..... 1111111 @r
>  kwmmul_u   0111001  ..... ..... 001 ..... 1111111 @r
> +
> +smmwb      0100010  ..... ..... 001 ..... 1111111 @r
> +smmwb_u    0101010  ..... ..... 001 ..... 1111111 @r
> +smmwt      0110010  ..... ..... 001 ..... 1111111 @r
> +smmwt_u    0111010  ..... ..... 001 ..... 1111111 @r
> +kmmawb     0100011  ..... ..... 001 ..... 1111111 @r
> +kmmawb_u   0101011  ..... ..... 001 ..... 1111111 @r
> +kmmawt     0110011  ..... ..... 001 ..... 1111111 @r
> +kmmawt_u   0111011  ..... ..... 001 ..... 1111111 @r
> +kmmwb2     1000111  ..... ..... 001 ..... 1111111 @r
> +kmmwb2_u   1001111  ..... ..... 001 ..... 1111111 @r
> +kmmwt2     1010111  ..... ..... 001 ..... 1111111 @r
> +kmmwt2_u   1011111  ..... ..... 001 ..... 1111111 @r
> +kmmawb2    1100111  ..... ..... 001 ..... 1111111 @r
> +kmmawb2_u  1101111  ..... ..... 001 ..... 1111111 @r
> +kmmawt2    1110111  ..... ..... 001 ..... 1111111 @r
> +kmmawt2_u  1111111  ..... ..... 001 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index fbc9c0b57b..e708ae7a6a 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -564,3 +564,21 @@ GEN_RVP_R_ACC_OOL(kmmsb);
>  GEN_RVP_R_ACC_OOL(kmmsb_u);
>  GEN_RVP_R_OOL(kwmmul);
>  GEN_RVP_R_OOL(kwmmul_u);
> +
> +/* Most Significant Word "32x16" Multiply & Add Instructions */
> +GEN_RVP_R_OOL(smmwb);
> +GEN_RVP_R_OOL(smmwb_u);
> +GEN_RVP_R_OOL(smmwt);
> +GEN_RVP_R_OOL(smmwt_u);
> +GEN_RVP_R_ACC_OOL(kmmawb);
> +GEN_RVP_R_ACC_OOL(kmmawb_u);
> +GEN_RVP_R_ACC_OOL(kmmawt);
> +GEN_RVP_R_ACC_OOL(kmmawt_u);
> +GEN_RVP_R_OOL(kmmwb2);
> +GEN_RVP_R_OOL(kmmwb2_u);
> +GEN_RVP_R_OOL(kmmwt2);
> +GEN_RVP_R_OOL(kmmwt2_u);
> +GEN_RVP_R_ACC_OOL(kmmawb2);
> +GEN_RVP_R_ACC_OOL(kmmawb2_u);
> +GEN_RVP_R_ACC_OOL(kmmawt2);
> +GEN_RVP_R_ACC_OOL(kmmawt2_u);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index c1322d2fac..ea3c9f6dd8 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -1477,3 +1477,211 @@ static inline void do_kwmmul_u(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(kwmmul_u, 1, 4);
> +
> +/* Most Significant Word "32x16" Multiply & Add Instructions */
> +static inline void do_smmwb(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i)] >> 16;
> +}
> +
> +RVPR(smmwb, 1, 4);
> +
> +static inline void do_smmwb_u(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i)] + (1ull << 15)) >> 16;
> +}
> +
> +RVPR(smmwb_u, 1, 4);
> +
> +static inline void do_smmwt(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 16;
> +}
> +
> +RVPR(smmwt, 1, 4);
> +
> +static inline void do_smmwt_u(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] + (1ull << 15)) >> 16;
> +}
> +
> +RVPR(smmwt_u, 1, 4);
> +
> +static inline void do_kmmawb(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc;
> +    int16_t *b = vb;
> +    d[H4(i)] = sadd32(env, 0, (int64_t)a[H4(i)] * b[H2(2 * i)] >> 16, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawb, 1, 4);
> +
> +static inline void do_kmmawb_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc;
> +    int16_t *b = vb;
> +    d[H4(i)] = sadd32(env, 0, ((int64_t)a[H4(i)] * b[H2(2 * i)] +
> +                               (1ull << 15)) >> 16, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawb_u, 1, 4);
> +
> +static inline void do_kmmawt(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc;
> +    int16_t *b = vb;
> +    d[H4(i)] = sadd32(env, 0, (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 16,
> +                      c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawt, 1, 4);
> +
> +static inline void do_kmmawt_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc;
> +    int16_t *b = vb;
> +    d[H4(i)] = sadd32(env, 0, ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] +
> +                               (1ull << 15)) >> 16, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawt_u, 1, 4);
> +
> +static inline void do_kmmwb2(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        d[H4(i)] = INT32_MAX;
> +    } else {
> +        d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i)] >> 15;
> +    }
> +}
> +
> +RVPR(kmmwb2, 1, 4);
> +
> +static inline void do_kmmwb2_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        d[H4(i)] = INT32_MAX;
> +    } else {
> +        d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i)] + (1ull << 14)) >> 15;
> +    }
> +}
> +
> +RVPR(kmmwb2_u, 1, 4);
> +
> +static inline void do_kmmwt2(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        d[H4(i)] = INT32_MAX;
> +    } else {
> +        d[H4(i)] = (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 15;
> +    }
> +}
> +
> +RVPR(kmmwt2, 1, 4);
> +
> +static inline void do_kmmwt2_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        d[H4(i)] = INT32_MAX;
> +    } else {
> +        d[H4(i)] = ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] + (1ull << 14)) >> 15;
> +    }
> +}
> +
> +RVPR(kmmwt2_u, 1, 4);
> +
> +static inline void do_kmmawb2(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc, result;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        result = INT32_MAX;
> +    } else {
> +        result = (int64_t)a[H4(i)] * b[H2(2 * i)] >> 15;
> +    }
> +    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawb2, 1, 4);
> +
> +static inline void do_kmmawb2_u(CPURISCVState *env, void *vd, void *va,
> +                                void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc, result;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        result = INT32_MAX;
> +    } else {
> +        result = ((int64_t)a[H4(i)] * b[H2(2 * i)] + (1ull << 14)) >> 15;
> +    }
> +    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawb2_u, 1, 4);
> +
> +static inline void do_kmmawt2(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc, result;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        result = INT32_MAX;
> +    } else {
> +        result = (int64_t)a[H4(i)] * b[H2(2 * i + 1)] >> 15;
> +    }
> +    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawt2, 1, 4);
> +
> +static inline void do_kmmawt2_u(CPURISCVState *env, void *vd, void *va,
> +                                void *vb, void *vc, uint8_t i)
> +{
> +    int32_t *d = vd, *a = va, *c = vc, result;
> +    int16_t *b = vb;
> +    if (a[H4(i)] == INT32_MIN && b[H2(2 * i + 1)] == INT16_MIN) {
> +        env->vxsat = 0x1;
> +        result = INT32_MAX;
> +    } else {
> +        result = ((int64_t)a[H4(i)] * b[H2(2 * i + 1)] + (1ull << 14)) >> 15;
> +    }
> +    d[H4(i)] = sadd32(env, 0, result, c[H4(i)]);
> +}
> +
> +RVPR_ACC(kmmawt2_u, 1, 4);
> --
> 2.17.1
>

