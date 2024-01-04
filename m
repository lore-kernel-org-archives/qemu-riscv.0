Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2224C47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 23:00:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLWh8-00041c-R7; Thu, 04 Jan 2024 18:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWh6-00041A-0Y; Thu, 04 Jan 2024 18:00:09 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLWh3-0002cz-U0; Thu, 04 Jan 2024 18:00:07 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4b745fa9671so299008e0c.0; 
 Thu, 04 Jan 2024 15:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704409204; x=1705014004; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLTPtn8KsZSo2T/OmS23oBF20rd49bjYa5hF/DBWF4k=;
 b=O38wyLOWJnpnDE+viskJOTLAG09fKQdvxjSrZYyzg/VOvafindfGQja/XSUkI+wtVh
 Ybj5wE51o2/VZlwqvva4Alfo1jVlC1uaoB6aTmLgUX6kaKnny+5vo8peiVR6a7YUUV3z
 DyHeC95oPnBXiWaicmNBzWdPRax2FhpTN2+d+1rP/89MiU/9HZvzSIEnjvhJLCsLN8qK
 cumMeMZNj8bmaVZ5OG0Sli6iLfcnzxRryhiaxoAyyJ+/4J+GfxvT3N7NTMnYpuTUDEy1
 mWmAFy6Y8aVUWU1fxGsh9b0mNGU8ODH0mVpmB+ORc1bpdMxywxoWGVxZTClFRWnbwZrq
 KsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704409204; x=1705014004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLTPtn8KsZSo2T/OmS23oBF20rd49bjYa5hF/DBWF4k=;
 b=VutijRBVZXcfpx+BwE8x/8FG1wN64Npe83AxfF/kBa2pGPZe5MNMRo4RVLAlcoL+G1
 cHeNuQJPMQXfGrtXRISbJ+QdxOVeCzf9KXuDRWDmL1I4qhtJ0AcmbfM8i/oYRX7NLTiW
 A4aIPRgKmPCZF2AvufGJZi2XszP/DRgBgD4lT/qj715YVWcF5BQXkdKE4+D9HdAheYa6
 wNYAyzBrfRIYzN9OOdGeJSwx7pUQSUDCoTmaAw/J4DJNWRTJ8YC/h/DVmNOPI3dNm7s/
 cNkS3q+PwhpHpI/bo9ZE9sJ1k7asnG+HNvCaV60Nz3gxAFtZYNd2/mPT0cf0MyGt4CTY
 +c7w==
X-Gm-Message-State: AOJu0YyuGwuSYZDikFNEfpmL7kSPuvW7NIv3OorB613e+m08fBj0lpbw
 QqHe/bVgCq/vKu9lE8EscVa7D9KZX4TqTV0sbJA=
X-Google-Smtp-Source: AGHT+IGNvUcS68rlSOfaFQQkdiCp3VlwGm5+r9zTrcsuH8vvrBlUBLpFMjVBw/ZKG1g2oLyiOcid2f1OBqc/rOJewR0=
X-Received: by 2002:a05:6122:922:b0:4b6:de45:807e with SMTP id
 j34-20020a056122092200b004b6de45807emr1314137vka.15.1704409204366; Thu, 04
 Jan 2024 15:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-20-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-20-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 08:59:38 +1000
Message-ID: <CAKmqyKOiY+W6594v4wDBkmCv1BipqwhOPTodrUQQ-+8DNXgHPQ@mail.gmail.com>
Subject: Re: [PATCH v13 19/26] target/riscv: implement svade
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

On Mon, Dec 18, 2023 at 10:57=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'svade' is a RVA22S64 profile requirement, a profile we're going to add
> shortly. It is a named feature (i.e. not a formal extension, not defined
> in riscv,isa DT at this moment) defined in [1] as:
>
> "Page-fault exceptions are raised when a page is accessed when A bit is
> clear, or written when D bit is clear.".
>
> As far as the spec goes, 'svade' is one of the two distinct modes of
> handling PTE_A and PTE_D. The other way, i.e. update PTE_A/PTE_D when
> they're cleared, is defined by the 'svadu' extension. Checking
> cpu_helper.c, get_physical_address(), we can verify that QEMU is
> compliant with that: we will update PTE_A/PTE_D if 'svadu' is enabled,
> or throw a page-fault exception if 'svadu' isn't enabled.
>
> So, as far as we're concerned, 'svade' translates to 'svadu must be
> disabled'.
>
> We'll implement it like 'zic64b': an internal flag that profiles can
> enable. The flag will not be exposed to users.
>
> [1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 1 +
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 5 +++++
>  3 files changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a38d78b2d6..a76bc1b86a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1445,6 +1445,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>  };
>
>  const RISCVCPUMultiExtConfig riscv_cpu_named_features[] =3D {
> +    MULTI_EXT_CFG_BOOL("svade", svade, true),
>      MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
>
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 90f18eb601..46b06db68b 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -116,6 +116,7 @@ struct RISCVCPUConfig {
>      bool ext_smepmp;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
> +    bool svade;
>      bool zic64b;
>
>      uint32_t mvendorid;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 04aedf3840..e395e2449e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -188,6 +188,9 @@ static void riscv_cpu_enable_named_feat(RISCVCPU *cpu=
, uint32_t feat_offset)
>          cpu->cfg.cbop_blocksize =3D 64;
>          cpu->cfg.cboz_blocksize =3D 64;
>          break;
> +    case CPU_CFG_OFFSET(svade):
> +        cpu->cfg.ext_svadu =3D false;
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -381,6 +384,8 @@ static void riscv_cpu_update_named_features(RISCVCPU =
*cpu)
>      cpu->cfg.zic64b =3D cpu->cfg.cbom_blocksize =3D=3D 64 &&
>                        cpu->cfg.cbop_blocksize =3D=3D 64 &&
>                        cpu->cfg.cboz_blocksize =3D=3D 64;
> +
> +    cpu->cfg.svade =3D !cpu->cfg.ext_svadu;
>  }
>
>  static void riscv_cpu_validate_g(RISCVCPU *cpu)
> --
> 2.43.0
>
>

