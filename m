Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4571AC48BF6
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 16:03:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1riGDX-000546-Lb; Thu, 07 Mar 2024 11:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1riGDU-000537-A9
 for qemu-riscv@nongnu.org; Thu, 07 Mar 2024 11:03:32 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1riGDP-000633-U6
 for qemu-riscv@nongnu.org; Thu, 07 Mar 2024 11:03:32 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1dd2dca2007so8272895ad.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Mar 2024 08:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709827405; x=1710432205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XpDoYt2Qb/Km1f+I5GhoGYGwXZarW4PqGG8m8YQiDcM=;
 b=CfO7RreE4XDloWpbUpxBKvnSVQXepvMZuJzXwhSTc27TsD4SSwJ5PelDngneUgfET8
 wIK/kZk7kynvsWwDOKkOF/TOnm4CtjbyPV5dpNNbhfncuxNneGVZu5ZIPToXumycJRht
 a0u55wwcgvhXKUo7M6Bblm1lnkxLNDAdhuLCPJHEZWd9yzegYEoTlja8+1lDnC46Ekpu
 vkyL+sL79vhrpDWaNxau2ao4PyWfmp+m8uRYc0824HcMzpXQuYIXv28xdxFY/4/VpOtw
 bUaT8Ra3O2MnSb+GcbkaYRaNUC37fIkQ4o4ZL9mkQa2oBKPtRp6HUpY86J0VjWtXz5fP
 B1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709827405; x=1710432205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XpDoYt2Qb/Km1f+I5GhoGYGwXZarW4PqGG8m8YQiDcM=;
 b=IbH97YfJnvQqSMrz4dC5kJZyEfN6W+KditlWfgO8s3ByOYVNoFXn9rqCpIBuLLnGuN
 XGZA2gKpjw8NrtsLVmnJBnr5Nyu35xXr8k1AoA1AcfuZeZBISixOlPAMFrwl9It8Ef8h
 dCSgs1rO4hafuPTYqQF7uFSkjT35RszjbEqJw0Km25AjeIcFBIWwCppvoFAqJ8ZBiD4V
 TnKBkXd589YWhWgI8BebL0zVb46Bzjq9NLAKFN1Joseehmg3PtuL1nPH2pn+08Q7f4MO
 ChD8f89BsqydBygnuuN7LMfl9Hj8HmbpsVI3BG9/y8RBzIAKjZPFORH0eNUv9/GSvOvM
 OQFA==
X-Gm-Message-State: AOJu0YwKafqKWQZoLN7Gcc5ayEKc2Zh9HS53Qa+iyHF/ZAqZAoxwFIg2
 dI4vhi4ZARXDuYeh5K364maZuZZLzueX3iPJtiij7zjsK3MeCH2nC5HYBYmeW5k=
X-Google-Smtp-Source: AGHT+IHSaCML1erTlBWTp535Xj99gR8/V4Mw6i8kmGQD/Kk3sTS0iEgIeGWWOPI29u18kD4paQphJQ==
X-Received: by 2002:a17:902:c146:b0:1db:9a69:293d with SMTP id
 6-20020a170902c14600b001db9a69293dmr7412480plj.24.1709827405287; 
 Thu, 07 Mar 2024 08:03:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170903124b00b001db2b8b2da7sm14663136plh.122.2024.03.07.08.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 08:03:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, tjeznach@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 00/15] riscv: QEMU RISC-V IOMMU Support
Date: Thu,  7 Mar 2024 13:03:03 -0300
Message-ID: <20240307160319.675044-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

Hi,

This is the second version of the work Tomasz sent in July 2023 [1].
I'll be helping Tomasz upstreaming it. 

The core emulation code is left unchanged but a few tweaks were made in
v2:

- The most notable difference in this version is that the code was split
  in smaller chunks. Patch 03 is still a 1700 lines patch, which is an
  improvement from the 3800 lines patch from v1, but we can only go so
  far when splitting the core components of the emulation. The reality
  is that the IOMMU emulation is a rather complex piece of software and
  there's not much we can do to alleviate it;

