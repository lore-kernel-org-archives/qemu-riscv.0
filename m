Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36017C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 09:23:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF9qq-0007X0-3T; Mon, 18 Dec 2023 04:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rF9qo-0007WP-Bm; Mon, 18 Dec 2023 04:23:50 -0500
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rF9qk-00015q-27; Mon, 18 Dec 2023 04:23:48 -0500
Received: from [192.168.123.94] (ip-178-202-040-247.um47.pools.vodafone-ip.de
 [178.202.40.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B39313F5F0; 
 Mon, 18 Dec 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1702891423;
 bh=Bg3qYfFFd8H2aGlw08bBTiuD/yZJ1rWQm8HJE2Q0BsI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=AKB60Xbhf/2AIZtmPJ33TwtwGGuszRqSF4EX4oDJBJr9FXKFUcYjLB+q9q1dOdbeZ
 wXUE0ioG+v9PSt7rH7x7rnbltpam/4NK2j/kX78b9rUVglLGjLJeLz1lfv3rO2+kbo
 E+8XwVyltJ8Xrjt6hgXhHsodRCaEbM04pMNov/90qrmvOQjuJQZbwRtDydt339NnI7
 JxLG+oJ/eK0/yJHFrfzVW1XtUTu5CYVXVdrNMIKRnHPeLBHv0yS2/Q1ifp13Q2L4iP
 8ERVfGtRlerYszDgmRWVJvIsfNDmzvlRG+3tqhqPvs6kiaVLy+zJKhth0JxgP0SaPb
 lzpx8X8+5zXpA==
Message-ID: <9183a3fb-b9f7-470c-b9a6-8d8cc6dce7c3@canonical.com>
Date: Mon, 18 Dec 2023 10:23:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: SMBIOS support for RISC-V virt machine
Content-Language: en-US, de-DE
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218074018.66134-1-heinrich.schuchardt@canonical.com>
 <ZYAHtq1HozBOZZrJ@sunil-laptop>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <ZYAHtq1HozBOZZrJ@sunil-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.121;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-canonical-1.canonical.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 12/18/23 09:49, Sunil V L wrote:
> Hi Heinrich,
> 
> Thanks for the patch!.
> 
> On Mon, Dec 18, 2023 at 08:40:18AM +0100, Heinrich Schuchardt wrote:
>> Generate SMBIOS tables for the RISC-V mach-virt.
>> Add CONFIG_SMBIOS=y to the RISC-V default config.
>>
>> The implementation is based on the corresponding ARM and Loongson code.
>>
>> With the patch the following firmware tables are provided:
>>
>>      etc/smbios/smbios-anchor
>>      etc/smbios/smbios-tables
>>
>> Booting Ubuntu 23.10 via EDK II allowed displaying the SMBIOS table using
>> the dmidecode command:
>>
>>      Handle 0x0100, DMI type 1, 27 bytes
>>      System Information
>>          Manufacturer: QEMU
>>          Product Name: QEMU Virtual Machine
>>          Version: virt
>>      ...
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   hw/riscv/Kconfig |  1 +
>>   hw/riscv/virt.c  | 36 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
>> index b6a5eb4452..1e11ac9432 100644
>> --- a/hw/riscv/Kconfig
>> +++ b/hw/riscv/Kconfig
>> @@ -41,6 +41,7 @@ config RISCV_VIRT
>>       select RISCV_IMSIC
>>       select SIFIVE_PLIC
>>       select SIFIVE_TEST
>> +    select SMBIOS
>>       select VIRTIO_MMIO
>>       select FW_CFG_DMA
>>       select PLATFORM_BUS
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index d2eac24156..6c27cb5330 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -36,6 +36,7 @@
>>   #include "hw/riscv/boot.h"
>>   #include "hw/riscv/numa.h"
>>   #include "kvm/kvm_riscv.h"
>> +#include "hw/firmware/smbios.h"
>>   #include "hw/intc/riscv_aclint.h"
>>   #include "hw/intc/riscv_aplic.h"
>>   #include "hw/intc/riscv_imsic.h"
>> @@ -1249,6 +1250,39 @@ static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
>>                                   sysbus_mmio_get_region(sysbus, 0));
>>   }
>>   
>> +static void virt_build_smbios(RISCVVirtState *s)
>> +{
> Can we avoid duplicating this function which exists in other
> architectures?
> 

Every architecture uses it own structures (e.g. RISCVVirtState) and 
constants (e.g VIRT_DRAM). As long as this is not addressed we will have 
to live with this piece of code duplication.

After this patch is accepted we will have to work on improving SMBIOS 
3.7.0 compliance:

* Table 22
* * field Processor Family should contain a RISC-V specfic value. Maybe 
derived from TARGET_RISCV##.
* * field Processor ID should contain the value of mvendorid of hart 0 
(i.e. cpu->cfg.mvendorid).

* Table 44

The required contents of this table are provided in 
https://github.com/riscv/riscv-smbios .

Best regards

Heinrich

