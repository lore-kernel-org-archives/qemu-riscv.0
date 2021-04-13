Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSYf-0008IO-Kd
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYX-0008Fz-1N; Tue, 13 Apr 2021 19:34:53 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:38737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSYS-0004RV-99; Tue, 13 Apr 2021 19:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356889; x=1649892889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LznrQSfngCWKhlsOXVetOWhyo4CEQ9VGzWTa9SxNiMA=;
 b=iGfinXIcLDJAfUdnId5IjzM+AYKIa5bPW/s1Gx4j0KBut88jS+SICYxu
 AiaLh4gZHFYQ18Yhhvi8sjSumSu4usRxsVnOaxtpIMXYPhk7UkQMlOQYS
 DybqTOch0jttAzyQtAKKMmUQcfJD9goq/8mpyfIQ184zuEwGW5reOp69A
 sCong7bqrOMuCs9mBu3utYM+fN9F+fRru35gq45kYMfCyeNpia2ag1n8r
 hYzOiJYsX1j+6tdx+HJBHmUSmuHv/2Ua5vdDU2+35ZftaYW1PU/BiIK4l
 LpIPn1fOdg9QpHzDwbuJJKBKXFY0xDZO+Fb/ae+I5jDqPBG8k8KpuBzIv Q==;
IronPort-SDR: hDqBCp8gr1MWBcbLcYSLWbv+7JZ7OZXUbIJAmgI9mYBRdQa2FLDVxiUvCeLeDZ4feO9DxwHN1h
 NhPgfv50TNyPgjiM3KruDcLI8y7RUVfcfDZeW0ZIuBi5q7nAK3lkELh4CywMR4LYQOasuL4ifT
 ppRDOdzvOORb3OSMUfCLQO+B/60Vt+25Zg5HnmYp2s2QI69SP2thY6fX0H76L/TB8gYHIkyBBF
 pc1RE2JLiST8Mp160D1lW/xDPUstbz1F3SqVYBzM52mzxoWJIdDLRwkPWCkBB19ha/v01fyBma
 xzU=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="165429538"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:34:39 +0800
IronPort-SDR: KyUUaRAE/jJbOCtzP9gikKJX2MnEM+hVWPn91zyBzZbThTUj5RyjVa7/ViMKRRr7gJlt20x3WY
 61gc+idaXqVoJFsP6KbhqbhuVP43GIzmADceWxFbtg2hqMf6iReXMSdxG0FQ0Ry2hxJIwJZ2/n
 7D/6NOHcxCzCQdtDYHEjoVRuvjy4TB6tn03y2cezZdHbT26ZIngf5XfHHhUrJGqrO/yd90gFgk
 5UN1goZ2vVluiOQWA4Wogj2I7j0X7VzI/Gp6acobPTi2a1oDlUKR/6AHpbWDAep4Jdn1KtzEbf
 EK69zg210gyUtl7QUdEKboRl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:15:37 -0700
IronPort-SDR: uO5tXEwiDegysCUR/nG4UTarRkpM87gYwBS5s80P6p2q18XuuZJJRlzY+CbWRiXJBowmyAkpMX
 ZG3LMmKwDXeIjjBC/Pr6zdm6YCDQ64shpRYfmWNTOO2CaRtq5uNQpm9ZiP3F7YDvZFvXzdEEoN
 nZ7T2WgHyc81KO1+t0GVSvmluCpY+z7Lp+f5U0ZPvpgH6YXrzL1BvpDvCpakRMfv/cme/4FcEp
 wvIi9jfWv97K4HF3hCMfOPM/HSGBMK2nLMdGb+B22hBCt4BiXK6aN16D0i2DPqZaqU6PVxe667
 kGc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Apr 2021 16:34:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 8/9] target/riscv: Consolidate RV32/64 32-bit instructions
Date: Wed, 14 Apr 2021 09:34:24 +1000
Message-Id: <058e2779f8bcd25816bc2338a44ab6f1b2d549db.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Tue, 13 Apr 2021 23:34:56 -0000

This patch removes the insn32-64.decode decode file and consolidates the
instructions into the general RISC-V insn32.decode decode tree.

