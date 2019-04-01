Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnN7-0006v5-3R
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnN3-0006qh-CR
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnN1-0002tE-VP
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:25 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnN1-0002sp-K1
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:23 -0400
Received: by mail-pg1-x544.google.com with SMTP id j26so3990927pgl.5
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zVkrbUuoiJ5PF3J+0B4MA51B6b0CZ7ZDOOl2e2CcX9k=;
	b=EOzREzVpmWT1ChQv4qBhettpX7mpR19ncOTqVc1UDhHYOcdAZP1Sxr0hkGDJOO+pIR
	skiAOBShJ1CUAsDxL0HWPXArY9kC3NRpOJDG/d0zpxEwIJ89/2SR3ZhMRMqGW7RD4mbU
	0FIJPWcsnapGVsH+cvlF4qScw1ONgrDdvOVCG1v2H58ULubNAw4ZyekXU+Gcca9Vk8Wm
	kyHP0h0eGCgGY+KDj2a7x64cT+lFIDzKZeoW6dVi5ACyJVsD5NKwJqdoBxQ3njqO+XLL
	Qk1bAtJUa8LPU9+ZMidaufCXHW0ms1lv+x06U6capxR4wiM8++ECCzOqCsQKT2CflgrN
	XATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zVkrbUuoiJ5PF3J+0B4MA51B6b0CZ7ZDOOl2e2CcX9k=;
	b=ty18g0TMqWczsSUARURRlAiNIKRCZsRmCYft8jX3P9dvs0brus8pviUvljY7yeCaCO
	whclijMLhHoE25hK9LAwU46Z0Dk46y4r9CZNN8q/lEyZhwvTXQYYmrg3sbNlYFwZoW9j
	/GNg7v7O0Z4yyb5z6z23zzIJ8Z8EF5jch5BTQgrZrl93nviPXZihD+fxXAFec/643G6z
	/Ntk9uj2TlOBzlCBsMso7DcHpPtEBxCQEhqV7Ssho+8Q5lVnXHWlSohPFPJriGD1Xbws
	HuEfpZ4KQE7EjEkPSqHlxPhMPu3gsOa0srzsKF50InEyewchlhCEJ6dABuN8MPK3bFAm
	gHmQ==
X-Gm-Message-State: APjAAAVJbZnPKw6zwZmNWfLrNZlTxsXsDi2fqZKC3pZeuoBRp1Bs7bRB
	gQ2TAvFQfXjM2TeqYeLm+N7RgQ==
X-Google-Smtp-Source: APXvYqyzhRH1XqCEtig9HPfxq+2X/Cc+ucNc3KpsB2yWvjl/yZmadZbCZCWhTFaquJ1p1JGNiYO2ww==
X-Received: by 2002:a63:4144:: with SMTP id o65mr58722809pga.241.1554088342732;
	Sun, 31 Mar 2019 20:12:22 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:52 +0700
Message-Id: <20190401031155.21293-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-riscv] [PATCH for-4.1 5/8] target/riscv: Use pattern groups
 in insn16.decode
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 03:12:27 -0000

This eliminates about half of the complicated decode
bits within insn_trans/trans_rvc.inc.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvc.inc.c | 63 -------------------------
 target/riscv/insn_trans/trans_rvi.inc.c |  6 +++
 target/riscv/insn16.decode              | 29 +++++++++---
 3 files changed, 29 insertions(+), 69 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
index 691b1e2725..43bff97f66 100644
--- a/target/riscv/insn_trans/trans_rvc.inc.c
+++ b/target/riscv/insn_trans/trans_rvc.inc.c
@@ -18,16 +18,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static bool trans_c_addi4spn(DisasContext *ctx, arg_c_addi4spn *a)
-{
-    if (a->nzuimm == 0) {
-        /* Reserved in ISA */
-        return false;
-    }
-    arg_addi arg = { .rd = a->rd, .rs1 = 2, .imm = a->nzuimm };
-    return trans_addi(ctx, &arg);
-}
-
 static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
 {
 #ifdef TARGET_RISCV32
@@ -79,25 +69,6 @@ static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
 #endif
 }
 
-static bool trans_c_addi16sp_lui(DisasContext *ctx, arg_c_addi16sp_lui *a)
-{
-    if (a->rd == 2) {
-        /* C.ADDI16SP */
-        arg_addi arg = { .rd = 2, .rs1 = 2, .imm = a->imm_addi16sp };
-        return trans_addi(ctx, &arg);
-    } else if (a->imm_lui != 0) {
-        /* C.LUI */
-        if (a->rd == 0) {
-            /* Hint: insn is valid but does not affect state */
-            return true;
-        }
-        arg_lui arg = { .rd = a->rd, .imm = a->imm_lui };
-        return trans_lui(ctx, &arg);
-    }
-    return false;
-}
-
-
 static bool trans_c_subw(DisasContext *ctx, arg_c_subw *a)
 {
 #ifdef TARGET_RISCV64
@@ -130,40 +101,6 @@ static bool trans_c_flwsp_ldsp(DisasContext *ctx, arg_c_flwsp_ldsp *a)
     return false;
 }
 
