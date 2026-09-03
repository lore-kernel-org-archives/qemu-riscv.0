Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877F9C61DD3
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 17:05:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2AsI-0003QP-B6; Thu, 03 Sep 2026 13:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2AsG-0003QB-EZ
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:05:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x2ArJ-0004zC-LK
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:05:16 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-cbedf433a99so161304a12.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788455056; x=1789059856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kWbk6bJ4gzcYZbDe8UfozS5vSTG9P9yfPb8F48deIsI=;
 b=Z8iZf2yf2W+/Cjaw9+MqT8xGv7DIH28kVDDoJidNLWc5/utn9FggrUPfAEjhEOb+4s
 IxIf6EJprb88HXv/modWuYM2XwR1p6n6BcXKsBohmQ2WPLi8VudyTyDrwUcupYgWn6Jc
 CofD83gtWC3P7VUODXEgcZSsw9fW4xllYVor3e6P4tpQMB8kQplPu5BhLBo+HvmVJBE6
 mZUGa8hcqmvT+5GXMC5d0qICx/Rt7owN5n5gtjUjYSOlxL7aLT6NzbfbOPBVrVgQx8qh
 YzXQGJxztBbQ+9/0MmSmHedpAUHpgOtF4eUYoyK2bHtTnXWP0KkMsDT2BAWAsVdT4FoD
 2Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788455056; x=1789059856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kWbk6bJ4gzcYZbDe8UfozS5vSTG9P9yfPb8F48deIsI=;
 b=EsbPlhb3Odt81deXiklDq/DM6Lo3UuEB3fkeQwsH+o4ogyyhgP0hJIp4Qws6+kfSTV
 LA2QoF9DL6dt26UuMryC9/f8111yW7bKmNHd7Ta+VuasViR/X/gOdP0adGM22jBh5wZe
 AZzNFW5l4ysd/VKGtZI4l+QRUdbyFGhkmTMbiSibI/r3qDr2Am/H4GbsVNs37ni1ngmY
 TSXBY0ZcRqCo3fPXSIXEZJCu4pUKyoH0y23zNvJGad6S9r8FMEeWR08/yOczMYs9Dbl6
 EkTpobNGPoNYbF9Bo4J78cIe3iK4A0GHaZUAY+RDgblp0lM7pmjrpVp88kHFgGigQdAt
 M3pw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx7qs5v/s7RyTRbsSbcBEbaEPmVpx4m1P6ImOURXUXrewwkEjHueRMUeI5sk10J+NitW8guJhNaR+4j@nongnu.org
X-Gm-Message-State: AFuF++ljoQE0hX4kFYv2vfc/UVX2CbDK0bf6nA1yLz0nnvq0baB/piQU
 7wNwgw2EQaX91QNIPmDyuUGnckBIUgH8Vp/k36rd2wjgo6d4lkVduXaMqY35RYV1P2c=
X-Gm-Gg: AYBFou3QXu9op9G5JsdYrbl3AVeblyym0eaUJta/HZHPvLKiTLadaXZfTlir+LYtg41
 VFJZ2uLjC6+cQxOoH0UXQmsPTFlLej27Df+FnQ21rJkjJ+Vhw8gO768QqV8YZaImoUSZVGP0DeK
 w7QdCyWogZSz4O4vnecYcShL6j/70edqlaEIpJBXKrnB4zCgZWgGBdhRH+vAI4Q/cEAUCcwkkqD
 39XCNw0q2UutnWKuGQf+EpDWj6SIsnzJeO2Hbk/aVpGpGl8vKnWDgRxbST7Mt4jHdypkNVaRjba
 NdYgzpjGf91bpLSIOfL2svbmQwybfMfw9Rb8T92VMaUxMzD7bEhUy0G9fE8tJ2kQMRzV2ulmIm1
 vkvyAJFPbSp5hkn0sCFCGDdDy5xaijnVclufEc7O83RSXHv0jFzZJ1qUCkbG+ZtOIiGfWTblZVZ
 FH8+cqfk+ucAqP4ie2Y9b+yO1T0XcsWsXyRvwWDomE3eFWnSkHN81g2aYTX6IUdLBiTeiXsjmQQ
 J3Tz4is8Aga7w05laui9IhyyRYOMKhik4ufYg78AXq4Dnc5wDub+FTLVbpn/t0=
