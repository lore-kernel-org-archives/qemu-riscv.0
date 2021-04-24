Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la943-0008LW-Cg
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93w-0008JO-0f; Fri, 23 Apr 2021 23:34:33 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la93q-0004BP-88; Fri, 23 Apr 2021 23:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235266; x=1650771266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqpIQlJ0i0/m9BcItdGzu0HlsENrUUSOxhFdL6n/qMI=;
 b=gJzqmj7rRN2B8c9x87clZE17AvKYcw67MUSdUv8J+8CROu/HzuMXpYpb
 17V0VTexEwf+lenViKpfZLZlwjvhlq4tnbW5fNI99hzlS8NdZJEnLYj6F
 seBa0b1lc4DVAnCXPlPnY8pv/R4btl0xrglzq+NCCjH89hLcyyt8wV/HW
 3UdmRVK6f/eBEPLztXn2qGjLTsdZRE20u8DKTXwSdLUjO4XxAf8lWgyMT
 IHm8Utp3moKyqxjhUHMMqzb+wov5u5IWcPg5OVJunYRGAqvsYJlk6DAsv
 OEUpu/7YpdAGgTYgHMbDzniDMwKtGsMsPvDH1C1fRo8N7Whh3ZZGNRGSA A==;
IronPort-SDR: gAXKVq4a/85E2h/zggjlLZj+o9ynD/aq77ZNIZdmIeNh0CzFsr1/NtC/07pwE7cQkdZ2K2+bio
 xOAwyu8Bg0kqXZCIMsw9Lkn2GikzRNChA88Ik44zDKY2qrG587b3Qjy2ylGCk51isPPsjZh8u7
 yiaXrd+ORiq4yycVqtUiWnAbw9fw0osw1/IKzeW9Fd2V4NAwB5kIvPioO8qr6WXXGmAWK3cImT
 T26NLDn/z4A7AKww3IbvQ2xrIZkcNjXjO1y4D22/SbvhryveDuJ4QeDilqJ4vPm5j0AGTVtx3p
 oPI=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="277100852"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:34:22 +0800
IronPort-SDR: P7ml4IgWXISYJi3Efxi47nlr4gLUXBdVuh4h1bfF9YLgaUM4h489wqDESGwB2+BhM2f3arBO0C
 9mFx5NdxQBD5A4gaeKf2ZsGRUxVcvGphJ3/PcoP6Q8UmlWmGpI1pnu77CgMWbjNpcPLTkmQzcM
 /0wyExoy034bmEiaZJ8i/nrakn3Iag5mLBTpQkYn3xz0rG4Ra2sVG5y4NIMdDW3tpCW1ieJVZp
 krEYXM2/0UQwYTueAruecZSC9XCKwo/5JrYebETcqsaKpQyGf7+oERd5tfM+3IBFp8az2l4mBa
 Ev/NwzyanaAX9uWHPtracn47
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:13:24 -0700
IronPort-SDR: +cas80iTj7bUQ6W+9K02H3T+OigscBU+u/xtbVzIPiVBgUDuq+XAJflmkCrIrmk/BfTHjE3y0G
 BdFTpck9t5voXLhP6/KdydBgdscjRlB31djKesYUcB/Bl4OP+3ZdrTQDA/fpAXUt0U19V7+ktj
 IXcunR3+11mWmD1AaG6C6zExL/C4OvChD5XtTpRuyGD0KSd5zAXnvfme7KyKDTTxhF7fE8goew
 wHuvxdlWvhiO84ogzPJuAKKImAuxVAnMCuEYhB4pAlBe2pFV0Nj+OPd9I2Gb4N9KNd7kDL6ajb
 0VU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:34:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 08/10] target/riscv: Consolidate RV32/64 32-bit instructions
