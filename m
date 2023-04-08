Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYg-0007pC-2e
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYe-0007nC-1e
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYE-0005k2-4Y
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:03 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso9062853pjc.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HILSA4FGaRdNKn9uDo5A96FpFkUHaWEI+nrm0ay0YIU=;
 b=T8Sfhn0B336VqWRI8Cj7nE2BiBs7knfZv18eWruZ5znf0s5mJ2WLjMrbraAjXi8Pxd
 y9lmdTvPxNCui/aN3MGkzR9Ovs6GSsx/7dJpXlCWEUJ06AW2eTHVw0C8FcSgNF3cGUAB
 uWRLtjFkBysuUBswyru4Jj3/k/WBSpo356U77eM0gCfxB5FcRUg659zhTxasKp0ktLbb
 aeC2HReS2c8VF3NO9j7F7/ByGegNBIDGkIRqxvE/i+V5j6uHrIeE+CVZ5QCmHjVqjAYa
 MBs+5fnXHnnmQM1orRxEsfSIRs54wP9GD1314IeHViMcWCpaC/pPja50CfWOq0LvO1Zn
 BMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HILSA4FGaRdNKn9uDo5A96FpFkUHaWEI+nrm0ay0YIU=;
 b=bJk9HVPngeyn+Wmr8gybMPda+Z39TArIEQK97Ah6jkQMqUR9w1M4315RSDTNDpbSmT
 voxW5nVGO53IL5b9nvZLMbK/6lvqWm4Ay2NgN1oa2ffg0IXDlya/MNq8zMduD4tK8hwi
 w1DbUS9zCX4AH1/jQpwjRzDMWwGV7pJK/I2hMHx6fmQzbG3J0ql/nHFBuzHUGtUVwD7t
 W5O9j0H1cefsribSxek1oVmmb+gAq8HFlpdkF/eJ0dHtK9KrD0HzKi28DdVLbmD8mbIi
 rEBQyYw4DT/vuKjM7hbj42Q0tT2oLeHRwtAs8i31971s2rnnkOY4GZ6qs/AOZ0iS2pHO
 Ul5Q==
X-Gm-Message-State: AAQBX9c+1EU6amVad7SDctiH9sDmv1NS4to+Z54qzlUyv6wKvYYWYboc
 6lZQQq+9xtXsV2aMjGg9Pzdn3w==
X-Google-Smtp-Source: AKy350Y8kc/xv/qfi5xW9l5zh0E5CuU5+zjtfnXJOYxpyNXQVf7B9SMHV2dShYDqMEcPYU6fQQZ2qQ==
X-Received: by 2002:a17:903:230b:b0:1a1:b5e3:7db4 with SMTP id
 d11-20020a170903230b00b001a1b5e37db4mr5202003plh.18.1680921816698; 
 Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 23/42] tcg/arm: Use TCGType not bool is_64 in tcg_out_qemu_{ld, st}
Date: Fri,  7 Apr 2023 19:42:55 -0700
Message-Id: <20230408024314.3357414-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:04 -0000

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index bad1e6d399..9bf831223a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1526,15 +1526,17 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 /* Record the context of a call to the out of line helper code for the slow
    path for a load or store, so that we can later generate the correct
    helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg datalo, TCGReg datahi, TCGReg addrlo,
-                                TCGReg addrhi, tcg_insn_unit *raddr,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGType type,
+                                MemOpIdx oi, TCGReg datalo, TCGReg datahi,
+                                TCGReg addrlo, TCGReg addrhi,
+                                tcg_insn_unit *raddr,
                                 tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -1788,7 +1790,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
     MemOpIdx oi;
@@ -1802,7 +1804,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
+    datahi = (d_type == TCG_TYPE_I32 ? 0 : *args++);
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
     oi = *args++;
@@ -1819,7 +1821,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
     tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
-    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, oi, d_type, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
@@ -1910,7 +1912,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
 }
 #endif
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
     MemOpIdx oi;
@@ -1924,7 +1926,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (is64 ? *args++ : 0);
+    datahi = (d_type == TCG_TYPE_I32 ? 0 : *args++);
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
     oi = *args++;
@@ -1941,7 +1943,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, oi, d_type, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     a_bits = get_alignment_bits(opc);
@@ -2237,16 +2239,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, 0);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     case INDEX_op_bswap16_i32:
-- 
2.34.1


