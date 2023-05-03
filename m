Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Qp-0007UO-MD
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qn-0007Sj-Vr
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qg-0001fh-U2
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30639daee76so1062828f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097053; x=1685689053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
 b=gIciM5J03PdLz7MhEvap20sQyTL/otIv3RCAYdOHK3Co7Hf8IdxXkmy5HsfwaiGt33
 BhIAjoRLgrxHqozlUhi6emTsXAbhdVJpNgUuL90YAFIBTW6/OLPEMg8y+aHuYGWP4Fws
 maYzuihHHeNPaJoHLnyqgSAHJrlrnix2BvEh5J+BCBhTelbtp1NzpkoxpCudyZW/eyQU
 5jaExLa4Ii6BYdkgEdod3b1E5ieSjMsZcQp+/G5mAwEvlmF9C3VE03H6jqoJrceiK5nt
 BLwKMU7bP8+5fFPE5aI5WsyzS/MUISLT2LQB1ekDW5rwoaXxyHLu/6iQviVmutXCi2BJ
 fYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097053; x=1685689053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
 b=bEAPuoqzCWIdeUcEU2Tl09mwcFAF25P9m/DWgZF0vxPMwcesN1XN7gUpWiDjqDd7kO
 UBtjMHG7gJ998nCPLYK+UDQomhbsRH1OD1gnXHMjx/PoboynoaJnvXQh/lUccfUpZw61
 mVodNyQ4dXfCap9dTtqos0WVo/T9iUVxZVeMe6gNqUlr7/P6XL30ooqjm9g63rFn2sDf
 AxbA2llLr8+n1tA9vKP80s4YZju6r8UkLmOkb2R0v/atx1zmdyd/tud6MqQFyrLeOcvi
 wyGbQ42jh44gEOq6KEdnuLCKMKL+pcKQ7cnjeY6t1Qt8CyzpTFGagb877JsG35kZNCXv
 u31Q==
X-Gm-Message-State: AC+VfDwKX+s66cHSpWc902RMeHc+rUHu0Rslv+CrurRi78FkjbhM9UoF
 9QsblFuc//pFoik7fnDvoOl3tA==
X-Google-Smtp-Source: ACHHUZ5enEvDvrXQr3HwLXeof0FDfn5ZlSv62vkrjqzJTgmpH1HMTvKeBoqBSOBIXf5oJZwGvhv+bQ==
X-Received: by 2002:adf:dd52:0:b0:306:3bf0:f1ec with SMTP id
 u18-20020adfdd52000000b003063bf0f1ecmr1996327wrm.7.1683097053202; 
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 04/54] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Date: Wed,  3 May 2023 07:56:39 +0100
Message-Id: <20230503065729.1745843-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 06:57:42 -0000

Use TCG_REG_L[01] constants directly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 909eecd4a3..78160f453b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1810,8 +1810,6 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
                                     int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
 {
-    const TCGReg r0 = TCG_REG_L0;
-    const TCGReg r1 = TCG_REG_L1;
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
@@ -1835,15 +1833,15 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
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
 
@@ -1851,19 +1849,21 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
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
@@ -1871,8 +1871,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     s->code_ptr += 4;
 
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(r0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
+        /* cmp 4(TCG_REG_L0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, which + 4);
 
         /* jne slow_path */
         tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1882,8 +1882,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /* TLB Hit.  */
 
-    /* add addend(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
+    /* add addend(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L1, TCG_REG_L0,
                          offsetof(CPUTLBEntry, addend));
 }
 
-- 
2.34.1


