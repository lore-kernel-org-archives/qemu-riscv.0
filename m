Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADCCD1AD44
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:41:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t1ApB-0004AE-RM; Wed, 16 Oct 2024 16:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t1Ap8-00048u-V3
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 16:40:50 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t1Ap5-0004bc-EA
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 16:40:49 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-7db637d1e4eso243384a12.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 13:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1729111245; x=1729716045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=igh5mCCa45zVdSMgTR9Sg53Z9Gk2P3nQElo7HTvMwp8=;
 b=Blowfvub8TAtUH/624pYvL5I/7dUH10fmeL6GRgzYw1MjcAr6oJ8mkBknwDkS08le8
 To+HiECBlkj9aXFFEGfBlYeolvNHY6hk54+av54KXn8Q+UUwM0AS/TlhhbAx3KKbMHm/
 T1mIKTDBcOroCpYR/g4o2dX8oqQFfc/mhG2WVBTXIRr5XHmuOoCxJF0VckIkYjpFxbT8
 lJkpT1jGo6Ze6j37I1uBoiFBHml0DfWhovbnFI+9u2FZIOI6W8BtqFAl0StTNwjxQqyn
 I2IlCqE7dH5RiMHSENuevYZFg1eEym29T5bqm0MI5BeEB7t4+hVq+UMeTBQvuMjG1p3e
 GgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729111245; x=1729716045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igh5mCCa45zVdSMgTR9Sg53Z9Gk2P3nQElo7HTvMwp8=;
 b=mfDvQNT+GqZxbqblJ8LfkBfe9QnPZ6y+HemZkJzfF0Q1XfqlIk4EeOyz2PrSJZEyWR
 2RDVv1BGmvz9ReU45jkczbe13b0vcUH6sD8oCBHUqovU9225qgrqrQ3eafDj156qrQ4Z
 37+o2lm6CKMC+waGuomBEueIg8W1U8vy+7beKtrW6vbXDbP3KV6QlUs/dY49qCjktyng
 /9q+ZGA7F6VgyA3336vUCyo3o/RgsoiOQBuIlqAJQ79mqgmUCiIy1vDwcbhnRrG1OI3b
 bNTqz4QmgWWrp4phCBwBQa90mnE+iAGYcvQhHyiN1NdAj4qoUIcZUaidB3/5IFAwlDIQ
 fs5A==
X-Gm-Message-State: AOJu0YyFjkKzfX4fLGV/e4/8qza1m960r9hba2UhJGiIokvUFVTbdJkX
 lPizF5hAe0lfNgjO7uaWECgcHDDIXaxqH3RJprHJ8FL3O5nhl8aRCxK/Dmb0v7vgG5IK4UzhEsH
 D
X-Google-Smtp-Source: AGHT+IEvjxU3S/vg1O9J6hb7WndUw9xEA9M9uBovBR971LFudAfTOnTrtGaKmL65/6fPOlGCGc9/sg==
X-Received: by 2002:a17:90a:f184:b0:2e2:e82d:48cf with SMTP id
 98e67ed59e1d1-2e3ab7fc85fmr6211847a91.16.1729111245276; 
 Wed, 16 Oct 2024 13:40:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e3e09085cfsm242158a91.54.2024.10.16.13.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 13:40:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 00/12] riscv: QEMU RISC-V IOMMU support
Date: Wed, 16 Oct 2024 17:40:24 -0300
Message-ID: <20241016204038.649340-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52c.google.com
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

In this new version we fixed address alignment issues in some command
queue commands, pointed out by Jason in v9.

No other changes made. Series based on alistair/riscv-to-apply.next.

All patches reviewed.

Changes from v9:
- patch 3:
  - fixed cmd.dword1 alignment in riscv_iommu_process_cq_tail()
- patch 8:
  - fixed cmd.dword1 alignment in riscv_iommu_process_cq_tail()
- v9 link: https://lore.kernel.org/qemu-riscv/20241004155721.2154626-1-dbarboza@ventanamicro.com/


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
 docs/specs/riscv-iommu.rst       |   90 ++
 docs/system/riscv/virt.rst       |   13 +
 hw/riscv/Kconfig                 |    4 +
 hw/riscv/meson.build             |    1 +
 hw/riscv/riscv-iommu-bits.h      |  421 ++++++
 hw/riscv/riscv-iommu-pci.c       |  202 +++
 hw/riscv/riscv-iommu.c           | 2399 ++++++++++++++++++++++++++++++
 hw/riscv/riscv-iommu.h           |  130 ++
 hw/riscv/trace-events            |   17 +
 hw/riscv/trace.h                 |    1 +
 hw/riscv/virt.c                  |   33 +-
 include/exec/memattrs.h          |    5 +
 include/hw/pci/pci.h             |    1 +
 include/hw/riscv/iommu.h         |   36 +
 meson.build                      |    1 +
 tests/qtest/libqos/meson.build   |    4 +
 tests/qtest/libqos/riscv-iommu.c |   76 +
 tests/qtest/libqos/riscv-iommu.h |  101 ++
 tests/qtest/meson.build          |    1 +
 tests/qtest/riscv-iommu-test.c   |  210 +++
 22 files changed, 3748 insertions(+), 1 deletion(-)
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


