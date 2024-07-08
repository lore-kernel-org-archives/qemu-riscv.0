Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E12C3271E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 17:35:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sQsGf-00056g-6B; Mon, 08 Jul 2024 13:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sQsGe-00055i-Hy
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 13:35:12 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sQsGc-0007l0-LR
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 13:35:12 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70af8062039so2536254b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Jul 2024 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720460109; x=1721064909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BmNAIMyEKVsxbwgCoLc24DkY1wQMfb3Vv8J9XO3mGC4=;
 b=EfnB6uC0pz8G1oap+SRyfT393fLg3h1wafJ0roP/9c6bC/+1rLYZO3diCK0LgoEA2h
 ThLHKMI8Eq1/u3bCNhmrR3rJmRFKS5JBy0DnRlONsx/TwJQwOEFBai2kaekeDG2oUxyM
 arkAAAvyDgfS/xiCwUjho1HiPLFpFm0RMQ5LRPs0NCAoAkidC4rPcEO78YKMACRAmvLo
 /qZFgYQ8BAWntuADDjU9rUijeNPZNRluNgnx5HwN+sY7TTqOSqQYw6dBMD6QHPpQemEJ
 oy8/IcnQVuEWjpqV5sDH1g5mOU7W/6fRw4+nWWaFwhASOc0dljUSPeweQvewNp1z6T6R
 UhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720460109; x=1721064909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BmNAIMyEKVsxbwgCoLc24DkY1wQMfb3Vv8J9XO3mGC4=;
 b=cdmPDHzVlUnP9GxIC/LpJA5xpLB3C5bvbgb85bHfLa5aascVDW+0ZddGt0OeRqLgOD
 GzaLCh/n2h4gVwlZpu7YDn0iprejzQlIZn+iyTtMRkcms0xIT5r2XDfEvbcEZMErA8zO
 V0yzUMOyJIfLDkfO5+17ka+47Wx6sHXJK/rWWwPX4HPB2yl6owUKjay4vVf4UwL7qRwG
 RMvxnhDRr+KG6T1zcnOSeAIoWJFcgFPlnHddwydgPvxayCaEgetgaTGapGXQzua3vk1f
 h4eGdBVCFt+1U7Sn7RxNirlan2jPS/nBjKGbcmmau4oiCNf1Z7LyGFJdTEB7OT3fqQ7W
 grPQ==
X-Gm-Message-State: AOJu0YxTrHCI7bDPwnOwjDAhtt0ANuHdwm3FN4uSY6DBJadRXCd4G/mA
 d1+nomnYE7qI7kkQeq2CeNnOIgf120rl2jXPgvZUkogdBudOjxeOwZTUAi/6DhA=
X-Google-Smtp-Source: AGHT+IFJADvGlUHMA9N2KAbimhRVdBkKnbmC4l8y+Os1jawMBnGZds9vh/RU/FLKy3Vty59hQI8i1g==
X-Received: by 2002:a05:6a20:c744:b0:1c2:8949:5ba1 with SMTP id
 adf61e73a8af0-1c2984ce6b3mr61191637.53.1720460108617; 
 Mon, 08 Jul 2024 10:35:08 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ad3829sm1153765ad.299.2024.07.08.10.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 frank.chang@sifive.com, tjeznach@rivosinc.com, jason.chien@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 00/13] riscv: QEMU RISC-V IOMMU Support
Date: Mon,  8 Jul 2024 14:34:47 -0300
Message-ID: <20240708173501.426225-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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

Hi,

In this new version changes based on the suggestions made in v4 were
made.

