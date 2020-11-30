Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjmYu-0006Wk-BY
	for mharc-qemu-riscv@gnu.org; Mon, 30 Nov 2020 12:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1kjmYs-0006Ua-5p; Mon, 30 Nov 2020 12:02:03 -0500
Received: from ppsw-40.csi.cam.ac.uk ([131.111.8.140]:36026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1kjmYe-0006H5-Su; Mon, 30 Nov 2020 12:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
 s=20180806.ppsw;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOEpV6CZKeGUY0MSrfRAXq4X54rBPjUzgadK25fXuQc=; b=nihs4+fhItuXKJ9eJSS0/v5sBx
 GKzA1cgdzKfc2fwWoVnWVLVrDb5Vrr63WIy0SOiG/Y3P2AHwPk5YqmdA++eH87TVj3nR0hrSuIAor
 zB41B4Pqa0LvuR4WWRQlWrQCBwbAaadRvpuWJUsPZvOtpqyU40Ztn0mVQkRzsKjA8EfQ=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from host86-156-62-101.range86-156.btcentralplus.com
 ([86.156.62.101]:56575 helo=Alexs-MBP-10.home)
 by ppsw-40.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:587)
 with esmtpsa (LOGIN:alr48) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1kjmYX-000pBy-lU (Exim 4.92.3)
 (return-path <alr48@hermes.cam.ac.uk>); Mon, 30 Nov 2020 17:01:41 +0000
From: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
To: 
Cc: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] target/riscv: Fix definition of MSTATUS_TW and MSTATUS_TSR
Date: Mon, 30 Nov 2020 17:01:17 +0000
Message-Id: <20201130170117.71281-1-Alexander.Richardson@cl.cam.ac.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: "A.L. Richardson" <alr48@hermes.cam.ac.uk>
Received-SPF: pass client-ip=131.111.8.140;
 envelope-from=alr48@hermes.cam.ac.uk; helo=ppsw-40.csi.cam.ac.uk
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 30 Nov 2020 17:02:03 -0000

The TW and TSR fields should be bits 21 and 22 and not 30/29.
This was found while comparing QEMU behaviour against the sail formal
model (https://github.com/rems-project/sail-riscv/).

Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
---
 target/riscv/cpu_bits.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24b24c69c5..92147332c6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -379,8 +379,8 @@
 #define MSTATUS_MXR         0x00080000
 #define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
-#define MSTATUS_TW          0x20000000 /* since: priv-1.10 */
-#define MSTATUS_TSR         0x40000000 /* since: priv-1.10 */
+#define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
+#define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
 
-- 
2.29.2


