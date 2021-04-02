Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJGE-0002Q0-7w
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJG6-0002LL-VF; Fri, 02 Apr 2021 08:50:44 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJFu-0005a9-IJ; Fri, 02 Apr 2021 08:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367830; x=1648903830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wudO3Lv+mtFD1GAc1BX9Z+PCB+LHagjqO9xemJTHsyI=;
 b=KBBmV1lUSuii4lSrzNrPSkwG2giyTfZZosmDuK3xCfye+y3dZHRdlIwo
 89DBJOM51+IXDkxN/eGXyn/n3/dO54+a/i35JqbtIbqGSOwEpW2DfNg80
 Oj3KoPfeCbTRqxMoYuHu0Rn3M1eQPyEmBIfNchZLbjkEsVwniUDzKhrUi
 wuHLRhFUF/WLhp8DoXtxKcIS9fhpBfT2Xb83X5niqtWAd0TMFQOXenxTw
 /RmtYb4RxCpnH2Fy1PbpI4Xw0BJwsleWwQheVILC2e0MiPDsNCJEKvH/v
 ky3K/+z30p+6eAzFFHfozs18PV2/T8cwTdWHN9UItHp5UriU4e0iAnzJs Q==;
IronPort-SDR: zcknax85aI+VVThFpRkr6PHW9I7MOP3+TmWRcf+u+Zm2f/2FSGbhtEQN22tq93UCPr4cWHIgkx
 Br4ijf0c721gISuuWE707ZVzbo/dw9AmvIacy6erVz9wtFDZdaootLrDGNsTnYyIKix+Mcqw0Q
 JMb78hlTe+HUNkbnzxCFQV4ot9yGyplDcolWyl4iTf+fpKQgOx0Qmz1Ez8CGUv/dD+qgPUrEB9
 gssrRoG511wpllSREc/7//ZAbEDlJxdaR0gCOIgyFM2ttImzctKZduql58a9cqgQ9YOWrKUpmp
 6v8=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="163523932"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:50:15 +0800
IronPort-SDR: t1uVQizh4CjzIldL8zIAAcTGZ1INWdaos+LP5BOgDuKHqm/wsPD0d2amNMdYCn5bsyjdiyK/2N
 yrNoURxAnaeuNRjdNgBrTm4WKYrfnrBAM8pb7u/9WRXuTQ9Wy12/1Zqm5OozgyxoU3Hl7QSaAs
 QRKsYYhOaQ35kO+L8Daejjtm8SV2AAWE05wTByki4sAbxUw+oiaDO9qpEwMsNqnHfYs6/YEOuq
 jgp1LYwjgO+RGGKxuSjvmN3jeVFAws/m0qvaNFeKIDhq7WXnii9ho2TbEp5+OtzgUfM1wWQG99
 yhrT3qPD87UL1AQrYKkPqZah
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:31:49 -0700
IronPort-SDR: H+93N4RLX9sN6AzZ+JIphxh/gCT6WdG2raCV6Hxcuim08Qkj9kiRANi7vFHohqvE0WB5zj4q25
 2oP1/rv9l3YH0Nd7SRVekgeMZk0lAuaIBk/CUFeX1tKedFYkqhmwBkzhSXCSTXRT34a1OQk/X7
 T7szWXGkNedtv/6feAghge4udQ5NiaZbExWl/bUGLRdYV5a9X1kwaQOxTtHccexxkJKnYKcC8a
 lh/p1vzLozoKECQYgmEDyzr3wtKTvm/pv0D8INh/k6txhzT0FQks+2Nc6CEWXDAuHaaQY2aDS2
 zUE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 05:50:08 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 6/8] target/riscv: Add a config option for ePMP
Date: Fri,  2 Apr 2021 08:48:13 -0400
Message-Id: <89188d4b3d72aa1dbcd696c6489a39d84ef8cd2e.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 12:50:46 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Add a config option to enable experimental support for ePMP. This
is disabled by default and can be enabled with 'x-epmp=true'.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Message-Id: <SG2PR02MB263458D195A60A57C05EBE9993450@SG2PR02MB2634.apcprd02.prod.outlook.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d1198c0d0d..22df0d8206 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -305,6 +305,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool epmp;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..d665681f90 100644
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
2.31.0


