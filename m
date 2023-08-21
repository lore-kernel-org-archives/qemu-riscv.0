Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C33EE4993
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 19:05:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYACg-00025M-2J; Mon, 21 Aug 2023 15:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYACd-00024l-8x; Mon, 21 Aug 2023 15:04:39 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYACa-0006jc-Pv; Mon, 21 Aug 2023 15:04:39 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-78a5384a5daso858312241.0; 
 Mon, 21 Aug 2023 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692644675; x=1693249475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=803YHqPe30JU0oVx2FoHvlXUChYTLMQVDnX0jiLNOH4=;
 b=MKYe8Qrgd4842de/ZU0x0CcpBgo0wwjmgJCWh5v1lzvHEm6c1qaSOFuTB4OR541rbc
 mrwwRWQquDaVQUHTFgfwwEyGPSuc4nBkrzKGBj7HSvKiom8NULx6L/nZEGZsg9G9DEBi
 ccWHf5SKftZ++HwbP5Nlv919TO/TtT74Vk8DBx/d/oAGL7fYdQUekidGTZQ62lqK122l
 9Ek8JXObjVQrfVhHQZBgZ04MvunaYMdzyT/FQ1rKx6CcqQuaL1g0lglP+z3rf3tGb2i+
 V4LT0U4mAwRyfnWMttxh9B8iDS2UEVd2x8WyFoithz54+PXO6nWbQs53L8yeAJXPBwWV
 occA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692644675; x=1693249475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=803YHqPe30JU0oVx2FoHvlXUChYTLMQVDnX0jiLNOH4=;
 b=G++9igLeIHH6L2jvgYVhg2qBCxLT2FGGuKPY44SS269bz7Ve0VpN12LXitOF0mCFvb
 Pkr2Bph7MaSn8iSF+G2abB3yczwgd0395B4xDbxKJ6SC+52Oyn41UeDQGEn3Seq6hKu6
 UB6Rn6EjPMrAdarUhPj+gZT9UIEuzB2vjB5Zt/wGu7FQePVcFzRi82ksByNjy1Iv41Ew
 L6+0PFEuAfAsjP49rPjH2k1v1ktrCn77Vyw9ALPm6k62BkmhLOJGX7SILyOSqEVjkeeI
 I0tDwDSqXhncUvexVH2zx0QHYjusYLexFmifimIQWoZCbPtmG6m/yKeDgBpGirHUZpAs
 DEHQ==
X-Gm-Message-State: AOJu0Yzz+YZfjiLGGq8AC/msZQvUVwBzZVmK6w84vN2mSq9bBYCj2Hd+
 6ReqvkWS1ct00rVxip2YdrLNO9hnjrobUJxBySY=
X-Google-Smtp-Source: AGHT+IHFAUQgRvTgOC09VjglQ8HiWJGYjl0Am+PexC0pNkMUx2ngXu4cj6B2iVEgXxo75/Z0UTg8qUzvc3UoAQw0itQ=
X-Received: by 2002:a05:6102:34d2:b0:443:7572:598b with SMTP id
 a18-20020a05610234d200b004437572598bmr3163848vst.13.1692644674968; Mon, 21
 Aug 2023 12:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230816141916.66898-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230816141916.66898-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Aug 2023 15:04:09 -0400
