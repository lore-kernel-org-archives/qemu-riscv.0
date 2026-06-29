Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87009C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we0DL-0001VB-B9; Sun, 28 Jun 2026 20:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0DF-0001V1-OT
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:51:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we0DD-0004ta-3R
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:51:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-697bd21fdc2so4855333a12.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782694255; cv=none;
 d=google.com; s=arc-20260327;
 b=rbPsugZyXrVis9gJaPTnnMmSHL9vtyrxGKOjAGy93JfFeDEJ5xhehw4qSVruXMgEcY
 d6UIDrDOpMvZlI/XdKvYNSBpph6eXCO8ktnpmRYQt2G46tUuOqhlveAbHUZGJE5349OZ
 ygB7AlNSxD917o/E08qT6VvRhmB1ZYFORKRtLKwzullLC3mXDSbSx6cFGqE/MDVTTiJw
 2uscWpTGcxBs1n82Qkc+yWKBW1y/UMwKuyfVgVuxg7T7QQQSggzRNNoxYqMGej8rC+wV
 DQvsnmbPlql/dXknc9XKxcJk0EEAZLzuzgnytrZXuCtMburSj0GDxtRzyJzgUnQKQrhp
 PUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LwzgFFmYXx5EzS6oTaFWg3iGy/aaClN4MZPlgQhAOQg=;
 fh=sHta28Jao3DQpSaaEu0Ki7C6Chjqez6ozHsQWTTPxMo=;
 b=hcE3s81osK81/TwG1+B62Gr9JjX1Tu1Wk3Dci9XxnRZ6houaMczL4Wv08kG/i37weo
 KQjDVfRRDqmoHH/J0yT410T3y0bImlIcHNiyJkyDcpYGo+21Fgfm4HVXzKS3lm73irfy
 yxUrMsQPqtFC+biwfbNrptKz3xPz6fiYTdDWiqW/CZnhyDLOzQ/eSc/7wT6kZJ0GPC9Q
 wuhBBNkRDb8zdMFrjtO6FRdD5UKA6FxWUdhXXqwA03OZoCCETyYEsHPOOKqANjTe8+/7
 17euy2cbH02AsGV/bwVazrRMJb3vhRXSYaXudFHeU8mZqLybGGjUrufpdxB98W7VBSBf
 BksA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782694255; x=1783299055; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwzgFFmYXx5EzS6oTaFWg3iGy/aaClN4MZPlgQhAOQg=;
 b=EO23m/0KgRZmG4QM6VEQTumFyQKM2fOIXk9EqpTfRKTTsJxDaJz/I+8TZ+70zszbLb
 m592PpoftK5xf5gXQGVRVu+ARw404EogPCv61prDu7IPNZiF2o6GYwolc0dWZjv00ZT6
 dguRbdWdX8kwymxCswuKBYlcyEKnONWLBRw/PZGP9NrrHMuGq/RzQLkBqCT9g/WwDdhx
 8YAzTQ8f2heFtaSvkBanilN0dBOm/f0ZGK0RKu0yLPq9WybmX5Aw0LtbSUIFljvZd0WG
 fvdjaMM1ED3tjucojOjp8mYhtiD/yNsGReIoRtNVUdIPdJMeeERXvGyGCWncr3sDxiA/
 vxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782694255; x=1783299055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LwzgFFmYXx5EzS6oTaFWg3iGy/aaClN4MZPlgQhAOQg=;
 b=Oduq2fRGJeusd2nBiZu5mkH4ckD5Asr2/RVpk32WPcQl/ISy1Gs5fjTbw+cfTy8Q3w
 biBNgLfG1F1BhvPN66DT0RKGnLD8FVYM+3GiKItLb6sp3YKg7nln8sJQ6gTDTU6i0Bi0
 E2ptOctlgRBxqF7oJ/kr3lVjABhP510Wev7AJJIGPdBHtztMrDCRaDGLx1X3D/tUOOb1
 kC64PAsZ5QFCRILHh2QSFBakNnY1U8T4vYLVZ7qg4b70e9mR3VaCvRmSio5LIpXLDpVt
 4WLUNrqwJw+dFX5gCn63TqCPY3CSp3YtX2x8Ob/hlZIcjX4cisHlSU5QZmkQJdUgjqhp
 2D0A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpC+FcrOTSTH+lID9Xr2jPfvzIaxUqwCNlBIVUIAK9J7+4B0NOshoX4LVz+HnNaPVBIgaxhtc/JHXkp@nongnu.org
X-Gm-Message-State: AOJu0YyXNF/OmL0jJPJGqIRRA6YjYZf7aHCi5HMkdorRri1u4L1+P9T5
 a0APLimPnvacdammoNolo3APsJbTVdfntchnzEMWkuQHIV0FWgn0y7NM4p4tEY/04EbGn7w/OxL
 NXUI14g6nbZ3c2CAUSykuupUAd+z2NH8=
