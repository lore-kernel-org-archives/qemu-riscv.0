Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D081EC369C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:20:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7BfC-00027Q-8T; Tue, 22 Apr 2025 07:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u7Bf9-00026J-RJ
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 07:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u7Bf3-0005i2-HC
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 07:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745320770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lsdmIFtX99VQcGuR1LBZf7rR8W5MrQzqwjTqq52/G6A=;
 b=epDWcMYRkc/bE0XOJ5b8+IyhzbgjWXnE/brx+yWpfZhpZEM7sQsT0gI4TZErf0108jlYzw
 tpzpFsoTcxhH5i79dx6QULUKzoK5anq0MQU82lY5fBzjHKvl6NiiQqnvCUKi7BWpzwY/1m
 vaB/kIHScR+gHjxBuy7D/FtLElOH8zQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-3cp9-jEjNF2n6HYM-pM32Q-1; Tue, 22 Apr 2025 07:19:29 -0400
X-MC-Unique: 3cp9-jEjNF2n6HYM-pM32Q-1
X-Mimecast-MFC-AGG-ID: 3cp9-jEjNF2n6HYM-pM32Q_1745320768
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43efa869b19so30552405e9.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Apr 2025 04:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745320768; x=1745925568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsdmIFtX99VQcGuR1LBZf7rR8W5MrQzqwjTqq52/G6A=;
 b=oeSQaXASh4d0pdmByBWF8Gp53OSLR7HwSqXoeB8ZRy6yWo79C3pmOQ5tspEdjA2Fya
 E4be9c8zPq9LlKIL5rBl9Hnp0QJc+FQpWSvjRYXslRAC3APjMK/U31DIx3nOMmhFGbn7
 0JBSuzIhuXAITOvbZ7oBU61Na/sOitXa0CyNYTIKMCnviNNz1AJ2XITuZRJyxJ+MEYfW
 kOGxzE5HOjIr+6u3fitKel8NDCC5GFKbO8Vke0T4IWr30Go3KjVg5BKdWRPgauk8pAz3
 MsskOvih/BI7/a4Mcx0iiltU7S3DObubGY+TzKOC48Os399DjBnyvF4AhvxQtHVn0gIl
 /Mmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAO0QK0Ob1kor3e7kXe3z1d3vu9jP2Yrwh47Z4rcTducch46VuAjq4FgOQx/uA+ZOIrTQLGJu7xNv3@nongnu.org
X-Gm-Message-State: AOJu0Yy/TyGVgWOiC38Tjvz/Eobh2IKYAnBwv6so3o4NFGralvUwnOKI
 BtxGsXs3/EN3B0wewU8fbdvuNIWrNEJLSaGB4xyFvfASCiHaQcSJ6EOng0rprP3pI8Ap5TqF4t0
 5hP1m4s6WiqvYaDEtR/V5E5IAnKXyj/+SXjk50ucyvMVdkLUMUfAj
X-Gm-Gg: ASbGncvQEk3GNT9PRqoo9m/S/sKEyOf4+bDWCXSrV04wKZBYLqbL6k1mlTWOoBQ3TB8
 NS3XSzNTdAd8CA5doj3zoX1crQl3ZX4hPCv1R4t499epIltaNVXozroDVY97xHdg9AZrogPAqUO
 bd1PWJr55v/Lv1mxcI41VY2cyftfrBQZJMcUantbxkE+KU3MvOliEn259v86qZza2bHdyOW4sDn
 vuuxFK8Sn7BzUfSPuQoH/y9xUys2jNRKT3x333fiBBfTuCWDrzxFsDkXD2hCovzjagkf7ZzoaXe
 xhGz1A==
X-Received: by 2002:a05:600c:444e:b0:43c:fe9f:ab90 with SMTP id
 5b1f17b1804b1-4406ac17342mr101370675e9.28.1745320767770; 
 Tue, 22 Apr 2025 04:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgLC3SWsjAkWbXnn2rnb/1Pc98w1aii9oSgY/gpPlfphDfYQCqRSzXBou6osTCJQNwJ1DNgg==
X-Received: by 2002:a05:600c:444e:b0:43c:fe9f:ab90 with SMTP id
 5b1f17b1804b1-4406ac17342mr101370305e9.28.1745320767397; 
 Tue, 22 Apr 2025 04:19:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6db230sm171907035e9.31.2025.04.22.04.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:19:26 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:19:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?=22Philippe_Mathieu-Daud=E9=22?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH] acpi: Add machine option to disable SPCR table