Date: Sat, 24 Apr 2021 13:34:12 +1000
Message-Id: <db709360e2be47d2f9c6483ab973fe4791aefa77.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1619234854.git.alistair.francis@wdc.com>
References: <cover.1619234854.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
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
X-List-Received-Date: Sat, 24 Apr 2021 03:34:34 -0000

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
 target/riscv/helper.h                   | 18 +++--
 target/riscv/insn32-64.decode           | 88 -------------------------
 target/riscv/insn32.decode              | 67 ++++++++++++++++++-
 target/riscv/fpu_helper.c               | 16 ++---
 target/riscv/translate.c                | 11 ++--
 target/riscv/vector_helper.c            |  4 --
 target/riscv/insn_trans/trans_rva.c.inc | 14 +++-
 target/riscv/insn_trans/trans_rvd.c.inc | 17 ++++-
 target/riscv/insn_trans/trans_rvf.c.inc |  6 +-
 target/riscv/insn_trans/trans_rvh.c.inc |  8 ++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 +++--
 target/riscv/insn_trans/trans_rvm.c.inc | 12 +++-
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++------
 target/riscv/meson.build                |  2 +-
 14 files changed, 166 insertions(+), 152 deletions(-)
 delete mode 100644 target/riscv/insn32-64.decode

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e3f3f41e89..c7267593c3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -27,12 +27,12 @@ DEF_HELPER_FLAGS_3(flt_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_s, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_s, TCG_CALL_NO_RWG, tl, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_l_s, TCG_CALL_NO_RWG, i64, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_lu_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_l_s, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_s, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_s, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Floating Point - Double Precision */
@@ -50,12 +50,12 @@ DEF_HELPER_FLAGS_3(flt_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_d, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_d, TCG_CALL_NO_RWG, tl, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, i64, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_wu, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
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
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 7c4ab92ecb..8700516a14 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -223,13 +223,13 @@ target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
     return (int32_t)float32_to_uint32(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
+target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(rs1);
     return float32_to_int64(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
+target_ulong helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(rs1);
     return float32_to_uint64(frs1, &env->fp_status);
@@ -245,12 +245,12 @@ uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
     return nanbox_s(uint32_to_float32((uint32_t)rs1, &env->fp_status));
 }
 
-uint64_t helper_fcvt_s_l(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_s_l(CPURISCVState *env, target_ulong rs1)
 {
     return nanbox_s(int64_to_float32(rs1, &env->fp_status));
 }
 
-uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_s_lu(CPURISCVState *env, target_ulong rs1)
 {
     return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
 }
@@ -332,12 +332,12 @@ target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
     return (int32_t)float64_to_uint32(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
+target_ulong helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_int64(frs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
+target_ulong helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_uint64(frs1, &env->fp_status);
 }
@@ -352,12 +352,12 @@ uint64_t helper_fcvt_d_wu(CPURISCVState *env, target_ulong rs1)
     return uint32_to_float64((uint32_t)rs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_d_l(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_d_l(CPURISCVState *env, target_ulong rs1)
 {
     return int64_to_float64(rs1, &env->fp_status);
 }
 
-uint64_t helper_fcvt_d_lu(CPURISCVState *env, uint64_t rs1)
+uint64_t helper_fcvt_d_lu(CPURISCVState *env, target_ulong rs1)
 {
     return uint64_to_float64(rs1, &env->fp_status);
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a1f794ffda..669fd0d525 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -74,8 +74,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 
 #ifdef TARGET_RISCV32
 # define is_32bit(ctx)  true
-#elif defined(CONFIG_USER_ONLY)
-# define is_32bit(ctx)  false
 #else
 static inline bool is_32bit(DisasContext *ctx)
 {
@@ -435,6 +433,12 @@ EX_SH(12)
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
@@ -482,7 +486,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
     return true;
 }
 
-#ifdef TARGET_RISCV64
 static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_add_tl(ret, arg1, arg2);
@@ -543,8 +546,6 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
-#endif
-
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4651a1e224..12c31aa4b4 100644
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
index 4f832637fa..7e45538ae0 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -358,10 +358,9 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     return true;
 }
 
-#ifdef TARGET_RISCV64
-
 static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
@@ -375,6 +374,7 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
 
 static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
@@ -388,15 +388,21 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
 
 static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
+#ifdef TARGET_RISCV64
     gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
     return true;
+#else
+    qemu_build_not_reached();
+#endif
 }
 
 static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
@@ -412,6 +418,7 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
 
 static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
@@ -427,9 +434,11 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
 
 static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
+#ifdef TARGET_RISCV64
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
 
@@ -437,5 +446,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
     tcg_temp_free(t0);
     mark_fs_dirty(ctx);
     return true;
-}
+#else
+    qemu_build_not_reached();
 #endif
+}
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 3dfec8211d..db1c0c9974 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -415,9 +415,9 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     return true;
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
@@ -431,6 +431,7 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
 
 static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
@@ -444,6 +445,7 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
 
 static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
@@ -460,6 +462,7 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
 
 static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
@@ -473,4 +476,3 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
     tcg_temp_free(t0);
     return true;
 }
-#endif
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index ce7ed5affb..6b5edf82b7 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -203,10 +203,11 @@ static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 #endif
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -228,7 +229,9 @@ static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
@@ -250,7 +253,9 @@ static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+
 #ifndef CONFIG_USER_ONLY
     TCGv t0 = tcg_temp_new();
     TCGv dat = tcg_temp_new();
@@ -269,7 +274,6 @@ static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
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
index 47cd6edc72..10ecc456fc 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -87,34 +87,42 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
     return gen_arith(ctx, a, &gen_remu);
 }
 
-#ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
+
     return gen_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
+
     return gen_arith_div_w(ctx, a, &gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
+
     return gen_arith_div_uw(ctx, a, &gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
+
     return gen_arith_div_w(ctx, a, &gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
+    REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
+
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


