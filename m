Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876D2C47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 05:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLFqx-0005qv-Lc; Thu, 04 Jan 2024 00:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLFqu-0005qe-UZ; Thu, 04 Jan 2024 00:01:08 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLFqp-0006wL-S1; Thu, 04 Jan 2024 00:01:08 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4b78b813dd0so40363e0c.3; 
 Wed, 03 Jan 2024 21:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704344462; x=1704949262; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owWktdVrkfJt4dno9YfQ+Ezmxzv6HHxt8Zg7cBU8ti0=;
 b=lhv+r/CkwcyCBkuE1hWIgkJQBoyBtEvjdXS/ElyO5q5gBB7YDBkoORvUo2HjtVGzj5
 5S2LjZZlDV6G4XKSWam2bsCPyRmgOFaqjD8f71kt98Uz6F4IjoAlUxcCLXyGytwpoH7E
 wsLbe6C71NGq5O1sMfTY5Y2ePtSBPSh0lkVFj+aQRWcJ/tkPaEhal7VlJHKTLJTy16Im
 7VziBFe+oGwHSJLw0QTVtmRdFlNCJjFd4WM4BVbMMJ1jLdqwF4DEDH+p8uTPViT6rYQ2
 yeNNeyq833A+XCL/VlYhqyK5pxNsQp/2mQj7e6raVmj1zg0Fs8vkO7/eb3tzwtCuZsor
 nqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704344462; x=1704949262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owWktdVrkfJt4dno9YfQ+Ezmxzv6HHxt8Zg7cBU8ti0=;
 b=SzXNWt/8KrJCQetxt/eRhRvee1KJ9K3oWgURnnWo4HZSbak2+u+6nHp82zDzM61OvJ
 Teukm0ArFRZB5gZhhvDi4NnikBMTlx93sHqk7b0QHTJPxDDSwkx5E17UmY7kh40FFlLJ
 YrcfkJxM+iUtNpiVDTJFe9IAMiL8hJfoCS1VCw+E0fYmDZYqSW/z9XZVgUPCJAOTT2SC
 v4RrVvCkVKfCq4utQzncQvUhZrZCAa1dT5l+9U/+LYD31EbiPIoCs4odAYkhTYaVw/yf
 ySbhuqRYgx0dPFHuEOsn6U5eCAcFMYblE2Z9ucKodc4zRijyKsjppc2T9einFVkdaO0L
 mvgQ==
X-Gm-Message-State: AOJu0YxVpM71UWhmqyi12NzChVi3MPj+PwTNNUF8LeNU6r5e1ZujQSSx
 a3TQFHq+v+G/9KbxgenM6LFTTeDGbM5VoOUPl18=
X-Google-Smtp-Source: AGHT+IGm9yboH59DbyLMxKsF2TiDHHQuzITttsJz+PbuYdCR2Fu8Jf8vznCl4oNdDKC7mhaFCKE7oM9uBcCVOvgJ1b8=
X-Received: by 2002:ac5:cfd9:0:b0:4b6:e339:31b3 with SMTP id
 m25-20020ac5cfd9000000b004b6e33931b3mr32057vkf.27.1704344462189; Wed, 03 Jan
 2024 21:01:02 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-7-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 15:00:35 +1000
Message-ID: <CAKmqyKPOoWbbPqptqXTcMq49-X4PeF2V3ZWF=GRCcPw=20sKRg@mail.gmail.com>
Subject: Re: [PATCH v13 06/26] target/riscv/tcg: add 'zic64b' support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Mon, Dec 18, 2023 at 10:54=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zic64b is defined in the RVA22U64 profile [1] as a named feature for
> "Cache blocks must be 64 bytes in size, naturally aligned in the address
> space". It's a fantasy name for 64 bytes cache blocks. The RVA22U64
> profile mandates this feature, meaning that applications using this
> profile expects 64 bytes cache blocks.
>
> To make the upcoming RVA22U64 implementation complete, we'll zic64b as
> a 'named feature', not a regular extension. This means that:
>
> - it won't be exposed to users;
> - it won't be written in riscv,isa.
>
> This will be extended to other named extensions in the future, so we're
> creating some common boilerplate for them as well.
>
> zic64b is default to 'true' since we're already using 64 bytes blocks.
> If any cache block size (cbo{m,p,z}_blocksize) is changed to something
> different than 64, zic64b is set to 'false'.
>
> Our profile implementation will then be able to check the current state
> of zic64b and take the appropriate action (e.g. throw a warning).
>
> [1] https://github.com/riscv/riscv-profiles/releases/download/v1.0/profil=
es.pdf
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  6 ++++++
>  target/riscv/cpu.h         |  1 +
>  target/riscv/cpu_cfg.h     |  1 +
>  target/riscv/tcg/tcg-cpu.c | 26 ++++++++++++++++++++++++++
>  4 files changed, 34 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 86e3514cc8..b2e539f807 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1444,6 +1444,12 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimenta=
l_exts[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +const RISCVCPUMultiExtConfig riscv_cpu_named_features[] =3D {
> +    MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  /* Deprecated entries marked for future removal */
>  const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361be6..5fb4ca2324 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -767,6 +767,7 @@ typedef struct RISCVCPUMultiExtConfig {
>  extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_named_features[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
>  extern Property riscv_cpu_options[];
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index bd2ff87cc8..90f18eb601 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -116,6 +116,7 @@ struct RISCVCPUConfig {
>      bool ext_smepmp;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
> +    bool zic64b;
>
>      uint32_t mvendorid;
>      uint64_t marchid;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index aee98db6f8..3319ba8e4e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -114,6 +114,19 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_=
offset)
>      g_assert_not_reached();
>  }
>
> +static bool cpu_cfg_offset_is_named_feat(uint32_t ext_offset)
> +{
> +    const RISCVCPUMultiExtConfig *feat;
> +
> +    for (feat =3D riscv_cpu_named_features; feat->name !=3D NULL; feat++=
) {
> +        if (feat->offset =3D=3D ext_offset) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  static void cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
>                                          uint32_t ext_offset)
>  {
> @@ -123,6 +136,10 @@ static void cpu_bump_multi_ext_priv_ver(CPURISCVStat=
e *env,
>          return;
>      }
>
> +    if (cpu_cfg_offset_is_named_feat(ext_offset)) {
> +        return;
> +    }
> +
>      ext_priv_ver =3D cpu_cfg_ext_get_min_version(ext_offset);
>
>      if (env->priv_ver < ext_priv_ver) {
> @@ -293,6 +310,13 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RIS=
CVCPU *cpu)
>      }
>  }
>
> +static void riscv_cpu_update_named_features(RISCVCPU *cpu)
> +{
> +    cpu->cfg.zic64b =3D cpu->cfg.cbom_blocksize =3D=3D 64 &&
> +                      cpu->cfg.cbop_blocksize =3D=3D 64 &&
> +                      cpu->cfg.cboz_blocksize =3D=3D 64;
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -657,6 +681,8 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, E=
rror **errp)
>          return;
>      }
>
> +    riscv_cpu_update_named_features(cpu);
> +
>      if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>          /*
>           * Enhanced PMP should only be available
> --
> 2.43.0
>
>

