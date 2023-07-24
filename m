Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546B0C0015E
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 03:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNmBx-000709-PI; Sun, 23 Jul 2023 23:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNmBv-0006zO-HL; Sun, 23 Jul 2023 23:24:59 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNmBt-0004ci-Qb; Sun, 23 Jul 2023 23:24:59 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-794c5f60479so1108883241.3; 
 Sun, 23 Jul 2023 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690169096; x=1690773896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUC3rhy2KGvlU5X92iuRLH2U9+SY3wCL9nhbQdTNOwM=;
 b=eSdHZ+hdmboxG4KmA91zCitQ6loaFb8MKOxvwfWmJlDSfpW72nyKL45eAuiE6sEHBa
 PHHE+whchi8sa0sf3nJON9n34F0//buFrS1GYWyxVSmx4x5PMMoU0xgX3dRmM0kxAHXa
 Io4FfM1F/pt+YVXsEmFRFt1oXCVpHEe/qC9oIgcazqwASdtWZrLzcwkK4GDZXha+ynuD
 5jrLP4Se8HXJ8PO2EXobgGUlYsEirqqXiFCNgzjOpgk/vV++dztOCHr2Eb3DHo1Gph9x
 i6x2AFO0VPpstg4IJKK5sNCDdG16mr7/ZTe52l93x71oPSHlMaZVBpVv05mowj4CcBVp
 IY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690169096; x=1690773896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUC3rhy2KGvlU5X92iuRLH2U9+SY3wCL9nhbQdTNOwM=;
 b=Eg2iUOUdDJbuvCf7cVjaBOLR9485oJLxqhfa/gtyG6kT0/fzoMeTpdGgGR9G/r6kfn
 v18TSMRfpUWctN2uTotJOf++ybd141w6a7x5FluCb1z6Ti/NsPPEGRrrQF6Vu6jIzhml
 0UhpypY6au3NQrg7d9Z+T1+hmi6bhPSc2mUGqoqa9YLS3viglWu8ZSmE+RdPyP6JW+IT
 HnwesEx8IqWZSdn0DanWPHuSgKnvYpBL+T2J6aaezuSN0sJ0ZwU8E2gZIEUluTZ8I5Sp
 K4Yo4evW8G1RlHLBBMtFq+2NVBXK9c4DubtCHNzFl2Jo36tkYmuenhGJBZzUJ2YZX/pc
 vkLg==
X-Gm-Message-State: ABy/qLalRV5NEmTAFWSBB+nQPiDpY+AG8ZZzO3p4ZK+EkSfRHTmTKOV8
 gTqhxXKfPXL7jgZLznLR1d0usloTrv0k4nyWE+I=
X-Google-Smtp-Source: APBJJlGjxVTwmQz5phDlYEbRle6I5D71tjqbdvXzLEBdQ/PIrWDu6oYfS76TR2FdN27pcWk2x0pbyPAXAma5uYPlqT8=
X-Received: by 2002:a1f:c485:0:b0:481:3054:1294 with SMTP id
 u127-20020a1fc485000000b0048130541294mr2049077vkf.3.1690169096219; Sun, 23
 Jul 2023 20:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230720171933.404398-1-dbarboza@ventanamicro.com>
 <20230720171933.404398-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230720171933.404398-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 13:24:30 +1000
Message-ID: <CAKmqyKNJco==j+jiievDhSBX_Q6awuAQ8k+cGeQ8RBpH4TduGQ@mail.gmail.com>
Subject: Re: [PATCH for-8.2 v5 01/11] target/riscv/cpu.c: split CPU options
 from riscv_cpu_extensions[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
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

On Fri, Jul 21, 2023 at 3:20=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll add a new CPU type that will enable a considerable amount of
> extensions. To make it easier for us we'll do a few cleanups in our
> existing riscv_cpu_extensions[] array.
>
> Start by splitting all CPU non-boolean options from it. Create a new
> riscv_cpu_options[] array for them. Add all these properties in
> riscv_cpu_add_user_properties() as it is already being done today.
>
> 'mmu' and 'pmp' aren't really extensions in the usual way we think about
> RISC-V extensions. These are closer to CPU features/options, so move
> both to riscv_cpu_options[] too. In the near future we'll need to match
> all extensions with all entries in isa_edata_arr[], and so it happens
> that both 'mmu' and 'pmp' do not have a riscv,isa string (thus, no priv
> spec version restriction). This further emphasizes the point that these
> are more a CPU option than an extension.
>
> No functional changes made.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..9a3afc0482 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1752,7 +1752,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> @@ -1764,15 +1763,8 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>      DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("Zve64d", RISCVCPU, cfg.ext_zve64d, false),
> -    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> -    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>
> -    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> -    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> -
>      DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
>      DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> @@ -1803,9 +1795,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>
>      DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> -    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
>      DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> -    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
> @@ -1849,6 +1839,21 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static Property riscv_cpu_options[] =3D {
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +
> +    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> +    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +
> +    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> +    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +
> +    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> +    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> +
> +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
> +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
> +};
>
>  #ifndef CONFIG_USER_ONLY
>  static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> @@ -1917,6 +1922,14 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>  #endif
>          qdev_property_add_static(dev, prop);
>      }
> +
> +    for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +        /* Check if KVM created the property already */
> +        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +    }
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> --
> 2.41.0
>
>

