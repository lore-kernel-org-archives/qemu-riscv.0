Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mJH7e-0002ss-B8
	for mharc-qemu-riscv@gnu.org; Thu, 26 Aug 2021 11:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mJH7a-0002jE-RP; Thu, 26 Aug 2021 11:16:50 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:22684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mJH7X-0002Gy-F1; Thu, 26 Aug 2021 11:16:50 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17QFDeJr022151;
 Thu, 26 Aug 2021 23:13:41 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 26 Aug 2021 23:13:41 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <alistair23@gmail.com>, 
 <wangjunqiang@iscas.ac.cn>, <bin.meng@windriver.com>
CC: <alankao@andestech.com>, <dylan@andestech.com>,
 <imruinland.cs00@g2.nctu.edu.tw>, Ruinland ChuanTzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH 2/2] Adding necessary files for Andes platforms,
 cores to enable custom CSR support
Date: Thu, 26 Aug 2021 23:13:32 +0800
Message-ID: <20210826151332.32753-3-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210826151332.32753-1-ruinland@andestech.com>
References: <20210826151332.32753-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17QFDeJr022151
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 26 Aug 2021 15:16:51 -0000

From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

Since Andes A25/AX25 is an extented "target" to existing, we suggest that if a
vendor flavored RISC-V platform or core is presented, it could utilize the
fact that `configure` the way how a "target" is defined by making corresponding
mak files. `rv_custom` is presented for the mere use that the `meson.build`
uses minikconf to parse `default-configs/devices/*.mak`, we want to use
minimize the change of logics.
---
 .../devices/riscv32-andes-softmmu.mak           | 17 +++++++++++++++++
 .../devices/riscv64-andes-softmmu.mak           | 17 +++++++++++++++++
 .../targets/riscv32-andes-linux-user.mak        |  1 +
 .../targets/riscv32-andes-softmmu.mak           |  1 +
 .../targets/riscv64-andes-linux-user.mak        |  1 +
 .../targets/riscv64-andes-softmmu.mak           |  1 +
 default-configs/targets/rv_custom/no_custom.mak |  0
 .../rv_custom/riscv32-andes-linux-user.mak      |  1 +
 .../targets/rv_custom/riscv32-andes-softmmu.mak |  1 +
 .../targets/rv_custom/riscv32-linux-user.mak    |  1 +
 .../targets/rv_custom/riscv32-softmmu.mak       |  1 +
 .../rv_custom/riscv64-andes-linux-user.mak      |  1 +
 .../targets/rv_custom/riscv64-andes-softmmu.mak |  1 +
 .../targets/rv_custom/riscv64-linux-user.mak    |  1 +
 .../targets/rv_custom/riscv64-softmmu.mak       |  1 +
 15 files changed, 46 insertions(+)
 create mode 100644 default-configs/devices/riscv32-andes-softmmu.mak
 create mode 100644 default-configs/devices/riscv64-andes-softmmu.mak
 create mode 120000 default-configs/targets/riscv32-andes-linux-user.mak
 create mode 120000 default-configs/targets/riscv32-andes-softmmu.mak
 create mode 120000 default-configs/targets/riscv64-andes-linux-user.mak
 create mode 120000 default-configs/targets/riscv64-andes-softmmu.mak
 create mode 100644 default-configs/targets/rv_custom/no_custom.mak
 create mode 100644 default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
 create mode 100644 default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
 create mode 120000 default-configs/targets/rv_custom/riscv32-linux-user.mak
 create mode 120000 default-configs/targets/rv_custom/riscv32-softmmu.mak
 create mode 100644 default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
 create mode 100644 default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
 create mode 120000 default-configs/targets/rv_custom/riscv64-linux-user.mak
 create mode 120000 default-configs/targets/rv_custom/riscv64-softmmu.mak

