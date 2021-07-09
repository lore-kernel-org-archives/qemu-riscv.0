Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hEP-0006br-MG
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEK-0006HQ-ET; Thu, 08 Jul 2021 23:31:08 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:23409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hEE-0006R9-02; Thu, 08 Jul 2021 23:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801461; x=1657337461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FGftd06KQUZ7tDQ5OGzIJ1X9u0u0bQAockp3XcvLTxU=;
 b=gkfQhiFZXLXL49BLAwz6cQvvj5l3DEZP1a8mLWfKDpIkpgbxVKVL+gpi
 1LSQeCMvN1Oe0lDbNITf+D3cNvBGZyL36WfUoOYWo3cKfViF0P7bzs4wS
 U9lsd31J8+N/nOYiwbfBr8MTeeR1nHtpijjPVuILencMtpaoOceAnFb+3
 06FWOcF9l7z8iIYKyxck+d2FpoLZ66PGWhdJfGLAdegJJ45eqeUR47xtD
 9voBgxDbZZ+SE10emNVpa5BdWCPIaR5pk8JM1ivTno+mMm6IDW4so8sc7
 EEI+CNLs4cd3t5yMeVERycvKS8FO1Du9Wi6tlb8qRj62/s5x0ThO4bAwt g==;
IronPort-SDR: /W2okUXLjoRwCiyaLlB591g9cJ4sePw48O/qCThKGv44xAUiSYn+ZfQxAQvhzTl8747Ew3pcat
 fH6emdp4waqk8sLs7637j8ig7KFz620h5XM/qhEW/CSLnw8+lNEhA31my9pOhidbmUjeyXfZ/G
 hlUIeofQdSQamRkZcXhUMPgenIg1lTcVGHO4hSgdkzTLIiRmP02wufqA819e2KHSIC1O2lBX5v
 tvuK+9FgRwYgcPtvgjDIQmoFNbWbxL1SDVhX/2eztb9pnWdlVKhXE4Z+v0MAQC2DWCHfIhUtpV
 Ang=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="285648619"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:30:55 +0800
IronPort-SDR: oVPcahEAOFREzQ3uaxnhm09R2DnRKVwAa70FRfsluCl0nJ46EKdiTN2SnMy9uoacYxP+zkQyft
 cptLvBLPtCJzPbTmt57IRYbkNYoiTWjKEjCdymMvvqyYnXXT7B/G7ZEice44NYI5QjAeOD/QCX
 VDupBAPyC5eLapOoo+mxGyd2oC0dIo2Wydi/qX3JJMFdWwvlLAOEFc3oyqHTJEsQtX8+XYWPZL
 SExYNHRdeXUfKXqyzIAW3Vn9G1/G98aOI74c3DRX1sqYYm/ayKPrYbiAtYjb47rHM911RjA9k1
 t6JrsajjBKHFvaUb1QjtM+JH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:07:53 -0700
IronPort-SDR: O6zxN4L7z/gW8LFnjvYIoqgvYDnoTZ9cjepdq8DtkCS4B42lP3oW08/9JFN8PJHVskDkcPH/iZ
 NdlgE1M6Fq55yZL8onJP8MG9sPbMubJfXRno7PC96WK0vM4aNQsYdhBM3xSslUo9X2nWpw++nx
 i0kStOtWLy5Oi3wdFrfh9qe4/b8IHI6ibkSALYiLPHdSfDWNGyQbybV1ZOmYc4aVzn4Jny0QMS
 vxM78mYvX5D6f1jyO5CWc5Ln06diwRNC2A3966YsWzTv6RGagbRW1Qy2Cn1HQH7SXeYCUnBTe3
 bCE=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Jul 2021 20:30:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/5] target/riscv: Expose interrupt pending bits as GPIO
 lines
Date: Fri,  9 Jul 2021 13:30:48 +1000
Message-Id: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 09 Jul 2021 03:31:08 -0000

Expose the 12 interrupt pending bits in MIP as GPIO lines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..86321baf9f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -565,11 +565,41 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_set_irq(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu = RISCV_CPU(opaque);
+
+    switch (irq) {
+    case IRQ_U_SOFT:
+    case IRQ_S_SOFT:
+    case IRQ_VS_SOFT:
+    case IRQ_M_SOFT:
+    case IRQ_U_TIMER:
+    case IRQ_S_TIMER:
+    case IRQ_VS_TIMER:
+    case IRQ_M_TIMER:
+    case IRQ_U_EXT:
+    case IRQ_S_EXT:
+    case IRQ_VS_EXT:
+    case IRQ_M_EXT:
+        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+#endif /* CONFIG_USER_ONLY */
+
 static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+#endif /* CONFIG_USER_ONLY */
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.31.1


