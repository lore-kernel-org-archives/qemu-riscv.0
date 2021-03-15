Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLuto-0000bs-2F
	for mharc-qemu-riscv@gnu.org; Mon, 15 Mar 2021 17:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLutg-0000aR-Im; Mon, 15 Mar 2021 17:37:10 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLutd-00024J-Fz; Mon, 15 Mar 2021 17:37:08 -0400
Received: by mail-il1-x12a.google.com with SMTP id b5so10769259ilq.10;
 Mon, 15 Mar 2021 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8X8Yy/8hIjHs+hPsXGpiT1WBaWAwkCjWEYV2hfI5wA=;
 b=rNoBr0NYPcQzTyNYypjTyvjfBVczEccDa9Alccb/Eq50nX1epQuRhQ++Yry94V4g0E
 NG3R3B9dvoWBaYOmqav1tJBayEBEbTB0uhu4rKRQPmhtbeIwi48aNnvcFxEuuvgGTMnQ
 PVgZm1n4MaNW/F4+8ZMwLnPA05GDbS3gKsLj/+zKL1/SwnZ8ukrJA/MBpw//ka/3buAA
 0c4O3EXf+sTymTcYgKeuoQZP2JG0aN5xJNpBg6FBPrq1L7JRBn2vVaVVoO8nBcg8QNcH
 K+vSCUnI/+UG2RTL2kghk19pWEhFd03Df+BIG3eTGI0sTPwswHhxSbzKziYoXCZR7j3a
 hn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8X8Yy/8hIjHs+hPsXGpiT1WBaWAwkCjWEYV2hfI5wA=;
 b=emV1OdyJ9/uHu8veClfqYuDFbGEpWi+gEfezZw9y8l2pc/qZKnU0zlO8JUXVcK5SX3
 ux6REw2q5ZEMj/4tggL8IqtBGCsv4wrVYC5d1HB0qpOCyJrPj63ufG1CoFsONGHLzoPK
 WvtYujgTRftFF1zLr2lDbeEKUfnYrke5YEn29FgHw6cNBhkAXDozjCNJ7lKcGIlLLgWu
 8S8wCc+e10l3ksvsuY9pR9Kq0FyAuhK98iLd+S9wpolF9DEGPg199+vP5/Z/7bOByapH
 s4/RpGsSuHbc5AtD2dIn6hT0cpq0is0MTvtSdzc0gVTWmr/HUyCt3pM0eet28xmwlyW9
 985A==
X-Gm-Message-State: AOAM5301IaIftNSLrAedfrVgI9oMFV8Fm3uyRyZ5ppjuslqQj6QYuvgM
 jEVO9K6wAEgnWZjbD0DorCRnldYcWgwjB/R0gII=
X-Google-Smtp-Source: ABdhPJx3hzcj1faXVGn4n9DisBi8hk4UglkafuVEfs1CVynakVZXi5c4jWeEY2LlmbruMzflXVPFAlk/5y6j2CwbnHk=
X-Received: by 2002:a92:c102:: with SMTP id p2mr1250325ile.227.1615844223232; 
 Mon, 15 Mar 2021 14:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-13-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-13-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:35:27 -0400
Message-ID: <CAKmqyKN9ncOLBP7V2whCjDiLVoqUxO1hxk9-byAhYDR5dufBhw@mail.gmail.com>
Subject: Re: [PATCH 12/38] target/riscv: SIMD 16-bit Miscellaneous Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Mon, 15 Mar 2021 21:37:12 -0000

