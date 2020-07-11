Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juIDM-0007LM-CN
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jul 2020 12:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDH-0007Ei-4J; Sat, 11 Jul 2020 12:18:55 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:58191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDC-0001Lp-QS; Sat, 11 Jul 2020 12:18:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0026535-0.000506006-0.99684;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l10422; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
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
Subject: [PATCH 04/11] riscv: Add RV64F instructions description
Date: Sun, 12 Jul 2020 00:16:48 +0800
Message-Id: <20200711161655.2856-5-zhiwei_liu@c-sky.com>
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

For supporting multi-precision, split all 32 fp registers into two groups.
The RV64F instructions will use only 16 fp registers selected by gfp32().

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 rv64.risu | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/rv64.risu b/rv64.risu
index ad5dee9..0dcc9a1 100644
--- a/rv64.risu
+++ b/rv64.risu
@@ -270,3 +270,97 @@ AMOMINU_D  RISCV 11000 imm:2 rs2:5 rs1:5 011 rd:5 0101111 \
 AMOMAXU_D  RISCV 11100 imm:2 rs2:5 rs1:5 011 rd:5 0101111 \
 !constraints { greg($rd) && greg($rs2) && gbase($rs1) && $rs2 != $rs1; }\
 !memory { align(8); reg($rs1, $rd); }
+
+@RV64F
+
+FLW RISCV imm:12 rs1:5 010 rd:5 0000111 \
+!constraints { gbase($rs1) && gfp32($rd); } \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+FSW RISCV imm5:7 rs2:5 rs1:5 010 imm:5 0100111 \
+!constraints { gbase($rs1) && gfp32($rs2); } \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+FMADD_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1000011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FMSUB_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1000111 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FNMSUB_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1001011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FNMADD_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1001111 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FADD_S RISCV 0000000 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FSUB_S RISCV 0000100 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FMUL_S RISCV 0001000 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FDIV_S RISCV 0001100 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd) && grm($rm); }
+
+FSQRT_S RISCV 0101100 00000  rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rd) && grm($rm); }
+
+FSGNJ_S RISCV 0010000 rs2:5  rs1:5 000 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd); }
+
+FSGNJN_S RISCV 0010000 rs2:5  rs1:5 001 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd); }
+
+FSGNJX_S RISCV 0010000 rs2:5  rs1:5 010 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd); }
+
+FMIN_S RISCV 0010100 rs2:5  rs1:5 000 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd); }
+
+FMAX_S RISCV 0010100 rs2:5  rs1:5 001 rd:5 1010011 \
+!constraints { gfp32($rs1) && gfp32($rs2) && gfp32($rd); }
+
+FCVT_W_S RISCV 1100000 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && grm($rm); }
+
+FCVT_WU_S RISCV 1100000 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && grm($rm); }
+
+FMV_X_W RISCV 1110000 00000 rs1:5 000 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1); }
+
+FEQ_S RISCV 1010000 rs2:5 rs1:5 010 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && gfp32($rs2); }
+
+FLT_S RISCV 1010000 rs2:5 rs1:5 001 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && gfp32($rs2); }
+
+FLE_S RISCV 1010000 rs2:5 rs1:5 000 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && gfp32($rs2); }
+
+FCLASS_S RISCV 1110000 00000 rs1:5 001 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1); }
+
+FCVT_S_W RISCV 1101000 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp32($rd) && grm($rm); }
+
+FCVT_S_WU RISCV 1101000 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp32($rd) && grm($rm); }
+
+FMV_W_X RISCV 1111000 00000 rs1:5 000 rd:5 1010011 \
+!constraints { greg($rs1) && gfp32($rd); }
+
+FCVT_L_S RISCV 1100000 00010 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && grm($rm); }
+
+FCVT_LU_S RISCV 1100000 00011 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp32($rs1) && grm($rm);  }
+
+FCVT_S_L RISCV 1101000 00010 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp32($rd) && grm($rm); }
+
+FCVT_S_LU RISCV 1101000 00011 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp32($rd) && grm($rm); }
-- 
2.23.0