This means that all of the instructions are avaliable in both the 32-bit
and 64-bit builds. This also means that we run a check to ensure we are
running a 64-bit softmmu before we execute the 64-bit only instructions.
This allows us to include the 32-bit instructions in the 64-bit build,
while also ensuring that 32-bit only software can not execute the
instructions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 -
 target/riscv/insn32-64.decode           | 88 -------------------------
 target/riscv/insn32.decode              | 67 ++++++++++++++++++-
 target/riscv/translate.c                | 19 +++---
 target/riscv/vector_helper.c            |  4 --
 target/riscv/insn_trans/trans_rva.c.inc | 14 +++-
 target/riscv/insn_trans/trans_rvd.c.inc | 43 ++++++------
 target/riscv/insn_trans/trans_rvf.c.inc | 40 +++++------
 target/riscv/insn_trans/trans_rvh.c.inc |  5 +-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 +++--
 target/riscv/insn_trans/trans_rvm.c.inc |  7 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++------
 target/riscv/meson.build                |  2 +-
 13 files changed, 172 insertions(+), 174 deletions(-)
 delete mode 100644 target/riscv/insn32-64.decode

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e3f3f41e89..cda1811512 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -241,7 +241,6 @@ DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
-#ifdef TARGET_RISCV64
 DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoaddw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
