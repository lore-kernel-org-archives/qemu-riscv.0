Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLurs-0006BI-9J
	for mharc-qemu-riscv@gnu.org; Mon, 15 Mar 2021 17:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLurp-00066b-HE; Mon, 15 Mar 2021 17:35:13 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLurn-00010t-Ki; Mon, 15 Mar 2021 17:35:13 -0400
Received: by mail-il1-x12c.google.com with SMTP id e7so10781598ile.7;
 Mon, 15 Mar 2021 14:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/c2z/RwMNO3+Vl7RwZuM+Pcx8Tmi4kDxh6VGrOHD9VQ=;
 b=cUFHG9Q2Eu78r3NuApvkmqPu9Nb4/6dpTlzZKED5/+ZYpBKAroByrmIeSHI7CqHLmZ
 NB7vZEhPp3Eosf8HDuZdGuIQRP/NwZJxYy1cO/V16pdVXItNnvLDQ1Gmutk5ZehDLkwJ
 EQn4JIx1jAY8dom+ob7crD9iXX3t5r3W4DoSqLxWUhJOqtYAGEpI0706sjNtByTbJDOw
 5hcILLv4hJCOaknji1W5MIfeyLBKJ1VN1ky5tEmN7oTUbr5821u8lYWuq1/6bVqC12fA
 k8gdulRLT0zOLuIfcEbIc9/n1KnC7o/q5TLBnSXaddGAxKYvw+HTk6tB/VlsN8/lEBqr
 3zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/c2z/RwMNO3+Vl7RwZuM+Pcx8Tmi4kDxh6VGrOHD9VQ=;
 b=SCkAmyp3ZdE5B7gfDmC7aKyTHrsPRQiPA2isWfbC02d0W/zn21PicIjLCTc+4nzNGO
 srZwq/+81f7Mh8N3JgkRtgY1uHPQAE+5CSRxd5Aa3vjijr5VJJt7OGi+A9w02LGGPY+u
 uz21a7cgukA8A31rPQ1t+QfHEsMvgCs1d2Cgz9lwtFO2c+lKBSTvO5yQ/jGkneG10thY
 ExuEFmjemtR8A4tdX0fN9Kff5vcoQkjAtGAHRII4G/c+6GcdSOsrE8XFrw+k5sWLtw3t
 IVtt4KxkOKhZCA1bMhMBJ0uVscJ+uDzuEUVqEY6LDm9qN1VxZ/AbNFQjsk+e+6cIJKo9
 xt2Q==
X-Gm-Message-State: AOAM533Hda3G7HQrW3CbwZL5qRhF3ySvtSfQ2zRbMU6y0jCvBMatQICf
 CqIuNKBneElfvskGXxThfxDxmQY2ofQDzOatfcc=
X-Google-Smtp-Source: ABdhPJw+o9WwG4njqLNtAjb5g4sUTcFl/1yDENAoDCz9rIKzgb+wZuU3P8q4IiZmFMqsAFhEknEuSMV8f6o0904Vepc=
X-Received: by 2002:a05:6e02:1748:: with SMTP id
 y8mr1250998ill.131.1615844110132; 
 Mon, 15 Mar 2021 14:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-12-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-12-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:33:33 -0400
Message-ID: <CAKmqyKPhpG3xuxeigYWFDYq75NRcZooaGiH-6RroBZYFm90U4g@mail.gmail.com>
Subject: Re: [PATCH 11/38] target/riscv: SIMD 8-bit Multiply Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 15 Mar 2021 21:35:14 -0000

