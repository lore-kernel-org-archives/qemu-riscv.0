Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B25C47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLHDJ-0004FV-3N; Thu, 04 Jan 2024 01:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHDH-0004F0-DX; Thu, 04 Jan 2024 01:28:19 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHDF-0006Ji-L2; Thu, 04 Jan 2024 01:28:19 -0500
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7cc9da9995bso93131241.3; 
 Wed, 03 Jan 2024 22:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704349696; x=1704954496; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Exh1PT3QW76iiVf6wm7xUfxa3dW+z4XD3mW8mEkU2yM=;
 b=kkgHZHHa86DNLTxixtYa8pO+WuN5nifo9xLGAUAjh5yXYLQocdS3vtqtMe9xqCBCUF
 rH3QvWGGXCycUnlq3GeEZNSDSRabGOMsVsF+kzEwJcuGmW1IhG24ATfjKdk2Z/f8xURP
 tBpDmfDz7r1kBf5VKvQb7mzJtE2PLTLn+w74gvYTYa90AZRuNYiEYL54vrGYgfjdUI5V
 1u770Vcl2tSOJqXB0e17rnN4aNNWw7QLFhdE3XsivqIpgupw4sE6L29Mm2s37fwObfCS
 2mhNVFKNgIWxI1XmW1qq0bW/oMI+cFjyeVrnmY0bZQDXW5R59lUuqKT1d+F1yeq1BWYf
 cTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704349696; x=1704954496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Exh1PT3QW76iiVf6wm7xUfxa3dW+z4XD3mW8mEkU2yM=;
 b=B7YCfJrmIw7MwsHJ7gvyL6BP0ZjxBIi5b8l6i9t23vd2ejAUia2TqdOwc2bp+Df/sm
 02i6R8U5XKhekwmpgjE2rZKYZ7qBHOLwICbXNp/gPjKqZ1Bbe0Bs71UqPME13R60/bmN
 wiH2YMnzXf8568s+OfzcSFFn7jx+G8YWG9jdVzw8f1Rai617C+9oYrO2e52qI5rWS4dC
 ZyJ4J6q3kXcN7J7p4+D6vRBhj23xvP4M/5Q6dCWAHnL8MU6YgP/NXyEHBKbcGKDDGLMM
 1eJ9SOU6IKWcbbOibu8fFVabXCjqMV3MTGPQOq2viIfkcNsvsGTE4Ujgi6THxJkvTxwT
 E8Ew==
X-Gm-Message-State: AOJu0YykS38rHid4Nsh61SIqFCqnfWnojpvnfwt0HsI+YpgiyBv2FLSZ
 05V3WXOFPmOmv48wggOgTU2JdePs5v9vU2dH6Uw=
X-Google-Smtp-Source: AGHT+IFd1bI35q8ESAjbAmH79TOVF/mT0z6it3S+feviMa1Pq2akNsR64TrTRSy8xt+RjzJVad+U7XnWa+hKXS7wWzU=
X-Received: by 2002:a05:6102:e06:b0:467:a697:b932 with SMTP id
 o6-20020a0561020e0600b00467a697b932mr65208vst.27.1704349696102; Wed, 03 Jan
 2024 22:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-17-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-17-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:27:50 +1000
Message-ID: <CAKmqyKNV=irm64C0aL=4RbmUA3KhF13q0x2ENPu=iR8D1hUtQw@mail.gmail.com>
Subject: Re: [PATCH v13 16/26] target/riscv/tcg: validate profiles during
 finalize
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Mon, Dec 18, 2023 at 10:57=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Enabling a profile and then disabling some of its mandatory extensions
> is a valid use. It can be useful for debugging and testing. But the
> common expected use of enabling a profile is to enable all its mandatory
> extensions.
>
> Add an user warning when mandatory extensions from an enabled profile
> are disabled in the command line. We're also going to disable the
> profile flag in this case since the profile must include all the
> mandatory extensions. This flag can be exposed by QMP to indicate the
> actual profile state after the CPU is realized.
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
> Note that the following will NOT throw warnings because the profile is
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
>  target/riscv/tcg/tcg-cpu.c | 69 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index c9df783c51..005d8be26b 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -147,6 +147,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_=
offset)
>      g_assert_not_reached();
>  }
>
> +static const char *cpu_cfg_ext_get_name(uint32_t ext_offset)
> +{
> +    const RISCVCPUMultiExtConfig *feat;
> +    const RISCVIsaExtData *edata;
> +
> +    for (edata =3D isa_edata_arr; edata->name !=3D NULL; edata++) {
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
>  static bool cpu_cfg_offset_is_named_feat(uint32_t ext_offset)
>  {
>      const RISCVCPUMultiExtConfig *feat;
> @@ -727,6 +747,54 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>      riscv_cpu_disable_priv_spec_isa_exts(cpu);
>  }
>
> +static void riscv_cpu_validate_profile(RISCVCPU *cpu,
> +                                       RISCVCPUProfile *profile)
> +{
> +    const char *warn_msg =3D "Profile %s mandates disabled extension %s"=
;
> +    bool send_warn =3D profile->user_set && profile->enabled;
> +    bool profile_impl =3D true;
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
> +            profile_impl =3D false;
> +
> +            if (send_warn) {
> +                warn_report(warn_msg, profile->name,
> +                            riscv_get_misa_ext_name(bit));
> +            }
> +        }
> +    }
> +
> +    for (i =3D 0; profile->ext_offsets[i] !=3D RISCV_PROFILE_EXT_LIST_EN=
D; i++) {
> +        int ext_offset =3D profile->ext_offsets[i];
> +
> +        if (!isa_ext_is_enabled(cpu, ext_offset)) {
> +            profile_impl =3D false;
> +
> +            if (send_warn) {
> +                warn_report(warn_msg, profile->name,
> +                            cpu_cfg_ext_get_name(ext_offset));
> +            }
> +        }
> +    }
> +
> +    profile->enabled =3D profile_impl;
> +}
> +
> +static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
> +{
> +    for (int i =3D 0; riscv_profiles[i] !=3D NULL; i++) {
> +        riscv_cpu_validate_profile(cpu, riscv_profiles[i]);
> +    }
> +}
> +
>  void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
> @@ -745,6 +813,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, E=
rror **errp)
>      }
>
>      riscv_cpu_update_named_features(cpu);
> +    riscv_cpu_validate_profiles(cpu);
>
>      if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>          /*
> --
> 2.43.0
>
>

