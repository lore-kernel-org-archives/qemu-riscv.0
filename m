Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMArM-0005F1-Hg
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 10:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMArL-0005Bh-6m; Tue, 16 Mar 2021 10:39:47 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMArJ-0002xt-6P; Tue, 16 Mar 2021 10:39:46 -0400
Received: by mail-io1-xd29.google.com with SMTP id m7so18341311iow.7;
 Tue, 16 Mar 2021 07:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7zzef6+8CgBZ96QFWYoXcjdnfYUS1We6Z3Bmcc22rM=;
 b=Nmea9YfzscEbiwHfR+SQIOwg8c3RCZzY/CLcigI9VLqAoOufCMwMwSYwFW7W444V8J
 Jy1sXVAtpaYtLsF8EBUSQQa79b/WbLqx4UGt7eC6UELYjExoCa7etazENV0ZDcohPndf
 z3AQD6ZZb9gDn3rQtUYsjJIAnmQ+EFBJMy+3UkLygG0tVtpfN/CooVkU3CbXLWMYQplW
 x2gHnZekTf871pMz0DwTwClOYyGFQ7fKKz/jfRxGtmGe7PFlgcwGgxt9rNBExNO6op27
 3SRnrEXAPOEhEfo6lYxKMnJHjUi6UHCJxzQTG7x4szkaQ4vnD3iAkGeuPREfKGwSdHZs
 dHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7zzef6+8CgBZ96QFWYoXcjdnfYUS1We6Z3Bmcc22rM=;
 b=Tc8cMeckccOTZaYEX2zS+CXvOMzwAgynIARYWZUlnUQ0nKHj5rGNuoHWRWCXVaTJgu
 qUTo3pQjNB//yUPdQo0nzd3gH+6V5Gx/A2rsRheeqDe5XNkgXcMf4ZJOJMLywudBaYDg
 bG9Ni8KD2ef4N9xXu3NZGnLbERNUwC+PO8wajyGKRMzMx6stKRqGCZIqn0OHWUqnmxYS
 IRJjHaukxdwEoUSQO1FrEd0GBEpIbO/N+zaNgaGrBOYhfyv/piByCYbtWkHXXjzcBxgr
 Md+nqqFSsJKGpyC659zqE5VFakSC5/09WR10wyrJ2y0N+2enfN3ARbsAivgSAVadSbvU
 xkKw==
X-Gm-Message-State: AOAM5337Fl9lohW+rRH7TgFggBpjBXkj/e3ZfAE+laDv8fNCpel3dYEJ
 FYYSzndHJGFZzCl8mYANQq3edr0JYePcq3LCDnk=
X-Google-Smtp-Source: ABdhPJzNacMx7NHmgBTMfnGNiYUvr6vx2lqpmrxrNKVRbDQUs8sapqgOz4ciXNNPK/iRuwkho2j5xizfT5PnPBjCyPo=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr14729520jah.8.1615905583378; 
 Tue, 16 Mar 2021 07:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-14-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-14-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 10:38:06 -0400
Message-ID: <CAKmqyKP69ixzifGhxHmB03twB_1=hFD9QT1hs4fj1JUELCznXQ@mail.gmail.com>
Subject: Re: [PATCH 13/38] target/riscv: SIMD 8-bit Miscellaneous Instructions
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
X-List-Received-Date: Tue, 16 Mar 2021 14:39:47 -0000

