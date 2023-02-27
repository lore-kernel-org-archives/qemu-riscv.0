Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCS-00028q-N4
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCP-0001yM-PM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:21 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCM-0002V3-O1
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:21 -0500
Received: by mail-pg1-x530.google.com with SMTP id h31so2838225pgl.6
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgU8jRRsy/4dDTOMKHuklv2pdjkeQjC0sYzVe39pJ+4=;
 b=K27SV84hKrTbD8r5jyUHbFYzZ1QW4nNBFe3C8WNwO+s+rkS2YM8VE+cHKng4vSF6xT
 KC7+l5ygc4GOFMd1R2lzxF9/VmaIgG2VXYACnpgeLPl4B6lxZvZdS9wmuVMU+9BLbIRQ
 rbfuJY3OAavb7U7CtNCO27nYA50rznphYgSZgFg3qu0nBZpglBfO8Q4F2KNu+ykFQ+hm
 TegEEqCunmyMoo8h4wo0tqlda7s6VBCkeb056zsGZ3rHoJnDm6xhTdIScZDq2IVWVf6C
 dPEqQle/AMC0AQWB1UI8mpQmTU1DGfy8vIQHe5g/6uNuOZZcaCWAG31lU9ysgTl6qEjR
 knJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgU8jRRsy/4dDTOMKHuklv2pdjkeQjC0sYzVe39pJ+4=;
 b=TWdKk1Hcgy2HdwBTCemm7tW1/61SxHgjeT+NAv2Vz6hrvbDrwIyu7YdinJKoqH3vF1
 1Am3gTakNnHkzycs23Ch/igXrJ3hc3+fsQgT1Kty1CVYqxD3NRlVH5/xCl4/Fxywfery
 MAF3s7K3KnYVw3a5xK6uLImN6iHYyU5fgr6NIti8AThvFH2LjL6Oc1l0qiYyTvdUCbrI
 RC8Bo0wA6WTMJNHWYWXLlrzMYi5mBPEiweQr99JJykmqhMH6W1L0fUgSvuX/Q/S5dtJK
 TDOv3hBJ4AVEZXSmF+NRMARIcw0aYLkfUX30EmODsI7eTY0+mwrlgMxqCNYhweNwiH5S
 pFcw==
X-Gm-Message-State: AO0yUKUGr2sRuPRCcHnzi3+vItozKCcElChbnYIEBiHRzSoIVSqxS/lC
 aS6CAk8SByFS4Djpv5OX7V/yhA==
X-Google-Smtp-Source: AK7set9XAOOJH/T2M1vxOCmeGWKkNrDid9mJ+NtmuFADNBmiq2ZgvAT5d+MM9alXLUreq1LAvF8HGQ==
X-Received: by 2002:a62:1d4b:0:b0:5a8:a250:bc16 with SMTP id
 d72-20020a621d4b000000b005a8a250bc16mr18135051pfd.3.1677476237140; 
 Sun, 26 Feb 2023 21:37:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 04/31] tcg: Remove branch-to-next regardless of reference
 count
Date: Sun, 26 Feb 2023 19:36:34 -1000
Message-Id: <20230227053701.368744-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:22 -0000

Just because the label reference count is more than 1 does
not mean we cannot remove a branch-to-next.  By doing this
first, the label reference count may drop to 0, and then
the label itself gets removed as before.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 06209e6160..0992fb4f31 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2638,7 +2638,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 /* Reachable analysis : remove unreachable code.  */
 static void reachable_code_pass(TCGContext *s)
 {
-    TCGOp *op, *op_next;
+    TCGOp *op, *op_next, *op_prev;
     bool dead = false;
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
@@ -2648,6 +2648,22 @@ static void reachable_code_pass(TCGContext *s)
         switch (op->opc) {
         case INDEX_op_set_label:
             label = arg_label(op->args[0]);
+
+            /*
+             * Optimization can fold conditional branches to unconditional.
+             * If we find a label which is preceded by an unconditional
+             * branch to next, remove the branch.  We couldn't do this when
+             * processing the branch because any dead code between the branch
+             * and label had not yet been removed.
+             */
+            op_prev = QTAILQ_PREV(op, link);
+            if (op_prev->opc == INDEX_op_br &&
+                label == arg_label(op_prev->args[0])) {
+                tcg_op_remove(s, op_prev);
+                /* Fall through means insns become live again.  */
+                dead = false;
+            }
+
             if (label->refs == 0) {
                 /*
                  * While there is an occasional backward branch, virtually
@@ -2661,21 +2677,6 @@ static void reachable_code_pass(TCGContext *s)
                 /* Once we see a label, insns become live again.  */
                 dead = false;
                 remove = false;
-
-                /*
-                 * Optimization can fold conditional branches to unconditional.
-                 * If we find a label with one reference which is preceded by
-                 * an unconditional branch to it, remove both.  This needed to
-                 * wait until the dead code in between them was removed.
-                 */
-                if (label->refs == 1) {
-                    TCGOp *op_prev = QTAILQ_PREV(op, link);
-                    if (op_prev->opc == INDEX_op_br &&
-                        label == arg_label(op_prev->args[0])) {
-                        tcg_op_remove(s, op_prev);
-                        remove = true;
-                    }
-                }
             }
             break;
 
-- 
2.34.1


