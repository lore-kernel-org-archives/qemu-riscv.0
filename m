Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU3YE-0005bt-6J
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Y4-0005Dq-KU
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:24:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Xx-0001fN-LV
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:23:56 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W6-0006WW-Pu; Thu, 30 Apr 2020 03:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.704462-0.000721421-0.294816;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07447; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, alistair23@gmail.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 1/8] riscv: Add RV64I instructions description
Date: Thu, 30 Apr 2020 15:21:32 +0800
Message-Id: <20200430072139.4602-2-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 30 Apr 2020 07:24:03 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 riscv64.risu | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 riscv64.risu

diff --git a/riscv64.risu b/riscv64.risu
new file mode 100644
index 0000000..98141ab
--- /dev/null
+++ b/riscv64.risu
@@ -0,0 +1,141 @@
+# Input file for risugen defining RISC-V instructions
+.mode riscv
+@RV64I
+
+# x2 stack pointer, x3 global pointer, x4 thread pointer
+# These registers should be reserved for signal handler.
+
+LUI RISCV imm:20 rd:5 0110111 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+AUIPC RISCV imm:20 rd:5 0110111 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
+
+# Limit to current implementation, the base address register will be overide
+LB RISCV imm:12 rs1:5 000 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(1); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+LH RISCV imm:12 rs1:5 001 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(2); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+LW RISCV imm:12 rs1:5 010 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+LBU RISCV imm:12 rs1:5 100 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(1); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+LHU RISCV imm:12 rs1:5 101 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(2); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+SB RISCV imm5:7 rs2:5 rs1:5 000 imm:5 0100011 \
+!constraints { $rs1 != 0 && $rs1 != 2 && $rs1 !=3 && $rs1 != 4 && $rs2 != 2 } \
+!memory { align(1); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+SH RISCV imm5:7 rs2:5 rs1:5 001 imm:5 0100011 \
+!constraints { $rs1 != 0 && $rs1 != 2 && $rs1 !=3 && $rs1 != 4 && $rs2 != 2 } \
+!memory { align(2); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+SW RISCV imm5:7 rs2:5 rs1:5 010 imm:5 0100011 \
+!constraints { $rs1 != 0 && $rs1 != 2 && $rs1 !=3 && $rs1 != 4 && $rs2 != 2 } \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+ADDI RISCV imm:12 rs1:5 000 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SLTI RISCV imm:12 rs1:5 010 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SLTIU RISCV imm:12 rs1:5 011 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+XORI RISCV imm:12 rs1:5 100 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+ORI RISCV imm:12 rs1:5 110 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+ANDI RISCV imm:12 rs1:5 111 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+ADD RISCV 0000000 rs2:5 rs1:5 000 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+SUB RISCV 0100000 rs2:5 rs1:5 000 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+SLL RISCV 0000000 rs2:5 rs1:5 001 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+SLT RISCV 0000000 rs2:5 rs1:5 010 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+SLTU  RISCV 0000000 rs2:5 rs1:5 011 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+XOR RISCV 0000000 rs2:5 rs1:5 100 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+SRL RISCV 0000000 rs2:5 rs1:5 101 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+SRA RISCV 0100000 rs2:5 rs1:5 101 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+OR RISCV 0000000 rs2:5 rs1:5 110 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+AND RISCV 0000000 rs2:5 rs1:5 111 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+LWU RISCV imm:12 rs1:5 110 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(4); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+LD RISCV imm:12 rs1:5 011 rd:5 0000011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 0 && $rs1 != 2 && $rs1 != 3 && $rs1 != 4 } \
+!memory { align(8); reg_plus_imm($rs1, sextract($imm, 12)); }
+
+SD RISCV imm5:7 rs2:5 rs1:5 011 imm:5 0100011 \
+!constraints { $rs1 != 0 && $rs1 != 2 && $rs1 !=3 && $rs1 != 4 && $rs2 != 2} \
+!memory { align(8); reg_plus_imm($rs1, sextract($imm5 << 5 | $imm, 12)); }
+
+SLLI RISCV 00000 sham5:7 rs1:5 001 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SRLI RISCV 00000 sham5:7 rs1:5 101 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SRAI RISCV 01000 sham5:7 rs1:5 101 rd:5 0010011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+ADDIW RISCV imm:12 rs1:5 000 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SLLIW RISCV 0000000 shamt:5 rs1:5 001 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SRLIW RISCV 0000000 shamt:5 rs1:5 101 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SRAIW RISCV 0100000 shamt:5 rs1:5 101 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+ADDW RISCV 0000000 rs2:5 rs1:5 000 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SUBW RISCV 0100000 rs2:5 rs1:5 000 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SLLW RISCV 0000000 rs2:5 rs1:5 001 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SRLW RISCV 0000000 rs2:5 rs1:5 101 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+SRAW RISCV 0100000 rs2:5 rs1:5 101 rd:5 0011011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
-- 
2.23.0