On Fri, Feb 12, 2021 at 10:30 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  12 +++
>  target/riscv/insn32.decode              |  12 +++
>  target/riscv/insn_trans/trans_rvp.c.inc |  13 +++
>  target/riscv/packed_helper.c            | 115 ++++++++++++++++++++++++
>  4 files changed, 152 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 866484e37d..83778b532a 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1240,3 +1240,15 @@ DEF_HELPER_2(clrs16, tl, env, tl)
>  DEF_HELPER_2(clz16, tl, env, tl)
>  DEF_HELPER_2(clo16, tl, env, tl)
>  DEF_HELPER_2(swap16, tl, env, tl)
> +
> +DEF_HELPER_3(smin8, tl, env, tl, tl)
> +DEF_HELPER_3(umin8, tl, env, tl, tl)
> +DEF_HELPER_3(smax8, tl, env, tl, tl)
> +DEF_HELPER_3(umax8, tl, env, tl, tl)
> +DEF_HELPER_3(sclip8, tl, env, tl, tl)
> +DEF_HELPER_3(uclip8, tl, env, tl, tl)
> +DEF_HELPER_2(kabs8, tl, env, tl)
> +DEF_HELPER_2(clrs8, tl, env, tl)
> +DEF_HELPER_2(clz8, tl, env, tl)
> +DEF_HELPER_2(clo8, tl, env, tl)
> +DEF_HELPER_2(swap8, tl, env, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index bc9d5fc967..e158066353 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -708,3 +708,15 @@ clrs16     1010111  01000 ..... 000 ..... 1111111 @r2
>  clz16      1010111  01001 ..... 000 ..... 1111111 @r2
>  clo16      1010111  01011 ..... 000 ..... 1111111 @r2
>  swap16     1010110  11001 ..... 000 ..... 1111111 @r2
> +
> +smin8      1000100  ..... ..... 000 ..... 1111111 @r
> +umin8      1001100  ..... ..... 000 ..... 1111111 @r
> +smax8      1000101  ..... ..... 000 ..... 1111111 @r
> +umax8      1001101  ..... ..... 000 ..... 1111111 @r
> +sclip8     1000110  00... ..... 000 ..... 1111111 @sh3
> +uclip8     1000110  10... ..... 000 ..... 1111111 @sh3
> +kabs8      1010110  10000 ..... 000 ..... 1111111 @r2
> +clrs8      1010111  00000 ..... 000 ..... 1111111 @r2
> +clz8       1010111  00001 ..... 000 ..... 1111111 @r2
> +clo8       1010111  00011 ..... 000 ..... 1111111 @r2
> +swap8      1010110  11000 ..... 000 ..... 1111111 @r2
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 56fb8b2523..5ad057d7ac 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -486,3 +486,16 @@ GEN_RVP_R2_OOL(clrs16);
>  GEN_RVP_R2_OOL(clz16);
>  GEN_RVP_R2_OOL(clo16);
>  GEN_RVP_R2_OOL(swap16);
> +
> +/* SIMD 8-bit Miscellaneous Instructions */
> +GEN_RVP_R_OOL(smin8);
> +GEN_RVP_R_OOL(umin8);
> +GEN_RVP_R_OOL(smax8);
> +GEN_RVP_R_OOL(umax8);
> +GEN_RVP_SHIFTI(sclip8, sclip8, NULL);
> +GEN_RVP_SHIFTI(uclip8, uclip8, NULL);
> +GEN_RVP_R2_OOL(kabs8);
> +GEN_RVP_R2_OOL(clrs8);
> +GEN_RVP_R2_OOL(clz8);
> +GEN_RVP_R2_OOL(clo8);
> +GEN_RVP_R2_OOL(swap8);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index a6ab011ace..be91d308e5 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -1087,3 +1087,118 @@ static inline void do_swap16(CPURISCVState *env, void *vd, void *va, uint8_t i)
>  }
>
>  RVPR2(swap16, 2, 2);
> +
> +/* SIMD 8-bit Miscellaneous Instructions */
> +static inline void do_smin8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] < b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(smin8, 1, 1);
> +
> +static inline void do_umin8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] < b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(umin8, 1, 1);
> +
> +static inline void do_smax8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] > b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(smax8, 1, 1);
> +
> +static inline void do_umax8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va, *b = vb;
> +
> +    d[i] = (a[i] > b[i]) ? a[i] : b[i];
> +}
> +
> +RVPR(umax8, 1, 1);
> +
> +static inline void do_sclip8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +
> +    d[i] = sat64(env, a[i], shift);
> +}
> +
> +RVPR(sclip8, 1, 1);
> +
> +static inline void do_uclip8(CPURISCVState *env, void *vd, void *va,
> +                              void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +
> +    if (a[i] < 0) {
> +        d[i] = 0;
> +        env->vxsat = 0x1;
> +    } else {
> +        d[i] = satu64(env, a[i], shift);
> +    }
> +}
> +
> +RVPR(uclip8, 1, 1);
> +
> +static inline void do_kabs8(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +
> +    if (a[i] == INT8_MIN) {
> +        d[i] = INT8_MAX;
> +        env->vxsat = 0x1;
> +    } else {
> +        d[i] = abs(a[i]);
> +    }
> +}
> +
> +RVPR2(kabs8, 1, 1);
> +
> +static inline void do_clrs8(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    d[i] = clrsb32(a[i]) - 24;
> +}
> +
> +RVPR2(clrs8, 1, 1);
> +
> +static inline void do_clz8(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    d[i] = (a[i] < 0) ? 0 : (clz32(a[i]) - 24);
> +}
> +
> +RVPR2(clz8, 1, 1);
> +
> +static inline void do_clo8(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    d[i] = (a[i] >= 0) ? 0 : (clo32(a[i]) - 24);
> +}
> +
> +RVPR2(clo8, 1, 1);
> +
> +static inline void do_swap8(CPURISCVState *env, void *vd, void *va, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    d[H1(i)] = a[H1(i + 1)];
> +    d[H1(i + 1)] = a[H1(i)];
> +}
> +
> +RVPR2(swap8, 2, 1);
> --
> 2.17.1
>