The most notable change, however, is the merge of patches 3 (base IOMMU
emulation and 9 (s-stage and g-stage) from v4 into a single patch. There
were several instances throughout the revisions of this work where a
comment made in patch 3 was relevant or made obsolete by patch 9. Having
them merged together in a single patch will put all the translation code
in a single patch, making it easier to review the whole picture.

Series based on alistair/riscv-to-apply.next. It's also applicable on
top of master.

Patches missing acks: 3, 13.

Changes from v4:
- patch 1:
  - renamed MemTxAttrs.pasid to MemTxAttrs.pid 
- patch 2:
  - removed qemu/osdep.h include from riscv-iommu-bits.h
- patch 3:
  - squashed with patch 9 ("hw/riscv/riscv-iommu: add s-stage and g-stage support")
  - renamed 'pasid_bits' to 'pid_bits'
  - added "!s->enable_msi" check to riscv_iommu_msi_check()
  - removed riscv_iommu_msi_check() from riscv_iommu_msi_write()
- patch 13 (former 14):
  - added information on all configuration parameters in the doc
- v4 link: https://lore.kernel.org/qemu-riscv/20240624201825.1054980-1-dbarboza@ventanamicro.com/


Andrew Jones (1):
  hw/riscv/riscv-iommu: Add another irq for mrif notifications

Daniel Henrique Barboza (4):
  pci-ids.rst: add Red Hat pci-id for RISC-V IOMMU device
  test/qtest: add riscv-iommu-pci tests
  qtest/riscv-iommu-test: add init queues test
  docs/specs: add riscv-iommu

Tomasz Jeznach (8):
  exec/memtxattr: add process identifier to the transaction attributes
  hw/riscv: add riscv-iommu-bits.h
  hw/riscv: add RISC-V IOMMU base emulation
  hw/riscv: add riscv-iommu-pci reference device
  hw/riscv/virt.c: support for RISC-V IOMMU PCIDevice hotplug
  hw/riscv/riscv-iommu: add Address Translation Cache (IOATC)
  hw/riscv/riscv-iommu: add ATS support
  hw/riscv/riscv-iommu: add DBG support

 docs/specs/index.rst             |    1 +
 docs/specs/pci-ids.rst           |    2 +
 docs/specs/riscv-iommu.rst       |   55 +
 docs/system/riscv/virt.rst       |   13 +
 hw/riscv/Kconfig                 |    4 +
 hw/riscv/meson.build             |    1 +
 hw/riscv/riscv-iommu-bits.h      |  417 ++++++
 hw/riscv/riscv-iommu-pci.c       |  178 +++
 hw/riscv/riscv-iommu.c           | 2370 ++++++++++++++++++++++++++++++
 hw/riscv/riscv-iommu.h           |  148 ++
 hw/riscv/trace-events            |   15 +
 hw/riscv/trace.h                 |    1 +
 hw/riscv/virt.c                  |   33 +-
 include/exec/memattrs.h          |    5 +
 include/hw/pci/pci.h             |    1 +
 include/hw/riscv/iommu.h         |   36 +
 meson.build                      |    1 +
 tests/qtest/libqos/meson.build   |    4 +
 tests/qtest/libqos/riscv-iommu.c |   76 +
 tests/qtest/libqos/riscv-iommu.h |  100 ++
 tests/qtest/meson.build          |    1 +
 tests/qtest/riscv-iommu-test.c   |  234 +++
 22 files changed, 3695 insertions(+), 1 deletion(-)
 create mode 100644 docs/specs/riscv-iommu.rst
 create mode 100644 hw/riscv/riscv-iommu-bits.h
 create mode 100644 hw/riscv/riscv-iommu-pci.c
 create mode 100644 hw/riscv/riscv-iommu.c
 create mode 100644 hw/riscv/riscv-iommu.h
 create mode 100644 hw/riscv/trace-events
 create mode 100644 hw/riscv/trace.h
 create mode 100644 include/hw/riscv/iommu.h
 create mode 100644 tests/qtest/libqos/riscv-iommu.c
 create mode 100644 tests/qtest/libqos/riscv-iommu.h
 create mode 100644 tests/qtest/riscv-iommu-test.c

-- 
2.45.2


