Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la94A-0008OH-BI
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la945-0008Mg-M0; Fri, 23 Apr 2021 23:34:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la941-0004BP-0L; Fri, 23 Apr 2021 23:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619235277; x=1650771277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lGDTyAhY8hezdUtJCTKLTSQi2mnrxTyltB8vZ0V1nks=;
 b=GAFABxgiIqd7kgqIgSyPTG5cQZkfIw2eqz83ytOzOkN5AmnSIlNNw2hj
 loMHPufqYiDhGnHDNrIg3vRZdiaHk+cCsKf1SKgejEEGBZufX13FtOWtd
 n9cG8/4iL7OP9CbmpgZkoO2atWZcS4bCoiFu9fuszB8BAb54pAlee6fn5
 lHPYEFfkBy5vTjt0u+VAAZylW8Xsm1KgumSujY7h9ASX78itVOqEQxMTV
 CYRY8TdMlPygCvp/3rdx8sKQJh6PFkS2kkeY/ismvO1OZgGStXv3OkoQ0
 dUU9ZmbENP6HBQZoe6iGU4MhPrewkxQvf3k0hblSM6NmS/dWcdYyxdTYi A==;
IronPort-SDR: GNk1WYHAWDa1pSzCBySloJ4w/+KhYopEV2PpXvytKVQdoYqPM5abFNb09jkVegfvWDSlfMi+80
 18Je/ok4TIyb4avOXD+Oq1BYdCf7uGctV6AwZcieZ1aRIi6hzMJVZADyFC2WrrNb48gtCjJ8wl
 Sib69bVDFTRlQ14rzW85JIP9DSlA6nR/EMqpD9wxmRxEYNxgFqhiWJ3YeAjiLH+kYMFHBJxkyr
 r86ZXfqddLi6yvApY8pOZUE5etgFfwoTvBsCvXCD5fecbicIeUWMKu9OaMLBh5NfJ2CvAMp1tZ
 tXM=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="277100858"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:34:34 +0800
IronPort-SDR: jFG45jphT9e1ojCzBg1mRN21WFCGSYdf2UQbPmXxEcSgXg7IU1fsfSTdTCXcmROJhfd5QM6Eor
 rpq89OFrMgb1dvDLvhG39i0kryQfsowuQXJsDw/uH2ap6XPkuz1v7i0iujaCK2xSjDZXcBdMzs
 26OX0OS8OHbGTxnYF3s37vOzEH3xZklll/ym7O7EgOhJ08HdmnxjNfOReZm9txnIPm5/ikuriw
 7hae9ngSNeTAkHq1ToHf5PKNL2Upi4BjWXy5nwYvl9W1wyZ+7CpwOiRwELN05a25N4ecE9pfId
 D+LO1ueHFa5GG/lWixVEAdU4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:15:07 -0700
IronPort-SDR: 6c3Zz/8h1Vxo2QnKC1YjtXjKK824KHy23oX4Ts4NxcppxvApi2EJefZmKhssOLISsH6h3Q2toW
 /XC6inQYl8ScISabKI4DYXCjd9u4OZRZruLfUgRsq0cBQPjCrA7sODyQiVuhiZswOjMnhSrSh0
 UXOES5yHxI0aQqzROr9a8jvzJbToHt0hs1iaOM+MkZfFL1dv4UrKN+8++8bMVh2WLwX3xxheRT
 HXCw7l1hXYjEr9B4Qg5vSMP7S/sfZ4lPJ0NHkWobKM244bSe7OTeCvb6vZEPYqiqtGzKBd5jdz
 sas=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Apr 2021 20:34:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 09/10] target/riscv: Consolidate RV32/64 16-bit instructions
Date: Sat, 24 Apr 2021 13:34:25 +1000
Message-Id: <01e2b0efeae311adc7ebf133c2cde6a7a37224d7.1619234854.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Sat, 24 Apr 2021 03:34:44 -0000

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


