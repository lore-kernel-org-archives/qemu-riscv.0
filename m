Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E595C4167D
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 09:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2q1T-0005Np-Nz; Tue, 14 Nov 2023 04:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1r2q1S-0005N9-J4; Tue, 14 Nov 2023 04:47:54 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1r2q1O-00011K-Ee; Tue, 14 Nov 2023 04:47:54 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3AE9lHel081392;
 Tue, 14 Nov 2023 17:47:17 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox.andestech.com (10.0.12.51) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Tue, 14 Nov 2023 17:47:13 +0800
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <edgar.iglesias@gmail.com>,
 <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <in.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <dbarboza@ventanamicro.com>, <hiwei_liu@linux.alibaba.com>,
 <qemu-riscv@nongnu.org>, <peterx@redhat.com>, <david@redhat.com>,
 Ethan Chen <ethan84@andestech.com>
Subject: [PATCH v3 0/4] Support RISC-V IOPMP
Date: Tue, 14 Nov 2023 17:47:01 +0800
Message-ID: <20231114094705.109146-1-ethan84@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.51]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AE9lHel081392
Received-SPF: pass client-ip=60.248.80.70; envelope-from=ethan84@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Source device can send transaction information to IOPMP StreamSink. IOPMP will
check partially hit with transaction information. If source device does not send
transaction information, IOPMP will skip partially hit check.

Changes for v3:
  - Remove iopmp_start_addr and iopmp_end_addr in MemTxAttrs
  - IOPMP: Get transaction_info from StreamSink instead of MemTxAttrs
  - ATCDMAC300: Convert ATCDMAC burst to AXI burst
  - ATCDMAC300: Send transaction_info to IOPMP StreamSink

Ethan Chen (4):
  hw/core: Add config stream
  Add RISC-V IOPMP support
  hw/dma: Add Andes ATCDMAC300 support
  hw/riscv/virt: Add IOPMP support

 hw/core/Kconfig                               |   3 +
 hw/core/meson.build                           |   1 +
 hw/dma/Kconfig                                |   4 +
 hw/dma/atcdmac300.c                           | 566 ++++++++++
 hw/dma/meson.build                            |   1 +
 hw/misc/Kconfig                               |   4 +
 hw/misc/meson.build                           |   1 +
 hw/misc/riscv_iopmp.c                         | 967 ++++++++++++++++++
 hw/riscv/Kconfig                              |   2 +
 hw/riscv/virt.c                               |  72 +-
 include/hw/dma/atcdmac300.h                   | 180 ++++
 include/hw/misc/riscv_iopmp.h                 | 342 +++++++
 .../hw/misc/riscv_iopmp_transaction_info.h    |  28 +
 include/hw/riscv/virt.h                       |  10 +-
 14 files changed, 2178 insertions(+), 3 deletions(-)
 create mode 100644 hw/dma/atcdmac300.c
 create mode 100644 hw/misc/riscv_iopmp.c
 create mode 100644 include/hw/dma/atcdmac300.h
 create mode 100644 include/hw/misc/riscv_iopmp.h
 create mode 100644 include/hw/misc/riscv_iopmp_transaction_info.h

-- 
2.34.1


