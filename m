Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FB1C47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 08:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rSC4Z-0002ry-VT; Tue, 23 Jan 2024 03:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rSC4R-0002r0-Im
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 03:23:48 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rSC4P-0000lv-PK
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 03:23:47 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a309c0a5593so93746166b.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705998224; x=1706603024; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dHnU/nzV7DPsamUGUinSJKtU7QrnA00vcPkRG5ndcqE=;
 b=dh31SttJZ62nxlkxqgKYOSb8MW4tKRrb0nvnwfJdTm/5u6IxjLaacJ2zymp0nfxxWP
 mOxfXoUuaceqh1vyR0rbia8SF4P4xREp9tL0MojRCkDhdZyevrk1sXkOlk6Dwh5eH0Sa
 T722RzV/rPRVV4nH+2sbfxvPJ/Vvgm7tVxns+LvzoRDLAoDUDxgIBErflVz6iuinzs6i
 s1S+ypLwtzUGOp2jvAhitlDGgIMJjd2q/ePcmBeH6lENx2rg3daJ/nuDixsTjeDFbGsX
 c+FiZ+3r9NsvdiBCkciv/lAUNsD3TYw4rzGpBBqhHI4Y1lETTa9QKS8165QgkOd0Cwgg
 H5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705998224; x=1706603024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHnU/nzV7DPsamUGUinSJKtU7QrnA00vcPkRG5ndcqE=;
 b=Fn/A+cRDDDwtpY7psMvMLV7lqyoafvR6ajuiC5K/otfkcwBxq++36gVzCzo2MJfILW
 c4JlvmhYnTp2g/J1swpGUCuVQOjIjMDpDqB8juK3Ob0z/4xkCn3z2UdetUf5ySCvbALC
 /HIrBTyQLGXRX0Nu1oBgxgyhbdW7X8lBF372u38BKpA07SFEpXmEyCyEg8aA3lJGob/N
 Rw3YLHnsYadUdA12LGkVjRG/7bhCElvDHgjwdy+vpMN452T1c318ySN5Tts8Ym4et7a+
 pDrWXbcJI2KXkPIlQZmAR0SRfxHbKPvBEXAoZxA4mhXP7st+aRM07nKiniNozbuMFEVm
 KSrw==
X-Gm-Message-State: AOJu0YxaR6RmM+Hn/IPyhmtXgzdU35S937Tc53WQnfdisw4nEwECot/T
 GHwOMcQh0JK4LySQSWUMX/YSg1hKJ6G1prFgZkrgnY23ShBuwC122RyzAO+ORJw=
X-Google-Smtp-Source: AGHT+IHG47r2X8sSckZoJXCdtDdXGTJyzZdcaRUyyHp/mzVF5X0hgN68zDN5klS1or4YFX0oN0cVaA==
X-Received: by 2002:a17:906:380e:b0:a30:b244:b09d with SMTP id
 v14-20020a170906380e00b00a30b244b09dmr216986ejc.131.1705998224139; 
 Tue, 23 Jan 2024 00:23:44 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 vh12-20020a170907d38c00b00a2eb648cdc5sm7401905ejc.156.2024.01.23.00.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 00:23:43 -0800 (PST)
Date: Tue, 23 Jan 2024 09:23:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/4] target/riscv: SMBIOS support for RISC-V virt
 machine
Message-ID: <20240123-080e9bffa2481da1c2065c4e@orel>
References: <20240122130758.74051-1-heinrich.schuchardt@canonical.com>
 <20240122130758.74051-4-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122130758.74051-4-heinrich.schuchardt@canonical.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jan 22, 2024 at 02:07:57PM +0100, Heinrich Schuchardt wrote:
> Generate SMBIOS tables for the RISC-V mach-virt.
> Add CONFIG_SMBIOS=y to the RISC-V default config.
> Set the default processor family in the type 4 table.
> 
> The implementation is based on the corresponding ARM and Loongson code.
> 
> With the patch the following firmware tables are provided:
> 
>     etc/smbios/smbios-anchor
>     etc/smbios/smbios-tables
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v3:
> 	use misa_mxl_max to determine bitness
> v2:
> 	set processor family
> ---
>  hw/riscv/Kconfig |  1 +
>  hw/riscv/virt.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index a50717be87..5d644eb7b1 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -41,6 +41,7 @@ config RISCV_VIRT
>      select RISCV_IMSIC
>      select SIFIVE_PLIC
>      select SIFIVE_TEST
> +    select SMBIOS
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
>      select PLATFORM_BUS
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index f9fd1341fc..1b333af4f0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -36,6 +36,7 @@
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
>  #include "kvm/kvm_riscv.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/riscv_aplic.h"
>  #include "hw/intc/sifive_plic.h"
> @@ -1263,6 +1264,47 @@ static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
>                                  sysbus_mmio_get_region(sysbus, 0));
>  }
>  
> +static void virt_build_smbios(RISCVVirtState *s)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(s);
> +    MachineState *ms = MACHINE(s);
> +    uint8_t *smbios_tables, *smbios_anchor;
> +    size_t smbios_tables_len, smbios_anchor_len;
> +    struct smbios_phys_mem_area mem_array;
> +    const char *product = "QEMU Virtual Machine";
> +
> +    if (kvm_enabled()) {
> +        product = "KVM Virtual Machine";
> +    }
> +
> +    smbios_set_defaults("QEMU", product, mc->name, false,
> +                        true, SMBIOS_ENTRY_POINT_TYPE_64);
> +
> +    if (riscv_is_32bit(&s->soc[0])) {

I just saw [1], but I think riscv_is_32bit() is still appropriate,
since, at the time SMBIOS tables are built, the effective mxl will
be set to the max mxl.

[1] 20240122145610.413836-2-alex.bennee@linaro.org

> +        smbios_set_default_processor_family(0x200);
> +#if defined(TARGET_RISCV64)
> +    } else {
> +        smbios_set_default_processor_family(0x201);
> +#endif

Despite the #ifdef being in riscv_cpu_validate_misa_mxl(), I'd drop it
here. I didn't see any riscv_is_32bit() call sites which do this.

Thanks,
drew

> +    }
> +
> +    /* build the array of physical mem area from base_memmap */
> +    mem_array.address = s->memmap[VIRT_DRAM].base;
> +    mem_array.length = ms->ram_size;
> +
> +    smbios_get_tables(ms, &mem_array, 1,
> +                      &smbios_tables, &smbios_tables_len,
> +                      &smbios_anchor, &smbios_anchor_len,
> +                      &error_fatal);
> +
> +    if (smbios_anchor) {
> +        fw_cfg_add_file(s->fw_cfg, "etc/smbios/smbios-tables",
> +                        smbios_tables, smbios_tables_len);
> +        fw_cfg_add_file(s->fw_cfg, "etc/smbios/smbios-anchor",
> +                        smbios_anchor, smbios_anchor_len);
> +    }
> +}
> +
>  static void virt_machine_done(Notifier *notifier, void *data)
>  {
>      RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> @@ -1351,6 +1393,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
>      }
>  
> +    virt_build_smbios(s);
> +
>      if (virt_is_acpi_enabled(s)) {
>          virt_acpi_setup(s);
>      }
> -- 
> 2.43.0
> 

