Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW919-0006wg-Oy
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW914-0006vd-46; Mon, 12 Apr 2021 22:43:02 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90y-0008Mn-HZ; Mon, 12 Apr 2021 22:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281776; x=1649817776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQtAdV5LP9iEiyOwP2HFZ15i0V8DACTLNBdpl+Fu7po=;
 b=EpqUv20TtY1SdNxSAe6wljf4+b4t8Jm/g3hWFx+smJXpoewQl1q7kWwG
 VvHIL5X7Sv94SFt4ukluADP3SA1NHnNhyTI249LfixqqNIG8/+GCM7onW
 VkeVTqGJNSkkDHVz8XUuauRThoJezIH9UAhoZ8uR1gwzSBUipz6J8yu6s
 26XZ6dpLQ/79YUgUOkLIcTScxRgi6hjjGib2aq2oCjkLMasPM0AXRvJb7
 IAYqJ1MzAui2OJUeYG6DUuafT3x8xTWlGJEPhw5Qy9q7sL4J6GrbGNGw8
 Z2bubK/v6Ur94bmNudEpmZkodfzKmTBHHLAvE9vy8l4o4UWQgc7GVf3Rn A==;
IronPort-SDR: gzMdB1tpBX5FXNGjRkkXpBEI1ZdkZt2I6bwYT/B8Tnt3+qhJm7Y6Y5da/tcYYJqaCigWJPiuy/
 ZsPm8zhk9HVbWpHBkI+X2GGrcQMeWaZFMXqbVA6KOAKCEEMfelV7IduBviyn/8ZVnIr5/3KN3i
 L6ocTuRg6KIG6x993rP8asIlvl7kQUHaf95Rss0OKTHBS5fjSIKjjmI6Z0cPm1J12jTXA5nt4h
 ARGtY4p4HBCuSCS2Jxxw+l0crXVAC/H9FoMlhEqzdr63vQqjeMMkFNW6DldHCMirplvVw8s9Zv
 lmc=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="169070162"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:42:54 +0800
IronPort-SDR: 1jlhDkytw8HfMpmYfWYyYchsfF/X6aqAJ0pO5/3tC4iK7Ub+RGO4rO95QUVK0H/PCqk56oyfBJ
 kY706KjndNG4AzG0nOe6zama1UWPo0djtWeQFQwmG12m8b3WMLNv5UyF2MD4TJbtq+3fjGjDMr
 E/3IXHmCzDfPcb1P3aaVff4rTWGTW825AX7anLne/Q7shzL4sSfCrPpFh3s0Ok4jWxl/CLaDGN
 z5OcfnKy0JZgcdrDs9GmL+ryPEjn7txOldvg3jTDEidMt4MP9d9Qf0riZI9k9jidVq/3Xq8wPx
 s4EaNjzpCersAPj9VJvmp4ze
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:22:22 -0700
IronPort-SDR: R1s/IVr91SSDEe9xUP1qEBtqeVeVSHlvqzkK3Y4JQFKwLV92MnCtuCD4jK06/IVlFZdFt8Bsqx
 LevDuo4nZT6YiSIgPGIUpJnJy0j7KcFWiQIW2M8t8PD3bdi992dqEQ0rEBSRm7kjo1hXuUsDfT
 0ztP3I2lBIWneC2AhjX1CHXLkbXTsDl3qnaPV4QEtj7COS44KXVwypcRnRYOaHRCRidMgUkFH4
 TEQq2yXSch+d9tKc2pyJ3/5lXPAwE/cV1Dw62CrA6FamBN+OCjauIAH7HMkCuGGywA9m2PwbIQ
 xRA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:42:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 6/8] target/riscv: Add a config option for ePMP
Date: Tue, 13 Apr 2021 12:42:44 +1000
Message-Id: <5369dff9ce1abd04874dc71dd1bae4d3e6428a25.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 02:43:04 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Add a config option to enable experimental support for ePMP. This
is disabled by default and can be enabled with 'x-epmp=true'.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Message-Id: <SG2PR02MB263458D195A60A57C05EBE9993450@SG2PR02MB2634.apcprd02.prod.outlook.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 83b315e0b2..add734bbbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool epmp;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e530df9385..66787d019c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -412,6 +412,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         set_feature(env, RISCV_FEATURE_PMP);
+
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        if (cpu->cfg.epmp) {
+            set_feature(env, RISCV_FEATURE_EPMP);
+        }
     }
 
     set_resetvec(env, cpu->cfg.resetvec);
@@ -554,6 +562,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.31.1


