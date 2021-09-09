Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOHpg-0001eL-8l
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 07:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpe-0001eC-4n
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 07:03:02 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpT-00027E-3G
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 07:03:01 -0400
Received: by mail-pg1-x536.google.com with SMTP id w8so1395756pgf.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=GCGo+DKC8Gm3ilVKb/Al+mlNXg8Ob1gZZWlUXEh+wHo=;
 b=oW77Em//ggZQqE8LtT4MJbelo672ksEJW7Zfs/jsiIf+jtrv53CPlwDU0Q/MjXs29r
 ZMKzBjqgO4p+LahBR0pq/L2/wnajWWQjqxQPlQJlph5Vs7KmECg5JSIJrcDYC2SJH7el
 XWc60Rr+BNYulvYPABGCMGLVrmIqpwT3qRgpXNXdyMD7ybSgOxjOc9FyvVRTUZPvu7hU
 G09DTBkTd3GhZaQWZiB9sDZoW/9fKBvFqv3XliDsYN9M1kfnPQRjY5ooQBamZP/VyZGP
 xDlHx5wGcT5GcyalbjkOcZpUTfxV5wr4pzTkmCKW4IjcDRWndwn2TLcF6Bflaox3Dvn+
 fplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GCGo+DKC8Gm3ilVKb/Al+mlNXg8Ob1gZZWlUXEh+wHo=;
 b=vAC7whJ5OECWp9FUrB97Q6S7ohUqQIuizuLXvPappktmgueMMKUnYhUJypSliwVtyr
 U4ZKc3GzhPv/3JYdABcQljTwbblJM0F2NUdw0wVKcKV/nfq4jhgVecjyUiCKvXbK/fEt
 S8XPcIaBy0x6HTjOX1g+JLm1FZKwp4cOkAoNomMTuWPEmK3TS+woNXjOGCrLFdOy3JLf
 a5J/a47lwj6OWQ1lEJ+T2dl6ACxDORaZlYmy/hrbHwzKPolMEBThwor3AlmMgccyPF11
 nI+6/GU8CSdK+Gm4TzDTjpZ5xw/2UDLt7AE/LUiuqd2T3JfriNoQe8Wm2wQMqtgXW4r1
 Kz4g==
X-Gm-Message-State: AOAM533syxxEomRqHEPExMmrR6+i6p8BDwtvltJS6clcHw6nsL0GVXX7
 L2z5HlBbeQpSFF1LMijEtNtfOg==
X-Google-Smtp-Source: ABdhPJzL502U3yH65stnLQFlzpFyzXoXJte0NXZZHCeLxk498QcjdZBD/UjDI+bOrEzoklykqBrECg==
X-Received: by 2002:a63:e413:: with SMTP id a19mr2127078pgi.408.1631185367411; 
 Thu, 09 Sep 2021 04:02:47 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.198.246])
 by smtp.googlemail.com with ESMTPSA id g19sm1894103pjl.25.2021.09.09.04.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 04:02:46 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH v1 0/3] PCIe Root complex event collector
Date: Thu,  9 Sep 2021 16:32:18 +0530
Message-Id: <20210909110221.703-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Sep 2021 11:03:02 -0000

Hi All,

This is a first attempt to add PCIe Root Complex Event Collector emulation
support to Qemu. This patch is created on Qemu commit:88afdc92b6 and tested
using Qemu Risc V virt machine and the PCIe aer error injection module in the
Linux kernel(v 5.14).

Thanks,
Mayuresh.

Mayuresh Chitale (3):
  hw/pci/pcie.c: modify PCIe Express capability for RCiEP and RCEC
  hw/pci: Add PCIe RCEC support
  docs: pcie: RCEC

 docs/pcie.txt              |  16 +++--
 hw/pci/meson.build         |   2 +-
 hw/pci/pcie.c              |  40 ++++++++++---
 hw/pci/pcie_aer.c          |   9 +++
 hw/pci/pcie_rcec.c         | 119 +++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h       |   1 +
 include/hw/pci/pci_ids.h   |   1 +
 include/hw/pci/pcie.h      |   3 +
 include/hw/pci/pcie_regs.h |   3 +
 9 files changed, 180 insertions(+), 14 deletions(-)
 create mode 100644 hw/pci/pcie_rcec.c

-- 
2.17.1