On Fri, Feb 12, 2021 at 10:26 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  7 ++
>  target/riscv/insn32.decode              |  7 ++
>  target/riscv/insn_trans/trans_rvp.c.inc |  8 +++
>  target/riscv/packed_helper.c            | 93 +++++++++++++++++++++++++
>  4 files changed, 115 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index bc60712bd9..6bb601b436 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1221,3 +1221,10 @@ DEF_HELPER_3(umul16, i64, env, tl, tl)
>  DEF_HELPER_3(umulx16, i64, env, tl, tl)
>  DEF_HELPER_3(khm16, tl, env, tl, tl)
>  DEF_HELPER_3(khmx16, tl, env, tl, tl)
> +
> +DEF_HELPER_3(smul8, i64, env, tl, tl)
> +DEF_HELPER_3(smulx8, i64, env, tl, tl)
> +DEF_HELPER_3(umul8, i64, env, tl, tl)
> +DEF_HELPER_3(umulx8, i64, env, tl, tl)
> +DEF_HELPER_3(khm8, tl, env, tl, tl)
> +DEF_HELPER_3(khmx8, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 38519a477c..9d165efba9 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -688,3 +688,10 @@ umul16     1011000  ..... ..... 000 ..... 1111111 @r
>  umulx16    1011001  ..... ..... 000 ..... 1111111 @r
>  khm16      1000011  ..... ..... 000 ..... 1111111 @r
>  khmx16     1001011  ..... ..... 000 ..... 1111111 @r
> +
> +smul8      1010100  ..... ..... 000 ..... 1111111 @r
> +smulx8     1010101  ..... ..... 000 ..... 1111111 @r
> +umul8      1011100  ..... ..... 000 ..... 1111111 @r
> +umulx8     1011101  ..... ..... 000 ..... 1111111 @r
> +khm8       1000111  ..... ..... 000 ..... 1111111 @r
> +khmx8      1001111  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 7e5bf9041d..336f3418b1 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -436,3 +436,11 @@ GEN_RVP_R_D64_OOL(umul16);
>  GEN_RVP_R_D64_OOL(umulx16);
>  GEN_RVP_R_OOL(khm16);
>  GEN_RVP_R_OOL(khmx16);
> +
> +/* SIMD 8-bit Multiply Instructions */
> +GEN_RVP_R_D64_OOL(smul8);
> +GEN_RVP_R_D64_OOL(smulx8);
> +GEN_RVP_R_D64_OOL(umul8);
> +GEN_RVP_R_D64_OOL(umulx8);
> +GEN_RVP_R_OOL(khm8);
> +GEN_RVP_R_OOL(khmx8);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 13fed2c4d1..56baefeb8e 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -827,3 +827,96 @@ static inline void do_khmx16(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(khmx16, 2, 2);
> +
> +/* SIMD 8-bit Multiply Instructions */
> +static inline void do_smul8(CPURISCVState *env, void *vd, void *va, void *vb)
> +{
> +    int16_t *d = vd;
> +    int8_t *a = va, *b = vb;
> +    d[H2(0)] = (int16_t)a[H1(0)] * b[H1(0)];
> +    d[H2(1)] = (int16_t)a[H1(1)] * b[H1(1)];
> +    d[H2(2)] = (int16_t)a[H1(2)] * b[H1(2)];
> +    d[H2(3)] = (int16_t)a[H1(3)] * b[H1(3)];
> +}
> +
> +RVPR64(smul8);
> +
> +static inline void do_smulx8(CPURISCVState *env, void *vd, void *va, void *vb)
> +{
> +    int16_t *d = vd;
> +    int8_t *a = va, *b = vb;
> +    d[H2(0)] = (int16_t)a[H1(0)] * b[H1(1)];
> +    d[H2(1)] = (int16_t)a[H1(1)] * b[H1(0)];
> +    d[H2(2)] = (int16_t)a[H1(2)] * b[H1(3)];
> +    d[H2(3)] = (int16_t)a[H1(3)] * b[H1(2)];
> +}
> +
> +RVPR64(smulx8);
> +
> +static inline void do_umul8(CPURISCVState *env, void *vd, void *va, void *vb)
> +{
> +    uint16_t *d = vd;
> +    uint8_t *a = va, *b = vb;
> +    d[H2(0)] = (uint16_t)a[H1(0)] * b[H1(0)];
> +    d[H2(1)] = (uint16_t)a[H1(1)] * b[H1(1)];
> +    d[H2(2)] = (uint16_t)a[H1(2)] * b[H1(2)];
> +    d[H2(3)] = (uint16_t)a[H1(3)] * b[H1(3)];
> +}
> +
> +RVPR64(umul8);
> +
> +static inline void do_umulx8(CPURISCVState *env, void *vd, void *va, void *vb)
> +{
> +    uint16_t *d = vd;
> +    uint8_t *a = va, *b = vb;
> +    d[H2(0)] = (uint16_t)a[H1(0)] * b[H1(1)];
> +    d[H2(1)] = (uint16_t)a[H1(1)] * b[H1(0)];
> +    d[H2(2)] = (uint16_t)a[H1(2)] * b[H1(3)];
> +    d[H2(3)] = (uint16_t)a[H1(3)] * b[H1(2)];
> +}
> +
> +RVPR64(umulx8);
> +
> +static inline void do_khm8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +
> +    if (a[i] == INT8_MIN && b[i] == INT8_MIN) {
> +        env->vxsat = 1;
> +        d[i] = INT8_MAX;
> +    } else {
> +        d[i] = (int16_t)a[i] * b[i] >> 7;
> +    }
> +}
> +
> +RVPR(khm8, 1, 1);
> +
> +static inline void do_khmx8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +    /*
> +     * t[x] = ra.B[x] s* rb.B[y];
> +     * rt.B[x] = SAT.Q7(t[x] s>> 7);
> +     *
> +     * (RV32: (x,y)=(3,2),(2,3),
> +     *              (1,0),(0,1),
> +     * (RV64: (x,y)=(7,6),(6,7),(5,4),(4,5),
> +     *              (3,2),(2,3),(1,0),(0,1))
> +     */
> +    if (a[H1(i)] == INT8_MIN && b[H1(i + 1)] == INT8_MIN) {
> +        env->vxsat = 1;
> +        d[H1(i)] = INT8_MAX;
> +    } else {
> +        d[H1(i)] = (int16_t)a[H1(i)] * b[H1(i + 1)] >> 7;
> +    }
> +    if (a[H1(i + 1)] == INT8_MIN && b[H1(i)] == INT8_MIN) {
> +        env->vxsat = 1;
> +        d[H1(i + 1)] = INT8_MAX;
> +    } else {
> +        d[H1(i + 1)] = (int16_t)a[H1(i + 1)] * b[H1(i)] >> 7;
> +    }
> +}
> +
> +RVPR(khmx8, 2, 1);
> --
> 2.17.1
>

