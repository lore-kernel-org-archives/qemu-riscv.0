Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B85C61D92
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 05:35:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5fsa-0006yc-7B; Wed, 22 Nov 2023 00:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1r5fsX-0006wY-RZ; Wed, 22 Nov 2023 00:34:25 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1r5fsL-0006bb-R0; Wed, 22 Nov 2023 00:34:25 -0500
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 3AM5X9XB016100;
 Wed, 22 Nov 2023 13:33:09 +0800 (+08)
 (envelope-from ethan84@andestech.com)
Received: from ethan84-VirtualBox.andestech.com (10.0.12.51) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; 
 Wed, 22 Nov 2023 13:33:05 +0800
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <edgar.iglesias@gmail.com>,
 <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <in.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <dbarboza@ventanamicro.com>, <hiwei_liu@linux.alibaba.com>,
 <qemu-riscv@nongnu.org>, <peterx@redhat.com>, <david@redhat.com>,
 Ethan Chen <ethan84@andestech.com>
Subject: [PATCH v4 1/4] hw/core: Add config stream
Date: Wed, 22 Nov 2023 13:32:48 +0800
Message-ID: <20231122053251.440723-2-ethan84@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122053251.440723-1-ethan84@andestech.com>
References: <20231122053251.440723-1-ethan84@andestech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.51]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AM5X9XB016100
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

Make other device can use /hw/core/stream.c by select this config.

Signed-off-by: Ethan Chen <ethan84@andestech.com>
---
 hw/Kconfig          | 1 +
 hw/core/Kconfig     | 3 +++
 hw/core/meson.build | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index 9ca7b38c31..e4d153dce7 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -79,6 +79,7 @@ config XILINX
 config XILINX_AXI
     bool
     select PTIMER # for hw/dma/xilinx_axidma.c
+    select STREAM
 
 config XLNX_ZYNQMP
     bool
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index 9397503656..e89ffa728b 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -27,3 +27,6 @@ config REGISTER
 
 config SPLIT_IRQ
     bool
+
+config STREAM
+    bool
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 67dad04de5..0893917b12 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -32,8 +32,8 @@ system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
 system_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
 system_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
 system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
-system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
+system_ss.add(when: 'CONFIG_STREAM', if_true: files('stream.c'))
 
 system_ss.add(files(
   'cpu-sysemu.c',
-- 
2.34.1