@@ -260,7 +259,6 @@ DEF_HELPER_6(vamominuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamominud_v_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamomaxuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamomaxud_v_d, void, ptr, ptr, tl, ptr, env, i32)
-#endif
 DEF_HELPER_6(vamoswapw_v_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoaddw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamoxorw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
deleted file mode 100644
index 8157dee8b7..0000000000
--- a/target/riscv/insn32-64.decode
+++ /dev/null
@@ -1,88 +0,0 @@
-#
-# RISC-V translation routines for the RV Instruction Set.
-#
-# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
-#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2 or later, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program.  If not, see <http://www.gnu.org/licenses/>.
-
-# This is concatenated with insn32.decode for risc64 targets.
-# Most of the fields and formats are there.
-
-%sh5    20:5
-
-@sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
-
-# *** RV64I Base Instruction Set (in addition to RV32I) ***
-lwu      ............   ..... 110 ..... 0000011 @i
-ld       ............   ..... 011 ..... 0000011 @i
-sd       ....... .....  ..... 011 ..... 0100011 @s
-addiw    ............   ..... 000 ..... 0011011 @i
-slliw    0000000 .....  ..... 001 ..... 0011011 @sh5
-srliw    0000000 .....  ..... 101 ..... 0011011 @sh5
-sraiw    0100000 .....  ..... 101 ..... 0011011 @sh5
-addw     0000000 .....  ..... 000 ..... 0111011 @r
-subw     0100000 .....  ..... 000 ..... 0111011 @r
-sllw     0000000 .....  ..... 001 ..... 0111011 @r
-srlw     0000000 .....  ..... 101 ..... 0111011 @r
-sraw     0100000 .....  ..... 101 ..... 0111011 @r
-
-# *** RV64M Standard Extension (in addition to RV32M) ***
-mulw     0000001 .....  ..... 000 ..... 0111011 @r
-divw     0000001 .....  ..... 100 ..... 0111011 @r
-divuw    0000001 .....  ..... 101 ..... 0111011 @r
-remw     0000001 .....  ..... 110 ..... 0111011 @r
-remuw    0000001 .....  ..... 111 ..... 0111011 @r
-
-# *** RV64A Standard Extension (in addition to RV32A) ***
-lr_d       00010 . . 00000 ..... 011 ..... 0101111 @atom_ld
-sc_d       00011 . . ..... ..... 011 ..... 0101111 @atom_st
-amoswap_d  00001 . . ..... ..... 011 ..... 0101111 @atom_st
-amoadd_d   00000 . . ..... ..... 011 ..... 0101111 @atom_st
-amoxor_d   00100 . . ..... ..... 011 ..... 0101111 @atom_st
-amoand_d   01100 . . ..... ..... 011 ..... 0101111 @atom_st
-amoor_d    01000 . . ..... ..... 011 ..... 0101111 @atom_st
-amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
-amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
-amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
-amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
-
-#*** Vector AMO operations (in addition to Zvamo) ***
-vamoswapd_v     00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoaddd_v      00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoxord_v      00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoandd_v      01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoord_v       01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-
-# *** RV64F Standard Extension (in addition to RV32F) ***
-fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
-fcvt_lu_s  1100000  00011 ..... ... ..... 1010011 @r2_rm
-fcvt_s_l   1101000  00010 ..... ... ..... 1010011 @r2_rm
-fcvt_s_lu  1101000  00011 ..... ... ..... 1010011 @r2_rm
-
-# *** RV64D Standard Extension (in addition to RV32D) ***
-fcvt_l_d   1100001  00010 ..... ... ..... 1010011 @r2_rm
-fcvt_lu_d  1100001  00011 ..... ... ..... 1010011 @r2_rm
-fmv_x_d    1110001  00000 ..... 000 ..... 1010011 @r2
-fcvt_d_l   1101001  00010 ..... ... ..... 1010011 @r2_rm
-fcvt_d_lu  1101001  00011 ..... ... ..... 1010011 @r2_rm
-fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
-
-# *** RV32H Base Instruction Set ***
-hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
-hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
-hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18c..fecf0f15d5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -21,6 +21,7 @@
 %rs2       20:5
 %rs1       15:5
 %rd        7:5
+%sh5       20:5
 
 %sh10    20:10
 %csr    20:12
@@ -86,6 +87,8 @@
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
+# Formats 64:
+@sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
@@ -144,6 +147,20 @@ csrrwi   ............     ..... 101 ..... 1110011 @csr
 csrrsi   ............     ..... 110 ..... 1110011 @csr
 csrrci   ............     ..... 111 ..... 1110011 @csr
 
+# *** RV64I Base Instruction Set (in addition to RV32I) ***
+lwu      ............   ..... 110 ..... 0000011 @i
+ld       ............   ..... 011 ..... 0000011 @i
+sd       ....... .....  ..... 011 ..... 0100011 @s
+addiw    ............   ..... 000 ..... 0011011 @i
+slliw    0000000 .....  ..... 001 ..... 0011011 @sh5
+srliw    0000000 .....  ..... 101 ..... 0011011 @sh5
+sraiw    0100000 .....  ..... 101 ..... 0011011 @sh5
+addw     0000000 .....  ..... 000 ..... 0111011 @r
+subw     0100000 .....  ..... 000 ..... 0111011 @r
+sllw     0000000 .....  ..... 001 ..... 0111011 @r
+srlw     0000000 .....  ..... 101 ..... 0111011 @r
+sraw     0100000 .....  ..... 101 ..... 0111011 @r
+
 # *** RV32M Standard Extension ***
 mul      0000001 .....  ..... 000 ..... 0110011 @r
 mulh     0000001 .....  ..... 001 ..... 0110011 @r
@@ -154,6 +171,13 @@ divu     0000001 .....  ..... 101 ..... 0110011 @r
 rem      0000001 .....  ..... 110 ..... 0110011 @r
 remu     0000001 .....  ..... 111 ..... 0110011 @r
 
+# *** RV64M Standard Extension (in addition to RV32M) ***
+mulw     0000001 .....  ..... 000 ..... 0111011 @r
+divw     0000001 .....  ..... 100 ..... 0111011 @r
+divuw    0000001 .....  ..... 101 ..... 0111011 @r
+remw     0000001 .....  ..... 110 ..... 0111011 @r
+remuw    0000001 .....  ..... 111 ..... 0111011 @r
+
 # *** RV32A Standard Extension ***
 lr_w       00010 . . 00000 ..... 010 ..... 0101111 @atom_ld
 sc_w       00011 . . ..... ..... 010 ..... 0101111 @atom_st
@@ -167,6 +191,19 @@ amomax_w   10100 . . ..... ..... 010 ..... 0101111 @atom_st
 amominu_w  11000 . . ..... ..... 010 ..... 0101111 @atom_st
 amomaxu_w  11100 . . ..... ..... 010 ..... 0101111 @atom_st
 
+# *** RV64A Standard Extension (in addition to RV32A) ***
+lr_d       00010 . . 00000 ..... 011 ..... 0101111 @atom_ld
+sc_d       00011 . . ..... ..... 011 ..... 0101111 @atom_st
+amoswap_d  00001 . . ..... ..... 011 ..... 0101111 @atom_st
+amoadd_d   00000 . . ..... ..... 011 ..... 0101111 @atom_st
+amoxor_d   00100 . . ..... ..... 011 ..... 0101111 @atom_st
+amoand_d   01100 . . ..... ..... 011 ..... 0101111 @atom_st
+amoor_d    01000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
+amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
+amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
+
 # *** RV32F Standard Extension ***
 flw        ............   ..... 010 ..... 0000111 @i
 fsw        .......  ..... ..... 010 ..... 0100111 @s
@@ -195,6 +232,12 @@ fcvt_s_w   1101000  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_s_wu  1101000  00001 ..... ... ..... 1010011 @r2_rm
 fmv_w_x    1111000  00000 ..... 000 ..... 1010011 @r2
 
+# *** RV64F Standard Extension (in addition to RV32F) ***
+fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_lu_s  1100000  00011 ..... ... ..... 1010011 @r2_rm
+fcvt_s_l   1101000  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_s_lu  1101000  00011 ..... ... ..... 1010011 @r2_rm
+
 # *** RV32D Standard Extension ***
 fld        ............   ..... 011 ..... 0000111 @i
 fsd        ....... .....  ..... 011 ..... 0100111 @s
@@ -223,6 +266,14 @@ fcvt_wu_d  1100001  00001 ..... ... ..... 1010011 @r2_rm
 fcvt_d_w   1101001  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_d_wu  1101001  00001 ..... ... ..... 1010011 @r2_rm
 
+# *** RV64D Standard Extension (in addition to RV32D) ***
+fcvt_l_d   1100001  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_lu_d  1100001  00011 ..... ... ..... 1010011 @r2_rm
+fmv_x_d    1110001  00000 ..... 000 ..... 1010011 @r2
+fcvt_d_l   1101001  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_d_lu  1101001  00011 ..... ... ..... 1010011 @r2_rm
+fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
+
 # *** RV32H Base Instruction Set ***
 hlv_b       0110000  00000  ..... 100 ..... 1110011 @r2
 hlv_bu      0110000  00001  ..... 100 ..... 1110011 @r2
@@ -237,7 +288,10 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
 hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
 hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
 
-# *** RV32V Extension ***
+# *** RV32H Base Instruction Set ***
+hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
+hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
+hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 
 # *** Vector loads and stores are encoded within LOADFP/STORE-FP ***
 vlb_v      ... 100 . 00000 ..... 000 ..... 0000111 @r2_nfvm
@@ -592,3 +646,14 @@ vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
+
+#*** Vector AMO operations (in addition to Zvamo) ***
+vamoswapd_v     00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoaddd_v      00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoxord_v      00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoandd_v      01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoord_v       01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ba8fb2cda3..0ded4f9882 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -72,15 +72,13 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa & ext;
 }
 
