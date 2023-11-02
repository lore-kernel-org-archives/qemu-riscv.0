Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4593C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:46:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyX5j-0007jI-MO; Thu, 02 Nov 2023 08:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1qyUCK-0007Tp-Ql; Thu, 02 Nov 2023 05:41:10 -0400
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1qyUCE-0000ZH-GN; Thu, 02 Nov 2023 05:41:08 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3A29ebjg058695;
 Thu, 2 Nov 2023 17:40:37 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox.andestech.com (10.0.12.51) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Thu, 2 Nov 2023 17:40:35 +0800
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <pbonzini@redhat.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <in.meng@windriver.com>,
 <liweiwei@iscas.ac.cn>, <dbarboza@ventanamicro.com>,
 <hiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <peterx@redhat.com>, <david@redhat.com>, Ethan Chen <ethan84@andestech.com>
Subject: [PATCH v2 0/4] Support RISC-V IOPMP
Date: Thu, 2 Nov 2023 17:40:11 +0800
Message-ID: <20231102094015.208588-1-ethan84@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.51]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3A29ebjg058695
Received-SPF: pass client-ip=60.248.80.70; envelope-from=ethan84@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Nov 2023 08:46:30 -0400
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
Reply-to:  Ethan Chen <ethan84@andestech.com>
From:  Ethan Chen via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This series implements IOPMP specification v1.0.0-draft4 rapid-k model.

When IOPMP is enabled, a DMA device ATCDMAC300 is added to RISC-V virt
platform. This DMA devce is connected to the IOPMP and has the functionalities
required by IOPMP, including:
- Support specify source-id (SID)
- Support asynchronous I/O to handle stall transcations

IOPMP takes a transaction which partially match an entry as a partially hit
error. The transaction size is depending on source device, destination device
and bus.

As v1 disccussion, new iommu translate_size() function is not suitable because
the size may be modified in previos stage.

In addtion to SID, start address and end address are also added to MemTxAttrs
in v2. IOPMP matches transaction to an entry with those attributes.


Changes for v2:

  - Add iopmp_start_addr and iopmp_end_addr to MemTxAttrs.
  - Remove translate_size().
  - IOPMP: Get transaction info in attrs_to_index instead of using
    translate_size().
  - IOPMP: Fix some partially hit transactions are not detected.
  - ATCDMAC300: Fix write stall is not resumed correctly.
  - ATCDMAC300: Fix some partially hit errors are not detected.

Ethan Chen (4):
  exec/memattrs: Add iopmp source id, start address, end address to
    MemTxAttrs
  Add RISC-V IOPMP support
  hw/dma: Add Andes ATCDMAC300 support
  hw/riscv/virt: Add IOPMP support

 hw/dma/Kconfig                |   3 +
 hw/dma/atcdmac300.c           | 460 +++++++++++++++++
 hw/dma/meson.build            |   1 +
 hw/misc/Kconfig               |   3 +
 hw/misc/meson.build           |   1 +
 hw/misc/riscv_iopmp.c         | 902 ++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig              |   2 +
 hw/riscv/virt.c               |  68 +++
 include/exec/memattrs.h       |   6 +
 include/hw/dma/atcdmac300.h   | 171 +++++++
 include/hw/misc/riscv_iopmp.h | 330 +++++++++++++
 include/hw/riscv/virt.h       |  10 +-
 12 files changed, 1956 insertions(+), 1 deletion(-)
 create mode 100644 hw/dma/atcdmac300.c
 create mode 100644 hw/misc/riscv_iopmp.c
 create mode 100644 include/hw/dma/atcdmac300.h
 create mode 100644 include/hw/misc/riscv_iopmp.h

-- 
2.34.1