On Fri, Feb 12, 2021 at 10:28 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  12 ++
>  target/riscv/insn32.decode              |  13 ++
>  target/riscv/insn_trans/trans_rvp.c.inc |  42 ++++++
>  target/riscv/packed_helper.c            | 167 ++++++++++++++++++++++++
>  4 files changed, 234 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 6bb601b436..866484e37d 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1228,3 +1228,15 @@ DEF_HELPER_3(umul8, i64, env, tl, tl)
>  DEF_HELPER_3(umulx8, i64, env, tl, tl)
>  DEF_HELPER_3(khm8, tl, env, tl, tl)
>  DEF_HELPER_3(khmx8, tl, env, tl, tl)
> +
> +DEF_HELPER_3(smin16, tl, env, tl, tl)
> +DEF_HELPER_3(umin16, tl, env, tl, tl)
> +DEF_HELPER_3(smax16, tl, env, tl, tl)
> +DEF_HELPER_3(umax16, tl, env, tl, tl)
> +DEF_HELPER_3(sclip16, tl, env, tl, tl)
> +DEF_HELPER_3(uclip16, tl, env, tl, tl)
> +DEF_HELPER_2(kabs16, tl, env, tl)
> +DEF_HELPER_2(clrs16, tl, env, tl)
> +DEF_HELPER_2(clz16, tl, env, tl)
> +DEF_HELPER_2(clo16, tl, env, tl)
> +DEF_HELPER_2(swap16, tl, env, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 9d165efba9..bc9d5fc967 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -42,6 +42,7 @@
>  &i    imm rs1 rd
>  &j    imm rd
>  &r    rd rs1 rs2
> +&r2   rd rs1
>  &s    imm rs1 rs2
>  &u    imm rd
>  &shift     shamt rs1 rd
> @@ -695,3 +696,15 @@ umul8      1011100  ..... ..... 000 ..... 1111111 @r
>  umulx8     1011101  ..... ..... 000 ..... 1111111 @r
>  khm8       1000111  ..... ..... 000 ..... 1111111 @r
>  khmx8      1001111  ..... ..... 000 ..... 1111111 @r
> +
> +smin16     1000000  ..... ..... 000 ..... 1111111 @r
> +umin16     1001000  ..... ..... 000 ..... 1111111 @r
> +smax16     1000001  ..... ..... 000 ..... 1111111 @r
> +umax16     1001001  ..... ..... 000 ..... 1111111 @r
> +sclip16    1000010  0.... ..... 000 ..... 1111111 @sh4
> +uclip16    1000010  1.... ..... 000 ..... 1111111 @sh4
> +kabs16     1010110  10001 ..... 000 ..... 1111111 @r2
> +clrs16     1010111  01000 ..... 000 ..... 1111111 @r2
> +clz16      1010111  01001 ..... 000 ..... 1111111 @r2
> +clo16      1010111  01011 ..... 000 ..... 1111111 @r2
> +swap16     1010110  11001 ..... 000 ..... 1111111 @r2
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 336f3418b1..56fb8b2523 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -444,3 +444,45 @@ GEN_RVP_R_D64_OOL(umul8);
>  GEN_RVP_R_D64_OOL(umulx8);
>  GEN_RVP_R_OOL(khm8);
>  GEN_RVP_R_OOL(khmx8);
> +
> +/* SIMD 16-bit Miscellaneous Instructions */
> +GEN_RVP_R_OOL(smin16);
> +GEN_RVP_R_OOL(umin16);
> +GEN_RVP_R_OOL(smax16);
> +GEN_RVP_R_OOL(umax16);
> +GEN_RVP_SHIFTI(sclip16, sclip16, NULL);
> +GEN_RVP_SHIFTI(uclip16, uclip16, NULL);
> +
> +/* Out of line helpers for R2 format */
> +static bool
> +r2_ool(DisasContext *ctx, arg_r2 *a,
> +       void (* fn)(TCGv, TCGv_ptr, TCGv))
> +{
> +    TCGv src1, dst;
> +    if (!has_ext(ctx, RVP)) {
> +        return false;
> +    }
> +
> +    src1 = tcg_temp_new();
> +    dst = tcg_temp_new();
> +
> +    gen_get_gpr(src1, a->rs1);
> +    fn(dst, cpu_env, src1);
> +    gen_set_gpr(a->rd, dst);
> +
> +    tcg_temp_free(src1);
> +    tcg_temp_free(dst);
> +    return true;
> +}
> +
> +#define GEN_RVP_R2_OOL(NAME)                           \
> +static bool trans_##NAME(DisasContext *s, arg_r2 *a)   \
> +{                                                      \
> +    return r2_ool(s, a, gen_helper_##NAME);            \
> +}
> +
> +GEN_RVP_R2_OOL(kabs16);
> +GEN_RVP_R2_OOL(clrs16);
> +GEN_RVP_R2_OOL(clz16);
> +GEN_RVP_R2_OOL(clo16);
> +GEN_RVP_R2_OOL(swap16);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 56baefeb8e..a6ab011ace 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -920,3 +920,170 @@ static inline void do_khmx8(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(khmx8, 2, 1);
> +
> +/* SIMD 16-bit Miscellaneous Instructions */
> +static inline void do_smin16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] < b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(smin16, 1, 2);
> +
> +static inline void do_umin16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] < b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(umin16, 1, 2);
> +
> +static inline void do_smax16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] > b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(smax16, 1, 2);
> +
> +static inline void do_umax16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] > b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(umax16, 1, 2);
> +
> +static int64_t sat64(CPURISCVState *env, int64_t a, uint8_t shift)
> +{
> +    int64_t max = shift >= 64 ? INT64_MAX : (1ull << shift) - 1;
> +    int64_t min = shift >= 64 ? INT64_MIN : -(1ull << shift);
> +    int64_t result;
> +
> +    if (a > max) {
> +        result = max;
> +        env->vxsat = 0x1;
> +    } else if (a < min) {
> +        result = min;
> +        env->vxsat = 0x1;
> +    } else {
> +        result = a;
> +    }
> +    return result;
> +}
> +
> +static inline void do_sclip16(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +
> +    d[i] = sat64(env, a[i], shift);
> +}
> +
> +RVPR(sclip16, 1, 2);
> +
> +static uint64_t satu64(CPURISCVState *env, uint64_t a, uint8_t shift)
> +{
> +    uint64_t max = shift >= 64 ? UINT64_MAX : (1ull << shift) - 1;
> +    uint64_t result;
> +
> +    if (a > max) {
> +        result = max;
> +        env->vxsat = 0x1;
> +    } else {
> +        result = a;
> +    }
> +    return result;
> +}
> +
> +static inline void do_uclip16(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> +
> +    if (a[i] < 0) {
> +        d[i] = 0;
> +        env->vxsat = 0x1;
> +    } else {
> +        d[i] = satu64(env, a[i], shift);
> +    }
> +}
> +
> +RVPR(uclip16, 1, 2);
> +
> +typedef void PackedFn2i(CPURISCVState *, void *, void *, uint8_t);
> +
> +static inline target_ulong rvpr2(CPURISCVState *env, target_ulong a,
> +                                 uint8_t step, uint8_t size, PackedFn2i *fn)
> +{
> +    int i, passes = sizeof(target_ulong) / size;
> +    target_ulong result;
> +
> +    for (i = 0; i < passes; i += step) {
> +        fn(env, &result, &a, i);
> +    }
> +    return result;
> +}
> +
> +#define RVPR2(NAME, STEP, SIZE)                                  \
> +target_ulong HELPER(NAME)(CPURISCVState *env, target_ulong a)    \
> +{                                                                \
> +    return rvpr2(env, a, STEP, SIZE, (PackedFn2i *)do_##NAME);   \
> +}
> +
> +static inline void do_kabs16(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +
> +    if (a[i] == INT16_MIN) {
> +        d[i] = INT16_MAX;
> +        env->vxsat = 0x1;
> +    } else {
> +        d[i] = abs(a[i]);
> +    }
> +}
> +
> +RVPR2(kabs16, 1, 2);
> +
> +static inline void do_clrs16(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    d[i] = clrsb32(a[i]) - 16;
> +}
> +
> +RVPR2(clrs16, 1, 2);
> +
> +static inline void do_clz16(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    d[i] = (a[i] < 0) ? 0 : (clz32(a[i]) - 16);
> +}
> +
> +RVPR2(clz16, 1, 2);
> +
> +static inline void do_clo16(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    d[i] = (a[i] >= 0) ? 0 : (clo32(a[i]) - 16);
> +}
> +
> +RVPR2(clo16, 1, 2);
> +
> +static inline void do_swap16(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va;
> +    d[H2(i)] = a[H2(i + 1)];
> +    d[H2(i + 1)] = a[H2(i)];
> +}
> +
> +RVPR2(swap16, 2, 2);
> --
> 2.17.1
>

