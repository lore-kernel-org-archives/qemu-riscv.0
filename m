Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1klEPQ-0003Ii-Bh
	for mharc-qemu-riscv@gnu.org; Fri, 04 Dec 2020 11:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6009f06ea=alistair.francis@wdc.com>)
 id 1klEPN-0003C6-O4; Fri, 04 Dec 2020 11:58:13 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:33051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6009f06ea=alistair.francis@wdc.com>)
 id 1klEPK-0002pu-Gx; Fri, 04 Dec 2020 11:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607101090; x=1638637090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tXaaNI9ekjpZnUCKv7I8tJpHkOtOggoLq6N+Kl7YbkU=;
 b=L/OXtKi1DHwTfHLqUd3OWBWkcGHsVrS87W1xJB0SDaczGvsaB4M7BCmh
 FkF2EYfyieYra+GuV/Xb3rnybSq8ZyexZT9anOuMZhoRiOv38jaMlxA17
 UTxw1ufiwagGXXqNwHGDuGMyrktDdzXhtelQZ5ZFOqZ3zYezKjLiOa00x
 U15LBzl/c3kVh/+swMG9Wlkni9tulHGq2uYxAD1QNNj666QLCh//8F94O
 uFpWjUPfTtnGVkOin22wbSXeZxkdBglWwrR2/qVPni8CAwQaEAnlHU0Fi
 SqHKNjkaxw9M+wd+nQCzeLZg7LOgOFd6n4/QdY8PTCLHHBCxKOwHfiQgf Q==;
IronPort-SDR: YXULDF105/w3TSpgsPlwxWA04Iqpk5q1EMJCpcZiRnXRGEix7dXbNfUDQ3ey8wlg9ssrRs0SFE
 Q3/cYdN6Gnh7XAoXLLkIbpVm2rUKZ+/icz+2dgMbH395vHi5wLyvqQXNUJnDhbZ3sE4mnNrKly
 5ZLl5xSPVXUiQvXU7/7DUv6eRbWG2zd6qk3UXm+dtOCkMlaq7sd9qy0VORVgDCh8LhHjeMrCOL
 GeF2x7V9TgPbdXMPUMvb3Zl3cczlgp+BoEFsPq6JfbjtNPW5MBKH65gbg1S/kcTFnrPET69spa
 Hx0=
X-IronPort-AV: E=Sophos;i="5.78,393,1599494400"; d="scan'208";a="158919471"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2020 00:47:38 +0800
IronPort-SDR: EGrgEwyTEsXSLy0VHBsj1DXR4BSSpn3tudfiF+rGe+ri6UxZgHBZkiz2zzV3k6yKVtc5laojlo
 JMLbvH9bmWofA/RIzqA/S92AbBCq7d+24=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 08:33:10 -0800
IronPort-SDR: ROFtwLik8ByshmcCwLHxyhI5k9W+TqQz8/Dh3TEI55A/lIufHSF0pwlg/GG1szY7MaDhg2d5B1
 vRNmX0jzpi3Q==
WDCIronportException: Internal
Received: from uscrq8cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.182])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Dec 2020 08:47:38 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, jackieke724@hotmail.com
Subject: [PATCH v1 1/1] intc/ibex_plic: Clear interrupts that occur during
 claim process
Date: Fri,  4 Dec 2020 08:47:37 -0800
Message-Id: <4e9786084a86f220689123cc8a7837af8fa071cf.1607100423.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=6009f06ea=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 04 Dec 2020 16:58:14 -0000

Previously if an interrupt occured during the claim process (after the
interrupt is claimed but before it's completed) it would never be
cleared.
This patch ensures that we also clear the hidden_pending bits as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/ibex_plic.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index 341c9db405..c1b72fcab0 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -43,16 +43,23 @@ static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool level)
 {
     int pending_num = irq / 32;
 
+    if (!level) {
+        /*
+         * If the level is low make sure we clear the hidden_pending.
+         */
+        s->hidden_pending[pending_num] &= ~(1 << (irq % 32));
+    }
+
     if (s->claimed[pending_num] & 1 << (irq % 32)) {
         /*
          * The interrupt has been claimed, but not completed.
          * The pending bit can't be set.
+         * Save the pending level for after the interrupt is completed.
          */
         s->hidden_pending[pending_num] |= level << (irq % 32);
-        return;
+    } else {
+        s->pending[pending_num] |= level << (irq % 32);
     }
-
-    s->pending[pending_num] |= level << (irq % 32);
 }
 
 static bool ibex_plic_irqs_pending(IbexPlicState *s, uint32_t context)
-- 
2.29.2


