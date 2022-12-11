Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4CpE-0003Uc-8e
	for mharc-qemu-riscv@gnu.org; Sat, 10 Dec 2022 22:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4CpC-0003Sy-1p; Sat, 10 Dec 2022 22:16:22 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4Cp9-0007Wu-Tx; Sat, 10 Dec 2022 22:16:21 -0500
X-QQ-mid: bizesmtp68t1670728116tlzl42ne
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:08:35 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: y2QbpjJ0aruSxrKTIG5PW74A+O0T4sgG+OOobB4xdBVQahU9+eZBv8t6qzf1q
 63QEHvPwrMF5aoNk50xaX9dpf/W31a1QKGh2TGJHTOv58AOGoSEQtJX+/FVj4JW8LGnPYbh
 2CKwtmVnW4fS8lRLq/sMiUI3jRahw+pro82i5GwRePC0Dqbt2zMWW/cD2D2YWNbjd5gNrdX
 QuTi//+tXvC2vQUxjixoAD/YJhNaZR45AdJgYz59qEAUvnxtsm/RVTGTilx3ZlKXPY1tkDq
 YXaMkeYDF49LHysK8OJsHKJvmSxoc+Zahu4yKCWnvIk8N4NlQ1+pLmdG82GyEU7ATJArCGQ
 /AUU7fYtjW9/+qU6lYJ3s/cjhKAJgH75dpTf6Y2
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 03/16] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
Date: Sun, 11 Dec 2022 11:08:16 +0800
Message-Id: <20221211030829.802437-3-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 11 Dec 2022 03:16:22 -0000

Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest build")
the IBEX PLIC model was replaced with the SiFive PLIC model in the
'opentitan' machine but we forgot the add the dependency there.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 167dc4cca6..1e4b58024f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,7 @@ config MICROCHIP_PFSOC
 config OPENTITAN
     bool
     select IBEX
+    select SIFIVE_PLIC
     select UNIMP
 
 config SHAKTI_C
-- 
2.34.1



