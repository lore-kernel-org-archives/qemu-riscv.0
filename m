Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0429C83F17
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 20:03:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubPOO-0003s4-0D; Mon, 14 Jul 2025 16:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubOBM-0007xI-Ui
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 14:45:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubOBJ-0006r8-Oc
 for qemu-riscv@nongnu.org; Mon, 14 Jul 2025 14:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752518740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IC+y8Ts8tvKgDcEp7zaqafgWzmW1YusiFlMT1mEZamc=;
 b=YE7SBBneIwKWQSqv9McMtpn7jGr72tt8ulhYcAYy7tEpK23twxC0H8/uo7sc7e2tMdDOt6
 wLUOlJC/MsS0fO+L+h7Q85i/6VUUe2lDwkNyhpYcLX9tqtrCG+f26tunfAVLY6hkPReKJz
 W+RZtt8UEkYCk3qWKRph00ZY5kRbsTM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-P8WfsCs8MJO0bm38-YPIFw-1; Mon, 14 Jul 2025 14:45:37 -0400
X-MC-Unique: P8WfsCs8MJO0bm38-YPIFw-1
X-Mimecast-MFC-AGG-ID: P8WfsCs8MJO0bm38-YPIFw_1752518736
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4e9252ba0so2742598f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Jul 2025 11:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752518736; x=1753123536;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IC+y8Ts8tvKgDcEp7zaqafgWzmW1YusiFlMT1mEZamc=;
 b=btmIprwaVLbwsMpT8n42yskjrXHqrv3AzBM+I0/gHrsgsxQs8TlHSUei0EOUOcHari
 60E3ShwJcSXam3xDpGOdMnWwg5LGq7lm6sjCiJfLFA4LWBufsxfc3VQVDJhKJsBiCTRV
 2LYn7bBfLYihuEEPsJLMel8n8DBGr8KOE/mVWacmQxahiz3s0cBQjE0ohuectXXMNVzN
 KNl78qD60oDbV+LaozgA6aVzd41aUbgG54dyUTbsE+XFJhLhjCVuIb4STdNw++PrFs/w
 OOmosCWo/ccYswjBGbx+swFABUJIDLw5NCbLY1avDvU9XPiXodwU3bNc1USAsasRnk3b
 +CxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+UWSkJnwmzGt+vjq31F1stCmabv+6ZL+M9MnfelGPdHzYhh3I5qy1Siq4dbaS+xZe5J89m7U24CrK@nongnu.org
X-Gm-Message-State: AOJu0Yw3kBkBhc7zd3SP4ceQgC5I9eAKgXCimht2xW99hLLVAzVpFltN
 XjNllcHfaO6aM1ZmClUHBlkYKuaKxXBTfBl3g/dPgxhJvbuWh6d8VJwQLgZxXUa9JIT9cvsy2ku
 vCgVJo8PAdA7SgtdCFT/FgbdZ3spI2iVmYJ1gHFx1jqkLxU/6HwausTvd
X-Gm-Gg: ASbGnctr4uJNKjDJfJCACWkTq6hQG2Wgbad9COHFFNDdIEq+BamcpYg0ZUz0Ihpjteq
 CnBOQnrYOQij7WhKVEQNXOLviV9xArCeprUahD0517MprrT6pp4OgLYQ0v/0s2k3dCR3e2nxTYJ
 sBSu6gDeZ8wL4oPiEtEvjNC1g7OZsTl0AMhDFU/nRUylMMeqM15FH/buKfcnDdwMJg+1RNGbyKz
 Xtwc/gPKQNT2CSEFuYWAlagEyw5rn9fWnK59q004gAt/Xfi/rC4IJpO/wHnrJy0lvdiyv5AwFsq
 ovmvLVWuYCD+6YkwA4n1uYrW1mtmYKLeUw==
X-Received: by 2002:a05:6000:4405:b0:3a5:8d08:6239 with SMTP id
 ffacd0b85a97d-3b5f188e6a2mr8404266f8f.21.1752518735778; 
 Mon, 14 Jul 2025 11:45:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXK7Sx2g4Y03ZTrtj7qHrRREIe7XEb8ZQLOG2mObH5V1YWfr0zAN0O9S3VhIYNWkhCPMUVeg==
X-Received: by 2002:a05:6000:4405:b0:3a5:8d08:6239 with SMTP id
 ffacd0b85a97d-3b5f188e6a2mr8404253f8f.21.1752518735278; 
 Mon, 14 Jul 2025 11:45:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e2710bsm13070306f8f.99.2025.07.14.11.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 11:45:34 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:45:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>,
 Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH REPOST v4 4/4] acpi/virt: suppress UART device & SPCR
 when guest has no serial hardware
Message-ID: <20250714144303-mutt-send-email-mst@kernel.org>
References: <20250528105404.457729-1-me@linux.beauty>
 <20250528105404.457729-5-me@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <20250528105404.457729-5-me@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F9ULQt4QJnJwLyWJPNogPMiM8fv5hOpFkmOzaqI6e-c_1752518736
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, May 28, 2025 at 06:53:38PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The virt machines always instantiate a PL011/16550 at UART0 and
> describe it in ACPI (DSDT device node plus optional SPCR table).  When
> the command line contains “-serial none” there is no backend attached to
> that UART, yet the guest still discovers it via ACPI and may try to use
> it as a console, causing unexpected results.
> 
> And also explicitly add "-serial stdio" in bios-tables-test.c to allow
> serial device creation, otherwise DSDT assert would get failure because
> "-nodefaults" will not create uart device by default:
> 
> ```
> stderr:
> acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-BMOL72], Expected [aml:tests/data/acpi/aarch64/virt/DSDT].
> See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-RNOL72.dsl, aml:/tmp/aml-BMOL72], Expected [asl:/tmp/asl-ZVQL72.dsl, aml:tests/data/acpi/aarch64/virt/DS
> DT].
> ```
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>


