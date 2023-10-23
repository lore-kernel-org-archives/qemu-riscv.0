Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AE3CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 13:16:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quumt-0001hr-Ce; Mon, 23 Oct 2023 09:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quumr-0001gn-P5
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 09:16:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quumc-0001xw-Im
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 09:16:05 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so4812865a12.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698066933; x=1698671733; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lp5XgaTGAYLEPcb3FwiHHF0cU/aMySfDzag4MhUqsT4=;
 b=AWQ059UYmSPE6D/Zt0sttXdcRxqL8dSHxokolBzJGiNMF8L1IEr4Od7m0GSo0LSbRX
 RrfEfsG9BtDj8BgQk2AD4o/dtpblp6Kdi1r1VkAjvMrAS1WcJzLnUg5Ynt8w9U8uP2ID
 6bSHTdwiEuqKLiopmxMtmy+bbZw7bdmy5XOCpuSbv7o3rIYNmNSlQ6ZOGqHM1slM8kjm
 rJK4I0PB6rtHSNVQO5fW5FBHcpm+5LEDQtH4l+L4m4wYGDYrStDKQzlLA0PHwHL4jYRh
 dcP527oWwscqYBhDx9NtzjaycGHdKj0AUho/kJSKI+7vlxfIY75+rkg8h3X/H9a/b50j
 TJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698066933; x=1698671733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lp5XgaTGAYLEPcb3FwiHHF0cU/aMySfDzag4MhUqsT4=;
 b=Y4MXSsIGwOjwqJ1eBoOChVuA8pvm/9G2L3idmM0QdKnXQJchknBbfxM313zJQn04wA
 JDSZZeF2XlV8D54AwLim1ToHa9jT7b3w4bW9qahfnlJKLDBP86hEbFc4oYOgiZxSj2uP
 lmWB7/p8yBChKaH3ai66Q2vwxEAIuRurvClmcJC/VhYV7CJfidUGkelbDi1WKaVYIzeV
 6cqvgUenOkJcYNV5ZPQYZpfm7nHDpL5iIJfbGHpe6Oa64NyaAIs9mP/kVjCKyULF7tVb
 TavuL1nIY86AHJ7xHpc4cDAMkrNAEip530Ei0qw5g/hjQmFp/dQa+lbh9egLm543Goro
 ir4Q==
X-Gm-Message-State: AOJu0YxMmEwWLUIzE+bKLQRIVAh77pe6Ave9mF/o6G9yXHtV19kqcazY
 E4ou9SbvZuW5OlJPYo2cFG1T5g==
X-Google-Smtp-Source: AGHT+IGbeXtrBbhU/UVaYwF2o+YRVN/Rrt8SRZp31Muk4gVnypNf64dXDoYPDXBqjoKBWIxx1DS8gA==
X-Received: by 2002:a17:907:1b0a:b0:9a6:1446:852c with SMTP id
 mp10-20020a1709071b0a00b009a61446852cmr8633702ejc.27.1698066933263; 
 Mon, 23 Oct 2023 06:15:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a1709063bd200b009737b8d47b6sm6557416ejf.203.2023.10.23.06.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:15:32 -0700 (PDT)
Date: Mon, 23 Oct 2023 15:15:31 +0200
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
Subject: Re: [PATCH v3 08/12] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Message-ID: <20231023-03c45516db7d8bf69f5eaf4c@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-9-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Oct 19, 2023 at 06:56:44PM +0530, Sunil V L wrote:
> MMU type information is available via MMU node in RHCT. Add this node in
> RHCT.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index bf47eef792..4895c9669d 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -159,6 +159,8 @@ static void build_rhct(GArray *table_data,
>      size_t len, aligned_len;
>      uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
>      RISCVCPU *cpu = &s->soc[0].harts[0];
> +    uint32_t mmu_offset = 0;
> +    uint8_t satp_mode_max;
>      char *isa;
>  
>      AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> @@ -178,6 +180,10 @@ static void build_rhct(GArray *table_data,
>          num_rhct_nodes++;
>      }
>  
> +    if (cpu->cfg.satp_mode.supported != 0) {
> +        num_rhct_nodes++;
> +    }
> +
>      /* Number of RHCT nodes*/
>      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
>  
> @@ -203,6 +209,26 @@ static void build_rhct(GArray *table_data,
>          build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
>      }
>  
> +    /* MMU node structure */
> +    if (cpu->cfg.satp_mode.supported != 0) {
> +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +        mmu_offset = table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 2, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 8, 2);    /* Total Length */

The comment for the above line should be "Length"

> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +        /* Virtual Address Scheme */

The above comment should be "MMU Type"

> +        if (satp_mode_max == VM_1_10_SV57) {
> +            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
> +        } else if (satp_mode_max == VM_1_10_SV48) {
> +            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
> +        } else if (satp_mode_max == VM_1_10_SV39) {
> +            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
> +        } else {
> +            assert(1);
> +        }
> +    }
> +
>      /* CMO node */
>      if (cpu->cfg.ext_zicbom || cpu->cfg.ext_zicboz) {
>          cmo_offset = table_data->len - table.table_offset;
> @@ -245,6 +271,11 @@ static void build_rhct(GArray *table_data,
>              num_offsets++;
>          }
>  
> +        if (mmu_offset) {
> +            len += 4;
> +            num_offsets++;
> +        }
> +
>          build_append_int_noprefix(table_data, len, 2);
>          build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
>          /* Number of offsets */
> @@ -253,9 +284,14 @@ static void build_rhct(GArray *table_data,
>  
>          /* Offsets */
>          build_append_int_noprefix(table_data, isa_offset, 4);
> +
>          if (cmo_offset) {
>              build_append_int_noprefix(table_data, cmo_offset, 4);
>          }
> +
> +        if (mmu_offset) {
> +            build_append_int_noprefix(table_data, mmu_offset, 4);
> +        }

I'd put the mmu_offset above the cmo_offset so the offsets are in
ascending order.

>      }
>  
>      acpi_table_end(linker, &table);
> -- 
> 2.34.1
> 

Thanks,
drew

