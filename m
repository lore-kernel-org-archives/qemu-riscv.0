Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYj-0007vl-Ku
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYh-0007sY-P0
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYG-0005m8-PP
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 r21-20020a17090aa09500b0024663a79050so1796684pjp.4
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1FKEPnLDJAj/yYVllIJiIXirCKiRcnvS7tDELskOLA=;
 b=DHujcaH32y4Zna1dz1MkOyyv60Bg2NPIiAmQwTOSqaG7Pxbg7U1TjILh0iD0xt5Y5x
 cEwwRReqyIEt3rgWzw0iPhMEpb1LgSQp9mflVoRvY9j0B8M13zv6ZQWdJEG33UWE0y9A
 yGniyV8PORKD8TKFNhr5ZDQWE2IhFTQVH8u10+17MDdIYTI8it2l6eb5j4rqgAjidndq
 mSNnOwiMhL77omghATzozmADNTa6pMYIoaClcmVlxgWhByDTlMfB056P2LHxk0SlsD6O
 WigdbRwFa5+poGkgSvne7Rx6ulDwQfbmzz1s2xHI8smtaAnMBFVe+Q6iUJfEs/SDf0cK
 tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1FKEPnLDJAj/yYVllIJiIXirCKiRcnvS7tDELskOLA=;
 b=AbyekLaQ7N+zYptBDgpyZ/1huJ3puDNmLcjPZDBjMexrx+em+5mx+6Ao6VwAWKfpLC
 yCJUMLPgPh1aFt9PS2eCgZUaETYRW37PEZrM4rYOPSh5K3ffbjontV9XYa8FZVTaL3kC
 bf6RAfc3hec8g2SYVr3KIoZUW1gO/tEb7k1BUpA5djGAmU5l4SWKCYdzhv1fBG3DGI+E
 FWRhaylsbys0mhW8O3zXRwb69dEchQD8Af7x/nqGgZFb61cdWXhp9aMnIz/7ZVAl0wu2
 RIS45LwstwourSO8Y1aQZ62L+VwUzkR6Ts3kt+z1oW6KotuO9+O0aPsaECx0lfntK4VQ
 3caQ==
X-Gm-Message-State: AAQBX9fQ3pgUuch07GnuxpKSaImkzuHe3gLD9RzfQ58gnSszT8kCSh/0
 mmjMOnwdqYczalsYFkvE6XONhA==
X-Google-Smtp-Source: AKy350an2vdxuMoVx8+aJxwgsk/mHnxgVuYN2zCC151wngoMwdnzsZjt/zYFhXxxunHxmqF8yXBbcA==
X-Received: by 2002:a17:902:da8a:b0:1a0:5524:eb8e with SMTP id
 j10-20020a170902da8a00b001a05524eb8emr5964539plx.68.1680921819421; 
 Fri, 07 Apr 2023 19:43:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 26/42] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Fri,  7 Apr 2023 19:42:58 -0700
Message-Id: <20230408024314.3357414-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:08 -0000

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b399798664..77dcdd7c0f 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1770,13 +1770,14 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg data, TCGReg addr,
+                                TCGType type, TCGReg data, TCGReg addr,
                                 tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = data;
     label->addrlo_reg = addr;
     label->raddr = tcg_splitwx_to_rx(raddr);
@@ -1900,7 +1901,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, 1, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -1931,7 +1933,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1947,7 +1949,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, 0, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -2307,13 +2310,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        /* ??? Technically we can use a non-extending instruction.  */
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I32);
+        break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args[0], args[1], args[2]);
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I32);
+        break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args[0], args[1], args[2]);
+        tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld16s_i64:
-- 
2.34.1