will need to be rebased updating loongarch too, now.


> ---
> 
> Notes:
>     Changes since v3: 1. Add Reviewed-by from Sunil V L <sunilvl@ventanamicro.com>
>                       2. Explicitly add "-serial stdio" to pass DSDT assert
> 
>  hw/arm/virt-acpi-build.c       | 15 +++++++++------
>  hw/riscv/virt-acpi-build.c     |  7 +++++--
>  include/system/system.h        |  2 ++
>  system/vl.c                    |  5 +++++
>  tests/qtest/bios-tables-test.c |  5 +++--
>  5 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d77d16cbd3..c26aedb1b1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -59,6 +59,7 @@
>  #include "hw/acpi/viot.h"
>  #include "hw/virtio/virtio-acpi.h"
>  #include "target/arm/multiprocessing.h"
> +#include "system/system.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -821,11 +822,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       */
>      scope = aml_scope("\\_SB");
>      acpi_dsdt_add_cpus(scope, vms);
> -    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0],
> -                       (irqmap[VIRT_UART0] + ARM_SPI_BASE), 0);
> -    if (vms->second_ns_uart_present) {
> -        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART1],
> -                           (irqmap[VIRT_UART1] + ARM_SPI_BASE), 1);
> +    if (serial_exist()) {
> +        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0],
> +                           (irqmap[VIRT_UART0] + ARM_SPI_BASE), 0);
> +        if (vms->second_ns_uart_present) {
> +            acpi_dsdt_add_uart(scope, &memmap[VIRT_UART1],
> +                               (irqmap[VIRT_UART1] + ARM_SPI_BASE), 1);
> +        }
>      }
>      if (vmc->acpi_expose_flash) {
>          acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> @@ -937,7 +940,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      acpi_add_table(table_offsets, tables_blob);
>  
> -    if (ms->acpi_spcr_enabled) {
> +    if (ms->acpi_spcr_enabled && serial_exist()) {
>          spcr_setup(tables_blob, tables->linker, vms);
>      }
>  
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index ee1416d264..80bf3c3cec 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -39,6 +39,7 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "system/reset.h"
> +#include "system/system.h"
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
> @@ -474,7 +475,9 @@ static void build_dsdt(GArray *table_data,
>                                   memmap[VIRT_APLIC_S].size, "RSCV0002");
>      }
>  
> -    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
> +    if (serial_exist())
> +        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
> +

coding style violation

>      if (virt_is_iommu_sys_enabled(s)) {
>          acpi_dsdt_add_iommu_sys(scope, &memmap[VIRT_IOMMU_SYS], IOMMU_SYS_IRQ);
>      }
> @@ -895,7 +898,7 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>  
>      acpi_add_table(table_offsets, tables_blob);
>  
> -    if (ms->acpi_spcr_enabled) {
> +    if (ms->acpi_spcr_enabled && serial_exist()) {
>          spcr_setup(tables_blob, tables->linker, s);
>      }
>  
> diff --git a/include/system/system.h b/include/system/system.h
> index a7effe7dfd..ca1af38432 100644
> --- a/include/system/system.h
> +++ b/include/system/system.h
> @@ -75,6 +75,8 @@ extern unsigned int nb_prom_envs;
>  /* Return the Chardev for serial port i, or NULL if none */
>  Chardev *serial_hd(int i);
>  
> +bool serial_exist(void);
> +
>  /* parallel ports */
>  
>  #define MAX_PARALLEL_PORTS 3
> diff --git a/system/vl.c b/system/vl.c
> index fd402b8ff8..e340ee3a95 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -1485,6 +1485,11 @@ Chardev *serial_hd(int i)
>      return NULL;
>  }
>  
> +bool serial_exist(void)
> +{
> +    return serial_hd(0) ? true : false;
> +}
> +

serial_exists


>  static bool parallel_parse(const char *devname, Error **errp)
>  {
>      static int index = 0;
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 44de152a36..452566fa86 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -824,10 +824,11 @@ static char *test_acpi_create_args(test_data *data, const char *params)
>          /*
>           * TODO: convert '-drive if=pflash' to new syntax (see e33763be7cd3)
>           * when arm/virt boad starts to support it.
> +         * NOTE: Explicitly add "-serial stdio" to enable uart in DSDT.
>           */
>          if (data->cd) {
>              args = g_strdup_printf("-machine %s%s %s -accel tcg "
> -                "-nodefaults -nographic "
> +                "-nodefaults -serial stdio -nographic "
>                  "-drive if=pflash,format=raw,file=%s,readonly=on "
>                  "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
>                  data->machine, data->machine_param ?: "",
> @@ -835,7 +836,7 @@ static char *test_acpi_create_args(test_data *data, const char *params)
>                  data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
>          } else {
>              args = g_strdup_printf("-machine %s%s %s -accel tcg "
> -                "-nodefaults -nographic "
> +                "-nodefaults -serial stdio -nographic "
>                  "-drive if=pflash,format=raw,file=%s,readonly=on "
>                  "-drive if=pflash,format=raw,file=%s,snapshot=on %s",
>                  data->machine, data->machine_param ?: "",




> -- 
> 2.49.0