X-Received: by 2002:a05:6a21:a4c2:b0:3d0:d0ed:f141 with SMTP id
 adf61e73a8af0-3da35d4c9b2mr2068876637.2.1788455056114; 
 Thu, 03 Sep 2026 10:04:16 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc43d39e4ddsm1227860a12.5.2026.09.03.10.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 10:04:15 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH 2/2] tcg/riscv64: Fall back when AUIPC pairs are out of range
Date: Fri,  4 Sep 2026 01:04:05 +0800
Message-ID: <20260903170405.3632015-3-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903170405.3632015-1-max.chou@sifive.com>
References: <20260903170405.3632015-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

tcg_out_movi and tcg_out_call_int only check whether a
PC-relative displacement is signed 32-bit before emitting an AUIPC
pair. This does not account for rounding the signed 12-bit immediate,
which can require an unencodable positive 0x80000000 AUIPC contribution.

Validate the split and emit the pair only when it fits. Otherwise,
tcg_out_movi keeps its existing full-address materialization and
tcg_out_call_int uses its existing indirect far-call sequence.

Fixes: dfa8e74f9463 ("tcg/riscv: Add the relocation functions")
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tcg/riscv64/tcg-target.c.inc | 43 +++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 1c41f8ffade..12efb44c3d7 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -667,6 +667,21 @@ static bool reloc_call(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
     return false;
 }
 
+static bool tcg_out_auipc_pair(TCGContext *s, const tcg_insn_unit *target,
+                               RISCVInsn opc, TCGReg base,
+                               TCGReg rd, TCGReg rs1)
+{
+    intptr_t hi, lo;
+
+    if (!split_auipc_offset(s->code_ptr, target, &hi, &lo)) {
+        return false;
+    }
+    tcg_out_opc_upper(s, OPC_AUIPC, base, hi);
+    tcg_out_opc_imm(s, opc, rd, rs1, lo);
+
+    return true;
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -803,7 +818,8 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
                          tcg_target_long val)
 {
     tcg_target_long lo, hi, tmp;
-    int shift, ret;
+    int shift;
+    bool ret;
 
     if (type == TCG_TYPE_I32) {
         val = (int32_t)val;
@@ -824,12 +840,9 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
         return;
     }
 
-    tmp = tcg_pcrel_diff(s, (void *)val);
-    if (tmp == (int32_t)tmp) {
-        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
-        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
-        ret = reloc_call(s->code_ptr - 2, (const tcg_insn_unit *)val);
-        tcg_debug_assert(ret == true);
+    ret = tcg_out_auipc_pair(s, (const tcg_insn_unit *)val, OPC_ADDI, rd, rd,
+                             rd);
+    if (ret) {
         return;
     }
 
@@ -1583,7 +1596,7 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
     TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
     ptrdiff_t offset = tcg_pcrel_diff(s, arg);
-    int ret;
+    bool ret;
 
     init_setting_vtype(s);
 
@@ -1591,14 +1604,14 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     if (offset == sextreg(offset, 0, 20)) {
         /* short jump: -2097150 to 2097152 */
         tcg_out_opc_jump(s, OPC_JAL, link, offset);
-    } else if (offset == (int32_t)offset) {
-        /* long jump: -2147483646 to 2147483648 */
-        tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
-        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
-        ret = reloc_call(s->code_ptr - 2, arg);
-        tcg_debug_assert(ret == true);
     } else {
-        /* far jump: 64-bit */
+        ret = tcg_out_auipc_pair(s, arg, OPC_JALR, TCG_REG_TMP0, link,
+                                 TCG_REG_TMP0);
+        if (ret) {
+            return;
+        }
+
+        /* Far jump: 64-bit. */
         tcg_target_long imm = sextreg((tcg_target_long)arg, 0, 12);
         tcg_target_long base = (tcg_target_long)arg - imm;
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
-- 
2.43.7


