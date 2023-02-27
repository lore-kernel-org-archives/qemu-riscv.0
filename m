Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCT-0002FT-Vb
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCR-00027m-De
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:24 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCP-0002WZ-7I
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id z2so5518184plf.12
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=eZ1VDAE0A4B68/UvZiQsA3HbY5a8VnVVkkO3IvXh9L7Yj+6d7kZT/GB8CvbBXRI/8K
 PQ7k4TgglZPwAq/WeFaKWdUe3cvpvgmmz66Ojsb/weewFhWyvrrlngxjSfZadTgTOl0g
 JjETL/kEFWEFMSZ7T1U5h4ac+3sao2AzuEKSsG3ZhqMGCFW73oTh1LH5Si5h6WDuRRXa
 awL4cxUDpaSSyJ6+2USLEz3TfGcQ3ZwvfXUvaRwQZ0G8oYQf25h8Lo2vrZH++doCPZVt
 hCDKhFPf1lrKNvr6W6DwXpda7ZPs0vFvK2nPSPP35EQjMDiVQ1CkECCJVYNMA6A1hOnp
 AEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=MieiNEOs9azBtE2iiXtXK39URTkGp45AnpjWu0pL0upH4pTSTihnaUasnZeUS6p5db
 7YQcuRVKmSIbjYQZhX4UNa7ME76wfUpl22ozzDgeRKe+u9/A7nlyUhSSTpAxUUdjdIXf
 PIOS+uQXX50by48Y4N5fadJOgHT+VKd4JmC5kyyL44GWrNQsn7WolXreU6BHMjoXzpgT
 k2VlTnK5M+PcYx5O48/o0cQPQQCbj8BwyT1Fm22kDmbyKmtXmWYqvPsvzh+VcBiALAHB
 7gZPEM6v0XY9WDEUikxm++yv//nE145N0nVHnfMIMxTuMj8qOn5J1R5xtpzVu5WD+EgC
 poeg==
X-Gm-Message-State: AO0yUKXKN8QrEdCqAuAr+872eTI7L6tpDvPkrlxmIO02lJx20pPBXPKy
 k8/8wtdN5MuquF2ARHt1KPCRWg==
X-Google-Smtp-Source: AK7set9ejX/AAfB0TyN98cgEy+QrZl2XFkz5Nwb7RHBq931+BTfn6n1t+ckRCJyg+jHNnMAd1S2spg==
X-Received: by 2002:a05:6a20:7351:b0:cc:c5db:ea4a with SMTP id
 v17-20020a056a20735100b000ccc5dbea4amr7662597pzc.33.1677476239768; 
 Sun, 26 Feb 2023 21:37:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 05/31] tcg: Rename TEMP_LOCAL to TEMP_TB
Date: Sun, 26 Feb 2023 19:36:35 -1000
Message-Id: <20230227053701.368744-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:24 -0000

Use TEMP_TB as that is more explicit about the default
lifetime of the data.  While "global" and "local" used
to be contrasting, we have more lifetimes than that now.

Do not yet rename tcg_temp_local_new_*, just the enum.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 12 ++++++++----
 tcg/optimize.c    |  2 +-
 tcg/tcg.c         | 18 +++++++++---------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 59854f95b1..2010e746ca 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -433,11 +433,15 @@ typedef enum TCGTempVal {
 typedef enum TCGTempKind {
     /* Temp is dead at the end of all basic blocks. */
     TEMP_NORMAL,
-    /* Temp is live across conditional branch, but dead otherwise. */
+    /*
+     * Temp is dead at the end of the extended basic block (EBB),
+     * the single-entry multiple-exit region that falls through
+     * conditional branches.
+     */
     TEMP_EBB,
-    /* Temp is saved across basic blocks but dead at the end of TBs. */
-    TEMP_LOCAL,
-    /* Temp is saved across both basic blocks and translation blocks. */
+    /* Temp is live across the entire translation block, but dead at end. */
+    TEMP_TB,
+    /* Temp is live across the entire translation block, and between them. */
     TEMP_GLOBAL,
     /* Temp is in a fixed register. */
     TEMP_FIXED,
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 763bca9ea6..ce05989c39 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -190,7 +190,7 @@ static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
         } else if (i->kind > ts->kind) {
             if (i->kind == TEMP_GLOBAL) {
                 g = i;
-            } else if (i->kind == TEMP_LOCAL) {
+            } else if (i->kind == TEMP_TB) {
                 l = i;
             }
         }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0992fb4f31..bf2af8b0fe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1258,7 +1258,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
+    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
@@ -1369,7 +1369,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          */
         return;
     case TEMP_NORMAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         break;
     default:
         g_assert_not_reached();
@@ -1915,7 +1915,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
-        case TEMP_LOCAL:
+        case TEMP_TB:
             ts->mem_allocated = 0;
             break;
         default:
@@ -1937,7 +1937,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_GLOBAL:
         pstrcpy(buf, buf_size, ts->name);
         break;
-    case TEMP_LOCAL:
+    case TEMP_TB:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
@@ -2759,7 +2759,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         switch (ts->kind) {
         case TEMP_FIXED:
         case TEMP_GLOBAL:
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
@@ -2804,7 +2804,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
         int state;
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = ts->state;
             ts->state = state | TS_MEM;
             if (state != TS_DEAD) {
@@ -3497,7 +3497,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_FIXED:
         return;
     case TEMP_GLOBAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
     case TEMP_NORMAL:
@@ -3785,7 +3785,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         TCGTemp *ts = &s->temps[i];
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
         case TEMP_NORMAL:
@@ -3822,7 +3822,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
          * Keep tcg_debug_asserts for safety.
          */
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
             break;
         case TEMP_NORMAL:
-- 
2.34.1


