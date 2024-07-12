Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B914C2BD09
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 12:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sSFcb-0001Nj-GO; Fri, 12 Jul 2024 08:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sSFcV-0001N1-PO
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 08:43:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sSFcS-0000G2-VC
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 08:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720788203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1OlqYp3prCTYsg4T2pRkw+AIIXE1wLWyasdZ+NgxOo=;
 b=LHjrE+NtPLb88Ws9bxQSYIvKQMBVCz8NtPgjPzAOyOsWiWBS7nsIwPD1zmooZsYDmgr1yv
 GaDTIxAVnR7j7dz2V6awjlc49Dk2wE12YkdLUWhBL3bS5NxRzFDlh3VSmf0Wv6OTKg6oxN
 fMkkTmfllxg4g7h1qQ9hG4hwpiKaPVs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-jwdo1WNDNLm32rUHwnJW-A-1; Fri, 12 Jul 2024 08:43:21 -0400
X-MC-Unique: jwdo1WNDNLm32rUHwnJW-A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42725ef39e2so15340435e9.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jul 2024 05:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720788201; x=1721393001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1OlqYp3prCTYsg4T2pRkw+AIIXE1wLWyasdZ+NgxOo=;
 b=C1zwu1K4QA43sGp08nnjzzdO+6SrozjmW9JYohPoZn7P1iJ2Sulc9hjKMZD4RmtyOt
 OMKZq4XIFcP2++C7ZcXgVyHouJUYWqTIesZOX4pIrJNR4v+L/pKZ+TSZLtmCKTJK2O+e
 eG8LT1NooTWaXpGVWA5nyFKu42VcVcrRCn9TNByzYgrKgGSGAGAkVRjjD0I8QqhKRdmt
 2oUghZvEq+1/QD+3t9tBfen7s9NRTft0iS1awX4A0CbAq6lp20fxfDMKL5sypDlomBCY
 rWMGrYBl7q6ZZsSsfhgbemdF82QjC5v9UkRLm/uFiTt+KTMVgoTChf8woxsqdmp1Wuvl
 IzSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURIo0qq4O7zBBFnNiL7+SbN98mw9B+Va3TLVcKettzqcNDXJOBxlkIkl7d5CXCKSOn/OJp/DnjA99NnmJ3RROGKd8XaYc=
X-Gm-Message-State: AOJu0Yw/ipTEllNXDYwBX/1xBmZSabmDkMAiO17oKlPhBHcLvqs1F4RM
 5N18nqtAou2eBWnH1toBjrUQf5C7L/sjDsoz3kRsv9lXtXoAQhyS12B5SS8U5/a2vMCLUZXCnDa
 VDT5lKKxKeqcWqHt+Yao7ITnG5sCQdDXQwXw5SkGeEjZUD3mlCY6k
X-Received: by 2002:a05:600c:894:b0:426:5e1c:1ad0 with SMTP id
 5b1f17b1804b1-426708f202cmr69327485e9.37.1720788200874; 
 Fri, 12 Jul 2024 05:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrlO+RIL0juXBskpDuCr6RMgmGMVeP8KgpYNOp91l4h4dZGORfy3ZKLuNpYLbYXtBC3tZerw==
X-Received: by 2002:a05:600c:894:b0:426:5e1c:1ad0 with SMTP id
 5b1f17b1804b1-426708f202cmr69327305e9.37.1720788200460; 
 Fri, 12 Jul 2024 05:43:20 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde847bdsm10093738f8f.41.2024.07.12.05.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 05:43:20 -0700 (PDT)
Date: Fri, 12 Jul 2024 14:43:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, "Michael S . Tsirkin" <mst@redhat.com>, Ani
 Sinha <anisinha@redhat.com>