-#ifndef CONFIG_USER_ONLY
-# ifdef TARGET_RISCV32
-#  define is_32bit(ctx)  true
-# else
+#ifdef TARGET_RISCV32
+# define is_32bit(ctx)  true
+#else
 static inline bool is_32bit(DisasContext *ctx)
 {
-    return !(ctx->misa & RV64);
+    return (ctx->misa & RV32) == RV32;
 }
-# endif
 #endif
 
 /*
@@ -436,6 +434,12 @@ EX_SH(12)
     }                              \
 } while (0)
 
+#define REQUIRE_64BIT(ctx) do { \
+    if (is_32bit(ctx)) {        \
+        return false;           \
+    }                           \
+} while (0)
+
 static int ex_rvc_register(DisasContext *ctx, int reg)
 {
     return 8 + reg;
@@ -483,7 +487,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
     return true;
 }
 
-#ifdef TARGET_RISCV64
 static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_add_tl(ret, arg1, arg2);
@@ -544,8 +547,6 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
-#endif
-
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d28..a64c86b7e4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -751,7 +751,6 @@ GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_w,  32, 32, H4, DO_MIN,  l)
 GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_w,  32, 32, H4, DO_MAX,  l)
 GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_w, 32, 32, H4, DO_MINU, l)
 GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_w, 32, 32, H4, DO_MAXU, l)
-#ifdef TARGET_RISCV64
 GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_d, 64, 32, H8, DO_SWAP, l)
 GEN_VEXT_AMO_NOATOMIC_OP(vamoswapd_v_d, 64, 64, H8, DO_SWAP, q)
 GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_d,  64, 32, H8, DO_ADD,  l)
@@ -770,7 +769,6 @@ GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_d, 64, 32, H8, DO_MINU, l)
 GEN_VEXT_AMO_NOATOMIC_OP(vamominud_v_d, 64, 64, H8, DO_MINU, q)
 GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_d, 64, 32, H8, DO_MAXU, l)
 GEN_VEXT_AMO_NOATOMIC_OP(vamomaxud_v_d, 64, 64, H8, DO_MAXU, q)
-#endif
 
 static inline void
 vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
@@ -814,7 +812,6 @@ void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
                       GETPC());                                 \
 }
 
-#ifdef TARGET_RISCV64
 GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d, clearq)
 GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d, clearq)
 GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d, clearq)
@@ -833,7 +830,6 @@ GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d, clearq)
 GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d, clearq)
 GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d, clearq)
 GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d, clearq)
-#endif
 GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w, clearl)
 GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w, clearl)
 GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w, clearl)
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index be8a9f06dd..ab2ec4f0a5 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -165,60 +165,68 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TESL));
 }
 
-#ifdef TARGET_RISCV64
-
 static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_lr(ctx, a, MO_ALIGN | MO_TEQ);
 }
 
 static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_sc(ctx, a, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEQ));
 }
 
 static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEQ));
 }
-#endif
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 4f832637fa..39645a6134 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -358,18 +358,17 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     return true;
 }
 
-#ifdef TARGET_RISCV64
-
 static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv_i64 t0 = tcg_temp_new_i64();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_set_gpr(a->rd, (TCGv) t0);
+    tcg_temp_free_i64(t0);
     return true;
 }
 
@@ -377,12 +376,13 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv_i64 t0 = tcg_temp_new_i64();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_set_gpr(a->rd, (TCGv) t0);
+    tcg_temp_free_i64(t0);
     return true;
 }
 
@@ -390,8 +390,9 @@ static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_64BIT(ctx);
 
-    gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, (TCGv) cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -399,13 +400,14 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    gen_get_gpr((TCGv) t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    tcg_temp_free_i64(t0);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -414,13 +416,14 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    gen_get_gpr((TCGv) t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    tcg_temp_free_i64(t0);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -429,13 +432,13 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    gen_get_gpr((TCGv) t0, a->rs1);
 
-    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
-    tcg_temp_free(t0);
+    tcg_gen_mov_tl((TCGv) cpu_fpr[a->rd], (TCGv) t0);
+    tcg_temp_free_i64(t0);
     mark_fs_dirty(ctx);
     return true;
 }
-#endif
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 3dfec8211d..327a2b2fab 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -303,11 +303,11 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
 
     TCGv t0 = tcg_temp_new();
 
-#if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
-#else
-    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
-#endif
+    if (!is_32bit(ctx)) {
+        tcg_gen_ext32s_tl((TCGv) t0, (TCGv) cpu_fpr[a->rs1]);
+    } else {
+        tcg_gen_extrl_i64_i32((TCGv_i32) t0, cpu_fpr[a->rs1]);
+    }
 
     gen_set_gpr(a->rd, t0);
     tcg_temp_free(t0);
@@ -415,17 +415,17 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     return true;
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv_i64 t0 = tcg_temp_new_i64();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_set_gpr(a->rd, (TCGv) t0);
+    tcg_temp_free_i64(t0);
     return true;
 }
 
@@ -433,12 +433,13 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv_i64 t0 = tcg_temp_new_i64();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_set_gpr(a->rd, (TCGv) t0);
+    tcg_temp_free_i64(t0);
     return true;
 }
 
@@ -446,15 +447,16 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    gen_get_gpr((TCGv) t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
+    tcg_temp_free_i64(t0);
     return true;
 }
 
@@ -462,15 +464,15 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
+    REQUIRE_64BIT(ctx);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    gen_get_gpr((TCGv) t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
+    tcg_temp_free_i64(t0);
     return true;
 }
-#endif
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index ce7ed5affb..beb66be670 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -203,10 +203,10 @@ static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 #endif
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
+    REQUIRE_64BIT(ctx);
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -229,6 +229,7 @@ static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_EXT(ctx, RVH);
+    REQUIRE_64BIT(ctx);
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -251,6 +252,7 @@ static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_EXT(ctx, RVH);
+    REQUIRE_64BIT(ctx);
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv dat = tcg_temp_new();
@@ -269,7 +271,6 @@ static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
     return false;
 #endif
 }
-#endif
 
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394c..1340676209 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -204,22 +204,23 @@ static bool trans_sw(DisasContext *ctx, arg_sw *a)
     return gen_store(ctx, a, MO_TESL);
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_load(ctx, a, MO_TEUL);
 }
 
 static bool trans_ld(DisasContext *ctx, arg_ld *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_load(ctx, a, MO_TEQ);
 }
 
 static bool trans_sd(DisasContext *ctx, arg_sd *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_store(ctx, a, MO_TEQ);
 }
-#endif
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
@@ -361,14 +362,15 @@ static bool trans_and(DisasContext *ctx, arg_and *a)
     return gen_arith(ctx, a, &tcg_gen_and_tl);
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_arith_imm_tl(ctx, a, &gen_addw);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
+    REQUIRE_64BIT(ctx);
     TCGv source1;
     source1 = tcg_temp_new();
     gen_get_gpr(source1, a->rs1);
@@ -383,6 +385,7 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
+    REQUIRE_64BIT(ctx);
     TCGv t = tcg_temp_new();
     gen_get_gpr(t, a->rs1);
     tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
@@ -395,6 +398,7 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
+    REQUIRE_64BIT(ctx);
     TCGv t = tcg_temp_new();
     gen_get_gpr(t, a->rs1);
     tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
@@ -405,16 +409,19 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_arith(ctx, a, &gen_addw);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
+    REQUIRE_64BIT(ctx);
     return gen_arith(ctx, a, &gen_subw);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
+    REQUIRE_64BIT(ctx);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
@@ -433,6 +440,7 @@ static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
+    REQUIRE_64BIT(ctx);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
@@ -453,6 +461,7 @@ static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
+    REQUIRE_64BIT(ctx);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
@@ -473,7 +482,6 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 
     return true;
 }
-#endif
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 47cd6edc72..7f541e35ca 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -87,34 +87,37 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
     return gen_arith(ctx, a, &gen_remu);
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_EXT(ctx, RVM);
+    REQUIRE_64BIT(ctx);
     return gen_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
     REQUIRE_EXT(ctx, RVM);
+    REQUIRE_64BIT(ctx);
     return gen_arith_div_w(ctx, a, &gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_EXT(ctx, RVM);
+    REQUIRE_64BIT(ctx);
     return gen_arith_div_uw(ctx, a, &gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
     REQUIRE_EXT(ctx, RVM);
+    REQUIRE_64BIT(ctx);
     return gen_arith_div_w(ctx, a, &gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_EXT(ctx, RVM);
+    REQUIRE_64BIT(ctx);
     return gen_arith_div_uw(ctx, a, &gen_remu);
 }
-#endif
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 887c6b8883..47914a3b69 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -705,7 +705,6 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         gen_helper_vamominuw_v_w,
         gen_helper_vamomaxuw_v_w
     };
-#ifdef TARGET_RISCV64
     static gen_helper_amo *const fnsd[18] = {
         gen_helper_vamoswapw_v_d,
         gen_helper_vamoaddw_v_d,
@@ -726,7 +725,6 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         gen_helper_vamominud_v_d,
         gen_helper_vamomaxud_v_d
     };
-#endif
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         gen_helper_exit_atomic(cpu_env);
@@ -734,12 +732,12 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         return true;
     } else {
         if (s->sew == 3) {
-#ifdef TARGET_RISCV64
-            fn = fnsd[seq];
-#else
-            /* Check done in amo_check(). */
-            g_assert_not_reached();
-#endif
+            if (!is_32bit(s)) {
+                fn = fnsd[seq];
+            } else {
+                /* Check done in amo_check(). */
+                g_assert_not_reached();
+            }
         } else {
             assert(seq < ARRAY_SIZE(fnsw));
             fn = fnsw[seq];
@@ -769,6 +767,11 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
             ((1 << s->sew) >= 4));
 }
 
