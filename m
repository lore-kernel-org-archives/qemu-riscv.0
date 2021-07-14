Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZGB-00049D-FN
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZG9-000485-8o; Wed, 14 Jul 2021 03:24:45 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:58273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8220343f1=alistair.francis@wdc.com>)
 id 1m3ZG7-0007Ds-GJ; Wed, 14 Jul 2021 03:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626247485; x=1657783485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gmMBtGIjVwB2suosvF2nd4pSPHvP9RnihxqAwIoab2c=;
 b=OujZt4jATRi55IfskFfPxONQ5oR4gBIvqNVEvU0c2/v+tIO3SP5ZkhtT
 oexap3fdHa6n6DOwNSjx8HTbL6y8s+eYhUlqI8EfUa1PCGnOETQm7It1s
 CoNYEuSlQWSsmdwx1m0CN5x4OL50zff5EFBO1XM5lGOlYJ10326jFfSfj
 BSCR7JXxw1sA2gDujfVCz1kw7vOFRMhgGp2AmP9bfrnccgJJ2qfQH/ufq
 m4DZrm1YHUOxVC4FgM5RM1lUujS8ABqgL3DHoD4AExwh9FXiiEW6PmDTX
 3u+MfvOsym3opUz18gbptyROw6JkVWTtDX6Dps3yhb6B0y1HtRThWvXaC A==;
IronPort-SDR: MrbZRiYCFBxMS+fNJqkvvTK2JOFrs6SNBVvbsU/qFEUbgLGrSRUiE5PLbELZF6E6xBbCZRb0rQ
 kZS7lsvd0IJF05AcB2xRmtmy0UsJNjfWW0nRyLfD3idPNBc4xXfkIn0aA4phAf7TxvjSv1GweH
 //hvE7wmT7xzQ2K4iE/VMUJApdipu9OzC4/AOKTyrnlzK1MoRJjAMWOiwm1MrNGH0aBXaBb5Mn
 OF7pYfkqIcNuzum8PqUA72wdywWiuhjtT2+KL9LwN6FoukrcRRLSU22sWdHxsa2qXnRDcgltf+
 VZ0=
X-IronPort-AV: E=Sophos;i="5.84,238,1620662400"; d="scan'208";a="278349785"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2021 15:24:42 +0800
IronPort-SDR: 63PEp4FKUBkrpFmcfVwvDMyCAHI5PjQcKPYBygtKNvqYbpVx6E2mJqyT0ZzjxI0A0KGzievOKI
 YlMQYoGBtW0nv5K5YWFFe6KkmZ91GoXhkFHt3fdT3oY9el/7CdEPbbdOwaJ5aQKALpganu9oif
 tRLHrmkI8cuFq1H5HZODe3vpNhk/W5hpxHUvqjovCrBGUS1BdHLLwGyQ+nO89o1MzjhUSdmj3x
 bGfNiHxqQZL/LBD+sMwflnRTXVyj2+P3nA0EjXf+D9dez73UNg/xPYvCHtTyv/rfj6WbuxA52b
 1Vxh+6+kWho7A+LjoKpryXhG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 00:02:45 -0700
IronPort-SDR: SqrlCQPxhehDn/nZXmOI8/3r5dTV3uOAKOxkvbJT/Xne4lqPRxP/HqD1l8GO6ZOC7tLk2iUcJQ
 JD7H0/+lr1NVqJ++D7PHnfDYn+Ec700xeb6kFfWkViw/8hGg4yWFGNjYM4i0sHpcZcW2f4/aJm
 Le74ePaas33PQiFg3zBXt9i503Btzx14l4EuIKfHmTA1CGJfb1Q+otbLs2npZCutOQaw5vr9wx
 H42AZKc2zeborqqz01yKJCmX7nqcxl8pa+s+xmWiRc76+Ln3qLbfk/ajoZUQgQ+yHlDmFF/g/v
 5vA=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.112])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jul 2021 00:24:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/5] target/riscv: Expose interrupt pending bits as GPIO
 lines
Date: Wed, 14 Jul 2021 17:24:34 +1000
Message-Id: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8220343f1=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Wed, 14 Jul 2021 07:24:45 -0000

Expose the 12 interrupt pending bits in MIP as GPIO lines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


