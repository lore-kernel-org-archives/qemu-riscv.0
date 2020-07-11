Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juIDN-0007N6-32
	for mharc-qemu-riscv@gnu.org; Sat, 11 Jul 2020 12:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDI-0007FT-Ke; Sat, 11 Jul 2020 12:18:56 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:40247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1juIDD-0001Lq-Ku; Sat, 11 Jul 2020 12:18:56 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0023182-0.000295609-0.997386;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07381; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.I0GMGMe_1594484317; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.I0GMGMe_1594484317)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 12 Jul 2020 00:18:40 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com,
 chihmin.chao@sifive.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 05/11] riscv: Add RV64D instructions description
Date: Sun, 12 Jul 2020 00:16:49 +0800
Message-Id: <20200711161655.2856-6-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 11 Jul 2020 16:18:57 -0000

For supporting multi-precison, split all 32 fp registers into two groups.
The RV64D instructions will use only the 16 fp registers selected by
gfp64().

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 rv64.risu | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/rv64.risu b/rv64.risu
index 0dcc9a1..a6fa9fc 100644
--- a/rv64.risu
+++ b/rv64.risu
@@ -364,3 +364,103 @@ FCVT_S_L RISCV 1101000 00010 rs1:5 rm:3 rd:5 1010011 \
 
 FCVT_S_LU RISCV 1101000 00011 rs1:5 rm:3 rd:5 1010011 \
 !constraints { greg($rs1) && gfp32($rd) && grm($rm); }
+
+@RV64D
+
+FLD RISCV imm:12 rs1:5 011 rd:5 0000111 \
+!constraints { gbase($rs1) && gfp64($rd); } \
+!memory { align(8); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+FSD RISCV imm5:7 rs2:5 rs1:5 010 imm:5 0100111 \
+!constraints { gbase($rs1) && gfp64($rs2); } \
+!memory { align(8); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+FMADD_D RISCV rs3:5 01 rs2:5 rs1:5 rm:3 rd:5 1000011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FMSUB_D RISCV rs3:5 01 rs2:5 rs1:5 rm:3 rd:5 1000111 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FNMSUB_D RISCV rs3:5 01 rs2:5 rs1:5 rm:3 rd:5 1001011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FNMADD_D RISCV rs3:5 01 rs2:5 rs1:5 rm:3 rd:5 1001111 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FADD_D RISCV 0000001 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FSUB_D RISCV 0000101 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FMUL_D RISCV 0001001 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FDIV_D RISCV 0001101 rs2:5 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd) && grm($rm); }
+
+FSQRT_D RISCV 0101101 00000  rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rd) && grm($rm); }
+
+FSGNJ_D RISCV 0010001 rs2:5  rs1:5 000 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd); }
+
+FSGNJN_D RISCV 0010001 rs2:5  rs1:5 001 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd); }
+
+FSGNJX_D RISCV 0010001 rs2:5  rs1:5 010 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd); }
+
+FMIN_D RISCV 0010101 rs2:5  rs1:5 000 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd); }
+
+FMAX_D RISCV 0010101 rs2:5  rs1:5 001 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rs2) && gfp64($rd); }
+
+FCVT_S_D RISCV 0100000 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rd) && grm($rm); }
+
+FCVT_D_S RISCV 0100001 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { gfp64($rs1) && gfp64($rd) && grm($rm); }
+
+FEQ_D RISCV 1010001 rs2:5 rs1:5 010 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && gfp64($rs1); }
+
+FLT_D RISCV 1010001 rs2:5 rs1:5 001 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && gfp64($rs1); }
+
+FLE_D RISCV 1010001 rs2:5 rs1:5 000 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && gfp64($rs1); }
+
+FCLASS_D RISCV 1110001 00000 rs1:5 001 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1); }
+
+FCVT_W_D RISCV 1100001 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && grm($rm); }
+
+FCVT_WU_D RISCV 1100001 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && grm($rm); }
+
+FCVT_D_W RISCV 1101001 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp64($rd) && grm($rm); }
+
+FCVT_D_WU RISCV 1101001 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp64($rd) && grm($rm); }
+
+FCVT_L_D RISCV 1100001 00010 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && grm($rm); }
+
+FCVT_LU_D RISCV 1100001 00011 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1) && grm($rm); }
+
+FCVT_D_L RISCV 1101001 00010 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp64($rd) && grm($rm); }
+
+FCVT_D_LU RISCV 1101001 00011 rs1:5 rm:3 rd:5 1010011 \
+!constraints { greg($rs1) && gfp64($rd) && grm($rm); }
+
+FMV_D_X RISCV 1111001 00000 rs1:5 000 rd:5 1010011 \
+!constraints { greg($rs1) && gfp64($rd); }
+
+FMV_X_D RISCV 1110001 00000 rs1:5 000 rd:5 1010011 \
+!constraints { greg($rd) && gfp64($rs1); }
-- 
2.23.0


