Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORV-00057J-Ao
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR4-000494-HI
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:47 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQz-00050U-Sc
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:46 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8b3ecf59fso60913981fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451279; x=1685043279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
 b=JucbdGKMAchPxx+TKrrskyDhoA5x9eyO2R4fxUbLt9rH5Quqn58Eeua6J21M97NhCY
 tfxi2VOa+cWFKOC5iY8Lrr6IfVcnrAJpttBs15pnH7RU/zmCH473/kdzGrnZOrNOwFcP
 u6ojuX0ukfks96mPjQ6rgji5Z4umdRqMIpdr8EMD8KbeCnxSm3BHd9hWc4c6e8wco/Uv
 Sgskva6A0RM/Iqj0LrCbLTDFjjxFHaWGM4qci3Y4K/n7GxrRwuFM7CbokjNvfVfQuQQ8
 l2nyufQFJp5D5KEjjNLH/ZIGl72IVUMUMTKqOG8aUDr+SmsrLaflu/EDL/jCnYqvh3ug
 9pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451279; x=1685043279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTRyUJJ//8McRlEJCpdcC3CCDoyJJ5ltYvB50/bCFGE=;
 b=MFvYfEc84zDBJISLqUVE++qcSiSFFlvAq1WLOuN5B9ffFHtA9lmoHVOwE04bxYAfam
 UowdoCv3wL04ZGRuLgHCY+LeyMfoGv9eqhxqZ0AdCYbwgRpXUzqDiO1RmKm9XyHjo/br
 UokZyIEYbT4eXLroqMBU0y5BO/IxFTuhPTps9Vxw0fvjjLO1s3hRKp32IakSIypBTVPQ
 IvnKYY6i37nE6aUduY1fylyG1IPjT1BN/jcou/dGZcaLE+UvxmaDYGZFTnvUzDMJcT1K
 veCCdZYfjLI8KMt8zVD9UuR0nYk1oVpikTX74bZWxxMI4tCqjLZXZFDolI7pdSClLacj
 D5qg==
X-Gm-Message-State: AAQBX9esL5H/RgRmJz6XrDduUcGrQeoNRfeau18rHHOsJfJbN+o8RC/p
 7Z30GXmoefPK5ycb59F4NApS9w==
X-Google-Smtp-Source: AKy350auMfpul13T/KEciadGWbHJE1bhbZnEu/9XzRlP2ht0onOItQ7ZHLBFtjeqX4HtjGwxfGlWSQ==
X-Received: by 2002:a2e:8216:0:b0:2a8:ae90:83d6 with SMTP id
 w22-20020a2e8216000000b002a8ae9083d6mr3579235ljg.48.1682451279612; 
 Tue, 25 Apr 2023 12:34:39 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 28/57] tcg/mips: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:17 +0100
Message-Id: <20230425193146.2106111-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x236.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:47 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 57 ++-------------------------------------
 1 file changed, 2 insertions(+), 55 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7770ef46bd..fa0f334e8d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1075,7 +1075,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
     tcg_out_nop(s);
 }
 
-#if defined(CONFIG_SOFTMMU)
 /* We have four temps, we might as well expose three of them. */
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 3, .tmp = { TCG_TMP0, TCG_TMP1, TCG_TMP2 }
@@ -1088,8 +1087,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
-        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
+        || (l->label_ptr[1] && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1118,8 +1116,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     if (!reloc_pc16(l->label_ptr[0], tgt_rx)
-        || (TCG_TARGET_REG_BITS < TARGET_LONG_BITS
-            && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
+        || (l->label_ptr[1] && !reloc_pc16(l->label_ptr[1], tgt_rx))) {
         return false;
     }
 
@@ -1139,56 +1136,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    void *target;
-
-    if (!reloc_pc16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        /* A0 is env, A1 is skipped, A2:A3 is the uint64_t address. */
-        TCGReg a2 = MIPS_BE ? l->addrhi_reg : l->addrlo_reg;
-        TCGReg a3 = MIPS_BE ? l->addrlo_reg : l->addrhi_reg;
-
-        if (a3 != TCG_REG_A2) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
-        } else if (a2 != TCG_REG_A3) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_TMP0, TCG_REG_A2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, TCG_REG_A3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, TCG_TMP0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /*
-     * Tail call to the helper, with the return address back inline.
-     * We have arrived here via BNEL, so $31 is already set.
-     */
-    target = (l->is_ld ? helper_unaligned_ld : helper_unaligned_st);
-    tcg_out_call_int(s, target, true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* SOFTMMU */
-
 typedef struct {
     TCGReg base;
     MemOp align;
-- 
2.34.1


