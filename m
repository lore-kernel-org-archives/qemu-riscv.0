Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4842C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 21:01:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyeny-00015s-M5; Thu, 02 Nov 2023 17:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyenu-00014x-S3
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 17:00:39 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyenp-0008KD-Pq
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 17:00:38 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5afa5dbc378so17392937b3.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698958831; x=1699563631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6tij+y3GKq7vIhBMugA7qgadmRNb9RcDsnJ7ejspyAI=;
 b=VlQlGWGd1zgxqGNQHZUGpsA/5dGavFqFuBArgAJdh6Mq0V+cGYnsoxPfFsxldyu1JC
 /pFFmDlmWx24/ohnrfX8IEvhtRKyBhzV026oZWjFp8vyXJgUUCuL3ZEail7g6RefRMZ5
 QgUlGHM2mN6OUHcTtUIujBpJCeBvNySNysK1OG+1MlAdURluTImJGW1dFa1W0WJgEcZ6
 pKr9um7jbuJW1lOlnefTS7myaLlDE0BSW8+mHA2t12dOpbI6NY8w6sMgAOocm2Zzg5Ta
 YMxY5fYINfTr7Ka67/aTl2YZtLevyLOC5taG1cj7fwJ141im+45YOGSMDURjM4YxAvB0
 IyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698958831; x=1699563631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6tij+y3GKq7vIhBMugA7qgadmRNb9RcDsnJ7ejspyAI=;
 b=LF8OX+WXFw5+lNdDeADxogKCkSvTpptHMYaKHyuzuJ72+haRtqYT6s2K2S7dM1IAFp
 zBqs9+Xbw3hmMNWYl56dKijyWY0n7npystOYGS3nLJ9jn8L28r2bLqDuaCdGtu29hO74
 RJmuIvOcQVA9DOl1m5WcXFV3I1FnV879b4Jn6iNDAdn2QE+z6rvy/y3PYSN4R1rEK3Bd
 egkFBv98xUx+41HkpV0UVm6DnmoPUcNr7HUKDIHjqgxdIs/KHhVKCyLSo7xbmWd6frpg
 M6SUEwy9JThOC/EZiz8ovKsBD6/0zMTncsOnGW/V4Fr9F1Dm+12kTR7/5hfKaP/MdOJM
 txSA==
X-Gm-Message-State: AOJu0YzWJ6iPgxtc2SVPc6XTmJaZbJBd8OgFDrd5bA8TBtWWiDQfgeWi
 z7UDNa1VGNhxusgPWWv5mJTtQg==
X-Google-Smtp-Source: AGHT+IG8aBOlJYDugsHb6GFWCmRTaUk7KiFmO7uUJAeZa0A/owiygAlu3hur0TdVREeT2dJTnrFllQ==
X-Received: by 2002:a81:4e07:0:b0:5a8:5824:b953 with SMTP id
 c7-20020a814e07000000b005a85824b953mr911399ywb.8.1698958830967; 
 Thu, 02 Nov 2023 14:00:30 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 bz5-20020a05690c084500b005af98b6f795sm178490ywb.23.2023.11.02.14.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 14:00:29 -0700 (PDT)
Message-ID: <64055d84-7a8f-4fc5-85db-dcaa7a36e120@ventanamicro.com>
Date: Thu, 2 Nov 2023 18:00:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Sunil,


While doing unrelated work (running Gitlab on my series built on top of
current riscv-to-apply.next), I hit the following error:

https://gitlab.com/danielhb/qemu/-/jobs/5448178994

==========

4/257 ERROR:../tests/qtest/bios-tables-test.c:535:test_acpi_asl: assertion failed: (all_tables_match) ERROR
   4/257 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test                ERROR           7.77s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=/builds/danielhb/qemu/tests/dbus-vmstate-daemon.sh PYTHON=/builds/danielhb/qemu/build/pyvenv/bin/python3 MALLOC_PERTURB_=159 QTEST_QEMU_BINARY=./qemu-system-i386 /builds/danielhb/qemu/build/tests/qtest/bios-tables-test --tap -k

acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-IOYVD2], Expected [aml:tests/data/acpi/microvm/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
to see ASL diff between mismatched files install IASL, rebuild QEMU from scratch and re-run tests with V=1 environment variable set**
ERROR:../tests/qtest/bios-tables-test.c:535:test_acpi_asl: assertion failed: (all_tables_match)
(test program exited with status code -6)

(...)

Summary of Failures:
4571  4/257 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test                ERROR           7.77s   killed by signal 6 SIGABRT
4572  7/257 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test          ERROR          66.00s   killed by signal 6 SIGABRT
4573  Ok:                 247
4574  Expected Fail:      0
4575  Fail:               2
4576  Unexpected Pass:    0
4577  Skipped:            8
4578  Timeout:            0

==========

(qtest-aarch64/bios-tables-test' fails with the same error message as 'qtest-i386/bios-tables-test')


To be sure, since I ran a hacked version of your patches in that Gitlab pipeline, I
removed your ACPI patches from riscv-to-apply.next, applied this new version, and then
tried to run the x86 qtest locally. It still fails, same error:

$ rm -rf build && ./configure --target-list=x86_64-softmmu
$ make -j && QTEST_QEMU_BINARY=./build/qemu-system-x86_64 ./build/tests/qtest/bios-tables-test

(...)
# starting QEMU: exec ./build/qemu-system-x86_64 -qtest unix:/tmp/qtest-508977.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-508977.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -machine microvm -accel kvm -accel tcg -net none  -machine microvm,acpi=on,ioapic2=off,rtc=off -drive id=hd0,if=none,file=tests/acpi-test-disk-eyxyvN,format=raw -device virtio-blk-device,drive=hd0  -accel qtest
acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-H9IUD2], Expected [aml:tests/data/acpi/microvm/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
to see ASL diff between mismatched files install IASL, rebuild QEMU from scratch and re-run tests with V=1 environment variable set**
ERROR:../tests/qtest/bios-tables-test.c:535:test_acpi_asl: assertion failed: (all_tables_match)
not ok /x86_64/acpi/microvm - ERROR:../tests/qtest/bios-tables-test.c:535:test_acpi_asl: assertion failed: (all_tables_match)


I did a 'git bisect' and it pointed to the following patch:


$ git bisect good
e63248d45e8f8488706ed13a7b83266e578deafd is the first bad commit
commit e63248d45e8f8488706ed13a7b83266e578deafd
Author: Sunil V L <sunilvl@ventanamicro.com>
Date:   Thu Nov 2 22:32:13 2023 +0530

     hw/i386/acpi-microvm.c: Use common function to add virtio in DSDT
     
     With common function to add virtio in DSDT created now, update microvm
     code also to use it instead of duplicate code.
     
     Suggested-by: Andrew Jones <ajones@ventanamicro.com>
     Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
     Acked-by: Alistair Francis <alistair.francis@wdc.com>
     Acked-by: Michael S. Tsirkin <mst@redhat.com>

  hw/i386/acpi-microvm.c | 15 ++-------------
  1 file changed, 2 insertions(+), 13 deletions(-)
$

This suggests a problem in patch 03. I suggest doing a bisect on your own to be sure.

Unfortunately these tests will block the pipeline, forbidding us to merge it. I'm afraid
you'll need to fix it and send a v7.



Thanks,

Daniel


On 11/2/23 14:02, Sunil V L wrote:
> This series primarily enables external interrupt controllers (AIA and PLIC)
> in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO and
> MMU related information.
> 
> Below ECRs for these changes are approved by ASWG and will be
> available in next ACPI spec release.
> 
> 1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
> 2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing
> 
> First two patches in this series are to migrate a couple of functions from
> ARM architecture to common code so that RISC-V doesn't need to duplicate
> the same.
> 
> The patch set is based on Alistair's riscv-to-apply.next branch.
> 
> These changes are also available in  riscv_acpi_b2_v6 branch at:
> https://github.com/vlsunil/qemu/
> 
> Changes since v5:
> 	1) Fixed the issue in PATCH 2 reported by Daniel found when built with
> 	   clang + --enable-debug.
> 
> Changes since v4:
> 	1) Updated copyright for new files as per SPDX format suggested by Drew.
> 	2) Updated RINTC patch to avoid code duplication as suggested by Drew.
> 	3) Moved mmu offset below cmo in MMU patch as suggested by Drew.
> 	4) Updated tags.
> 
> Changes since v3:
> 	1) Addressed comments from Daniel and Drew.
> 	2) Added a new patch in microvm to use common function for virtio in DSDT.
> 	3) Rebased to latest riscv-to-apply.next branch and added tags.
> 
> Changes since v2:
>          1) Rebased to latest riscv-to-apply.next branch which needed
>             changing ext_icboz to ext_zicboz in CMO patch.
>          2) Fixed node type in MMU node.
>          3) Added latest tags.
> 
> Changes since v1:
>          1) As per Igor's suggestion, migrated fw_cfg and virtio creation
>             functions to device specific file instead of generic aml-build.c.
>             Since ACPI is optional, new files are created and enabled for
>             build only when CONFIG_ACPI is enabled.
>          2) As per Igor's suggestion, properties are added to the GPEX PCI
>             host to indicate MMIO ranges. The platform fw can initialize
>             these to appropriate values and the DSDT generator can fetch
>             the information from the host bus itself. This makes the code
>             generic instead of machine specific.
>          3) Added PLIC patch from Haibo.
>          4) Rebased to latest riscv-to-apply.next and added RB tags as
>             appropriate.
> Sunil V L (13):
>    hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
>    hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
>    hw/i386/acpi-microvm.c: Use common function to add virtio in DSDT
>    hw/riscv: virt: Make few IMSIC macros and functions public
>    hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
>    hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
>    hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
>    hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
>    hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
>    hw/pci-host/gpex: Define properties for MMIO ranges
>    hw/riscv/virt: Update GPEX MMIO related properties
>    hw/riscv/virt-acpi-build.c: Add IO controllers and devices
>    hw/riscv/virt-acpi-build.c: Add PLIC in MADT
> 
>   hw/arm/virt-acpi-build.c        |  51 +----
>   hw/i386/acpi-microvm.c          |  15 +-
>   hw/nvram/fw_cfg-acpi.c          |  23 +++
>   hw/nvram/meson.build            |   1 +
>   hw/pci-host/gpex-acpi.c         |  13 ++
>   hw/pci-host/gpex.c              |  12 ++
>   hw/riscv/Kconfig                |   1 +
>   hw/riscv/virt-acpi-build.c      | 323 +++++++++++++++++++++++++++++---
>   hw/riscv/virt.c                 |  72 ++++---
>   hw/virtio/meson.build           |   1 +
>   hw/virtio/virtio-acpi.c         |  32 ++++
>   include/hw/nvram/fw_cfg_acpi.h  |  15 ++
>   include/hw/pci-host/gpex.h      |  28 ++-
>   include/hw/riscv/virt.h         |  26 +++
>   include/hw/virtio/virtio-acpi.h |  16 ++
>   15 files changed, 498 insertions(+), 131 deletions(-)
>   create mode 100644 hw/nvram/fw_cfg-acpi.c
>   create mode 100644 hw/virtio/virtio-acpi.c
>   create mode 100644 include/hw/nvram/fw_cfg_acpi.h
>   create mode 100644 include/hw/virtio/virtio-acpi.h
> 

