Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSc8-0004vN-G6
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSc7-0004tb-5M; Tue, 13 Apr 2021 19:38:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:18260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSc3-00067s-Bo; Tue, 13 Apr 2021 19:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618357111; x=1649893111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbbfjVqA5KYchZGFwHBxmJf7NazYTVzndMWw/GcsCsw=;
 b=VAwYk3I1RhQ2rKNVEePn15duil7nXQVmM+gXVYtapSpr9VaPr5j14b4d
 DGoB+6hZKfy6dMjducLzFzQ7fHLO8+MH9AqnUabQrA14pQViEp45L62SQ
 ZdTOpczYAWNZWF5XxJHlfrjEFF7hxGwavV6+1IGFZFY9WAB+V2zzNpj5A
 L/DIm6qh4+wYOUMPH3KZrp6XqTtXm0e+AhRX6bMHWIqnCLjQEBRWbaC2G
 naC4jI6+AD4fbLG5cqQXuz1XwddLIKg1YN8NI5MwKiz395GXuQ9ge8UVS
 uQIUZJ87bXqwEvDuZGEKRBut669wBk9llDb4NIiOmcp70/PJn1F1PKdPE g==;
IronPort-SDR: m2wwhF4R/Q9vnOkJZX8DXPz5DODIpycgdFNkHYGX9+iKQns6l5F7CAquFVir99CtuD++00UADq
 uHYQnorZfo23IyEGAHfD7cD6NSlCCfE4LZ+qwkPfTTAMWOX3NBnchufhk+pMFlLovlbewOrC3e
 4g8pjzj8VZbVZZycAxjsZBPpB5Qe4OZh3wYdnJGMUHpA3kkAaOi4+ehsPyHxqg4OWphfNLLhCZ
 gk8YEuMx17Xidit8ChN05vXZllWsnJuFMb6PixG5BkQZCF37FBFgrOUR5088xXoU8fw60qKn1r
 5wo=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164660171"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:34:59 +0800
IronPort-SDR: Xa64SLyzz6QzZlC/cE2fPV2n8ohjJEEGTGQBAvZcAWOGmEtytv1Rm+Dr2rW4xOxSmG5O8IBU3l
 ePQhFq5Y2+/daCEe4EPeAV46jqD6ZoeBGMSC60OFdzRdbySBhHRE97Oia8p73uiQdqEAHz/aFx
 sjA3f5Q4yR1PY5RXdxJYzBsaTQqHgpeG3htnFrrqtpjrx6tzmNp7T1jz9iX59HWKFF1vLocRNn
 bGoVlRzekN/xPmiQR3pTwOWObWVW9ANw+xAHpTxu5PjkzXLJ5gql8eIMB+D6Dw+0gh3TsN6Sj5
 4wmrNY5W3JzuLJ8ifAuzQGfD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:14:12 -0700
IronPort-SDR: B1aNsTnTK3iW9gR3vBMpY4twBHpOuDz43vu+Ng46iHCCIOosOS+Z1wPYws3dl7+gKxs590yy8o
 xblB+iycFbQu5d8F3Ec6tKqSrPVqwS77GO5JK+x8rDrQk/nKw7m+yFI12t2UQ3M7/yf3D//Tax
 Mx1Sld46Jyq8GZgmJn7jWcijw/zU/WxNhUYkOby3aen3tqMsoJBsjrzKv02g58LglzwnYih/qG
 5+fz/hF7IZwsQwUpDsKqFnw1KYDztbcfixrK2acHXCw+AdtE1cQleOFBCazR+qnUJiO/LEvLJk
 CeA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Apr 2021 16:34:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 9/9] target/riscv: Consolidate RV32/64 16-bit instructions
Date: Wed, 14 Apr 2021 09:34:36 +1000
Message-Id: <c2672cba3d0cdb9f803b28ce684fe2a41bb05aeb.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 23:38:35 -0000

This patch removes the insn16-32.decode and insn16-64.decode decode
files and consolidates the instructions into the general RISC-V
insn16.decode decode tree.

This means that all of the instructions are avaliable in both the 32-bit
and 64-bit builds. This also means that we run a check to ensure we are
running a 64-bit softmmu before we execute the 64-bit only instructions.
This allows us to include the 32-bit instructions in the 64-bit build,
while also ensuring that 32-bit only software can not execute the
instructions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16-32.decode           | 28 -------------------
 target/riscv/insn16-64.decode           | 36 -------------------------
 target/riscv/insn16.decode              | 30 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  6 +++++
 target/riscv/meson.build                | 11 +++-----
 5 files changed, 39 insertions(+), 72 deletions(-)
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode

