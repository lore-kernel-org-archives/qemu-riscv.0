Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7703C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 04:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxJTT-00030A-9P; Mon, 30 Oct 2023 00:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJTN-0002vy-ND; Mon, 30 Oct 2023 00:01:53 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJTK-00042g-Rz; Mon, 30 Oct 2023 00:01:52 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-457bac7c3f5so1600880137.2; 
 Sun, 29 Oct 2023 21:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698638509; x=1699243309; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGLIo89dniMt8GfBqUtu6fp+0h7dZBzecssUkPXiUGk=;
 b=HOeajO54lnBsWG0sqDOED6iT+6kDsD/lFqUjjm/yZZUbleiBeohTF3N4kR5F1pAzzg
 PN/zlLfXBjMXtTAw++UWxgPMhXi9cFycNqhzEIrbVpqHulg/Vcdmx325iUms4XilkClq
 5uuQ3GNOHPPZ5ju2KroTiLd7MufMRkd3aDF23NKONYAPDZa8cNoEWg0jDwNf0xuFg4ml
 Kqoyi9dUqAN3K7WgXpyKYQ6kepG8+eqDOUCUekNDcqoQldUjGgc1XdAQ6k5ogWHedFbr
 nh+jvjMeWuxxB1tURVWhHKZD8TYhQuc+QR+rNVXepdcTizxLRjToOHKkCw3j+/8oG/a9
 ttYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698638509; x=1699243309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGLIo89dniMt8GfBqUtu6fp+0h7dZBzecssUkPXiUGk=;
 b=xKCXaUvD7EOMCxiMlcRqpJ3OXWekfrhiONzYuSOubWnIofkq3LoGvvJVgc6wjH9Doa
 BjiBoGOHtcwlrmjETMpMCHpAmjjbcJKiqWzSHFeiCAXjPGhO85HmwWfh2PGX9n5/mP1w
 y+LQG/FVKjrtX6QXueb34kfpdyMJyjUvw2BqOt9GTkkbqqrdk1TaYaPJlH+DLnhLMPYl
 CPS1uTdM+kLRhcZBFCpeOr6Q3HEKHkVZXCtUM00ujapyP5sdPEtRqYLRqy6BH75Nfq+C
 EqTf0kEuoegHYNLYvYzF+3MkYa7TnCp/6krLYMQFpnYky9YAaqnuhwYeydHeXHCe6Sk7
 a0Cg==
X-Gm-Message-State: AOJu0Yz3Kph3VHTzBfP18N8rKcT2GxdEO9HGSiobEXT7Zjxd3TsBfBvl
 +jz3BV113p0FzA516/624HKZ+E66rirgp0ouhFY=
X-Google-Smtp-Source: AGHT+IG6AxI72TDGfyxuw+L1644wEHDnjdAPOjMnh8tRhuEzDIQ/vAZpJUzq8hKlXLLIfCBTSIXDRplAOh42rw2Jxs0=
X-Received: by 2002:a67:c092:0:b0:44e:d6c3:51d4 with SMTP id
 x18-20020a67c092000000b0044ed6c351d4mr8186227vsi.18.1698638508819; Sun, 29
 Oct 2023 21:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-13-dbarboza@ventanamicro.com>
In-Reply-To: <20231028085427.707060-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 14:01:22 +1000
Message-ID: <CAKmqyKOH=QDeq4+Zd+Yyg8YsKCOtrNJgvtDfXY9iRKXnbFcZ9w@mail.gmail.com>
Subject: Re: [PATCH v6 12/12] target/riscv/tcg: warn if profile exts are
 disabled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Sat, Oct 28, 2023 at 8:07=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Enabling a profile and then disabling some of its mandatory extensions
> is a valid use. It can be useful for debugging and testing. But the
> common expected use of enabling a profile is to enable all its mandatory
> extensions.
>
> Add an user warning when mandatory extensions from an enabled profile
> are disabled in the command line, like we're already doing with RVG.
>
> After this patch, this will throw warnings:
>
> -cpu rv64,rva22u64=3Dtrue,zihintpause=3Dfalse,zicbom=3Dfalse,zicboz=3Dfal=
se
>
> qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extensio=
n zihintpause
> qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extensio=
n zicbom
> qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extensio=
n zicboz
>
> Note that the following  will NOT throw warnings because the profile is
> being enabled last, hence all its mandatory extensions will be enabled:
>
> -cpu rv64,zihintpause=3Dfalse,zicbom=3Dfalse,zicboz=3Dfalse,rva22u64=3Dtr=
ue
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 61 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 953e8432d6..5e7855b41b 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -147,6 +147,27 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_=
offset)
>      g_assert_not_reached();
>  }
>
> +static const char *cpu_cfg_ext_get_name(uint32_t ext_offset)
> +{
> +    const RISCVCPUMultiExtConfig *feat;
> +    const RISCVIsaExtData *edata;
> +
> +    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> +        if (edata->ext_enable_offset =3D=3D ext_offset) {
> +            return edata->name;
> +        }
> +    }
> +
> +    for (feat =3D riscv_cpu_named_features; feat->name !=3D NULL; feat++=
) {
> +        if (feat->offset =3D=3D ext_offset) {
> +            return feat->name;
> +        }
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -631,6 +652,45 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>      riscv_cpu_disable_priv_spec_isa_exts(cpu);
>  }
>
> +static void riscv_cpu_validate_profile(RISCVCPU *cpu,
> +                                       RISCVCPUProfile *profile)
> +{
> +    const char *warn_msg =3D "Profile %s mandates disabled extension %s"=
;
> +    int i;
> +
> +    for (i =3D 0; misa_bits[i] !=3D 0; i++) {
> +        uint32_t bit =3D misa_bits[i];
> +
> +        if (!(profile->misa_ext & bit)) {
> +            continue;
> +        }
> +
> +        if (!riscv_has_ext(&cpu->env, bit)) {
> +            warn_report(warn_msg, profile->name, riscv_get_misa_ext_name=
(bit));
> +        }
> +    }
> +
> +    for (i =3D 0; profile->ext_offsets[i] !=3D RISCV_PROFILE_EXT_LIST_EN=
D; i++) {
> +        int ext_offset =3D profile->ext_offsets[i];
> +
> +        if (!isa_ext_is_enabled(cpu, ext_offset)) {
> +            warn_report(warn_msg, profile->name,
> +                        cpu_cfg_ext_get_name(ext_offset));
> +        }
> +    }
> +}
> +
> +static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
> +{
> +    for (int i =3D 0; riscv_profiles[i] !=3D NULL; i++) {
> +        RISCVCPUProfile *profile =3D riscv_profiles[i];
> +
> +        if (profile->user_set && profile->enabled) {
> +            riscv_cpu_validate_profile(cpu, profile);
> +        }
> +    }
> +}
> +
>  void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -649,6 +709,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, E=
rror **errp)
>      }
>
>      riscv_cpu_validate_named_features(cpu);
> +    riscv_cpu_validate_profiles(cpu);
>
>      if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>          /*
> --
> 2.41.0
>
>

