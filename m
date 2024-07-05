Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A87C3271E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 21:25:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sPqQO-0005AQ-NX; Fri, 05 Jul 2024 17:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sPqQN-0005AD-Av
 for qemu-riscv@nongnu.org; Fri, 05 Jul 2024 17:24:59 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sPqQL-00059d-Du
 for qemu-riscv@nongnu.org; Fri, 05 Jul 2024 17:24:59 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-700cc8e447aso1149597a34.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jul 2024 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720214696; x=1720819496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yww0imN73JEvc2ZP19yTQKRDD8C0ZKwbzciTAfC5Vvc=;
 b=gaq4GacCMippGoYU/XKkhdRaaHtJguNarYYOcbnJI2WwEgU1qZ/CZ7FUIfWdxIBwK0
 drixZJ1CAAMcdvIVKOx+2QSfFAxTu0jMK2fPKCAnT4S/geLnkukJb4NEbV2YtT9HEMUR
 Axnfn9iem8jMZOOm8YgY+8AoQmHP/g5P5kyBCR/WL/0tGEnygcxVsnYA+QK3ElTqmKSN
 jeO/d5Wy/qqz1qL2c/s55FNv2E8cjE9ZRBiWxksXwAKre2xX0gPeixyBBse00xNshpF/
 Y0AMN0+kznqjtZtD+KyD8MDyQMv4/baHrmWr1RQS+ZuIDmk+YKEbfZFuPLdmLAW9kTrD
 GolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720214696; x=1720819496;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yww0imN73JEvc2ZP19yTQKRDD8C0ZKwbzciTAfC5Vvc=;
 b=sghlYKK2Lvlf659UcMgBEYM7NpjJSidBwi1o/Lj5HL+EBujGvk6PW9B7FsDfWQE3WU
 HnDrNxH5uxZL7mCpsqNVVCslc9Cl+hYJa6R1zl3z8/w9UjgzsoxcNG3QdjUgvOFRs7AD
 nHyKGjx1ENxg95QkfxrNZyxA1YqMzMpCQ13wkDfytcmzpz8aY78bRxU2D/mpC8xajO62
 +WGeOdoNLB7E7YbztyOQpH43WrrnsuZ33dMBOdAuuXGKm478v57dwkJWB33YJQIDFmTH
 Vff+F2MghRVy98BK/MckqnYUgx89EzdC/HxWbvAJ6MyN/XKc7kSP3ZXDlCSeIwXOlS2G
 y3MA==
X-Gm-Message-State: AOJu0Yww/pvejsoycETHIWz+x2oIGqlNBCgfbQUyeZsijEwr4xh/wRrk
 JfjrC4YaMekRfztWVqHye9ssq9833b5y6zxpv7IXig6s7OxSOwSx1psBblWnHmQAIcc99FrRiIj
 h
X-Google-Smtp-Source: AGHT+IEwU8xk1AokwXleU9ONOZld/PyaeSQWYGdLLD7jh2PUxJ/7CJQkPm6hqGUzhr7Qr2IqfK0vJw==
X-Received: by 2002:a05:6870:7251:b0:254:77f7:7bdd with SMTP id
 586e51a60fabf-25e2bf4c037mr5426248fac.50.1720214675230; 
 Fri, 05 Jul 2024 14:24:35 -0700 (PDT)
Received: from [192.168.68.109] ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b0067cf78sm3538339b3a.134.2024.07.05.14.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 14:24:34 -0700 (PDT)
Message-ID: <7a0f63e4-9634-4274-af00-93c4a4e34810@ventanamicro.com>
Date: Fri, 5 Jul 2024 18:24:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] riscv: QEMU RISC-V IOMMU Support
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com, frank.chang@sifive.com,
 jason.chien@sifive.com
References: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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

Hi,

Would it make it easier for review if we squash patch 3:

[PATCH v4 03/14] hw/riscv: add RISC-V IOMMU base emulation

and patch 8:

[PATCH v4 09/14] hw/riscv/riscv-iommu: add s-stage and g-stage support

In the same patch?

I'm asking because I've been noticing since the first versions that some reviews
on patch 3 seems to refer to context that are s-stage and g-stage related, i.e.
added later. Perhaps squashing them together makes it easier to review since
we'll have a more complete picture. Patch 3 will end up gaining +381 lines
though.



Thanks,

Daniel