+static bool amo_check64(DisasContext *s, arg_rwdvm* a)
+{
+    return !is_32bit(s) && amo_check(s, a);
+}
+
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamoaddw_v, 1, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamoxorw_v, 2, rwdvm, amo_op, amo_check)
@@ -778,17 +781,15 @@ GEN_VEXT_TRANS(vamominw_v, 5, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamomaxw_v, 6, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamominuw_v, 7, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamomaxuw_v, 8, rwdvm, amo_op, amo_check)
-#ifdef TARGET_RISCV64
-GEN_VEXT_TRANS(vamoswapd_v, 9, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoaddd_v, 10, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoxord_v, 11, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoandd_v, 12, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoord_v, 13, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomind_v, 14, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check)
-#endif
+GEN_VEXT_TRANS(vamoswapd_v, 9, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamoaddd_v, 10, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamoxord_v, 11, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamoandd_v, 12, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamoord_v, 13, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamomind_v, 14, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check64)
+GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check64)
 
 /*
  *** Vector Integer Arithmetic Instructions
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 88ab850682..24bf049164 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -7,7 +7,7 @@ gen32 = [
 
 gen64 = [
   decodetree.process('insn16.decode', extra_args: [dir / 'insn16-64.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
-  decodetree.process('insn32.decode', extra_args: [dir / 'insn32-64.decode', '--static-decode=decode_insn32']),
+  decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
 ]
 
 riscv_ss = ss.source_set()
-- 
2.31.1


