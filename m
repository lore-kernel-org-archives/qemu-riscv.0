Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJF3-0001Jh-Ac
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJF0-0001E1-UW; Fri, 02 Apr 2021 08:49:34 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJEz-0004o8-8t; Fri, 02 Apr 2021 08:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367772; x=1648903772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCjdyiPAUhjBSzt373ttYpvN5BRMF04/VE5UxbyuPKc=;
 b=Ue4ph3oJlgjWr1eSPE2kPSqwGg4WJCv+b9g8nascCsv3oiOdbjjCDBUW
 dgw2A7rbvBbnTrDG+LFR8v2i4JSfN9sySSj2fiOhbUg8lx2UY0WYMwDcY
 5WBEQ9vycy432giKyy7bcWSLvMCXD3O7JGcyFmKHAEIh2g5TU5tLTvBMh
 Zw1NQ33OqKyfs5DQrN4LRqqSwklgbepTXEdFGu0PIoLCjgJgPBzzWfhnH
 RJSdFhL9QFHPRottf3F293nqtkCO6nN4BorhG0PncPjeK6fWMk7NXIAVa
 Ai5amuAFkM74JIj+M/iVPwRfeaiKsRw1hBQPQVwKGVhqtrq7B/plL6H8R A==;
IronPort-SDR: GHzlkI7UkI0Xe88BuB2VSO8RPLnjIGwLZ3VASS0RUCP0Mqz7kJGwOdRHSZOTddQzm5y+0LDc2m
 ERVIzsrl84OV36Mh7K+0JngGbv1+GvXcn66E2aSHUhsi+15R4tO0nYJETJU6A6tkdLtucbkoJQ
 1Nte0I/a9hKamDX4dJ+icu+6fF4CKF4p40xRkJE3TUn8p/qjCJAmdYKeDq6cEItCMnjtE8ER+o
 pSf0eibGGQsK4dBRH3lyw1JZ3cF8qzffofilA9zoCBrdJXkmBTtSyuyN3/0eK4W0SuJtEoiywW
 Vnc=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="163663482"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:49:31 +0800
IronPort-SDR: c6Iq/LkIE6rbaq0sQoJvgQNrKEny9JhbSPhaHtZhxgJOgrxcUlrXx8pjwfMSHqp39fd7QUGhLV
 lZ/SfNaOCKfYysSATg9iotL1ALHk4FWG9o8vxjmv08jVgu5ldT08kGY1klGEhjGx0Bmz4AjRSv
 zIQOG79eqX19xa96Lt3LOTNAtsZA4ShOw4bUZZQ7+5SPLk3koDIAxJHJk+jL3X6aknA37F0A4q
 Ft/DwWjTr2o2OFcmnqDQbFjW4C9mUniowgGBOmonBIC88usVR4msQDjxt1bF2OQtd+2swwcDSN
 m7MLDjwUIn7u69uYscSczyW8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:29:37 -0700
IronPort-SDR: aO7GtY22+jhAz1J80PpMYJaS3rqMYT66HNnEidVqyd3HT/2Il6+qsvwQ6x1BTf8yvBMOhHDdgH
 derZlQTbsb4ucEGDp/I53ZvamPxbISfBpEfj96DMsInTb1hyZCJj4+XaGGz5KY+jYWVo4bPmYy
 tdzwXP6R8CoPsvhMmbsDIKdpSTCn38JBb7OJub5dxtIZm6NAUxltXivrvtuk7GRzcsXTfP62KJ
 1MpeHXUli2BvnwLEiJdg7LfMTTN4zv0+eARmp1CuvmSUX4EQaA+86yxr8nGhk/J6cH4AoGiGh7
 3BA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:49:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 2/8] target/riscv: Define ePMP mseccfg
Date: Fri,  2 Apr 2021 08:47:35 -0400
Message-Id: <5bf4e802b52fc4f8e57c8c03346cec716ea3ce32.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 12:49:35 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Use address  0x390 and 0x391 for the ePMP CSRs.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <SG2PR02MB2634D85E5DF0C2BB540AE1BB93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..32e1ee92dc 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -232,6 +232,9 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Enhanced PMP */
+#define CSR_MSECCFG         0x390
+#define CSR_MSECCFGH        0x391
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
-- 
2.31.0


