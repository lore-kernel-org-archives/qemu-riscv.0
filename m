Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNE5-0003Z5-Na
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNDz-0003VA-Ly; Mon, 19 Apr 2021 02:17:35 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:63233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNDx-0005Td-Rd; Mon, 19 Apr 2021 02:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618813053; x=1650349053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQtAdV5LP9iEiyOwP2HFZ15i0V8DACTLNBdpl+Fu7po=;
 b=BXIgTf1fHRkjOcSIUO3ney5JvslDchON3WkLHEoaHafhQGFw7HSRPf4F
 oBfLrReoMVgiOTawghxhljLlD7Av8JY1e78JaUNqiS3997/WmiUQ+BXwI
 pqhtd4WKoyPWxgZQtVwgMIo5epq26S6YycWgZklbLCDRxBSOmeG9uxd/r
 NMZ2e5c9U2MB7lxIXSOujFwbITRDCIOqrOBjNql6ZKA/L3zcoLX/oMiux
 RKk6VnJkdUKD5/ajo/b85dE0AHHp8qeSsUy5zfBs8zuhBzb6OJ7y82+iW
 X6KfpfpGUTIQ2rKzUvJ/O4d1QrW4F2WACop2Eq10IOarN1Wie4c+YrJTo g==;
IronPort-SDR: zjrYFOeitNgcKQi2bwQLy27nf546kMBZ8AB4UKrABQoIrjBTB3/YLStWFivRKirGgEH/fvNqQI
 5Y6sgB3e8GOsHTNmm0Qh23MxTbQRYFxOqxgpOV5WX+Xk9t8y74xNZX9oW0ArfNXkHpR/8JuXc0
 LVbUJhQPVQhcsIaYOwwoQPNdxMEXBLXYPSpjT3RYkXddvC0x2ItmA2C96cSd3zHIevug6JqRZl
 BaSQMM4sLbDILqcsmH6pYxMnZdHtxs6whZ7LAnY7bFbZ6uAHB0hyHIY12CdrOC34XT+eeE1rv8
 vIk=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="276347587"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:17:31 +0800
IronPort-SDR: QvH0U3R7QV+wsE9vvefI++R1epTBx1bmGIcT1AorUvS0ULTAFLi4JaTOZtv7pfCXLmLv8gMazz
 eEFbila0F+H1tSGH3kcYkccMIublnQqyyaUy9zNPp6A2MfqpoMTiVQwd9UAGYFlBvuAKk0EiM7
 tUiO8noPPQTdi4y6MvOMUsApWVJP8fojYjs7s+9+4yGN+pFFHx7DLV7xxVhczp6Gq8Nh64tNn9
 DPXG/KutArsEWEhmPSTsoBVpDU2jUXRHv4VlVolC5yQquX/lBgkMtxjeJVhPheKPGb6Ejn7YPn
 HhSfvmxS8xSfh8QtpeVKjgT6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:56:39 -0700
IronPort-SDR: KVxzA7rG6LQyYRGilcTZIJNiGgpBlkKI5OiDZyQdhKQjs5Xcj+C0eNBncNRjeVNlRQXF63BbcO
 TQEBK/CUWneX7p+sngAPwdbc3Kh9WZ2+zJud8wktwK9NkqTFXtualmAN+8RI6p2wszZX1PTCUf
 WKrvcopV9X75Ost/TDYY8XUSPtDm/Ecyl7XXZYQcZJI8A7lXyvLium2EJWV0i+R4pG6AzBtqrk
 J0/kl4v4QXEvXyNOunjAEMkaAPjaW/DCOkHY/jB9MMhP+0gxhVVB9WtDgRVgH2gVIoat+FWB9m
 RAM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Apr 2021 23:17:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 6/8] target/riscv: Add a config option for ePMP
Date: Mon, 19 Apr 2021 16:17:25 +1000
Message-Id: <a22ccdaf9314078bc735d3b323f966623f8af020.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
References: <cover.1618812899.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=736d87ece=alistair.francis@wdc.com;
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
X-List-Received-Date: Mon, 19 Apr 2021 06:17:36 -0000

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


