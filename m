Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYe-0007nW-Df
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYb-0007jW-DO
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYC-0005iy-KE
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id ji2so1766740plb.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+sskExgwdL7kNpVsak9SGGYO2z60XgotlxGnsJ8eQ4=;
 b=NMg+zWyTpPnkv92xpy0TqsMuGsnq389StBGMoJoeS6T6KNlye/fDUkgTavsroY39TD
 A62SNHueP0v7lyRqAFEbUNTfIpta5S33ghZcF63820J5W0frNqRiZV4SEzC4OiGXpKas
 Oaf9wPpFwB2YaiMZMCqa0oKvavvyvgX3FEhZPToI5fGLKIIqRdq1YpzJuZs1qD7GTZTs
 z0QSARu+3rw422oa0wiuclLHysBH3AW7Qohp6WGl+nDKAmR8/6j0WhwjDimHiAQGyEoW
 59xSWHLd1svgnao9scC/kX6VYid34lI9NhOtpD2SwOwrlm8d+k48UIYjR9sXHolcBbJ6
 WUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+sskExgwdL7kNpVsak9SGGYO2z60XgotlxGnsJ8eQ4=;
 b=vcfVp4docmkEknyw4vWF3LYyB6iP6mH04KVEQVwrHu/8Okmr5crsXv17AAJdfw5cjd
 GdEvc3Au6A+CkAt7Cyo7lh+Dqr2JC4FoZow+I4PyOXXnwU8LANtyrMmDgTaMYZOrlBFv
 bV7pYiCCidw2iCWKEFJh5TFiZcXoS39HFHSG7qzySmkHsNYQjQsD1pQop2a8JvRTc1be
 eDp5BZd13N4ud+ZDUVAkb9+08nm/3bC3fDsEHesjfu5UXRiRO5WMFfszb20Bd38WlHPF
 fcKAWKUCnfbOAzRS7mU34yN4Gz6LQlD/PKMKh9HreHzTmT4Ek+F7VNTPdBeKPdMZpHBf
 IHsQ==
X-Gm-Message-State: AAQBX9dqtndqGEFrHuPR+mAns90GbNsdwiDpGOWEj8idU1YbQIeEdOGn
 rlWwkMRSQ1dweCJirzA/Xje/3w==
X-Google-Smtp-Source: AKy350awwjSiY8RSX2bTqCLvdx6e895lge41ckLsI/hcWe/6IeIXLY3F5D8VrmG65dlKWQTtItz7bA==
X-Received: by 2002:a17:902:d4c5:b0:1a5:1471:e397 with SMTP id
 o5-20020a170902d4c500b001a51471e397mr5209765plg.61.1680921815138; 
 Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 21/42] tcg/aarch64: Rename ext to d_type in tcg_out_qemu_ld
Date: Fri,  7 Apr 2023 19:42:53 -0700
Message-Id: <20230408024314.3357414-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:01 -0000

The new name is slightly more descritive as "data type",
where "extend", despite the c type, sounds like a bool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ec3cf3172..40122e1471 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1851,7 +1851,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 }
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi, TCGType ext)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
@@ -1864,9 +1864,9 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
-    tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+    tcg_out_qemu_ld_direct(s, memop, d_type, data_reg,
                            TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
+    add_qemu_ldst_label(s, true, oi, d_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
@@ -1874,10 +1874,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, d_type, data_reg,
                                TCG_REG_GUEST_BASE, otype, addr_reg);
     } else {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, d_type, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
-- 
2.34.1