diff --git a/default-configs/devices/riscv32-andes-softmmu.mak b/default-configs/devices/riscv32-andes-softmmu.mak
new file mode 100644
index 0000000..8f2e781
--- /dev/null
+++ b/default-configs/devices/riscv32-andes-softmmu.mak
@@ -0,0 +1,17 @@
+# Default configuration for riscv32-softmmu
+
+# Uncomment the following lines to disable these optional devices:
+#
+#CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+
+# Boards:
+#
+CONFIG_ANDES_AE350=y
+CONFIG_SPIKE=y
+CONFIG_SIFIVE_E=y
+CONFIG_SIFIVE_U=y
+CONFIG_RISCV_VIRT=y
+CONFIG_OPENTITAN=y
+CONFIG_ANDES_CORE=y
diff --git a/default-configs/devices/riscv64-andes-softmmu.mak b/default-configs/devices/riscv64-andes-softmmu.mak
new file mode 100644
index 0000000..7120cb8
--- /dev/null
+++ b/default-configs/devices/riscv64-andes-softmmu.mak
@@ -0,0 +1,17 @@
+# Default configuration for riscv64-softmmu
+
+# Uncomment the following lines to disable these optional devices:
+#
+#CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+
+# Boards:
+#
+CONFIG_ANDES_AE350=y
+CONFIG_SPIKE=y
+CONFIG_SIFIVE_E=y
+CONFIG_SIFIVE_U=y
+CONFIG_RISCV_VIRT=y
+CONFIG_MICROCHIP_PFSOC=y
+CONFIG_ANDES_CORE=y
diff --git a/default-configs/targets/riscv32-andes-linux-user.mak b/default-configs/targets/riscv32-andes-linux-user.mak
new file mode 120000
index 0000000..640a619
--- /dev/null
+++ b/default-configs/targets/riscv32-andes-linux-user.mak
@@ -0,0 +1 @@
+./riscv32-linux-user.mak
\ No newline at end of file
diff --git a/default-configs/targets/riscv32-andes-softmmu.mak b/default-configs/targets/riscv32-andes-softmmu.mak
new file mode 120000
index 0000000..e806510
--- /dev/null
+++ b/default-configs/targets/riscv32-andes-softmmu.mak
@@ -0,0 +1 @@
+./riscv32-softmmu.mak
\ No newline at end of file
diff --git a/default-configs/targets/riscv64-andes-linux-user.mak b/default-configs/targets/riscv64-andes-linux-user.mak
new file mode 120000
index 0000000..01cefa0
--- /dev/null
+++ b/default-configs/targets/riscv64-andes-linux-user.mak
@@ -0,0 +1 @@
+./riscv64-linux-user.mak
\ No newline at end of file
diff --git a/default-configs/targets/riscv64-andes-softmmu.mak b/default-configs/targets/riscv64-andes-softmmu.mak
new file mode 120000
index 0000000..ed1cae6
--- /dev/null
+++ b/default-configs/targets/riscv64-andes-softmmu.mak
@@ -0,0 +1 @@
+./riscv64-softmmu.mak
\ No newline at end of file
diff --git a/default-configs/targets/rv_custom/no_custom.mak b/default-configs/targets/rv_custom/no_custom.mak
new file mode 100644
index 0000000..e69de29
diff --git a/default-configs/targets/rv_custom/riscv32-andes-linux-user.mak b/default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
new file mode 100644
index 0000000..984affb
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv32-andes-linux-user.mak
@@ -0,0 +1 @@
+CONFIG_ANDES_CORE=y
diff --git a/default-configs/targets/rv_custom/riscv32-andes-softmmu.mak b/default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
new file mode 100644
index 0000000..984affb
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv32-andes-softmmu.mak
@@ -0,0 +1 @@
+CONFIG_ANDES_CORE=y
diff --git a/default-configs/targets/rv_custom/riscv32-linux-user.mak b/default-configs/targets/rv_custom/riscv32-linux-user.mak
new file mode 120000
index 0000000..073fa18
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv32-linux-user.mak
@@ -0,0 +1 @@
+./no_custom.mak
\ No newline at end of file
diff --git a/default-configs/targets/rv_custom/riscv32-softmmu.mak b/default-configs/targets/rv_custom/riscv32-softmmu.mak
new file mode 120000
index 0000000..073fa18
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv32-softmmu.mak
@@ -0,0 +1 @@
+./no_custom.mak
\ No newline at end of file
diff --git a/default-configs/targets/rv_custom/riscv64-andes-linux-user.mak b/default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
new file mode 100644
index 0000000..984affb
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv64-andes-linux-user.mak
@@ -0,0 +1 @@
+CONFIG_ANDES_CORE=y
diff --git a/default-configs/targets/rv_custom/riscv64-andes-softmmu.mak b/default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
new file mode 100644
index 0000000..984affb
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv64-andes-softmmu.mak
@@ -0,0 +1 @@
+CONFIG_ANDES_CORE=y
diff --git a/default-configs/targets/rv_custom/riscv64-linux-user.mak b/default-configs/targets/rv_custom/riscv64-linux-user.mak
new file mode 120000
index 0000000..073fa18
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv64-linux-user.mak
@@ -0,0 +1 @@
+./no_custom.mak
\ No newline at end of file
diff --git a/default-configs/targets/rv_custom/riscv64-softmmu.mak b/default-configs/targets/rv_custom/riscv64-softmmu.mak
new file mode 120000
index 0000000..073fa18
--- /dev/null
+++ b/default-configs/targets/rv_custom/riscv64-softmmu.mak
@@ -0,0 +1 @@
+./no_custom.mak
\ No newline at end of file
-- 
2.32.0


