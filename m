Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0E7EB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q94C3-0001n7-R6; Tue, 13 Jun 2023 09:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bu-0001Ny-KD
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:36:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bs-0002gL-BP
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:36:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so7853766a12.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663366; x=1689255366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ry/cjrg7XOxc8uRAKLAirJAwrBWEpGHjMR46sXnWNn0=;
 b=Chbfm/4pI28YU3JI6nhR4UtiXjsaLsUVuUbtdFvkuyscadYJNsIKxLkvc/hwoJP+36
 qeq+Ul1KsAwrcLsqikHBwedCOTw9QwoLq2DyOvqjYEgOew0wzXF2qchSiIHvrx46NJSP
 TYVW3hnT1JOmKvC1Px5NTx05V2fE0338Au+belQ+pAXogMkoPebgTp5XwPG4MDyfetDa
 r3u5OM0NeDBUzGCTrZFJOR7NqUtIZwRtNOqgxHtp2PREg63HItxtzb9w4218c1NzRVZe
 3zN2tihZhTSuHV0l8Dk1/v6en1rTAxtg+G1+PEOtFAdkcb7sWgh+NOYNunYaA/dk8Wq+
 spwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663366; x=1689255366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ry/cjrg7XOxc8uRAKLAirJAwrBWEpGHjMR46sXnWNn0=;
 b=iOlEA7ChBmUA8BbSAF90tSRXbpMZByfFaiAsS+6aorOwfevcejCMYFg1GoKvXd0j6L
 fC4HvKzrjJCZxgFPPwhpCWq5y5DiUCpfKM6VY0HwEmDzDFy5g7y2x2kNuGWQE62O1ilS
 TibvLOe3u9TqU4vMwvQnS6aeO02Pjz6hyBckJkFH5VMnyApgc3klxlOjGdpDOyFaQd7M
 XG/FAUbt3lgWwxg0y1bYooYT+CIaxmdBwUosyQrpCifleLJxBxYQQELQq8cst1Vm8xkT
 4wiFxygvdPnc3tX3t1XkD9R/DzJW8pIubddd/Zu6l8sLw/WsGd1CY7RYQXVnh3Tn6ZR1
 yxmA==
X-Gm-Message-State: AC+VfDxlBJOUz23dftMzUdphmNQSof2owVkUy6O0du4b7yNBMXZkZpGR
 NNZzxoShumxxWzXPWaqhRnzuNA==
X-Google-Smtp-Source: ACHHUZ6n6XOMfJzlx9L2HWubKA3hIePQCMFHC+DPA3/iDpRp3/UM3f0z2WTCLd5e/FOSna6y784C7A==
X-Received: by 2002:aa7:d691:0:b0:514:9e26:1f51 with SMTP id
 d17-20020aa7d691000000b005149e261f51mr7004399edr.24.1686663365840; 
 Tue, 13 Jun 2023 06:36:05 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056402004e00b00514b3dd8638sm6473595edu.67.2023.06.13.06.36.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:36:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/9] accel/tcg: Check for USER_ONLY definition instead of
 SOFTMMU one
Date: Tue, 13 Jun 2023 15:33:44 +0200
Message-Id: <20230613133347.82210-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Invert some if() ladders for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h | 6 +++---
 accel/tcg/cpu-exec.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 24f225cac7..65380ccb42 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -17,10 +17,10 @@
  * memory related structures are protected with mmap_lock.
  * In !user-mode we use per-page locks.
  */
-#ifdef CONFIG_SOFTMMU
-#define assert_memory_lock()
-#else
+#ifdef CONFIG_USER_ONLY
 #define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
+#else
+#define assert_memory_lock()
 #endif
 
 #if defined(CONFIG_SOFTMMU) && defined(CONFIG_DEBUG_TCG)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 42086525d7..1f592adc05 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -563,7 +563,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-#ifndef CONFIG_SOFTMMU
+#ifdef CONFIG_USER_ONLY
         clear_helper_retaddr();
         if (have_mmap_lock()) {
             mmap_unlock();
@@ -1020,7 +1020,7 @@ static int cpu_exec_setjmp(CPUState *cpu, SyncClocks *sc)
         /* Non-buggy compilers preserve this; assert the correct value. */
         g_assert(cpu == current_cpu);
 
-#ifndef CONFIG_SOFTMMU
+#ifdef CONFIG_USER_ONLY
         clear_helper_retaddr();
         if (have_mmap_lock()) {
             mmap_unlock();
-- 
2.38.1


