Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C47C4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnAK-0002MV-HP; Fri, 19 Jan 2024 06:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAJ-0002Kl-7s
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAG-0001E9-0Z
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33922d2cb92so202950f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664158; x=1706268958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bZ2ofuMw9l9dRlR/wStloN7Wq3xL/x8gLMvQvh8dxdA=;
 b=LpMWM1zy9VO8qoemsrs20TrHnsp4ZCXikcGvz2AyjXunvTLzBTGyoH458RQ8brPgaE
 uCCO64PIMXuD9ZMUsqlK82BJQ7S3Sk7YH5ELpgzY0k2ma59EJawLCHKRFsYC1FQlIqHD
 9zxv1rvfrueabvOHrAmOvpriNdZgzMz4Ai/CpliIeJl9zRLbbtb2IgSzGSzpiel7UBCz
 1YdXBbgjc40XEvJWYVBdfbgTU9bOC54w7HAkJS7WjQkF9hJX859A6+yhO+uDlOF2bv8A
 adfE3EQ0ZkUmzsv7BpmSBp2Eo4deh38+J2mJCa/ptdII/jG0P81os8c4C3pXEKt50kj0
 Z4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664158; x=1706268958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bZ2ofuMw9l9dRlR/wStloN7Wq3xL/x8gLMvQvh8dxdA=;
 b=pEJd7dF5iIA36j7y63ZIPWCClVdDDF4wfsJXLHyMC7kvmR87qsexuxh7TflKQZT8VP
 uPZqGH6Bms/NCnnGrAlhKUW2zQ21gWx86SX1X7u1rDgJ0O8/xaPmsZE1suOWgCVMpzYm
 JOZIHRHJ1oaTP2ZiIiemzIyIx99FDT5CtxzUNhcXQ2gUfRYI1cQw30t7TiQTDmBMOJ8P
 MtPABjmTa4Nt1bwu6/6KUatJEYI103MXFqY9A7t2nEd3/b/v3MwpbNT4uCZp6q3pbHiq
 qRLQaIW+mIwHIeCwKMUwDm9XKbw61xa+h6QUUTcbh72Ks1fiRLQKFn218FD2IXk200C5
 qagw==
X-Gm-Message-State: AOJu0YzPmExTE/GYytVtFhCY1YHUqTbgJ7jjuIQRhTHVdMxZXgOfg8ol
 x6MQzL1yo4Hx2tBsX59GScW9/lfyCvYyzrZgFh2Lab2AWUsSbT7bryujrhsyRCc=
X-Google-Smtp-Source: AGHT+IFCZdo0qSPmQt9VZFKlu/dy0lEiNjnCqeipku6/pKAveRyM3ECmqcXFOKwOdrmUMbv0AEghhw==
X-Received: by 2002:a05:600c:4394:b0:40d:5a5a:a10 with SMTP id
 e20-20020a05600c439400b0040d5a5a0a10mr604581wmn.139.1705664158381; 
 Fri, 19 Jan 2024 03:35:58 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 m10-20020adffa0a000000b003392172fd60sm1114421wrr.51.2024.01.19.03.35.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 11/36] system/cpu-timers: Have icount_configure() return a
 boolean
Date: Fri, 19 Jan 2024 12:34:40 +0100
Message-ID: <20240119113507.31951-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have icount_configure()
return a boolean indicating whether an error is set or not.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231208113529.74067-2-philmd@linaro.org>
---
 include/sysemu/cpu-timers.h | 10 ++++++++--
 accel/tcg/icount-common.c   | 16 +++++++++-------
 stubs/icount.c              |  4 +++-
 system/vl.c                 |  3 +--
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index 2e786fe7fb..b70dc7692d 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -50,8 +50,14 @@ int64_t icount_get(void);
  */
 int64_t icount_to_ns(int64_t icount);
 
-/* configure the icount options, including "shift" */
-void icount_configure(QemuOpts *opts, Error **errp);
+/**
+ * icount_configure: configure the icount options, including "shift"
+ * @opts: Options to parse
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Return: true on success, else false setting @errp with error
+ */
+bool icount_configure(QemuOpts *opts, Error **errp);
 
 /* used by tcg vcpu thread to calc icount budget */
 int64_t icount_round(int64_t count);
diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index ec57192be8..dc69d6a4c6 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -419,7 +419,7 @@ void icount_account_warp_timer(void)
     icount_warp_rt();
 }
 
-void icount_configure(QemuOpts *opts, Error **errp)
+bool icount_configure(QemuOpts *opts, Error **errp)
 {
     const char *option = qemu_opt_get(opts, "shift");
     bool sleep = qemu_opt_get_bool(opts, "sleep", true);
@@ -429,27 +429,28 @@ void icount_configure(QemuOpts *opts, Error **errp)
     if (!option) {
         if (qemu_opt_get(opts, "align") != NULL) {
             error_setg(errp, "Please specify shift option when using align");
+            return false;
         }
-        return;
+        return true;
     }
 
     if (align && !sleep) {
         error_setg(errp, "align=on and sleep=off are incompatible");
-        return;
+        return false;
     }
 
     if (strcmp(option, "auto") != 0) {
         if (qemu_strtol(option, NULL, 0, &time_shift) < 0
             || time_shift < 0 || time_shift > MAX_ICOUNT_SHIFT) {
             error_setg(errp, "icount: Invalid shift value");
-            return;
+            return false;
         }
     } else if (icount_align_option) {
         error_setg(errp, "shift=auto and align=on are incompatible");
-        return;
+        return false;
     } else if (!icount_sleep) {
         error_setg(errp, "shift=auto and sleep=off are incompatible");
-        return;
+        return false;
     }
 
     icount_sleep = sleep;
@@ -463,7 +464,7 @@ void icount_configure(QemuOpts *opts, Error **errp)
     if (time_shift >= 0) {
         timers_state.icount_time_shift = time_shift;
         icount_enable_precise();
-        return;
+        return true;
     }
 
     icount_enable_adaptive();
@@ -491,6 +492,7 @@ void icount_configure(QemuOpts *opts, Error **errp)
     timer_mod(timers_state.icount_vm_timer,
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                    NANOSECONDS_PER_SECOND / 10);
+    return true;
 }
 
 void icount_notify_exit(void)
diff --git a/stubs/icount.c b/stubs/icount.c
index 6df8c2bf7d..85c381a0ea 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -10,10 +10,12 @@ void icount_update(CPUState *cpu)
 {
     abort();
 }
-void icount_configure(QemuOpts *opts, Error **errp)
+bool icount_configure(QemuOpts *opts, Error **errp)
 {
     /* signal error */
     error_setg(errp, "cannot configure icount, TCG support not available");
+
+    return false;
 }
 int64_t icount_get_raw(void)
 {
diff --git a/system/vl.c b/system/vl.c
index 53850a1daf..404e7cf87a 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2270,8 +2270,7 @@ static void user_register_global_props(void)
 
 static int do_configure_icount(void *opaque, QemuOpts *opts, Error **errp)
 {
-    icount_configure(opts, errp);
-    return 0;
+    return !icount_configure(opts, errp);
 }
 
 static int accelerator_set_property(void *opaque,
-- 
2.41.0


