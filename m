Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15EDC47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 23:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLWon-0008S1-2q; Thu, 04 Jan 2024 18:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWol-0008RV-Ln; Thu, 04 Jan 2024 18:08:03 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWoj-0000dT-Vo; Thu, 04 Jan 2024 18:08:03 -0500
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35fcea0ac1aso4556425ab.1; 
 Thu, 04 Jan 2024 15:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704409680; x=1705014480; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NXIHpmvSrFxhg9IbVT5UxPKqTRKDV3bJjs5ZFxsAJ8=;
 b=RLK/RUtKWgbdvXib/3a7tU2PexvlGuWWQHKxyKOHu475uQn+hyY3vyxbzVBHQeMV8J
 F0P0oXjZuBIr0VRWhtqbX5kpogqy9zt4++NV+NZfU5eYjOErC8rG0CMxh7X06/k0Q0nA
 HQQ6meTVX1F0rl+8bEcKOp7NFWT2nn7QU10Rs3CfnyviAHM94t4IdiTrvQ/iadrPxPQA
 kEo/R/teGb3nB0ttcVRgXZgZlL8HJoYk/Qk9wBRkUvkMoCWDYYCzfA4iCBta71Fsfr+c
 spCW+M1GU48DSbY53egSR4k4/wIhs+hP0hPdCp1UCEBgmmELEQc5/UnUEjDlHo3YBnGP
 s7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704409680; x=1705014480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NXIHpmvSrFxhg9IbVT5UxPKqTRKDV3bJjs5ZFxsAJ8=;
 b=uMeBBkgUZV6nB2z7s6dkIwTiD0hS583CX2nB16RjMbmmGvF+UdnSgW5/NLKnDeAEEh
 LuUij397CFAvrXuDrEQ52uC8wIN0Y6OZ6WQl2GH/PZHR6WBOmZJhCd7IDCVw3xr7WoeB
 yccy788uzVwA2R8WP1ThRX9jgPL95gLkx672BlZ1VwbR2Is3rZDTUD6r2G86ODEW5fY8
 yCV5SeXh8QmA5eQfw5qRd8TmYoi/lTDCw5+WkikUs67GEFNQ0eH47kIov6jqsy+zH9Pd
 xdrVz/+wI2nN+vdVfDnuVRF9BYQg1tCD7QEgA5T+HxYvq2fyPgQAja7hy0IdTDhYxhRM
 jrqA==
X-Gm-Message-State: AOJu0YwCMymYwSGma8/rTJKEVLIxAheEELXFDA7guqDPp918VlCNjb7D
 m//XFdJU8h/AFcfSU0YYJ5CE885ZGwTE/+TMWLI=
X-Google-Smtp-Source: AGHT+IFngBuvkjP3wWGqQfri2u62Gh5yLjj2PtgLtAoEiqaZvSF0wG3KAyr8dXA0vUO94QfWB1w/jPNIEAGbhfULCXU=
X-Received: by 2002:a05:6e02:1c46:b0:360:219b:1b72 with SMTP id
 d6-20020a056e021c4600b00360219b1b72mr1358958ilg.106.1704409680492; Thu, 04
 Jan 2024 15:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-24-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-24-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 09:07:34 +1000
Message-ID: <CAKmqyKPn6SKunOtMhJv_0u4k=aPyk_wPeQY5dhk2TaGSW7=O3A@mail.gmail.com>
Subject: Re: [PATCH v13 23/26] target/riscv: add satp_mode profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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

On Mon, Dec 18, 2023 at 10:56=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'satp_mode' is a requirement for supervisor profiles like RVA22S64.
> User-mode/application profiles like RVA22U64 doesn't care.
>
> Add 'satp_mode' to the profile description. If a profile requires it,
> set it during cpu_set_profile(). We'll also check it during finalize()
> to validate if the running config implements the profile.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  1 +
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 40 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1dea5db52d..6795f5da41 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1543,6 +1543,7 @@ static RISCVCPUProfile RVA22U64 =3D {
>      .name =3D "rva22u64",
>      .misa_ext =3D RVI | RVM | RVA | RVF | RVD | RVC | RVU,
>      .priv_spec =3D RISCV_PROFILE_ATTR_UNUSED,
> +    .satp_mode =3D RISCV_PROFILE_ATTR_UNUSED,
>      .ext_offsets =3D {
>          CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>          CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 485d2da3c2..6c5fceb5f5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -82,6 +82,7 @@ typedef struct riscv_cpu_profile {
>      bool enabled;
>      bool user_set;
>      int priv_spec;
> +    int satp_mode;
>      const int32_t ext_offsets[];
>  } RISCVCPUProfile;
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 4d25fc43d2..152f95718b 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -766,6 +766,31 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>      riscv_cpu_disable_priv_spec_isa_exts(cpu);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +static bool riscv_cpu_validate_profile_satp(RISCVCPU *cpu,
> +                                            RISCVCPUProfile *profile,
> +                                            bool send_warn)
> +{
> +    int satp_max =3D satp_mode_max_from_map(cpu->cfg.satp_mode.supported=
);
> +
> +    if (profile->satp_mode > satp_max) {
> +        if (send_warn) {
> +            bool is_32bit =3D riscv_cpu_is_32bit(cpu);
> +            const char *req_satp =3D satp_mode_str(profile->satp_mode, i=
s_32bit);
> +            const char *cur_satp =3D satp_mode_str(satp_max, is_32bit);
> +
> +            warn_report("Profile %s requires satp mode %s, "
> +                        "but satp mode %s was set", profile->name,
> +                        req_satp, cur_satp);
> +        }
> +
> +        return false;
> +    }
> +
> +    return true;
> +}
> +#endif
> +
>  static void riscv_cpu_validate_profile(RISCVCPU *cpu,
>                                         RISCVCPUProfile *profile)
>  {
> @@ -775,6 +800,13 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu=
,
>      bool profile_impl =3D true;
>      int i;
>
> +#ifndef CONFIG_USER_ONLY
> +    if (profile->satp_mode !=3D RISCV_PROFILE_ATTR_UNUSED) {
> +        profile_impl =3D riscv_cpu_validate_profile_satp(cpu, profile,
> +                                                       send_warn);
> +    }
> +#endif
> +
>      if (profile->priv_spec !=3D RISCV_PROFILE_ATTR_UNUSED &&
>          profile->priv_spec !=3D env->priv_ver) {
>          profile_impl =3D false;
> @@ -1079,6 +1111,14 @@ static void cpu_set_profile(Object *obj, Visitor *=
v, const char *name,
>          cpu->env.priv_ver =3D profile->priv_spec;
>      }
>
> +#ifndef CONFIG_USER_ONLY
> +    if (profile->satp_mode !=3D RISCV_PROFILE_ATTR_UNUSED) {
> +        const char *satp_prop =3D satp_mode_str(profile->satp_mode,
> +                                              riscv_cpu_is_32bit(cpu));
> +        object_property_set_bool(obj, satp_prop, profile->enabled, NULL)=
;
> +    }
> +#endif
> +
>      for (i =3D 0; misa_bits[i] !=3D 0; i++) {
>          uint32_t bit =3D misa_bits[i];
>
> --
> 2.43.0
>
>

