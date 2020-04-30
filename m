Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU3YE-0005cX-Cf
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Y6-0005EA-0F
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Xy-0001fZ-7w
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:23:57 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W7-0006Wl-8B; Thu, 30 Apr 2020 03:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436297|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00411137-0.00097916-0.994909;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03308; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, alistair23@gmail.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 8/8] riscv: Add RV64F instructions description
Date: Thu, 30 Apr 2020 15:21:39 +0800
Message-Id: <20200430072139.4602-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:21:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Thu, 30 Apr 2020 07:24:04 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 riscv64.risu | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/riscv64.risu b/riscv64.risu
index f006dc8..0b81dfb 100644
--- a/riscv64.risu
+++ b/riscv64.risu
@@ -181,4 +181,82 @@ REMW RISCV 0000001 rs2:5 rs1:5 110 rd:5 0111011 \
 REMUW RISCV 0000001 rs2:5 rs1:5 111 rd:5 0111011 \
 !constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
 
+@RV64F
 
+FLW RISCV imm:12 rs1:5 010 rd:5 0000111 \
+!constraints { $rs1 != 0 && $rs1 != 2 && $rs1 !=3 && $rs1 != 4 } \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+FSW RISCV imm5:7 rs2:5 rs1:5 010 imm:5 0000111 \
+!constraints { $rs1 != 0 && $rs1 != 2 && $rs1 !=3 && $rs1 != 4 && $rs2 != 2} \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+FMADD_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1000011
+
+FMSUB_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1000111
+
+FNMSUB_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1001011
+
+FNMADD_S RISCV rs3:5 00 rs2:5 rs1:5 rm:3 rd:5 1001111
+
+FADD_S RISCV 0000000 rs2:5 rs1:5 rm:3 rd:5 1010011
+
+FSUB_S RISCV 0000100 rs2:5 rs1:5 rm:3 rd:5 1010011
+
+FMUL_S RISCV 0001000 rs2:5 rs1:5 rm:3 rd:5 1010011
+
+FDIV_S RISCV 0001100 rs2:5 rs1:5 rm:3 rd:5 1010011
+
+FSQRT_S RISCV 0101100 00000  rs1:5 rm:3 rd:5 1010011
+
+FSGNJ_S RISCV 0010000 rs2:5  rs1:5 000 rd:5 1010011
+
+FSGNJN_S RISCV 0010000 rs2:5  rs1:5 001 rd:5 1010011
+
+FSGNJX_S RISCV 0010000 rs2:5  rs1:5 010 rd:5 1010011
+
+FMIN_S RISCV 0010100 rs2:5  rs1:5 000 rd:5 1010011
+
+FMAX_S RISCV 0010100 rs2:5  rs1:5 001 rd:5 1010011
+
+FCVT_W_S RISCV 1100000 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FCVT_WU_S RISCV 1100000 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FMV_X_W RISCV 1110000 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FEQ_S RISCV 1010000 rs2:5 rs1:5 010 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FLT_S RISCV 1010000 rs2:5 rs1:5 001 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FLE_S RISCV 1010000 rs2:5 rs1:5 000 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FCLASS_S RISCV 1110000 00000 rs1:5 001 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+FCVT_S_W RISCV 1101000 00000 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rs1 != 2 }
+
+FCVT_S_WU RISCV 1101000 00001 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rs1 != 2 }
+
+FMV_W_X RISCV 1111000 00000 rs1:5 000 rd:5 1010011 \
+!constraints { $rs1 != 2 }
+
+FCVT_L_S RISCV 1100000 00010 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
+
+FCVT_LU_S RISCV 1100000 00011 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rm != 6 && $rm != 5 }
+
+FCVT_S_L RISCV 1101000 00010 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }
+
+FCVT_S_LU RISCV 1101000 00011 rs1:5 rm:3 rd:5 1010011 \
+!constraints { $rs1 != 2 && $rm != 6 && $rm != 5 }
-- 
2.23.0