On 6/24/24 5:18 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> This new version contains changes based on suggestions made during the
> v3 review [1]. Most notable changes:
> 
> - read/write locks were added in both ctx_lock and iot_lock. This code
>    was picked from Tomasz branch;
> - a new riscv_iommu_validate_process_ctx() helper was added to make
>    process-context validations. Suggested by Jason Chien;
> - a new doc patch was added to document how the IOMMU can be used by the
>    'virt' RISC-V board. Suggested by Alistair.
> 
> Patches based on alistair/riscv-to-apply.next. It's also applicable on
> master.
> 
> Patches missing reviews/acks: 3, 9, 14
> 
> * How it was tested *
> 
> This series was tested using an emulated QEMU RISC-V host booting a QEMU
> KVM guest, passing through an emulated e1000 network card from the host
> to the guest.
> 
> The Linux kernel used for tests can be found here:
> 
> https://github.com/tjeznach/linux/tree/riscv_iommu_v6-rc3
> 
> 
> Changes from v3:
> - patch 3:
>    - added FCTL_BE and FCTL_WSI bits to regs_ro[] mask
>    - renamed 'ctx->pasid' to 'ctx->process_id'
>    - added device translation cache update lock ctx_lock
>    - DC.tc.V == 0 is now checked before riscv_iommu_validate_device_ctx()
>    - PC.ta.V == 0 now issues a "PDT entry not valid" error in the end of
>      riscv_iommu_validate_device_ctx()
>    - added a new riscv_iommu_validate_process_ctx() helper to validate PC
>      as section 2.2.4 dictates
> - patch 5:
>    - added RISCV_PCI_CLASS_SYSTEM_IOMMU macro and use it in k->class_id
> - patch 8:
>    - added update lock iot_lock
> - patch 9:
>    - added FSC related checks to riscv_iommu_validate_process_ctx()
>    - moved 'if (mode == bare)' check to happen after ctx->process_id ==
>      noprocid check
> - patch 14 (new):
>    - add riscv-iommu docs for more information on how to use the
>      riscv-iommu-pci device
> - v3 link: https://lore.kernel.org/qemu-riscv/20240523173955.1940072-1-dbarboza@ventanamicro.com/
> 
> [1] https://lore.kernel.org/qemu-riscv/20240523173955.1940072-1-dbarboza@ventanamicro.com/
> 
> 
> Andrew Jones (1):
>    hw/riscv/riscv-iommu: Add another irq for mrif notifications
> 
> Daniel Henrique Barboza (4):
>    pci-ids.rst: add Red Hat pci-id for RISC-V IOMMU device
>    test/qtest: add riscv-iommu-pci tests
>    qtest/riscv-iommu-test: add init queues test
>    docs/specs: add riscv-iommu
> 
> Tomasz Jeznach (9):
>    exec/memtxattr: add process identifier to the transaction attributes
>    hw/riscv: add riscv-iommu-bits.h
>    hw/riscv: add RISC-V IOMMU base emulation
>    hw/riscv: add riscv-iommu-pci reference device
>    hw/riscv/virt.c: support for RISC-V IOMMU PCIDevice hotplug
>    hw/riscv/riscv-iommu: add Address Translation Cache (IOATC)
>    hw/riscv/riscv-iommu: add s-stage and g-stage support
>    hw/riscv/riscv-iommu: add ATS support
>    hw/riscv/riscv-iommu: add DBG support
> 
>   docs/specs/index.rst             |    1 +
>   docs/specs/pci-ids.rst           |    2 +
>   docs/specs/riscv-iommu.rst       |   55 +
>   docs/system/riscv/virt.rst       |   13 +
>   hw/riscv/Kconfig                 |    4 +
>   hw/riscv/meson.build             |    1 +
>   hw/riscv/riscv-iommu-bits.h      |  419 ++++++
>   hw/riscv/riscv-iommu-pci.c       |  178 +++
>   hw/riscv/riscv-iommu.c           | 2372 ++++++++++++++++++++++++++++++
>   hw/riscv/riscv-iommu.h           |  148 ++
>   hw/riscv/trace-events            |   15 +
>   hw/riscv/trace.h                 |    1 +
>   hw/riscv/virt.c                  |   33 +-
>   include/exec/memattrs.h          |    5 +
>   include/hw/pci/pci.h             |    1 +
>   include/hw/riscv/iommu.h         |   36 +
>   meson.build                      |    1 +
>   tests/qtest/libqos/meson.build   |    4 +
>   tests/qtest/libqos/riscv-iommu.c |   76 +
>   tests/qtest/libqos/riscv-iommu.h |  100 ++
>   tests/qtest/meson.build          |    1 +
>   tests/qtest/riscv-iommu-test.c   |  234 +++
>   22 files changed, 3699 insertions(+), 1 deletion(-)
>   create mode 100644 docs/specs/riscv-iommu.rst
>   create mode 100644 hw/riscv/riscv-iommu-bits.h
>   create mode 100644 hw/riscv/riscv-iommu-pci.c
>   create mode 100644 hw/riscv/riscv-iommu.c
>   create mode 100644 hw/riscv/riscv-iommu.h
>   create mode 100644 hw/riscv/trace-events
>   create mode 100644 hw/riscv/trace.h
>   create mode 100644 include/hw/riscv/iommu.h
>   create mode 100644 tests/qtest/libqos/riscv-iommu.c
>   create mode 100644 tests/qtest/libqos/riscv-iommu.h
>   create mode 100644 tests/qtest/riscv-iommu-test.c
> 

