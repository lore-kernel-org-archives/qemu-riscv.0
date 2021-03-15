Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLumc-000275-HT
	for mharc-qemu-riscv@gnu.org; Mon, 15 Mar 2021 17:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLuma-00024d-5j; Mon, 15 Mar 2021 17:29:48 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLumW-0006sl-P5; Mon, 15 Mar 2021 17:29:47 -0400
Received: by mail-io1-xd2b.google.com with SMTP id o11so35066868iob.1;
 Mon, 15 Mar 2021 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i2UonqqRAoR5WRWUc/te/zir+4jCd3JoWY9eP/cWwAQ=;
 b=cOsAGyI6LKKvNon05gGbnzTpzVvNwORJxNhCM7VxK108ftEagIFBxvRkP9//NkWB0/
 RDrJVFN70EC1FoF3aviZNRd3XZUy+BQ2g6H8BdwhjhBs+dpbphHK0ywCiFK9yZECc5zb
 3+r1WI90qf8lEC/Z9Ld7xGea0PCaFWFZol2uzkuvlBdQJxZlmbHONsgtuEayQF8Bj7t5
 lxZ+YtYJD7fmtNysaJn0KAxQ5GfaiDmu8rrV6lM6c1ZPMxPCpINbywjHbi93Wz2ghBBE
 IHAfpeKNCFDdE7t6f4+tv2pvt5JNix49b9+xwzi9zjXEA5y619qpij4EIHCeK5L77u/c
 e7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2UonqqRAoR5WRWUc/te/zir+4jCd3JoWY9eP/cWwAQ=;
 b=r8nUAjL09CQytbNDm609hOO+4y+2dRPqLhBxL5Sz1HBPm8t5wHztCye15BkGa6BhMz
 5zEvSiISofJTH9rWU6Qz21H/t7cm8Tp7/jk5DNUuPwyfDuC+K+KFMDnkQpUES24nX53z
 rv4qlslISrCdJDw2EVWu6/f9E5B7wW5P9dGdafWsoKbW88JojpQlrB/jsVQYcBJt6SYr
 kCwTwyVpI6YAwggVo0EOFd5evfQhKaAP3EN3xiRPmSpjN2YTpQ2ijWlHPfMJl8xfyhXl
 +ddJ7y1H7TO4Pr2ywA7/e/eKcK3GJNT3csEkPYmccUZYN5u1NndInftgtb/BVPCcBpO5
 4VJA==
X-Gm-Message-State: AOAM5329BHbztjpY0LyRAAt7RzzJmwoDAvRArl2YTnIL+gAO77PGzL8X
 NyEEUVOh/t+pzOP5mjy2wmy2L/DJivCzUogAcds=
X-Google-Smtp-Source: ABdhPJwnFMrQCxFrrute12kS/S4DEMLZ/OJJOBJnPB0xIggTjvaJ4XugLN2hKBR7uXqeXK8Vsxnn+gMDSnDJNVZUZ/w=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr11673008jah.8.1615843783228; 
 Mon, 15 Mar 2021 14:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-9-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-9-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:28:07 -0400
Message-ID: <CAKmqyKO5zA=DOJMWOf9zP30jNRTAfLggwvi2vzV4xP8_rWHWNw@mail.gmail.com>
Subject: Re: [PATCH 08/38] target/riscv: SIMD 16-bit Compare Instructions
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
X-List-Received-Date: Mon, 15 Mar 2021 21:29:48 -0000

On Fri, Feb 12, 2021 at 10:20 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  6 ++++
>  target/riscv/insn32.decode              |  6 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  7 ++++
>  target/riscv/packed_helper.c            | 46 +++++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 0ecd4d53f9..f41f9acccc 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1202,3 +1202,9 @@ DEF_HELPER_3(sll8, tl, env, tl, tl)
>  DEF_HELPER_3(ksll8, tl, env, tl, tl)
>  DEF_HELPER_3(kslra8, tl, env, tl, tl)
>  DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
> +
> +DEF_HELPER_3(cmpeq16, tl, env, tl, tl)
> +DEF_HELPER_3(scmplt16, tl, env, tl, tl)
> +DEF_HELPER_3(scmple16, tl, env, tl, tl)
> +DEF_HELPER_3(ucmplt16, tl, env, tl, tl)
> +DEF_HELPER_3(ucmple16, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index cc782fcde5..f3cd508396 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -669,3 +669,9 @@ ksll8      0110110  ..... ..... 000 ..... 1111111 @r
>  kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
>  kslra8     0101111  ..... ..... 000 ..... 1111111 @r
>  kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
> +
> +cmpeq16    0100110  ..... ..... 000 ..... 1111111 @r
> +scmplt16   0000110  ..... ..... 000 ..... 1111111 @r
> +scmple16   0001110  ..... ..... 000 ..... 1111111 @r
> +ucmplt16   0010110  ..... ..... 000 ..... 1111111 @r
> +ucmple16   0011110  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 12a64849eb..6438dfb776 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -369,3 +369,10 @@ GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
>  GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
>  GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
>  GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
> +
> +/* SIMD 16-bit Compare Instructions */
> +GEN_RVP_R_OOL(cmpeq16);
> +GEN_RVP_R_OOL(scmplt16);
> +GEN_RVP_R_OOL(scmple16);
> +GEN_RVP_R_OOL(ucmplt16);
> +GEN_RVP_R_OOL(ucmple16);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index ab9ebc472b..30b916b5ad 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -631,3 +631,49 @@ static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(kslra8_u, 1, 1);
> +
> +/* SIMD 16-bit Compare Instructions */
> +static inline void do_cmpeq16(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] == b[i]) ? 0xffff : 0x0;
> +}
> +
> +RVPR(cmpeq16, 1, 2);
> +
> +static inline void do_scmplt16(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] < b[i]) ? 0xffff : 0x0;
> +}
> +
> +RVPR(scmplt16, 1, 2);
> +
> +static inline void do_scmple16(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int16_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] <= b[i]) ? 0xffff : 0x0;
> +}
> +
> +RVPR(scmple16, 1, 2);
> +
> +static inline void do_ucmplt16(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] < b[i]) ? 0xffff : 0x0;
> +}
> +
> +RVPR(ucmplt16, 1, 2);
> +
> +static inline void do_ucmple16(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    uint16_t *d = vd, *a = va, *b = vb;
> +    d[i] = (a[i] <= b[i]) ? 0xffff : 0x0;
> +}
> +
> +RVPR(ucmple16, 1, 2);
> --
> 2.17.1
>

