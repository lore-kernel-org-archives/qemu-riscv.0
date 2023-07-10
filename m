Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905E7EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:33:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgiZ-0004tg-85; Sun, 09 Jul 2023 22:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgiW-0004si-WD; Sun, 09 Jul 2023 22:33:37 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgiV-0002lO-I3; Sun, 09 Jul 2023 22:33:36 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-45739737afcso988988e0c.2; 
 Sun, 09 Jul 2023 19:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688956414; x=1691548414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLV0qv5BROy6aKqxRxlqpspvmIHhAB5vrPmjH1PsNHo=;
 b=WWIbGLXO4gs44W/MNU5NNbv+eTqxR+S2aiKYGVSLtzEvxctTwyzK/gOl/i/v1sN+N4
 PVBvZDZrE5fCtFQPmv9SWaV862are/rnlUYK7MuQvJASlEpV35oao83/H5c7lVZqp3Hh
 5FXlgSboOml7nPa4z9DUd5O28CT01g3PMypDdvz9u5RO/KTkaTW+NDGGAWpl2mKFui57
 jSWi6rpvdRgAOYhueGRgHo/70hNyGkvHGLKTyBUKlkU3nWZv5a7ecqE9Wrc2RQcC6IPk
 tl7zGYd6ZSDMbhi+j2NntTxr4OIcXFFD76kGAd/jbXH+HEQVBaqjG+isWmkF8csQrfQM
 +X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688956414; x=1691548414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLV0qv5BROy6aKqxRxlqpspvmIHhAB5vrPmjH1PsNHo=;
 b=VcyHIhLLwrg/Z337IHxsoB8xMwVf7a1V8mfZDr8InMiwb8st7jHHPDB4Mz83K2Judf
 CZ/ScjXfJ4xL9Eljy02lzJzF4wxGLGGPzYFyO/SfRmzh80MFShVwSGNWh7x3PbrKHWhX
 8bGTUuu0uZNrcr/WVcZegr1UQ2QAMdkWYkhA0BVUjed7rQqBFQAoQHc0o3N65FCUEXvc
 UVxrvsjb8CnhuKrCpwlmDyi8sBSZJzYgRVZB58mxRzBwJoWubRjcT352jiZo466+bqcR
 KMdNk7XqnneVYiZc3iWUdk0iOwbAzr31W8Gs9hQFBrfbHc3/Rw+T9DQ2lloqcGBINWJ/
 ZUjg==
X-Gm-Message-State: ABy/qLbB0X2wQ09EteRfBo+mAvFtEFAbZyVE6fGl9WPud51UYex9FL+R
 Ld0GfWtbqu5tq7oBK/PuYufIBQGKIUGGlvzhzwA=
X-Google-Smtp-Source: APBJJlEn2O5QOSvcwCWIiG2jMHAgpdbbPNOjvLPVZ2BJd09uI2YYKrrrItQ+0TxFUCioAn7glQCf2Yv+t5z1TaBB2T0=
X-Received: by 2002:a67:ffcf:0:b0:443:53fe:3d85 with SMTP id
 w15-20020a67ffcf000000b0044353fe3d85mr3183951vsq.5.1688956414226; Sun, 09 Jul
 2023 19:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-20-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-20-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:33:08 +1000
Message-ID: <CAKmqyKMdznN_oCLUhnQnga+5ertxby_rA+e0dSAyGoGoWKmLeQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/20] target/riscv/kvm.c: add kvmconfig_get_cfg_addr()
 helper
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Thu, Jul 6, 2023 at 8:19=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There are 2 places in which we need to get a pointer to a certain
> property of the cpu->cfg struct based on property offset. Next patch
> will add a couple more.
>
> Create a helper to avoid repeating this code over and over.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index ba940e570e..cfeab5a4c0 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -215,11 +215,15 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
>  };
>
> +static void *kvmconfig_get_cfg_addr(RISCVCPU *cpu, KVMCPUConfig *kvmcfg)
> +{
> +    return (void *)&cpu->cfg + kvmcfg->offset;
> +}
> +
>  static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
>                              uint32_t val)
>  {
> -    int cpu_cfg_offset =3D multi_ext->offset;
> -    bool *ext_enabled =3D (void *)&cpu->cfg + cpu_cfg_offset;
> +    bool *ext_enabled =3D kvmconfig_get_cfg_addr(cpu, multi_ext);
>
>      *ext_enabled =3D val;
>  }
> @@ -227,8 +231,7 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConf=
ig *multi_ext,
>  static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
>                                  KVMCPUConfig *multi_ext)
>  {
> -    int cpu_cfg_offset =3D multi_ext->offset;
> -    bool *ext_enabled =3D (void *)&cpu->cfg + cpu_cfg_offset;
> +    bool *ext_enabled =3D kvmconfig_get_cfg_addr(cpu, multi_ext);
>
>      return *ext_enabled;
>  }
> --
> 2.41.0
>
>

