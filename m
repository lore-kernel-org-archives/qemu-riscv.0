Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B40C47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 23:02:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLWjQ-0004uw-2s; Thu, 04 Jan 2024 18:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWjO-0004uF-4R; Thu, 04 Jan 2024 18:02:30 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWjM-0003ZR-Dl; Thu, 04 Jan 2024 18:02:29 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-20451ecbb80so431520fac.2; 
 Thu, 04 Jan 2024 15:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704409347; x=1705014147; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/kx5/8AoNoQ/jpq+roFhcIj/HOSZkRIVBs/Mc5LBhA=;
 b=R8YY01dElz0onO0C6SzsNjjE4tDfczD2s3l2AM0aymXK/WqIQPwTT2/6Ma7LginKrk
 qpuBUfIwUGtFaPALfRC3/HrNopfSgUm68dDqoistx+gTSRcTpYj2Juam86rbmg/MnZo9
 YOcTFx5J++nqUuKXp/aOOkdnPgbk4Ko2dnmzPkW3npLYI+MPXw827ObTWM2ycYZExdAW
 ExleUpJP963AMYeQlpTvx79+mKcFgKLFffT/ZUl1iOuSLl+01VQSS6gdV/zTDSXAt0TD
 L/nRSP4+i6e6w9jpC9GKVIwypk+bJbcNReBwVCNdqTsB5Pp/8k2tRJjthvoPGmiEKPuI
 FgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704409347; x=1705014147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/kx5/8AoNoQ/jpq+roFhcIj/HOSZkRIVBs/Mc5LBhA=;
 b=jYm8VDknfHIYVKGibfHK8fRR388wGMAZ+1FJeBs2OoBeLaU7hauCXR81PObeROawzl
 tDAI3nGXRqMhf4JrASYCCid+Fll7vDDBELZ95rYBm7O5KY6Dch1eQGhwEA9zz2GC3+RK
 UtRXAvhQ0XErIoc3/ou5dgZLiBLcdFscz15a8y/lGDULEWZUu1EGA/QPiOi2T+0X0Sw5
 L122u+zNur3S+4iEl7n5g1HwTay9QKYxF+7VbddlhRWfOF+nMAollRB8EqjQK5ju8r79
 A8VXsjURQPyt6AtnOrq86hKEtPgUM99LvCHJh/vAxvC+f+ssWNuxszCYIch9PvFkdMU5
 TaYg==
X-Gm-Message-State: AOJu0YyNLCP7kf4gGbgoLQFdMZo9IzZeNjxRNm4X6s0zcc/ge0E+7PBR
 VHfhrz2YfRZxTMbtVAy3uRTn3kfi7vACcyRtJQI=
X-Google-Smtp-Source: AGHT+IF/L2ljI2rmQBruTnSl4dznMB96k1wd4kkTrUI0Dr7g05G9eOpg5C/qvJ9KHllLzz151Z52VmWLeJx9pYVvVeg=
X-Received: by 2002:a05:6871:2b24:b0:204:1b7c:83e4 with SMTP id
 dr36-20020a0568712b2400b002041b7c83e4mr1254390oac.104.1704409346756; Thu, 04
 Jan 2024 15:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-21-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-21-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 09:02:00 +1000
Message-ID: <CAKmqyKOrSEBhFpEcng42r5BG17XAS3mwByfTnpUot9OVcCCUAw@mail.gmail.com>
Subject: Re: [PATCH v13 20/26] target/riscv: add priv ver restriction to
 profiles
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Dec 19, 2023 at 12:23=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Some profiles, like RVA22S64, has a priv_spec requirement.
>
> Make this requirement explicit for all profiles. We'll validate this
> requirement finalize() time and, in case the user chooses an
> incompatible priv_spec while activating a profile, a warning will be
> shown.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  1 +
>  target/riscv/cpu.h         |  2 ++
>  target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a76bc1b86a..1ba85c6d1c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1537,6 +1537,7 @@ Property riscv_cpu_options[] =3D {
>  static RISCVCPUProfile RVA22U64 =3D {
>      .name =3D "rva22u64",
>      .misa_ext =3D RVI | RVM | RVA | RVF | RVD | RVC | RVU,
> +    .priv_spec =3D RISCV_PROFILE_ATTR_UNUSED,
>      .ext_offsets =3D {
>          CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>          CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5ff629650d..1f34eda1e4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -81,10 +81,12 @@ typedef struct riscv_cpu_profile {
>      uint32_t misa_ext;
>      bool enabled;
>      bool user_set;
> +    int priv_spec;
>      const int32_t ext_offsets[];
>  } RISCVCPUProfile;
>
>  #define RISCV_PROFILE_EXT_LIST_END -1
> +#define RISCV_PROFILE_ATTR_UNUSED -1
>
>  extern RISCVCPUProfile *riscv_profiles[];
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index e395e2449e..4d25fc43d2 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -74,6 +74,20 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, ui=
nt32_t bit,
>      }
>  }
>
> +static const char *cpu_priv_ver_to_str(int priv_ver)
> +{
> +    switch (priv_ver) {
> +    case PRIV_VERSION_1_10_0:
> +        return "v1.10.0";
> +    case PRIV_VERSION_1_11_0:
> +        return "v1.11.0";
> +    case PRIV_VERSION_1_12_0:
> +        return "v1.12.0";
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
>  static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>                                            const TranslationBlock *tb)
>  {
> @@ -755,11 +769,24 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>  static void riscv_cpu_validate_profile(RISCVCPU *cpu,
>                                         RISCVCPUProfile *profile)
>  {
> +    CPURISCVState *env =3D &cpu->env;
>      const char *warn_msg =3D "Profile %s mandates disabled extension %s"=
;
>      bool send_warn =3D profile->user_set && profile->enabled;
>      bool profile_impl =3D true;
>      int i;
>
> +    if (profile->priv_spec !=3D RISCV_PROFILE_ATTR_UNUSED &&
> +        profile->priv_spec !=3D env->priv_ver) {
> +        profile_impl =3D false;
> +
> +        if (send_warn) {
> +            warn_report("Profile %s requires priv spec %s, "
> +                        "but priv ver %s was set", profile->name,
> +                        cpu_priv_ver_to_str(profile->priv_spec),
> +                        cpu_priv_ver_to_str(env->priv_ver));
> +        }
> +    }
> +
>      for (i =3D 0; misa_bits[i] !=3D 0; i++) {
>          uint32_t bit =3D misa_bits[i];
>
> @@ -1048,6 +1075,10 @@ static void cpu_set_profile(Object *obj, Visitor *=
v, const char *name,
>      profile->user_set =3D true;
>      profile->enabled =3D value;
>
> +    if (profile->enabled) {
> +        cpu->env.priv_ver =3D profile->priv_spec;
> +    }
> +
>      for (i =3D 0; misa_bits[i] !=3D 0; i++) {
>          uint32_t bit =3D misa_bits[i];
>
> --
> 2.43.0
>
>