diff --git a/target/riscv/insn16-32.decode b/target/riscv/insn16-32.decode
deleted file mode 100644
index 0819b17028..0000000000
--- a/target/riscv/insn16-32.decode
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# RISC-V translation routines for the RVXI Base Integer Instruction Set.
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
-# *** RV32C Standard Extension (Quadrant 0) ***
-flw               011  ... ... .. ... 00 @cl_w
-fsw               111  ... ... .. ... 00 @cs_w
-
-# *** RV32C Standard Extension (Quadrant 1) ***
-jal               001     ........... 01 @cj    rd=1  # C.JAL
-
-# *** RV32C Standard Extension (Quadrant 2) ***
-flw               011 .  .....  ..... 10 @c_lwsp
-fsw               111 .  .....  ..... 10 @c_swsp
diff --git a/target/riscv/insn16-64.decode b/target/riscv/insn16-64.decode
deleted file mode 100644
index 672e1e916f..0000000000
--- a/target/riscv/insn16-64.decode
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# RISC-V translation routines for the RVXI Base Integer Instruction Set.
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
-# *** RV64C Standard Extension (Quadrant 0) ***
-ld                011  ... ... .. ... 00 @cl_d
-sd                111  ... ... .. ... 00 @cs_d
-
-# *** RV64C Standard Extension (Quadrant 1) ***
-{
-  illegal         001 -  00000  ----- 01 # c.addiw, RES rd=0
-  addiw           001 .  .....  ..... 01 @ci
-}
-subw              100 1 11 ... 00 ... 01 @cs_2
-addw              100 1 11 ... 01 ... 01 @cs_2
-
-# *** RV64C Standard Extension (Quadrant 2) ***
-{
-  illegal         011 -  00000  ----- 10 # c.ldsp, RES rd=0
-  ld              011 .  .....  ..... 10 @c_ldsp
-}
-sd                111 .  .....  ..... 10 @c_sdsp
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 1cb93876fe..2e9212663c 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -92,6 +92,16 @@ lw                010  ... ... .. ... 00 @cl_w
 fsd               101  ... ... .. ... 00 @cs_d
 sw                110  ... ... .. ... 00 @cs_w
 
+# *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
+{
+  ld              011  ... ... .. ... 00 @cl_d
+  flw             011  ... ... .. ... 00 @cl_w
+}
+{
+  sd              111  ... ... .. ... 00 @cs_d
+  fsw             111  ... ... .. ... 00 @cs_w
+}
+
 # *** RV32/64C Standard Extension (Quadrant 1) ***
 addi              000 .  .....  ..... 01 @ci
 addi              010 .  .....  ..... 01 @c_li
@@ -111,6 +121,15 @@ jal               101     ........... 01 @cj    rd=0  # C.J
 beq               110  ... ...  ..... 01 @cb_z
 bne               111  ... ...  ..... 01 @cb_z
 
+# *** RV64C and RV32C specific Standard Extension (Quadrant 1) ***
+{
+  c64_illegal     001 -  00000  ----- 01 # c.addiw, RES rd=0
+  addiw           001 .  .....  ..... 01 @ci
+  jal             001     ........... 01 @cj    rd=1  # C.JAL
+}
+subw              100 1 11 ... 00 ... 01 @cs_2
+addw              100 1 11 ... 01 ... 01 @cs_2
+
 # *** RV32/64C Standard Extension (Quadrant 2) ***
 slli              000 .  .....  ..... 10 @c_shift2
 fld               001 .  .....  ..... 10 @c_ldsp
@@ -130,3 +149,14 @@ fld               001 .  .....  ..... 10 @c_ldsp
 }
 fsd               101   ......  ..... 10 @c_sdsp
 sw                110 .  .....  ..... 10 @c_swsp
+
+# *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
+{
+  c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
+  ld              011 .  .....  ..... 10 @c_ldsp
+  flw             011 .  .....  ..... 10 @c_lwsp
+}
+{
+  sd              111 .  .....  ..... 10 @c_sdsp
+  fsw             111 .  .....  ..... 10 @c_swsp
+}
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 1340676209..bd93f634cf 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -24,6 +24,12 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
     return true;
 }
 
+static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
+{
+     REQUIRE_64BIT(ctx);
+     return trans_illegal(ctx, a);
+}
+
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 24bf049164..af6c3416b7 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,18 +1,13 @@
 # FIXME extra_args should accept files()
 dir = meson.current_source_dir()
-gen32 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-32.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
-  decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
-]
 
-gen64 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-64.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
+gen = [
+  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
 ]
 
 riscv_ss = ss.source_set()
-riscv_ss.add(when: 'TARGET_RISCV32', if_true: gen32)
-riscv_ss.add(when: 'TARGET_RISCV64', if_true: gen64)
+riscv_ss.add(gen)
 riscv_ss.add(files(
   'cpu.c',
   'cpu_helper.c',
-- 
2.31.1


