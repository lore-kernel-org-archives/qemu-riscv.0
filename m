Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2TA-0006DE-HL
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T8-00064e-PF
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T6-0000V4-FD
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:46 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w11so6263444plp.13
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLv/eAbI6tQ0am4/yuJPeuSznEA4VOjwICoxSl+rb4g=;
 b=Chsx+orGqCuQiAWcYAYXnuHCzV+AMJ2Jy5PpTW2n46j9xcfTGSQjTX1bqGZmsPf+BY
 QEKTyvX1EFLlzE3cq7BUpg2lJO8RBWkYdZwleaQg4MK75ypMhMEqpkdIBGLhxTWgVV9u
 KCn7TmYfEFh53Gk5JU0mh2vfHZDoOZeFw6pn5Zbk1GjuEugrmkkdkCFZhoql5N6L10Yv
 tdCHbqT4EG55njsT//pRwYHJiBKEiolZWdZIJFwHufm0/DUC930QvhEh3ikG+64Isg0F
 jc8b4lMcRyNZxi24vRs7t6pzpG1/0SplDYr8nOJJT0nd1jIyBDdwdX4YY6bNEtOWG+qn
 PhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLv/eAbI6tQ0am4/yuJPeuSznEA4VOjwICoxSl+rb4g=;
 b=PP2CcfQoxAmgOgfGgfvJPLDpqQqeAnQQIrBry7wWr9J+sGI7qKNRJFuFXZlBL2BV93
 KE9yLv21zLdpVY0f4CCgwxIma4va6v1cwMGD7JaoIOGa1SRjMc3bBkm7Fuk40SEn35hL
 0YRseNd35FvvxcsvyifocGx8CBbh2uxvtINUZKYlP/Tr5OXbjdgUMLWhjIkcMcD9CXZT
 /jqYnI69FeaudxNymFOcAJllYEqOfvrloyl6AelEMQWAIq4w22Z4VVbDD8ht+NPY20t0
 qKZgMOszKSnO9Vg9DF8JI5a2r2YgV47hzoFip2E5E0iv3y46rIF0rcmjaOKLR3OHhAFU
 +csw==
X-Gm-Message-State: AAQBX9ds16yQ9w4tQtPY8YBR/pEPvl68YHKvLSsXunIPnz5sML2pK7w0
 kw79EXBAAzhDKrs9RMm5p+Na4g==
X-Google-Smtp-Source: AKy350bhTYEf14wly+n86DnvucDw7end3QSHX9YO+jp9qzJcnBdjdWzrZmxVFbXe/UEc/UhL5fhuVQ==
X-Received: by 2002:a05:6a20:2d9a:b0:e9:5b0a:e8f2 with SMTP id
 bf26-20020a056a202d9a00b000e95b0ae8f2mr7414502pzb.35.1681175203771; 
 Mon, 10 Apr 2023 18:06:43 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 32/54] tcg: Replace REG_P with arg_loc_reg_p
Date: Mon, 10 Apr 2023 18:04:50 -0700
Message-Id: <20230411010512.5375-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:06:47 -0000

An inline function is safer than a macro, and REG_P
was rather too generic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  4 ----
 tcg/tcg.c          | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index e542a4e9b7..0f1ba01a9a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -58,10 +58,6 @@ typedef struct TCGCallArgumentLoc {
     unsigned tmp_subindex       : 2;
 } TCGCallArgumentLoc;
 
-/* Avoid "unsigned < 0 is always false" Werror, when iarg_regs is empty. */
-#define REG_P(L) \
-    ((int)(L)->arg_slot < (int)ARRAY_SIZE(tcg_target_call_iarg_regs))
-
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6f5daaee5f..fa28db0188 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -806,6 +806,16 @@ static void init_ffi_layouts(void)
 }
 #endif /* CONFIG_TCG_INTERPRETER */
 
+static inline bool arg_slot_reg_p(unsigned arg_slot)
+{
+    /*
+     * Split the sizeof away from the comparison to avoid Werror from
+     * "unsigned < 0 is always false", when iarg_regs is empty.
+     */
+    unsigned nreg = ARRAY_SIZE(tcg_target_call_iarg_regs);
+    return arg_slot < nreg;
+}
+
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
     int info_in_idx;            /* TCGHelperInfo in[] */
@@ -3231,7 +3241,7 @@ liveness_pass_1(TCGContext *s)
                         case TCG_CALL_ARG_NORMAL:
                         case TCG_CALL_ARG_EXTEND_U:
                         case TCG_CALL_ARG_EXTEND_S:
-                            if (REG_P(loc)) {
+                            if (arg_slot_reg_p(loc->arg_slot)) {
                                 *la_temp_pref(ts) = 0;
                                 break;
                             }
@@ -3258,7 +3268,7 @@ liveness_pass_1(TCGContext *s)
                     case TCG_CALL_ARG_NORMAL:
                     case TCG_CALL_ARG_EXTEND_U:
                     case TCG_CALL_ARG_EXTEND_S:
-                        if (REG_P(loc)) {
+                        if (arg_slot_reg_p(loc->arg_slot)) {
                             tcg_regset_set_reg(*la_temp_pref(ts),
                                 tcg_target_call_iarg_regs[loc->arg_slot]);
                         }
@@ -4833,7 +4843,7 @@ static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
 static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
                             TCGTemp *ts, TCGRegSet *allocated_regs)
 {
-    if (REG_P(l)) {
+    if (arg_slot_reg_p(l->arg_slot)) {
         TCGReg reg = tcg_target_call_iarg_regs[l->arg_slot];
         load_arg_reg(s, reg, ts, *allocated_regs);
         tcg_regset_set_reg(*allocated_regs, reg);
-- 
2.34.1