Message-ID: <20250422071902-mutt-send-email-mst@kernel.org>
References: <87a588wsc9.wl-me@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <87a588wsc9.wl-me@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q0kBgVkb1V5TP_L6uKCe-9_yk9OOn7JK0eTD1VYDHjg_1745320768
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 22, 2025 at 03:47:18PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The ACPI SPCR (Serial Port Console Redirection) table allows firmware
> to specify a preferred serial console device to the operating system.
> On ARM64 systems, Linux by default respects this table: even if the
> kernel command line does not include a hardware serial console (e.g.,
> "console=ttyAMA0"), the kernel still register the serial device
> referenced by SPCR as a printk console.
> 
> While this behavior is standard-compliant, it can lead to situations
> where guest console behavior is influenced by platform firmware rather
> than user-specified configuration. To make guest console behavior more
> predictable and under user control, this patch introduces a machine
> option to explicitly disable SPCR table exposure:
> 
>     -machine spcr=off
> 
> By default, the option is enabled (spcr=on), preserving existing
> behavior. When disabled, QEMU will omit the SPCR table from the guest's
> ACPI namespace, ensuring that only consoles explicitly declared in the
> kernel command line are registered.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>


The patches look ok to me

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/arm/virt-acpi-build.c       |  5 ++++-
>  hw/core/machine.c              | 22 ++++++++++++++++++++++
>  hw/loongarch/virt-acpi-build.c |  4 +++-
>  hw/riscv/virt-acpi-build.c     |  5 ++++-
>  include/hw/boards.h            |  1 +
>  qemu-options.hx                |  5 +++++
>  6 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e178..f25c3b26ce 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -940,7 +940,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    spcr_setup(tables_blob, tables->linker, vms);
> +
> +    if (ms->enable_spcr) {
> +        spcr_setup(tables_blob, tables->linker, vms);
> +    }
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_dbg2(tables_blob, tables->linker, vms);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63c6ef93d2..d56f44f4e8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -590,6 +590,20 @@ static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
>      ms->nvdimms_state->is_enabled = value;
>  }
>  
> +static bool machine_get_spcr(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->enable_spcr;
> +}
> +
> +static void machine_set_spcr(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->enable_spcr = value;
> +}
> +
>  static bool machine_get_hmat(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> @@ -1294,6 +1308,14 @@ static void machine_initfn(Object *obj)
>                                          "Table (HMAT)");
>      }
>  
> +    /* SPCR */
> +    ms->enable_spcr = true;
> +    object_property_add_bool(obj, "spcr", machine_get_spcr, machine_set_spcr);
> +    object_property_set_description(obj, "spcr",
> +                                   "Set on/off to enable/disable "
> +                                   "ACPI Serial Port Console Redirection "
> +                                   "Table (spcr)");
> +
>      /* default to mc->default_cpus */
>      ms->smp.cpus = mc->default_cpus;
>      ms->smp.max_cpus = mc->default_cpus;
> diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
> index fced6c445a..0e437bcf25 100644
> --- a/hw/loongarch/virt-acpi-build.c
> +++ b/hw/loongarch/virt-acpi-build.c
> @@ -557,7 +557,9 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      acpi_add_table(table_offsets, tables_blob);
>      build_srat(tables_blob, tables->linker, machine);
>      acpi_add_table(table_offsets, tables_blob);
> -    spcr_setup(tables_blob, tables->linker, machine);
> +
> +    if (machine->enable_spcr)
> +        spcr_setup(tables_blob, tables->linker, machine);
>  
>      if (machine->numa_state->num_nodes) {
>          if (machine->numa_state->have_numa_distance) {
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 1ad6800508..7f6d221c63 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -680,7 +680,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      build_rhct(tables_blob, tables->linker, s);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    spcr_setup(tables_blob, tables->linker, s);
> +
> +    if (ms->enable_spcr) {
> +        spcr_setup(tables_blob, tables->linker, s);
> +    }
>  
>      acpi_add_table(table_offsets, tables_blob);
>      {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f22b2e7fc7..cdf2791a50 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -444,6 +444,7 @@ struct MachineState {
>      SmpCache smp_cache;
>      struct NVDIMMState *nvdimms_state;
>      struct NumaState *numa_state;
> +    bool enable_spcr;
>  };
>  
>  /*
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dc694a99a3..953680595f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                nvdimm=on|off controls NVDIMM support (default=off)\n"
>      "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
>      "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> +    "                spcr=on|off controls ACPI SPCR support (default=on)\n"
>  #ifdef CONFIG_POSIX
>      "                aux-ram-share=on|off allocate auxiliary guest RAM as shared (default: off)\n"
>  #endif
> @@ -105,6 +106,10 @@ SRST
>          Enables or disables ACPI Heterogeneous Memory Attribute Table
>          (HMAT) support. The default is off.
>  
> +    ``spcr=on|off``
> +        Enables or disables ACPI Serial Port Console Redirection Table
> +        (SPCR) support. The default is on.
> +
>      ``aux-ram-share=on|off``
>          Allocate auxiliary guest RAM as an anonymous file that is
>          shareable with an external process.  This option applies to
> -- 
> 2.49.0


