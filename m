Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLuha-0005k0-O6
	for mharc-qemu-riscv@gnu.org; Mon, 15 Mar 2021 17:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLuhZ-0005jq-MK; Mon, 15 Mar 2021 17:24:37 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLuhX-0004YY-Jo; Mon, 15 Mar 2021 17:24:37 -0400
Received: by mail-io1-xd2b.google.com with SMTP id m7so15936958iow.7;
 Mon, 15 Mar 2021 14:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uQjQWwOaqj9IyCOedOb3/WMuW35xsCUy54LzQs5v+bA=;
 b=XXzuYGwycvvjUkRA46RYZ8n7jh8ce901B7d9eZOkFXXv7CvFJNArOKn3Q09qFqmNcv
 DCLKG62dbYxZmpg5kN4ztvNW3wKubAfzSXW2hYQhLnQPtOXoD2jNtDNec5w3ZvweDKlZ
 07YCyzbDU4g3TVVsgslGcn4HZjrVRNAE3k3VjAtroxCHoxecTwkxxL/9I7YUbdQExk8C
 OvW8zYiGWSEDXlaQcMlL5KbsvC+TtmHHFjHpMu/+a+3TgI5I5qudPGdNQC0p0X5hXArd
 Yzy/E5+EuUxejFhSg3A1eXUhLZSkosOz8QQc8jdcQm+MKdZ7kAshzDaGyMHOV/XgpgXb
 LdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uQjQWwOaqj9IyCOedOb3/WMuW35xsCUy54LzQs5v+bA=;
 b=qfLsV8sG+6dlsxTG3YVeQjy79BVVoHGQbPJwwcrvFJVbPodceBQBp3SE7DV5cLdl8+
 Jzc2eXPc36maWlSBEYpKL6Oghy6T9FrQ+vkXzYjqGF4S28NSsiaE+otPovxHtfv2BRzB
 Bsh34HMPanpFXiWYsxdrYb19KbLavaGAldc68m9Ue/D/TO6KJvrCmlLrBn3lBVo/Jbug
 rZCuWXRz/2MftdvqnYInv02wm5bQ/9vt76+xEC9BWGEIIQsvfy4VrMfiNaBWpWF3Ge+d
 LJJb5RuAXHrhnx1D183WUm6cdDuNT1FDy4lh/RdEuENYUg0aazj/EBUOtvJowxiyDphW
 g64Q==
X-Gm-Message-State: AOAM533tSyhvrFKKdPRNZdBVTi21QUR6wdGXn1MTrSiNO4pwdUIQHd3A
 4r2pSYH6aKwnVcz3j16O3bhGC+DpDaLlYOMaBdc=
X-Google-Smtp-Source: ABdhPJyRpvRWJXF8apcrRAw+XvBGpLnhyRV22dH7nBcaUFhw57QGQHZEW8UBOalbfn7YR0jXvv3UlygQniuj07FVTIg=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr11321093jap.106.1615843473976; 
 Mon, 15 Mar 2021 14:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-6-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-6-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:22:58 -0400
Message-ID: <CAKmqyKO9UHGkfRdb8dEVHFaxCjGox3x+-g066nRc_vqc7wtVWQ@mail.gmail.com>
Subject: Re: [PATCH 05/38] target/riscv: 8-bit Addition & Subtraction
 Instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 15 Mar 2021 21:24:38 -0000

