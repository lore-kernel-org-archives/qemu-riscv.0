Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMAvd-0002yi-1Z
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 10:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMAvY-0002wd-Qv; Tue, 16 Mar 2021 10:44:09 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMAvU-0005Ny-GP; Tue, 16 Mar 2021 10:44:08 -0400
Received: by mail-il1-x12f.google.com with SMTP id s1so12850324ilh.12;
 Tue, 16 Mar 2021 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5i8j2acsOOSVB8OVbOJhw8QZMjBL27CzRfnZhRu94OY=;
 b=vR6eveM/kMtksIcUbqryrnXbWfvx4V2NerO6pqwPFjRuIp/yyW0bu+k08wEoaW/aHS
 xSalan7ZNplwkKuSxbbKXd7+nIUoY3GXy+pzdXLh4t0JaQrQ/Ce1QYHfxDAEc/qnoC04
 PdFCEHoXZ+6IYaToHL0KfD9xfOE3N4GxLgWlIpQUqSYfPLgl/O7mfT15kKW2zFj/kwm7
 5u/vZ4nx1SqNgCe+mzNX0hvywq98895Mj1K1yMbSThO4KmHs5vv62IW1sHbSvC2aJGlZ
 vjyXMEfJ1PkVgAoqcI7aoscAYmRVZVJcKRijVaJm9k1u9qn7w9E9uXYw1l6tCNB4vfex
 nRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5i8j2acsOOSVB8OVbOJhw8QZMjBL27CzRfnZhRu94OY=;
 b=GgugV/T+piY+m4U0CqDuJ2vS0TmJRsN94RleT+sq7hpNZCb3466jw9d5oHTAwfufe4
 FtgVwCiAFqCmdlRwoZbd2no6lMrPiUAD91kxzPtSrznIxeoKqJpvwwYhMSGV12Hg0Prb
 aBkOr3o4PU5FmnU7KZSMhSJCOOqzUG7noYjgYDgxDYvFUb4f5fyd2WSbFjgcLO2ZWTI8
 lcxejWAFogwXsKMmoZMisQUI3y45v4PCVSo8+DXGy7dt8zeHjoiCA8QyfLrrFf1OZ11x
 bmC8cpToWxTduEpqZIukJR3qDh1wfk0NwB6H7QGJgmYMjsVogiWNGGHFVuWSFHIPx/Nz
 eXig==
X-Gm-Message-State: AOAM532w0LFURWoQXqAbz4taPfyOL/Eiz4b4f3Er7kuMZr0Rj49MjbO2
 h9h3tSPeI9inuJJhIFjo0W0yex8SvY2lhS2BiiI=
X-Google-Smtp-Source: ABdhPJwt+sj2YRzliryMMMBPgEbGHQBd++BIN8fFrMu6aaUMEaX40nFpPYkq9hc/nWe01oh6Dc0djHV4JhB7V6/tTKY=
X-Received: by 2002:a05:6e02:f81:: with SMTP id
 v1mr3911046ilo.267.1615905842665; 
 Tue, 16 Mar 2021 07:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-16-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-16-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 10:42:26 -0400
Message-ID: <CAKmqyKOuB+qNWLPuQxjzXnb+X=cm_VTCzWgWwiV9bdsRMu-bSw@mail.gmail.com>
Subject: Re: [PATCH 15/38] target/riscv: 16-bit Packing Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 14:44:11 -0000

On Fri, Feb 12, 2021 at 10:34 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  5 +++
>  target/riscv/insn32.decode              |  5 +++
>  target/riscv/insn_trans/trans_rvp.c.inc |  9 +++++
>  target/riscv/packed_helper.c            | 45 +++++++++++++++++++++++++
>  4 files changed, 64 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 585905a689..4dc66cf4cc 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1263,3 +1263,8 @@ DEF_HELPER_2(zunpkd820, tl, env, tl)
>  DEF_HELPER_2(zunpkd830, tl, env, tl)
>  DEF_HELPER_2(zunpkd831, tl, env, tl)
>  DEF_HELPER_2(zunpkd832, tl, env, tl)
> +
> +DEF_HELPER_3(pkbb16, tl, env, tl, tl)
> +DEF_HELPER_3(pkbt16, tl, env, tl, tl)
> +DEF_HELPER_3(pktt16, tl, env, tl, tl)
> +DEF_HELPER_3(pktb16, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index fa4a02c9db..a4d9ff2282 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -731,3 +731,8 @@ zunpkd820  1010110  01101 ..... 000 ..... 1111111 @r2
>  zunpkd830  1010110  01110 ..... 000 ..... 1111111 @r2
>  zunpkd831  1010110  01111 ..... 000 ..... 1111111 @r2
>  zunpkd832  1010110  10111 ..... 000 ..... 1111111 @r2
> +
> +pkbb16     0000111  ..... ..... 001 ..... 1111111 @r
> +pkbt16     0001111  ..... ..... 001 ..... 1111111 @r
> +pktt16     0010111  ..... ..... 001 ..... 1111111 @r
> +pktb16     0011111  ..... ..... 001 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index b69e964cb4..99a19019eb 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -511,3 +511,12 @@ GEN_RVP_R2_OOL(zunpkd820);
>  GEN_RVP_R2_OOL(zunpkd830);
>  GEN_RVP_R2_OOL(zunpkd831);
>  GEN_RVP_R2_OOL(zunpkd832);
> +
> +/*
> + *** Partial-SIMD Data Processing Instruction
> + */
> +/* 16-bit Packing Instructions */
> +GEN_RVP_R_OOL(pkbb16);
> +GEN_RVP_R_OOL(pkbt16);
> +GEN_RVP_R_OOL(pktt16);
> +GEN_RVP_R_OOL(pktb16);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index d0dcb692f5..fe1b48c86d 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -1323,3 +1323,48 @@ do_zunpkd832(CPURISCVState *env, void *vd, void *va, uint8_t i)
>  }
>
>  RVPR2(zunpkd832, 4, 1);
> +
> +/*
> + *** Partial-SIMD Data Processing Instructions
> + */
> +
> +/* 16-bit Packing Instructions */
> +static inline void do_pkbb16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[H2(i + 1)] = a[H2(i)];
> +    d[H2(i)] = b[H2(i)];
> +}
> +
> +RVPR(pkbb16, 2, 2);
> +
> +static inline void do_pkbt16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[H2(i + 1)] = a[H2(i)];
> +    d[H2(i)] = b[H2(i + 1)];
> +}
> +
> +RVPR(pkbt16, 2, 2);
> +
> +static inline void do_pktt16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[H2(i + 1)] = a[H2(i + 1)];
> +    d[H2(i)] = b[H2(i + 1)];
> +}
> +
> +RVPR(pktt16, 2, 2);
> +
> +static inline void do_pktb16(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[H2(i + 1)] = a[H2(i + 1)];
> +    d[H2(i)] = b[H2(i)];
> +}
> +
> +RVPR(pktb16, 2, 2);
> --
> 2.17.1
>

