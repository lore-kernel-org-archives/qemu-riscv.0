Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A498C001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 13:17:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quuoL-0003mm-2e; Mon, 23 Oct 2023 09:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuoC-0003kc-I3
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 09:17:29 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuoA-0002Ek-H8
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 09:17:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso468136666b.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698067045; x=1698671845; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=08Ns5r0OQR+V9W8vMSPerOUKx+75ry4tY92zwJak5PU=;
 b=JqLZnf1c8wutxBxgZaASw0k8SE18Q1uuD78bsFGrAUMQgZf3+zyFAhiZ0KqtqXPEV2
 A+nWw0dpGGWLEh13sfzPkMQ42aNapOQWqRX5XoqEO8Jr3iqWQbGOwzYsxHyafb35xMiA
 C/zWuwChjpvfhvgIFO4xJWg7EWCa9QB5A2pX6MAKIwimpJIgYRu0M4YWnQQeSVdc/MOK
 7j4K1UWeO2IY1NXP9KNSUfYbN5U14yd2SO0jWXMO4NN5tW4bkcMeUraaqs1j7xTRKl5O
 HdksOkGF6+ELOaiEAmrMiBwPReuAb8HKPOug/nfVrDCzHO/cCOApASz04HUtccQBjPxN
 yH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698067045; x=1698671845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=08Ns5r0OQR+V9W8vMSPerOUKx+75ry4tY92zwJak5PU=;
 b=IofUgery9ecIEcxlRW7Kq0SAKDy7bgeGtwJTGhz0VGc2ESubSstTAfZTFRHv5Xcvyp
 UmcsALlfbk8udkeTQV3CjF/I22Mspz8ZDLbRmaiZaulnqeq6tsNwUFxiPg42NhkdjNMD
 6Fuoy/lZVedntRQwiyzyS0BiU2/wo/4vtSpgwIXDo2IjZXBCFGSy7y4zt1tp3nsghPiP
 cKf2lPw255HsihOOQZXPgH/20DuQrDJbSRJlbxhwx1DdyH8UT3+hJ6Esca8XvGKcxZ42
 vaqVJSDWpP8nTNGtRnMxoq0Yj5TuzMw0knbZGl9CDv/5Rtg38WoUnnG2ZLUgDhBbURCr
 HHMA==
X-Gm-Message-State: AOJu0YzdL+hl5wfmfnVkJBbD3QBqsRcf+pv9cVb2Il62qWKuQm5njTYQ
 iJjAZ2+U7URYmAfbVA1bk8DwQQ==
X-Google-Smtp-Source: AGHT+IEdwwp5LYwZqnIgGG1Ta3aKIjOW+MS6MmJR7kaSzA1uQQqqSLm8ztvCDAvZqYo8qlDXsi6ThA==
X-Received: by 2002:a17:907:25c3:b0:9ae:5c99:f2e2 with SMTP id
 ae3-20020a17090725c300b009ae5c99f2e2mr6997333ejc.43.1698067044174; 
 Mon, 23 Oct 2023 06:17:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ga23-20020a170906b85700b009b65b2be80bsm6611455ejb.76.2023.10.23.06.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:17:23 -0700 (PDT)
Date: Mon, 23 Oct 2023 15:17:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v3 07/12] hw/riscv/virt-acpi-build.c: Add CMO information
 in RHCT
Message-ID: <20231023-c3b85e7af47edaaba7eedd6e@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-8-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Oct 19, 2023 at 06:56:43PM +0530, Sunil V L wrote:
> When CMO related extensions like Zicboz, Zicbom and Zicbop are enabled, the
> block size for those extensions need to be communicated via CMO node in
> RHCT. Add CMO node in RHCT if any of those CMO extensions are detected.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 8fa358d034..bf47eef792 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -147,6 +147,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>   * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
>   * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
>   *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> + *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
>   */
>  static void build_rhct(GArray *table_data,
>                         BIOSLinker *linker,
> @@ -156,8 +157,8 @@ static void build_rhct(GArray *table_data,
>      MachineState *ms = MACHINE(s);
>      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
>      size_t len, aligned_len;
> -    uint32_t isa_offset, num_rhct_nodes;
> -    RISCVCPU *cpu;
> +    uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
> +    RISCVCPU *cpu = &s->soc[0].harts[0];
>      char *isa;
>  
>      AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> @@ -173,6 +174,9 @@ static void build_rhct(GArray *table_data,
>  
>      /* ISA + N hart info */
>      num_rhct_nodes = 1 + ms->smp.cpus;
> +    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
> +        num_rhct_nodes++;
> +    }
>  
>      /* Number of RHCT nodes*/
>      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> @@ -184,7 +188,6 @@ static void build_rhct(GArray *table_data,
>      isa_offset = table_data->len - table.table_offset;
>      build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
>  
> -    cpu = &s->soc[0].harts[0];
>      isa = riscv_isa_string(cpu);
>      len = 8 + strlen(isa) + 1;
>      aligned_len = (len % 2) ? (len + 1) : len;
> @@ -200,14 +203,59 @@ static void build_rhct(GArray *table_data,
>          build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
>      }
>  
> +    /* CMO node */
> +    if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
> +        cmo_offset = table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 1, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 10, 2);   /* Total Length */

Comment should be "Length"

> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +
> +        /* CBOM block size */
> +        if (cpu->cfg.cbom_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cbom_blocksize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +
> +        /* CBOP block size */
> +        build_append_int_noprefix(table_data, 0, 1);
> +
> +        /* CBOZ block size */
> +        if (cpu->cfg.cboz_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cboz_blocksize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +    }
> +
>      /* Hart Info Node */
>      for (int i = 0; i < arch_ids->len; i++) {
> +        len = 16;
> +        int num_offsets = 1;
>          build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> -        build_append_int_noprefix(table_data, 16, 2);      /* Length */
> -        build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
> -        build_append_int_noprefix(table_data, 1, 2);    /* Number of offsets */
> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> -        build_append_int_noprefix(table_data, isa_offset, 4); /* Offsets[0] */
> +
> +        /* Length */
> +        if (cmo_offset) {
> +            len += 4;
> +            num_offsets++;
> +        }
> +
> +        build_append_int_noprefix(table_data, len, 2);

Missing "Length" comment

> +        build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
> +        /* Number of offsets */
> +        build_append_int_noprefix(table_data, num_offsets, 2);
> +        build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
> +
> +        /* Offsets */
> +        build_append_int_noprefix(table_data, isa_offset, 4);
> +        if (cmo_offset) {
> +            build_append_int_noprefix(table_data, cmo_offset, 4);
> +        }
>      }
>  
>      acpi_table_end(linker, &table);
> -- 
> 2.34.1
>

Thanks,
drew

