Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41299C47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 04:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLF6J-00065V-Rv; Wed, 03 Jan 2024 23:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLF67-00060a-HC; Wed, 03 Jan 2024 23:12:47 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLF65-0000GJ-8U; Wed, 03 Jan 2024 23:12:46 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-dbd73620c82so117127276.2; 
 Wed, 03 Jan 2024 20:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704341563; x=1704946363; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFWt8uZ3RqLe+JuiXGOL0o/DbKD/2hr5XoTPtyTv3e8=;
 b=OzmlU6aUbwz78vOPc/4HLKurgbFDhG96jNQY6/D30YDaT1sOvPqtXSETXZKNFnVfuY
 mxm6I3TuvNevjE28tSS3gBShXEPdnKrml49JNAlBV+ryktp57tG2Tetr+E6MMppgb5aM
 8UC45uJvWy/j1+a99NSg1vE6IHq3Dy+NLxYSvAySbXG4xPtLOk6oxxiraZA8kvvQfKo6
 IirVJSMj00fDbB0BznYIRmqsvcWrKNiMtaM/fN29+FZlkBsjYHGqxz/6C95p7KcRszHA
 b0f+JOwWIjBbiGna6QSn8Kq8Ej4gcNkOMM5eVFJ1V5Azp/DRX4ImGdMraZoRRWnHJ6ba
 seBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704341563; x=1704946363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFWt8uZ3RqLe+JuiXGOL0o/DbKD/2hr5XoTPtyTv3e8=;
 b=YpB7SJp0RoAhUIbOvekAPpQ+52JFxeeyn6vzXgQh7oLAwfR+HTYP0czoaRSpbKsNPS
 mD4q/3svSQ2MBKybiQd2i74CTiAC2A+bsCNX+T6GNkHZZ0k0JGjLWS9UWHvw0ByxgnLQ
 HKo24Cje/tNd2NIM3fd+Z3Fpz9ANRG+9enf2z26eFi4yM7iLFLOOCigl0OndZon6Ae0l
 vRV8kmkLixqsgMVn786NUaHh1iO9v8omGst9UOccZDOAKE0G+46CxYEUt78j81Zz373m
 NSuea9FjodZu50aa6hTy88duXSRTlEsapUd0uOeC83q45XL9h5lAPamX3ZBOA45dZd3q
 RCUQ==
X-Gm-Message-State: AOJu0YxE29iIEPmiO6HrHDs1qCp0T3k5egxt2SAj5PP1esfzo3JOQKgC
 5ik7hLowveO8VjSJA2eEp0Cenk9DsdVYOPEsDCw=
X-Google-Smtp-Source: AGHT+IFRFFXeRASNbWwO3aCnX8nB9fJCC/M2gdbCQgbeXFmjR2197am599/nbwOz00MttzXGR1EN/ZJyuZewRNT+VS4=
X-Received: by 2002:a25:d6d6:0:b0:dbd:ea33:ccc with SMTP id
 n205-20020a25d6d6000000b00dbdea330cccmr46928ybg.9.1704341563659; Wed, 03 Jan
 2024 20:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-6-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 14:12:17 +1000
Message-ID: <CAKmqyKNg7BKrBStrey-mqVO7wP-f5HdekD1ru75+Cdqbubts=g@mail.gmail.com>
Subject: Re: [PATCH v13 05/26] target/riscv: add zicbop extension flag
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=alistair23@gmail.com; helo=mail-yb1-xb2d.google.com
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
> QEMU already implements zicbom (Cache Block Management Operations) and
> zicboz (Cache Block Zero Operations). Commit 59cb29d6a5 ("target/riscv:
> add Zicbop cbo.prefetch{i, r, m} placeholder") added placeholders for
> what would be the instructions for zicbop (Cache Block Prefetch
> Operations), which are now no-ops.
>
> The RVA22U64 profile mandates zicbop, which means that applications that
> run with this profile might expect zicbop to be present in the riscv,isa
> DT and might behave badly if it's absent.
>
> Adding zicbop as an extension will make our future RVA22U64
> implementation more in line with what userspace expects and, if/when
> cache block prefetch operations became relevant to QEMU, we already have
> the extension flag to turn then on/off as needed.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c        | 5 +++++
>  target/riscv/cpu.c     | 3 +++
>  target/riscv/cpu_cfg.h | 2 ++
>  3 files changed, 10 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d2eac24156..da650865e5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -273,6 +273,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s=
, int socket,
>                                    cpu_ptr->cfg.cboz_blocksize);
>          }
>
> +        if (cpu_ptr->cfg.ext_zicbop) {
> +            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbop-block-s=
ize",
> +                                  cpu_ptr->cfg.cbop_blocksize);
> +        }
> +
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv"=
);
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
>          qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 34102f6869..86e3514cc8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -78,6 +78,7 @@ const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF=
, RVD, RVV,
>   */
>  const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
> +    ISA_EXT_DATA_ENTRY(zicbop, PRIV_VERSION_1_12_0, ext_zicbop),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_zicntr),
> @@ -1376,6 +1377,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
>
>      MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
> +    MULTI_EXT_CFG_BOOL("zicbop", ext_zicbop, true),
>      MULTI_EXT_CFG_BOOL("zicboz", ext_zicboz, true),
>
>      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
> @@ -1510,6 +1512,7 @@ Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
> +    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 6=
4),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..bd2ff87cc8 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -65,6 +65,7 @@ struct RISCVCPUConfig {
>      bool ext_zicntr;
>      bool ext_zicsr;
>      bool ext_zicbom;
> +    bool ext_zicbop;
>      bool ext_zicboz;
>      bool ext_zicond;
>      bool ext_zihintntl;
> @@ -142,6 +143,7 @@ struct RISCVCPUConfig {
>      uint16_t vlen;
>      uint16_t elen;
>      uint16_t cbom_blocksize;
> +    uint16_t cbop_blocksize;
>      uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
> --
> 2.43.0
>
>

