Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97567C3ABB2
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 May 2025 20:28:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKNNa-0000SD-W0; Wed, 28 May 2025 16:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKNNY-0000S2-Mj
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:28:00 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKNNU-0001Gu-BX
 for qemu-riscv@nongnu.org; Wed, 28 May 2025 16:27:59 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-51eb1a714bfso90623e0c.3
 for <qemu-riscv@nongnu.org>; Wed, 28 May 2025 13:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748464073; x=1749068873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=92UfK6LGb3e655cwJB8Y8Grjmr6zbigcWGXqhl/iC2E=;
 b=DGBu1OCTyq2qhTI7rE4+M5Xd80UBhDIHJNrUfIEDHvsl7lAFdD+o7ZhsCM4jgUuT+4
 kBqgUqatoWuchq2/FJvzBLbY6PhBRBAf7Tb7ho+1rFN63IfMJ9nKNb1TBc5V4trysDMG
 zzTaeMKheMShdLf5oD6vuq4fwHqNofouFG3PbzL8HkTcCk/uH+oMf3Y293s09dwylgCj
 bcMLzGJfLA35HAdUnraV4pAaDHiSx52AwD4crXOPobDtkxdR775hLoQT/gKNAbJaeJED
 ELXvmx04alaL3dbQPyyDcftccHB/kWmITf5+CSTJKcZL0kVkBmO9s90+XV3pmoF5Ci6a
 RVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748464073; x=1749068873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92UfK6LGb3e655cwJB8Y8Grjmr6zbigcWGXqhl/iC2E=;
 b=C27z9ChlpW4wsDI0qZFxS9fBrGjVzlsKHKr4GkAtNGHj1uWPQc5cOG8spowXCbgDTe
 uGyZyKIZUyzj2UcNVbb9QLElmUztcg01NH6XFwmdqCqVq5aIzxa2BtZUfUrM+PY0XL7J
 ak3qBSWKfN1GuXvmHc2S9qNBVXPZ5f8NoA9AcSFzWJBpr11rA2n2oXSSZ/y5VN89nuTl
 dzHc8rZvyuehC5/HyVY7kL13psM0Jq+9FXDcbR4GGzGWV8CuQ3y7oZoLPOG+uYoOJP99
 lu8moWguBL4SKgTlqCWgRt31nIQB3gYQn92ike5aL/C/9+DRYrfgvOOboAdwwj72LZts
 rtpg==
X-Gm-Message-State: AOJu0YwFmtAZCQWtgbBYC7H2ecrjERdMo6wTkwRUyTwUKuboY1M8kyh3
 fVYpH4+oZU/ds/ytraXD8X1W1sYTNqS1W5NdzpbWQ27PY6CcA49DlFs6AmAm2JSGysPKEc2DaRF
 cd0XZ
X-Gm-Gg: ASbGnct+r8CSeemrT2ziEFQHAuMmIWgeQeJ9chgnrydMXgnblENHpUIfBiSRdJggMS2
 4D2pVOY9m9p4eGVsDNjMACSyBm/BFQBAdZATFf1GnA5RtoixeFeM0Rif5hXKeuQPmqsrCsKN5tu
 FF998X89GeSPIJ6Mr9KZP0u6mKVIjvqziDnImKAkR8TCjLPg0aVRVr2UrjG1Z6Agq1x6IBn04gz
 eF8EJsfkR+V1NLsXVuzcDtRM6T1X3cDOOoJFXbXXOJShZRRgUKMtFKcMfA9ZT43JCgscQ8VbRjI
 d5RcBMFCyYARZE4r0WGrfraar3Qek0hJQh0uo3F4FjNgiZRM5WHz2H24+SCgIp2xtBt/hlj+ynK
 i9kw=
X-Google-Smtp-Source: AGHT+IEtxgMee3F8cEwS588/Oq+FsB429d091JlwGdPDXrh8xMU/PSNcrI8Jjf7H6Gjvny+Zdq5vOA==
X-Received: by 2002:a05:6102:c07:b0:4e5:a309:85e8 with SMTP id
 ada2fe7eead31-4e5a309874cmr3339660137.7.1748462503816; 
 Wed, 28 May 2025 13:01:43 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e59fc11a95sm1393736137.3.2025.05.28.13.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 13:01:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 0/4] hw/riscv: Add Server Platform Reference Board
Date: Wed, 28 May 2025 17:01:25 -0300
Message-ID: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi,

This is my attempt to ressurect the Server SoC Platform reference work
that has been buried for an year. The last posting was made an year ago
[1]. 

Most of the changes were made due to upstream differences from one year
ago. Patch 1 is an example of that.

In patch 2 (former 1), the main difference is the new CPU is rva23s64
compliant. This wasn't possible in May 2024 because we didn't have this
support back then.

Patch 3 consists mostly of code base changes rather than functional
changes. There was a discussion about whether we should supply fdts in
this machine back in the v2 review [2]. The answer is yes: machine mode
requires fdt to work, and we want to be flexible enough to generate our
own fdt instead of relying on EDK2 to supply them. Note that we can also
supply an EDK2-generated fdt via command line, bypassing the fdt created
by QEMU, if desired.

Patch 4 adds a riscv-iommu-sys device to the board. This wasn't possible
back then because we didn't have the required upstream support for it.

Patches based on alistair/riscv-to-apply.next.


Changes from v2:
- patch 1 (new):
  - allow CPUs other than 'bare' to assign profiles
- patch 2 (former 1):
  - added RVA23 profile support in the rvsp-ref CPU
- patch 3 (former 2):
  - hw/riscv/Kconfig changes:
    * added 'default y' in hw/riscv/Kconfig to build the board by default
    * added 'depends on RISCV64' to prevent the board to be built for qemu-system-riscv32

  - HMP qtest fixes:
    * added rvsp_aclint_allowed(). Use it instead of (!tcg_enabled()) when checking aclint support

  - changes in rvsp_ref_machine_done():
    * added 'RISCVBootInfo boot_info' struct
    * changed riscv_find_and_load_firmware(), riscv_calc_kernel_start_addr(),
      riscv_load_kernel() and riscv_compute_fdt_addr() to use boot_info

  - added "hw/char/serial-mm.h" include
  - changed 'addr' mem variables to 'hwaddr'
  - use HWADDR_PRIx format with 'addr' variables
  - changed GPEX_NUM_IRQS to PCI_NUM_PINS

- patch 4 (new):
  - add riscv-iommu-sys platform device
- v2 link: https://lore.kernel.org/qemu-riscv/20240312135222.3187945-1-fei2.wu@intel.com/


[1] https://lore.kernel.org/qemu-riscv/20240312135222.3187945-1-fei2.wu@intel.com/
[2] https://lore.kernel.org/qemu-riscv/CAHBxVyG186Zo7nAm7o8=vhBtzU+x8ry4_mWwHxuaZ8BasnDyPg@mail.gmail.com/

Daniel Henrique Barboza (2):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  hw/riscv/server_platform_ref.c: add riscv-iommu-sys

Fei Wu (2):
  target/riscv: Add server platform reference cpu
  hw/riscv: Add server platform reference machine

 configs/devices/riscv64-softmmu/default.mak |    1 +
 hw/riscv/Kconfig                            |   15 +
 hw/riscv/meson.build                        |    1 +
 hw/riscv/server_platform_ref.c              | 1346 +++++++++++++++++++
 target/riscv/cpu-qom.h                      |    1 +
 target/riscv/cpu.c                          |   12 +-
 6 files changed, 1375 insertions(+), 1 deletion(-)
 create mode 100644 hw/riscv/server_platform_ref.c

-- 
2.49.0


