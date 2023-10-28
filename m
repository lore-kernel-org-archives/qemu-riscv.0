Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB13C0032E
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 09:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwfwK-00060r-QQ; Sat, 28 Oct 2023 05:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwfwJ-00060Z-DP
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 05:49:07 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qwfwH-0004DB-OV
 for qemu-riscv@nongnu.org; Sat, 28 Oct 2023 05:49:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53e2dc8fa02so4867276a12.2
 for <qemu-riscv@nongnu.org>; Sat, 28 Oct 2023 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698486544; x=1699091344; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XNFQZ3Jy0hCSVyUTYAHN8B9Xml1+riL2EGmiayzC2LU=;
 b=JtBWTJg0D+E6JoINf9Tpgf1YNKssRuajZejJLQwrqtCFHY4SfOmOLMdFQrb9UQ+E/k
 q3dXaKRACemwUUK10YvB2tdBESBS/u1jfuEEISRo963z7+d/Hqg3p7aTr02BHSkVqjNv
 uwIiyRID+cFGmrh8hkbbS3Jr83LmAOifDJCyUzL+YS9mzGncN3P6SCMF/xo+2yUtG/Rg
 Db4i3yKWQyaGHC5n0O/ydtwa8e05atzD4XhELJEu2Zm3FPQQcJokK5tdJRp82G1SGUxo
 ol6prJcGilWYlQQ8bRXZoF2wdhHgeH9akDd5i29jqZKSvocTuqbd8TSz06coDsrQQL6e
 6VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698486544; x=1699091344;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNFQZ3Jy0hCSVyUTYAHN8B9Xml1+riL2EGmiayzC2LU=;
 b=q1517SLNLWXbJFpGc/yhuAQTxVFDmt9bf4XhzYJuMWOTfcmEMAsrSE6Agihn/3v30N
 9qUVq+y17Hfyz+Ub7ukhqM24Nb8JB8Zp0M81YQhYz1Tf1xGGPMmamOmbrtwKeYoO32AD
 AtlNnsj5dc3TBDIfab3782GYv/saOIJrkTqaFNCufAiSZuLDFbYMd4fQ+pqLsGv60iXo
 P5si7GWLYFTbQtfWSiuhMmh99ezZyq4prK0aBSMQGSwIogEyHXgdmLOjYaCLsbmVT7w2
 EoSQlnnD/vK0d5z0Kc+etcovb5FKBNFV2WTIx9snJsYl447UxeIsmMuOjk5mWhGzRf9J
 slfg==
X-Gm-Message-State: AOJu0YxfQxqN5eOJx6J98aL/WzAZtV4HEJaukyk30nDR4GIqXg42PGGn
 Ysf5xvQsO/4p1BOCKuo0Go6Gw0NcOJh10nwg1hk=
X-Google-Smtp-Source: AGHT+IE376z8dwGHHnjNMJckG5j8/sS/iCTKT2fUN5w4vdIkY2QeNG3nYrl7tYTJjizmYGU5YIYM6g==
X-Received: by 2002:aa7:d8cc:0:b0:53f:8493:5b0b with SMTP id
 k12-20020aa7d8cc000000b0053f84935b0bmr3889827eds.35.1698486543687; 
 Sat, 28 Oct 2023 02:49:03 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7d8ca000000b0053d9f427a6bsm2604271eds.71.2023.10.28.02.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 02:49:03 -0700 (PDT)
Date: Sat, 28 Oct 2023 11:49:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v6 01/12] target/riscv: add zicbop extension flag
Message-ID: <20231028-2d6bf00dddc7bc4a25b32663@orel>
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028085427.707060-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Oct 28, 2023 at 05:54:16AM -0300, Daniel Henrique Barboza wrote:
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
> ---
>  hw/riscv/virt.c        | 5 +++++
>  target/riscv/cpu.c     | 3 +++
>  target/riscv/cpu_cfg.h | 2 ++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 1732c42915..99c087240f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -273,6 +273,11 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>                                    cpu_ptr->cfg.cboz_blocksize);
>          }
>  
> +        if (cpu_ptr->cfg.ext_zicbop) {
> +            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbop-block-size",

I think we need to get this node approved by devicetree@vger.kernel.org
and merged into [1] first.

[1] Linux repo: Documentation/devicetree/bindings/riscv/cpus.yaml

> +                                  cpu_ptr->cfg.cbop_blocksize);
> +        }
> +
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
>          qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f40da4c661..6c0050988f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -78,6 +78,7 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>   */
>  const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
> +    ISA_EXT_DATA_ENTRY(zicbop, PRIV_VERSION_1_12_0, ext_zicbop),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_zicntr),
> @@ -1336,6 +1337,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
>  
>      MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
> +    MULTI_EXT_CFG_BOOL("zicbop", ext_zicbop, true),
>      MULTI_EXT_CFG_BOOL("zicboz", ext_zicboz, true),
>  
>      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
> @@ -1424,6 +1426,7 @@ Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>  
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> +    DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
>  
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 6eef4a51ea..2203b4c45b 100644
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
> @@ -134,6 +135,7 @@ struct RISCVCPUConfig {
>      uint16_t vlen;
>      uint16_t elen;
>      uint16_t cbom_blocksize;
> +    uint16_t cbop_blocksize;
>      uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
> -- 
> 2.41.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