On Fri, Feb 12, 2021 at 10:14 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  9 +++
>  target/riscv/insn32.decode              | 11 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc | 79 +++++++++++++++++++++++++
>  target/riscv/packed_helper.c            | 73 +++++++++++++++++++++++
>  4 files changed, 172 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 6d622c732a..a69a6b4e84 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1175,3 +1175,12 @@ DEF_HELPER_3(rstsa16, tl, env, tl, tl)
>  DEF_HELPER_3(urstsa16, tl, env, tl, tl)
>  DEF_HELPER_3(kstsa16, tl, env, tl, tl)
>  DEF_HELPER_3(ukstsa16, tl, env, tl, tl)
> +
> +DEF_HELPER_3(radd8, tl, env, tl, tl)
> +DEF_HELPER_3(uradd8, tl, env, tl, tl)
> +DEF_HELPER_3(kadd8, tl, env, tl, tl)
> +DEF_HELPER_3(ukadd8, tl, env, tl, tl)
> +DEF_HELPER_3(rsub8, tl, env, tl, tl)
> +DEF_HELPER_3(ursub8, tl, env, tl, tl)
> +DEF_HELPER_3(ksub8, tl, env, tl, tl)
> +DEF_HELPER_3(uksub8, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 8815e90476..358dd1fa10 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -624,3 +624,14 @@ rstsa16    1011011  ..... ..... 010 ..... 1111111 @r
>  urstsa16   1101011  ..... ..... 010 ..... 1111111 @r
>  kstsa16    1100011  ..... ..... 010 ..... 1111111 @r
>  ukstsa16   1110011  ..... ..... 010 ..... 1111111 @r
> +
> +add8       0100100  ..... ..... 000 ..... 1111111 @r
> +radd8      0000100  ..... ..... 000 ..... 1111111 @r
> +uradd8     0010100  ..... ..... 000 ..... 1111111 @r
> +kadd8      0001100  ..... ..... 000 ..... 1111111 @r
> +ukadd8     0011100  ..... ..... 000 ..... 1111111 @r
> +sub8       0100101  ..... ..... 000 ..... 1111111 @r
> +rsub8      0000101  ..... ..... 000 ..... 1111111 @r
> +ursub8     0010101  ..... ..... 000 ..... 1111111 @r
> +ksub8      0001101  ..... ..... 000 ..... 1111111 @r
> +uksub8     0011101  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 0885a4fd45..109f560ec9 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -159,3 +159,82 @@ GEN_RVP_R_OOL(rstsa16);
>  GEN_RVP_R_OOL(urstsa16);
>  GEN_RVP_R_OOL(kstsa16);
>  GEN_RVP_R_OOL(ukstsa16);
> +
> +/* 8-bit Addition & Subtraction Instructions */
> +/*
> + *  Copied from tcg-op-gvec.c.
> + *
> + *  Perform a vector addition using normal addition and a mask.  The mask
> + *  should be the sign bit of each lane.  This 6-operation form is more
> + *  efficient than separate additions when there are 4 or more lanes in
> + *  the 64-bit operation.
> + */
> +
> +static void gen_simd_add_mask(TCGv d, TCGv a, TCGv b, TCGv m)
> +{
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +    TCGv t3 = tcg_temp_new();
> +
> +    tcg_gen_andc_tl(t1, a, m);
> +    tcg_gen_andc_tl(t2, b, m);
> +    tcg_gen_xor_tl(t3, a, b);
> +    tcg_gen_add_tl(d, t1, t2);
> +    tcg_gen_and_tl(t3, t3, m);
> +    tcg_gen_xor_tl(d, d, t3);
> +
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +    tcg_temp_free(t3);
> +}
> +
> +static void tcg_gen_simd_add8(TCGv d, TCGv a, TCGv b)
> +{
> +    TCGv m = tcg_const_tl((target_ulong)dup_const(MO_8, 0x80));
> +    gen_simd_add_mask(d, a, b, m);
> +    tcg_temp_free(m);
> +}
> +
> +GEN_RVP_R_INLINE(add8, add, 0, trans_add);
> +
> +/*
> + *  Copied from tcg-op-gvec.c.
> + *
> + *  Perform a vector subtraction using normal subtraction and a mask.
> + *  Compare gen_addv_mask above.
> + */
> +static void gen_simd_sub_mask(TCGv d, TCGv a, TCGv b, TCGv m)
> +{
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +    TCGv t3 = tcg_temp_new();
> +
> +    tcg_gen_or_tl(t1, a, m);
> +    tcg_gen_andc_tl(t2, b, m);
> +    tcg_gen_eqv_tl(t3, a, b);
> +    tcg_gen_sub_tl(d, t1, t2);
> +    tcg_gen_and_tl(t3, t3, m);
> +    tcg_gen_xor_tl(d, d, t3);
> +
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +    tcg_temp_free(t3);
> +}
> +
> +static void tcg_gen_simd_sub8(TCGv d, TCGv a, TCGv b)
> +{
> +    TCGv m = tcg_const_tl((target_ulong)dup_const(MO_8, 0x80));
> +    gen_simd_sub_mask(d, a, b, m);
> +    tcg_temp_free(m);
> +}
> +
> +GEN_RVP_R_INLINE(sub8, sub, 0, trans_sub);
> +
> +GEN_RVP_R_OOL(radd8);
> +GEN_RVP_R_OOL(uradd8);
> +GEN_RVP_R_OOL(kadd8);
> +GEN_RVP_R_OOL(ukadd8);
> +GEN_RVP_R_OOL(rsub8);
> +GEN_RVP_R_OOL(ursub8);
> +GEN_RVP_R_OOL(ksub8);
> +GEN_RVP_R_OOL(uksub8);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index b84abaaf25..62db072204 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -352,3 +352,76 @@ static inline void do_ukstsa16(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(ukstsa16, 2, 2);
> +
> +/* 8-bit Addition & Subtraction Instructions */
> +static inline void do_radd8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    d[i] = hadd32(a[i], b[i]);
> +}
> +
> +RVPR(radd8, 1, 1);
> +
> +static inline void do_uradd8(CPURISCVState *env, void *vd, void *va,
> +                                  void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = haddu32(a[i], b[i]);
> +}
> +
> +RVPR(uradd8, 1, 1);
> +
> +static inline void do_kadd8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    d[i] = sadd8(env, 0, a[i], b[i]);
> +}
> +
> +RVPR(kadd8, 1, 1);
> +
> +static inline void do_ukadd8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = saddu8(env, 0, a[i], b[i]);
> +}
> +
> +RVPR(ukadd8, 1, 1);
> +
> +static inline void do_rsub8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    d[i] = hsub32(a[i], b[i]);
> +}
> +
> +RVPR(rsub8, 1, 1);
> +
> +static inline void do_ursub8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = hsubu64(a[i], b[i]);
> +}
> +
> +RVPR(ursub8, 1, 1);
> +
> +static inline void do_ksub8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    d[i] = ssub8(env, 0, a[i], b[i]);
> +}
> +
> +RVPR(ksub8, 1, 1);
> +
> +static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +    d[i] = ssubu8(env, 0, a[i], b[i]);
> +}
> +
> +RVPR(uksub8, 1, 1);
> --
> 2.17.1
>

