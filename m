Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B4BC44508
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:03:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIHM-0005pZ-PR; Fri, 10 Jul 2026 16:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFZ-0002NB-SU
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:12 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFK-00010x-LC
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:09 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-84536ecfc5bso1562249b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716882; x=1784321682; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zOV8aDWsylX+EDtzAiDKgexQev8L9FW7a3sm5qjjMIQ=;
 b=vowvtVoUdq0rdIQS1+zi4RFPW9DzyNJAdGXuoDwTiUWOS7sGyvbKKO6msBNY2bbqAm
 fCrp2FRRcu45WECOpYMwpDZvisWSrfjantcgHopE3TI1o3gGjKssdhGWjXAOe/MlwbI5
 sQe3wmOHTIFVUhcCw72aeOaK2q3vbCNuk5Oha51R6uHfCEPXgGuoDYa9PcS2/ofB4KTK
 o7EKSqJX6FaENH+iPdZf10Haen9KpaMZucDzmOzob8WSYtfGGzj/c5jbuU35RwniWiB4
 YowlbV9/0G6iJIYq2OVb1TDLXPQJJkVevvUYLOLFJswOf1T7DMjMcV+yLXjStx+aUpq+
 mj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716882; x=1784321682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zOV8aDWsylX+EDtzAiDKgexQev8L9FW7a3sm5qjjMIQ=;
 b=AgWi4F0KndL+nUkiIeF1/0ccs7ITDzgpcSKZrx6XXT5lQm0C/iBE2F5Yd6CjIGLHBV
 hip/wOc7Mamvl+cTVD2FPAPSZbQ/YMG07QJVgoJTw20e8/3t2hF0rReK9QeZZEqx8DPz
 ZrK44FvvMQaEyIIWE0ipkJaFCbxSi8V7c1HEmDSsip8AjZ2pJZ2ul2H4P3+3RrZBiEod
 w4zrNyNQv4jxQ57rGvzotP/H2f6eOD+Y1KrdiP7WlrDHlWDH1KGfBpnqZ0bs+EV8BQKT
 kuUXtigeFiQq/bHjtEs4y+Xboc31lJ1LOmpgguidE6S9GMIpSmsraPGyaFzg6qOXSmaV
 wH6w==
X-Forwarded-Encrypted: i=1;
 AHgh+RphbGXaZ9z7U8M30uqQQdr1+eunocKQAzyW2ojk8n+dEI9KVJy3NjEOR25lBgC8DblCmg3FnrvlS3LI@nongnu.org
X-Gm-Message-State: AOJu0YyBbQummE5OTIORZlJSDKPEPPmiWpUt2D8CdPbSEIo+3JCqErjl
 1u4EGp5vu1GNu5Rp+npqEl0BUp5eF2/MWBcKO04MeVax7cmkroRauRIMFRe8H8mMyhwYu/x5HKg
 3EmqE
X-Gm-Gg: AfdE7ckaIBNVTg4fpa6YAh7Q5bewkIcoRqBsKmCDvKCExCPOomg8oXsi3Qt1w11v1BX
 D+9ds0nP3E+DXoC3zYKFj0cPkBpoG8N+McZFs9zJikgxZaaACjwgkNV1ESQHIpludh/QdGxshJh
 GtdmIHgkm7Bin8tILYSsJmmhBRpCl3SF2G5SVuIf1x+Vd4Et5nT4IZKuBDEJ5Un9duLnOWDNTcj
 H3PIAdPCV4BhJk0VWI6mZT51/3YFD51R+u3XWe5KNI4mG6jtJvvlrF4kBB3ZlkZ5u6UB5uyL364
 coFXpNuR4qN31uBMCvxgfoK7FVSyLNOy2CbPeRahqls7nE0s6cNXd0Oa99I7pB4NBznkvpYenxQ
 ul9dg8lC/sZDjXlGNu37Fn8/LSe58Sb3gvOELLVtsScd/KHA67sLYFWZtzHSYvtkPiNVtPIf0iF
 +6pEzmTW9WNNotP4RUSg==
X-Received: by 2002:a05:6a00:4298:b0:848:5d9b:6885 with SMTP id
 d2e1a72fcca58-848897b70a6mr521424b3a.77.1783716882145; 
 Fri, 10 Jul 2026 13:54:42 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 37/51] target/riscv: Merge riscv_cpu_debug_check_{break,
 watch}point
Date: Fri, 10 Jul 2026 13:53:47 -0700
Message-ID: <20260710205401.836304-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

These functions are identical.  Rename to
riscv_cpu_debug_check_bp_wp and install in both target hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.h       |  3 +--
 target/riscv/debug.c       | 12 +-----------
 target/riscv/tcg/tcg-cpu.c |  4 ++--
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 540835f2d0..fbe6898718 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -144,8 +144,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 target_ulong tinfo_csr_read(CPURISCVState *env);
 
 void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit);
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp);
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp);
+bool riscv_cpu_debug_check_bp_wp(CPUState *cs, CPUBreakpoint *bp);
 
 void riscv_trigger_realize(CPURISCVState *env);
 void riscv_trigger_unrealize(CPURISCVState *env);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index f4689519d8..803418f390 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -923,7 +923,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
     do_trigger_action(env, DBG_ACTION_BP);
 }
 
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
+bool riscv_cpu_debug_check_bp_wp(CPUState *cs, CPUBreakpoint *bp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -933,16 +933,6 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     return trigger_common_match(env, trigger_type, i);
 }
 
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    int i = wp->id;
-    trigger_type_t trigger_type = get_trigger_type(env, i);
-
-    return trigger_common_match(env, trigger_type, i);
-}
-
 void riscv_trigger_realize(CPURISCVState *env)
 {
     int i;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b73e3e9dd4..3701aa6c94 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -292,8 +292,8 @@ const TCGCPUOps riscv_tcg_ops = {
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
     .debug_excp_handler = riscv_cpu_debug_excp_handler,
-    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
-    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
+    .debug_check_breakpoint = riscv_cpu_debug_check_bp_wp,
+    .debug_check_watchpoint = riscv_cpu_debug_check_bp_wp,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.43.0