Message-ID: <CAKmqyKMjzz4KyouTgOUAW2p=8syA-0aDpNibjJgLJCm21ZdOTw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Update CSR bits name for svadu extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Aug 16, 2023 at 10:20=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> The Svadu specification updated the name of the *envcfg bit from
> HADE to ADUE.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> v2:
> * rename hade variable name to adue suggested by Daniel
>
>  target/riscv/cpu.c        |  4 ++--
>  target/riscv/cpu_bits.h   |  8 ++++----
>  target/riscv/cpu_helper.c |  6 +++---
>  target/riscv/csr.c        | 12 ++++++------
>  4 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..f04a985d55 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -875,9 +875,9 @@ static void riscv_cpu_reset_hold(Object *obj)
>      env->two_stage_lookup =3D false;
>
>      env->menvcfg =3D (cpu->cfg.ext_svpbmt ? MENVCFG_PBMTE : 0) |
> -                   (cpu->cfg.ext_svadu ? MENVCFG_HADE : 0);
> +                   (cpu->cfg.ext_svadu ? MENVCFG_ADUE : 0);
>      env->henvcfg =3D (cpu->cfg.ext_svpbmt ? HENVCFG_PBMTE : 0) |
> -                   (cpu->cfg.ext_svadu ? HENVCFG_HADE : 0);
> +                   (cpu->cfg.ext_svadu ? HENVCFG_ADUE : 0);
>
>      /* Initialized default priorities of local interrupts. */
>      for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 59f0ffd9e1..1c2ffae883 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -745,12 +745,12 @@ typedef enum RISCVException {
>  #define MENVCFG_CBIE                       (3UL << 4)
>  #define MENVCFG_CBCFE                      BIT(6)
>  #define MENVCFG_CBZE                       BIT(7)
> -#define MENVCFG_HADE                       (1ULL << 61)
> +#define MENVCFG_ADUE                       (1ULL << 61)
>  #define MENVCFG_PBMTE                      (1ULL << 62)
>  #define MENVCFG_STCE                       (1ULL << 63)
>
>  /* For RV32 */
> -#define MENVCFGH_HADE                      BIT(29)
> +#define MENVCFGH_ADUE                      BIT(29)
>  #define MENVCFGH_PBMTE                     BIT(30)
>  #define MENVCFGH_STCE                      BIT(31)
>
> @@ -763,12 +763,12 @@ typedef enum RISCVException {
>  #define HENVCFG_CBIE                       MENVCFG_CBIE
>  #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>  #define HENVCFG_CBZE                       MENVCFG_CBZE
> -#define HENVCFG_HADE                       MENVCFG_HADE
> +#define HENVCFG_ADUE                       MENVCFG_ADUE
>  #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>  #define HENVCFG_STCE                       MENVCFG_STCE
>
>  /* For RV32 */
> -#define HENVCFGH_HADE                       MENVCFGH_HADE
> +#define HENVCFGH_ADUE                       MENVCFGH_ADUE
>  #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
>  #define HENVCFGH_STCE                       MENVCFGH_STCE
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9f611d89bb..3a02079290 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -861,11 +861,11 @@ static int get_physical_address(CPURISCVState *env,=
 hwaddr *physical,
>      }
>
>      bool pbmte =3D env->menvcfg & MENVCFG_PBMTE;
> -    bool hade =3D env->menvcfg & MENVCFG_HADE;
> +    bool adue =3D env->menvcfg & MENVCFG_ADUE;
>
>      if (first_stage && two_stage && env->virt_enabled) {
>          pbmte =3D pbmte && (env->henvcfg & HENVCFG_PBMTE);
> -        hade =3D hade && (env->henvcfg & HENVCFG_HADE);
> +        adue =3D adue && (env->henvcfg & HENVCFG_ADUE);
>      }
>
>      int ptshift =3D (levels - 1) * ptidxbits;
> @@ -1026,7 +1026,7 @@ restart:
>
>      /* Page table updates need to be atomic with MTTCG enabled */
>      if (updated_pte !=3D pte && !is_debug) {
> -        if (!hade) {
> +        if (!adue) {
>              return TRANSLATE_FAIL;
>          }
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..b4c66dc8ca 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1951,7 +1951,7 @@ static RISCVException write_menvcfg(CPURISCVState *=
env, int csrno,
>      if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
>          mask |=3D (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                  (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> -                (cfg->ext_svadu ? MENVCFG_HADE : 0);
> +                (cfg->ext_svadu ? MENVCFG_ADUE : 0);
>      }
>      env->menvcfg =3D (env->menvcfg & ~mask) | (val & mask);
>
> @@ -1971,7 +1971,7 @@ static RISCVException write_menvcfgh(CPURISCVState =
*env, int csrno,
>      const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
>      uint64_t mask =3D (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                      (cfg->ext_sstc ? MENVCFG_STCE : 0) |
> -                    (cfg->ext_svadu ? MENVCFG_HADE : 0);
> +                    (cfg->ext_svadu ? MENVCFG_ADUE : 0);
>      uint64_t valh =3D (uint64_t)val << 32;
>
>      env->menvcfg =3D (env->menvcfg & ~mask) | (valh & mask);
> @@ -2023,7 +2023,7 @@ static RISCVException read_henvcfg(CPURISCVState *e=
nv, int csrno,
>       * henvcfg.stce is read_only 0 when menvcfg.stce =3D 0
>       * henvcfg.hade is read_only 0 when menvcfg.hade =3D 0
>       */
> -    *val =3D env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_HA=
DE) |
> +    *val =3D env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_AD=
UE) |
>                             env->menvcfg);
>      return RISCV_EXCP_NONE;
>  }
> @@ -2040,7 +2040,7 @@ static RISCVException write_henvcfg(CPURISCVState *=
env, int csrno,
>      }
>
>      if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
> -        mask |=3D env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG=
_HADE);
> +        mask |=3D env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG=
_ADUE);
>      }
>
>      env->henvcfg =3D (env->henvcfg & ~mask) | (val & mask);
> @@ -2058,7 +2058,7 @@ static RISCVException read_henvcfgh(CPURISCVState *=
env, int csrno,
>          return ret;
>      }
>
> -    *val =3D (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_H=
ADE) |
> +    *val =3D (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE | HENVCFG_A=
DUE) |
>                              env->menvcfg)) >> 32;
>      return RISCV_EXCP_NONE;
>  }
> @@ -2067,7 +2067,7 @@ static RISCVException write_henvcfgh(CPURISCVState =
*env, int csrno,
>                                       target_ulong val)
>  {
>      uint64_t mask =3D env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE |
> -                                    HENVCFG_HADE);
> +                                    HENVCFG_ADUE);
>      uint64_t valh =3D (uint64_t)val << 32;
>      RISCVException ret;
>
> --
> 2.25.1
>
>