X-Gm-Gg: AfdE7ckPcnnL2WQ47BibRXeaZUue/rhHadXwgK37C0hDO/KFmZ6ZR5xkIIV0Ze3upuC
 YrUAGeDM9c6G5ubl2UbExTtz1bsL2hEvGfVLZsFvXIeGYeh0Of56BkRyUiFWwSXhXUi6mcfOmdv
 jAO678yKK6qCy3Gq6A5k0XoEH/oF/1rMntAMkC6xhHlvpZVKYPIamNCSvZeA0G5VCkZmg8Q/Xcj
 htbNFwTW30tfoi0biIlmVHJSSWrUYpKqNmQUsshbLUvA8ClBX9H3asOHd+j/GBcNQf2L6mq9wb+
 BSxptRuBBnHkJdOheueAojbr0nA=
X-Received: by 2002:a05:6402:5113:b0:683:e394:cc0c with SMTP id
 4fb4d7f45d1cf-69810a45891mr5278450a12.4.1782694255358; Sun, 28 Jun 2026
 17:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-marchid-v2-1-3821c351028b@gmail.com>
In-Reply-To: <20260625-marchid-v2-1-3821c351028b@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:50:28 +1000
X-Gm-Features: AVVi8Cfsp3EivFshtIbSQ8BCLnflCzLg2cCoR1E59koj_BUM6CGu6o4LxVHDf0A
Message-ID: <CAKmqyKPu+F9xaNiXuTC4R0VnCNXZ=z9kPNCQnyYs-d=pksWUbA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Report QEMU CPU archid as 42
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
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

On Fri, Jun 26, 2026 at 3:13=E2=80=AFPM Charlie Jenkins
<thecharlesjenkins@gmail.com> wrote:
>
> When a non-vendor CPU is used, report the archid as 42 which has been
> allocated for QEMU in the riscv isa manual [1]. This can help software
> check if it is running in QEMU.
>
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> This series was original proposed by Palmer Dabbelt [1] with a follow up
> by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.
>
> When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
> marchid will now be reported as 42.
>
> > qemu-system-riscv64 ... -cpu rv64
>
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_z=
ifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_=
zbc_zbs_sstc_svadu_svvptc
> mmu             : sv57
> mvendorid       : 0x0
> marchid         : 0x2a
> mimpid          : 0x0
> hart isa        : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_z=
ifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_=
zbc_zbs_sstc_svadu_svvptc
>
> When booting with a vendor CPU like veyron-v1, the proper marchid will
> still appear.
>
> > qemu-system-riscv64 ... -cpu veyron-v1
>
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei=
_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_=
sstc_svinval_svnapot_svpbmt
> mmu             : sv48
> mvendorid       : 0x61f
> marchid         : 0x8000000000010000
> mimpid          : 0x111
> hart isa        : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei=
_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_=
sstc_svinval_svnapot_svpbmt
>
> [1] https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.co=
m/
> ---
> Changes in v2:
> - Added comment linking the spec allocating 42 to marchid
> - Cleaned up the id setting
> - Link to v1: https://lore.kernel.org/qemu-devel/20260624-marchid-v1-1-a0=
af7997071f@gmail.com
> ---
>  target/riscv/cpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fa497e5e8a..94946d335f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -47,6 +47,13 @@
>  static const char riscv_single_letter_exts[] =3D "IEMAFDQCBPVH";
>  const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>                                RVC, RVS, RVU, RVH, RVG, RVB, 0};
> +#define RISCV_CPU_MVENDORID 0
> +#define RISCV_CPU_MIMPID 0
> +/*
> + * marchid allocated for qemu:
> + * https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
> + */
> +#define RISCV_CPU_MARCHID 42
>
>  /*
>   * From vector_helper.c
> @@ -1183,6 +1190,10 @@ static void riscv_cpu_init(Object *obj)
>          mcc->def->profile->enabled =3D true;
>      }
>
> +    cpu->cfg.mvendorid =3D RISCV_CPU_MVENDORID;
> +    cpu->cfg.marchid =3D RISCV_CPU_MARCHID;
> +    cpu->cfg.mimpid =3D RISCV_CPU_MIMPID;
> +
>      env->misa_ext_mask =3D env->misa_ext =3D mcc->def->misa_ext;
>      riscv_cpu_cfg_merge(&cpu->cfg, &mcc->def->cfg);
>
>
> ---
> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
> change-id: 20260624-marchid-80d176b873d8
>
> Best regards,
> --
> - Charlie
>
>

