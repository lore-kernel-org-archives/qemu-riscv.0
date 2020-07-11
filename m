Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juIDK-0007Gk-3y
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jul 2020 12:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDH-0007Ep-DM; Sat, 11 Jul 2020 12:18:55 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDD-0001Lo-Jo; Sat, 11 Jul 2020 12:18:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436779|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.499597-0.0016009-0.498802;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.I0GMGMe_1594484317; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.I0GMGMe_1594484317)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 12 Jul 2020 00:18:39 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com,
 chihmin.chao@sifive.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 02/11] riscv: Add RV64M instructions description
Date: Sun, 12 Jul 2020 00:16:46 +0800
Message-Id: <20200711161655.2856-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
References: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/11 12:18:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 11 Jul 2020 16:18:55 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 rv64.risu | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rv64.risu b/rv64.risu
index edf0d1f..2c4154e 100644
--- a/rv64.risu
+++ b/rv64.risu
@@ -139,3 +139,44 @@ SRLW RISCV 0000000 rs2:5 rs1:5 101 rd:5 0011011 \
 
 SRAW RISCV 0100000 rs2:5 rs1:5 101 rd:5 0011011 \
 !constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+@RV64M
+
+MUL RISCV 0000001 rs2:5 rs1:5 000 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+MULH RISCV 0000001 rs2:5 rs1:5 001 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+MULHSU RISCV 0000001 rs2:5 rs1:5 010 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+MULHU RISCV 0000001 rs2:5 rs1:5 011 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+DIV RISCV 0000001 rs2:5 rs1:5 100 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+DIVU RISCV 0000001 rs2:5 rs1:5 101 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+REM RISCV 0000001 rs2:5 rs1:5 110 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+REMU RISCV 0000001 rs2:5 rs1:5 111 rd:5 0110011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+MULW RISCV 0000001 rs2:5 rs1:5 000 rd:5 0111011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+DIVW RISCV 0000001 rs2:5 rs1:5 100 rd:5 0111011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+DIVUW RISCV 0000001 rs2:5 rs1:5 101 rd:5 0111011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+REMW RISCV 0000001 rs2:5 rs1:5 110 rd:5 0111011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
+
+REMUW RISCV 0000001 rs2:5 rs1:5 111 rd:5 0111011 \
+!constraints { greg($rd) && greg($rs1) && greg($rs2); }
-- 
2.23.0