Subject: Re: [PATCH v2 0/9] RISC-V: ACPI: Namespace updates
Message-ID: <20240712144319.233c19a7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
References: <20240708114741.3499585-1-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.138,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon,  8 Jul 2024 17:17:32 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> This series adds few updates to RISC-V ACPI namespace for virt platform.
> Additionally, it has patches to enable ACPI table testing for RISC-V.
> 
> 1) PCI Link devices need to be created outside the scope of the PCI root
> complex to ensure correct probe ordering by the OS. This matches the
> example given in ACPI spec as well.
> 
> 2) Add PLIC and APLIC as platform devices as well to ensure probing
> order as per BRS spec [1] requirement.
> 
> 3) BRS spec requires RISC-V to use new ACPI ID for the generic UART. So,
> update the HID of the UART.
> 
> 4) Enabled ACPI tables tests for RISC-V which were originally part of
> [2] but couldn't get merged due to updates required in the expected AML
> files. I think combining those patches with this series makes it easier
> to merge since expected AML files are updated.
> 
> [1] - https://github.com/riscv-non-isa/riscv-brs
> [2] - https://lists.gnu.org/archive/html/qemu-devel/2024-06/msg04734.html

btw: CI is not happy about series, see:
 https://gitlab.com/imammedo/qemu/-/pipelines/1371119552
also 'cross-i686-tci' job routinely timeouts on bios-tables-test
but we still keep adding more tests to it.
We should either bump timeout to account for slowness or
disable bios-tables-test for that job.


> Changes since v1:
> 	1) Made changes in gpex-acpi.c generic as per feedback from
> 	   Michael. This changes the DSDT for aarch64/virt and microvm
> 	   machines. Hence, few patches are added to update the expected
> 	   DSDT files for those machine so that CI tests don't fail.
> 	2) Added patches to enable ACPI tables tests for RISC-V
> 	   including a patch to remove the fallback path to
> 	   search for expected AML files.
> 	3) Rebased and added tags.
> 
> Sunil V L (9):
>   hw/riscv/virt-acpi-build.c: Add namespace devices for PLIC and APLIC
>   hw/riscv/virt-acpi-build.c: Update the HID of RISC-V UART
>   tests/acpi: Allow DSDT acpi table changes for aarch64
>   acpi/gpex: Create PCI link devices outside PCI root bridge
>   tests/acpi: update expected DSDT blob for aarch64 and  microvm
>   tests/qtest/bios-tables-test.c: Remove the fall back path
>   tests/acpi: Add empty ACPI data files for RISC-V
>   tests/qtest/bios-tables-test.c: Enable basic testing for RISC-V
>   tests/acpi: Add expected ACPI AML files for RISC-V
> 
>  hw/pci-host/gpex-acpi.c                       |  13 ++---
>  hw/riscv/virt-acpi-build.c                    |  49 +++++++++++++++++-
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5196 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5282 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6557 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7679 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5398 bytes
>  tests/data/acpi/riscv64/virt/APIC             | Bin 0 -> 116 bytes
>  tests/data/acpi/riscv64/virt/DSDT             | Bin 0 -> 3576 bytes
>  tests/data/acpi/riscv64/virt/FACP             | Bin 0 -> 276 bytes
>  tests/data/acpi/riscv64/virt/MCFG             | Bin 0 -> 60 bytes
>  tests/data/acpi/riscv64/virt/RHCT             | Bin 0 -> 332 bytes
>  tests/data/acpi/riscv64/virt/SPCR             | Bin 0 -> 80 bytes
>  tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 3023 bytes
>  tests/qtest/bios-tables-test.c                |  40 +++++++++-----
>  15 files changed, 81 insertions(+), 21 deletions(-)
>  create mode 100644 tests/data/acpi/riscv64/virt/APIC
>  create mode 100644 tests/data/acpi/riscv64/virt/DSDT
>  create mode 100644 tests/data/acpi/riscv64/virt/FACP
>  create mode 100644 tests/data/acpi/riscv64/virt/MCFG
>  create mode 100644 tests/data/acpi/riscv64/virt/RHCT
>  create mode 100644 tests/data/acpi/riscv64/virt/SPCR
> 


