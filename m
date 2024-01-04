Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB7BC47074
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 07:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLHxQ-0001m3-9c; Thu, 04 Jan 2024 02:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1rLHxN-0001kH-E7; Thu, 04 Jan 2024 02:15:57 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1rLHxJ-0002B3-Du; Thu, 04 Jan 2024 02:15:57 -0500
X-QQ-mid: bizesmtp87t1704352525tdv3w4yw
Received: from ubuntu.. ( [111.196.133.100]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Jan 2024 15:15:23 +0800 (CST)
X-QQ-SSF: 01200000000000F0I000000A0000000
X-QQ-FEAT: +ynUkgUhZJneV3O8vwQ6VqNCfIA+YGrhLMoq2uYiPpxq/RvPqkHFrU0luWxEx
 hvkzb+qq7yOY7HORcTUxN3jYeUOz1jrGZLKQi94Ir9cftgaJZaKt/4mG8JhzLssBNwgLqOX
 xyZEoBOt6g6/l4qLUupllSxMMCyC4osw2xa/iLxMhQs5KXlj6wUIm3CtKtX9NLGh2bolORy
 0pecdLdbySRxD45419bbY3jsJE0Uhv6dkT/Ullk+kb4cfh0dn4vLMgTzvroWWxONdb4i6lQ
 e85eUOqVnnGi+kbe5ufjiDlQXO3s+cD/Jp/LFDR+vlmLvAza62Wlka7FwtX9rMZEVZHEIUr
 FGAbF/E
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9677172758537372753
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH] docs/system/riscv: sifive_u: Update S-mode U-Boot image build
 instructions
Date: Thu,  4 Jan 2024 15:15:23 +0800
Message-Id: <20240104071523.273702-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz7a-0
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently, the documentation outlines the process for building the
S-mode U-Boot image using `make menuconfig` and manual actions within
the menuconfig UI. However, this approach is fragile due to Kconfig
options potentially changing across different releases. For example,
CONFIG_OF_PRIOR_STAGE has been replaced by CONFIG_BOARD since v2022.01
release, and CONFIG_TEXT_BASE has been moved to the 'General setup'
menu from the 'Boot options' menu in v2024.01 release.

This update aims to make the S-mode U-Boot image build instructions
future-proof. It leverages the 'config' script provided in the U-Boot
source tree to edit the .config file, followed by a `make olddefconfig`.

Validated with U-Boot v2024.01 release.

Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

 docs/system/riscv/sifive_u.rst | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 7b166567f9..8f55ae8e31 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -210,7 +210,7 @@ command line options with ``qemu-system-riscv32``.
 Running U-Boot
 --------------
 
-U-Boot mainline v2021.07 release is tested at the time of writing. To build a
+U-Boot mainline v2024.01 release is tested at the time of writing. To build a
 U-Boot mainline bootloader that can be booted by the ``sifive_u`` machine, use
 the sifive_unleashed_defconfig with similar commands as described above for
 Linux:
@@ -325,15 +325,10 @@ configuration of U-Boot:
 
   $ export CROSS_COMPILE=riscv64-linux-
   $ make sifive_unleashed_defconfig
-  $ make menuconfig
-
-then manually select the following configuration:
-
-  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior Stage bootloader DTB
-
-and unselect the following configuration:
-
-  * Library routines ---> Allow access to binman information in the device tree
+  $ ./scripts/config --enable OF_BOARD
+  $ ./scripts/config --disable BINMAN_FDT
+  $ ./scripts/config --disable SPL
+  $ make olddefconfig
 
 This changes U-Boot to use the QEMU generated device tree blob, and bypass
 running the U-Boot SPL stage.
@@ -352,17 +347,13 @@ It's possible to create a 32-bit U-Boot S-mode image as well.
 
   $ export CROSS_COMPILE=riscv64-linux-
   $ make sifive_unleashed_defconfig
-  $ make menuconfig
-
-then manually update the following configuration in U-Boot:
-
-  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior Stage bootloader DTB
-  * RISC-V architecture ---> Base ISA ---> RV32I
-  * Boot options ---> Boot images ---> Text Base ---> 0x80400000
-
-and unselect the following configuration:
-
-  * Library routines ---> Allow access to binman information in the device tree
+  $ ./scripts/config --disable ARCH_RV64I
+  $ ./scripts/config --enable ARCH_RV32I
+  $ ./scripts/config --set-val TEXT_BASE 0x80400000
+  $ ./scripts/config --enable OF_BOARD
+  $ ./scripts/config --disable BINMAN_FDT
+  $ ./scripts/config --disable SPL
+  $ make olddefconfig
 
 Use the same command line options to boot the 32-bit U-Boot S-mode image:
 
-- 
2.34.1


