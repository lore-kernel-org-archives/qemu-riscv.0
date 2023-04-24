Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoxK-0005UR-OC
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox5-0005Jh-9L
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowr-0004GW-Ke
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so2312859f8f.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrJzjH8IZNJFUh651D62ccr1sIbRumHAtxHaJjoHMgY=;
 b=c85MFEtHFsWLIv+UlVFh5F6GA6w/hwnShW05tlZT+8XoQNQbzuQfASnbbalo83pLAf
 Ih5tXA4h5ObhOxSZrUXqZFbvEuXn0K6IRcnuOFBfHEThOfRtBFhmQSrytGztXJZGMJ9+
 N538PvO/7Bvo2Luldu1epSsRhf1HmPwQhRfTMSb/5MzhzXHYRuZlzE5XwNG2E6T3EdrJ
 aBkoZn1fIZ0YE+tu1KQMljBMIruZ8iCgLz8vHrnxXc2BrsT68hG8OH8r1fe8A/GPJleP
 6qzFgoTGIs4JGjDj78bvyxBvOJP9pBXbxNjbJJuzVGQw2NSYqqAO/7K5haN838iqmeVM
 BUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrJzjH8IZNJFUh651D62ccr1sIbRumHAtxHaJjoHMgY=;
 b=EdVYLNL6jKJN+OTtH8SWYJi+sGeCzLnP3r00uJ8Fo7tWcmKHK2k67s1Dy23/lPV0Xo
 2U7xA9IEsq0UZHGB6287V5j0TsNNpOjFudQYOnObjGGXW7hzojhNZ3VDQxD3fcZFNZrc
 6QUI3A9r3urVhsuPSdLLykoqpH0DaBy3VQ9k4+Jyg5I4/Xp1xnImdb3tDaG8LeHiYK3b
 z26TBndPGCddmXjl/Cjte67WXD1QdJVQlsi24zeDX0fwmreQe6bR638j/zWI9yz1/nLw
 SOZ+htWhkNsDWD3fOJCzpgaYLfPo+L+pzIAED2DHbiLkwQDPPPu6sN2srI7gCVMsSMM5
 tRbw==
X-Gm-Message-State: AAQBX9cN0+t0MH+Z4pEzvfT7XIklQt0GlQaG8GtTBbWvdnLxP4qMXt1V
 B7vPlt1KI+EawCK1OmYg9qPBcg==
X-Google-Smtp-Source: AKy350YZMXeI0pEPtT3uTarD5sW/7JF0wr29PmscpjKwbQCjaYzUfmZ+54BT1v4H1tY4xUcnorqSrw==
X-Received: by 2002:a5d:6445:0:b0:2ff:3f47:1e99 with SMTP id
 d5-20020a5d6445000000b002ff3f471e99mr8412256wrw.41.1682314870982; 
 Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 08/57] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Date: Mon, 24 Apr 2023 06:40:16 +0100
Message-Id: <20230424054105.1579315-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:27 -0000

Use TCG_REG_L[01] constants directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b6750c364a..7a02f79f1b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1812,8 +1812,6 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
                                     int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
 {
-    const TCGReg r0 = TCG_REG_L0;
-    const TCGReg r1 = TCG_REG_L1;
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
@@ -1837,15 +1835,15 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
         }
     }
 
-    tcg_out_mov(s, tlbtype, r0, addrlo);
-    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, r0,
+    tcg_out_mov(s, tlbtype, TCG_REG_L0, addrlo);
+    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, TCG_REG_L0,
                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
 
-    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, r0, TCG_AREG0,
+    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, mask));
 
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r0, TCG_AREG0,
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, table));
 
@@ -1853,19 +1851,21 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
        copy the address and mask.  For lesser alignments, check that we don't
        cross pages for the complete access.  */
     if (a_bits >= s_bits) {
-        tcg_out_mov(s, ttype, r1, addrlo);
+        tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
-        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo, s_mask - a_mask);
+        tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
+                             addrlo, s_mask - a_mask);
     }
     tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tgen_arithi(s, ARITH_AND + trexw, r1, tlb_mask, 0);
+    tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
 
-    /* cmp 0(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw, r1, r0, which);
+    /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
+                         TCG_REG_L1, TCG_REG_L0, which);
 
     /* Prepare for both the fast path add of the tlb addend, and the slow
        path function argument setup.  */
-    tcg_out_mov(s, ttype, r1, addrlo);
+    tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
 
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1873,8 +1873,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     s->code_ptr += 4;
 
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(r0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
+        /* cmp 4(TCG_REG_L0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, which + 4);
 
         /* jne slow_path */
         tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1884,8 +1884,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /* TLB Hit.  */
 
-    /* add addend(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
+    /* add addend(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L1, TCG_REG_L0,
                          offsetof(CPUTLBEntry, addend));
 }
 
-- 
2.34.1