- I'm not contributing the HPM support that was present in v1. It shaved
  off 600 lines of code from the series, which is already large enough
  as is. We'll introduce HPM in later versions or as a follow-up;

- The riscv-iommu-header.h header was also trimmed. I shaved it of 300
  or so from it, all of them from definitions that the emulation isn't
  using it. The header will be eventually be imported from the Linux
  driver (not upstream yet), so for now we can live with a trimmed
  header for the emulation usage alone;

- I added libqos tests for the riscv-iommu-pci device. The idea of these
  tests is to give us more confidence in the emulation code;

- 'edu' device support. The support was retrieved from Tomasz EDU branch
  [2]. This device can then be used to test PCI passthrough to exercise
  the IOMMU.


Patches based on alistair/riscv-to-apply.next.

v1 link: https://lore.kernel.org/qemu-riscv/cover.1689819031.git.tjeznach@rivosinc.com/

[1] https://lore.kernel.org/qemu-riscv/cover.1689819031.git.tjeznach@rivosinc.com/
[2] https://github.com/tjeznach/qemu.git, branch 'riscv_iommu_edu_impl'

Andrew Jones (1):
  hw/riscv/riscv-iommu: Add another irq for mrif notifications

Daniel Henrique Barboza (2):
  test/qtest: add riscv-iommu-pci tests
  qtest/riscv-iommu-test: add init queues test

Tomasz Jeznach (12):
  exec/memtxattr: add process identifier to the transaction attributes
  hw/riscv: add riscv-iommu-bits.h
  hw/riscv: add RISC-V IOMMU base emulation
  hw/riscv: add riscv-iommu-pci device
  hw/riscv: add riscv-iommu-sys platform device
  hw/riscv/virt.c: support for RISC-V IOMMU PCIDevice hotplug
  hw/riscv/riscv-iommu: add Address Translation Cache (IOATC)
  hw/riscv/riscv-iommu: add s-stage and g-stage support
  hw/riscv/riscv-iommu: add ATS support
  hw/riscv/riscv-iommu: add DBG support
  hw/misc: EDU: added PASID support
  hw/misc: EDU: add ATS/PRI capability

 hw/misc/edu.c                    |  297 ++++-
 hw/riscv/Kconfig                 |    4 +
 hw/riscv/meson.build             |    1 +
 hw/riscv/riscv-iommu-bits.h      |  407 ++++++
 hw/riscv/riscv-iommu-pci.c       |  173 +++
 hw/riscv/riscv-iommu-sys.c       |   93 ++
 hw/riscv/riscv-iommu.c           | 2085 ++++++++++++++++++++++++++++++
 hw/riscv/riscv-iommu.h           |  146 +++
 hw/riscv/trace-events            |   15 +
 hw/riscv/trace.h                 |    2 +
 hw/riscv/virt.c                  |   33 +-
 include/exec/memattrs.h          |    5 +
 include/hw/riscv/iommu.h         |   40 +
 meson.build                      |    1 +
 tests/qtest/libqos/meson.build   |    4 +
 tests/qtest/libqos/riscv-iommu.c |   79 ++
 tests/qtest/libqos/riscv-iommu.h |   96 ++
 tests/qtest/meson.build          |    1 +
 tests/qtest/riscv-iommu-test.c   |  234 ++++
 19 files changed, 3704 insertions(+), 12 deletions(-)
 create mode 100644 hw/riscv/riscv-iommu-bits.h
 create mode 100644 hw/riscv/riscv-iommu-pci.c
 create mode 100644 hw/riscv/riscv-iommu-sys.c
 create mode 100644 hw/riscv/riscv-iommu.c
 create mode 100644 hw/riscv/riscv-iommu.h
 create mode 100644 hw/riscv/trace-events
 create mode 100644 hw/riscv/trace.h
 create mode 100644 include/hw/riscv/iommu.h
 create mode 100644 tests/qtest/libqos/riscv-iommu.c
 create mode 100644 tests/qtest/libqos/riscv-iommu.h
 create mode 100644 tests/qtest/riscv-iommu-test.c

-- 
2.43.2