-static bool trans_c_jr_mv(DisasContext *ctx, arg_c_jr_mv *a)
-{
-    if (a->rd != 0 && a->rs2 == 0) {
-        /* C.JR */
-        arg_jalr arg = { .rd = 0, .rs1 = a->rd, .imm = 0 };
-        return trans_jalr(ctx, &arg);
-    } else if (a->rd != 0 && a->rs2 != 0) {
-        /* C.MV */
-        arg_add arg = { .rd = a->rd, .rs1 = 0, .rs2 = a->rs2 };
-        return trans_add(ctx, &arg);
-    }
-    return false;
-}
-
-static bool trans_c_ebreak_jalr_add(DisasContext *ctx, arg_c_ebreak_jalr_add *a)
-{
-    if (a->rd == 0 && a->rs2 == 0) {
-        /* C.EBREAK */
-        arg_ebreak arg = { };
-        return trans_ebreak(ctx, &arg);
-    } else if (a->rd != 0) {
-        if (a->rs2 == 0) {
-            /* C.JALR */
-            arg_jalr arg = { .rd = 1, .rs1 = a->rd, .imm = 0 };
-            return trans_jalr(ctx, &arg);
-        } else {
-            /* C.ADD */
-            arg_add arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
-            return trans_add(ctx, &arg);
-        }
-    }
-    return false;
-}
-
 static bool trans_c_fswsp_sdsp(DisasContext *ctx, arg_c_fswsp_sdsp *a)
 {
 #ifdef TARGET_RISCV32
diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index d420a4d8b2..caf91f9a05 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -18,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+static bool trans_illegal(DisasContext *ctx, arg_empty *a)
+{
+    gen_exception_illegal(ctx);
+    return true;
+}
+
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index add9cf3923..3c79edf1c9 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -70,7 +70,6 @@
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
 @ci        ... . ..... .....  .. &i      imm=%imm_ci      rs1=%rd     %rd
-@ciw       ...   ........ ... .. &ciw    nzuimm=%nzuimm_ciw           rd=%rs2_3
 @cl_d      ... ... ... .. ... .. &i      imm=%uimm_cl_d   rs1=%rs1_3  rd=%rs2_3
 @cl_w      ... ... ... .. ... .. &i      imm=%uimm_cl_w   rs1=%rs1_3  rd=%rs2_3
 @cl        ... ... ... .. ... .. &cl                      rs1=%rs1_3  rd=%rs2_3
@@ -86,8 +85,12 @@
 @c_sdsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sd rs1=2 rs2=%rs2_5
 @c_swsp    ... . .....  ..... .. &s      imm=%uimm_6bit_sw rs1=2 rs2=%rs2_5
 @c_li      ... . .....  ..... .. &i      imm=%imm_ci rs1=0 %rd
+@c_lui     ... . .....  ..... .. &u      imm=%imm_lui %rd
+@c_jalr    ... . .....  ..... .. &i      imm=0 rs1=%rd
+@c_mv      ... . ..... .....  .. &i      imm=0 rs1=%rs2_5 %rd
 
-@c_addi16sp_lui ... .  ..... ..... .. &caddi16sp_lui %imm_lui %imm_addi16sp %rd
+@c_addi4spn     ... .  ..... ..... .. &i imm=%nzuimm_ciw rs1=2 rd=%rs2_3
+@c_addi16sp     ... .  ..... ..... .. &i imm=%imm_addi16sp rs1=2 rd=2
 @c_flwsp_ldsp   ... .  ..... ..... .. &cflwsp_ldsp uimm_flwsp=%uimm_6bit_lw \
     uimm_ldsp=%uimm_6bit_ld %rd
 @c_fswsp_sdsp   ... .  ..... ..... .. &cfswsp_sdsp uimm_fswsp=%uimm_6bit_sw \
@@ -101,7 +104,11 @@
 @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
 
 # *** RV64C Standard Extension (Quadrant 0) ***
-c_addi4spn        000    ........ ... 00 @ciw
+{
+  # Opcode of all zeros is illegal; rd != 0, nzuimm == 0 is reserved.
+  illegal         000  000 000 00 --- 00
+  addi            000  ... ... .. ... 00 @c_addi4spn
+}
 fld               001  ... ... .. ... 00 @cl_d
 lw                010  ... ... .. ... 00 @cl_w
 c_flw_ld          011  --- ... -- ... 00 @cl    #Note: Must parse uimm manually
@@ -113,7 +120,10 @@ c_fsw_sd          111  --- ... -- ... 00 @cs    #Note: Must parse uimm manually
 addi              000 .  .....  ..... 01 @ci
 c_jal_addiw       001 .  .....  ..... 01 @ci #Note: parse rd and/or imm manually
 addi              010 .  .....  ..... 01 @c_li
-c_addi16sp_lui    011 .  .....  ..... 01 @c_addi16sp_lui # shares opc with C.LUI
+{
+  addi            011 .  00010  ..... 01 @c_addi16sp
+  lui             011 .  .....  ..... 01 @c_lui
+}
 srli              100 . 00 ...  ..... 01 @c_shift
 srai              100 . 01 ...  ..... 01 @c_shift
 andi              100 . 10 ...  ..... 01 @c_andi
@@ -132,8 +142,15 @@ slli              000 .  .....  ..... 10 @c_shift2
 fld               001 .  .....  ..... 10 @c_ldsp
 lw                010 .  .....  ..... 10 @c_lwsp
 c_flwsp_ldsp      011 .  .....  ..... 10 @c_flwsp_ldsp #C.LDSP:RV64;C.FLWSP:RV32
-c_jr_mv           100 0  .....  ..... 10 @cr
-c_ebreak_jalr_add 100 1  .....  ..... 10 @cr
+{
+  jalr            100 0  .....  00000 10 @c_jalr rd=0  # C.JR
+  addi            100 0  .....  ..... 10 @c_mv
+}
+{
+  ebreak          100 1  00000  00000 10
+  jalr            100 1  .....  00000 10 @c_jalr rd=1  # C.JALR
+  add             100 1  .....  ..... 10 @cr
+}
 fsd               101   ......  ..... 10 @c_sdsp
 sw                110 .  .....  ..... 10 @c_swsp
 c_fswsp_sdsp      111 .  .....  ..... 10 @c_fswsp_sdsp #C.SDSP:RV64;C.FSWSP:RV32
-- 
2.17.1


