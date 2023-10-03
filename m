Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C8FE7542F
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 07:15:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnZcB-0007Sv-N1; Tue, 03 Oct 2023 03:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZc9-0007Qh-Ot
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qnZc7-0001gE-Az
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 03:14:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32325534cfaso586605f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1696317278; x=1696922078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCNf+Nj9MkTh/jQhA2UEhUyPLUkNl7IgQhSiMyt4rNI=;
 b=Z99nbxqt4kSKskIFwgtIdei8nssMMplUOsbb1G1xS40vgKKQdpDaxXy6TbZFAD66ql
 kd+vLFxMp2ACTbDiwhaZ6FBSIiwDbBqXWLxBEszSzj69qt6EGHhCE42DgSUGbJz08St0
 9vjgmCruWttoBarOtNLCNk/auSAcH6Vn5ZBNX7rtYd8pvstiIe75jT9YhPSb/1DuSRUg
 wL4uljPunFhG3FjVmWwe1kV6EAibWkKGM2oOlv6+RJ3tzfeJvppK0m4gRHXljMBirtmy
 DkPRzUcEu52+6j6oL5EmPJeWtrY4rZjAmW/e00UQU++SvRL0vWzE+49DxKCGWG8EOcsr
 +YVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696317278; x=1696922078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCNf+Nj9MkTh/jQhA2UEhUyPLUkNl7IgQhSiMyt4rNI=;
 b=pvEPI27exZ7aB++DIOdol9Vy2Qsw4ko5k6wdlQ3xagdRmBOhsZ4HTBVHYRkv0K+KXT
 VO7xPZCgN0R/ncZgH4hIPOseVlL6KCDXcNuAZDXn4UurhyR2EELVNFsIfuRUINn/J5jX
 lhzMrXY/hMDJ29akCziUsaYmS72P2cZTJfc68VCX4JVDKdo1MimxKJIhOMqdIJudr7p0
 vJ3dBhbZDy3Kgi8hEYGWwZB6E7bjOovwYvwC5/9JcDACBoZ+XjjgXx8/k+HjWWSlSOfM
 Q0o7nfIkBPfQEUH28XU+xCcEkPQTGLKiJid1kfhL0TTMjVpUE4Prw+Zcd58vbN9kjkXo
 a+hA==
X-Gm-Message-State: AOJu0YyMRKhaTj3PcaxCR2QgRr02kDiGNkG2ziMaIQa3PmvAg7JNhQgD
 60JL5OAG9uMBlBD/9/GM7N1Jiw==
X-Google-Smtp-Source: AGHT+IELoybTylNMZCWzC4yUvlKg2I8FSsHPQuJ6xZA/vw7JvJd5ZUcINC+SYnq9zpSGEG/3Pgf2EA==
X-Received: by 2002:adf:ea8f:0:b0:320:1c6:628c with SMTP id
 s15-20020adfea8f000000b0032001c6628cmr13176077wrm.65.1696317277651; 
 Tue, 03 Oct 2023 00:14:37 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b003179d5aee67sm832196wrq.94.2023.10.03.00.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 00:14:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 1/5] softmmu: add means to pass an exit code when
 requesting a shutdown
Date: Tue,  3 Oct 2023 09:14:23 +0200
Message-Id: <20231003071427.188697-2-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003071427.188697-1-chigot@adacore.com>
References: <20231003071427.188697-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

As of now, the exit code was either EXIT_FAILURE when a panic shutdown
was requested or EXIT_SUCCESS otherwise.
However, some hardware could want to pass more complex exit codes. Thus,
introduce a new shutdown request function allowing that.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/sysemu/runstate.h |  2 ++
 softmmu/runstate.c        | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index 08afb97695..c8c2bd8a61 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -68,6 +68,8 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
+void qemu_system_shutdown_request_with_code(ShutdownCause reason,
+                                            int exit_code);
 void qemu_system_shutdown_request(ShutdownCause reason);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 1652ed0439..363a5ea8dd 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -385,6 +385,7 @@ void vm_state_notify(bool running, RunState state)
 
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
+static int shutdown_exit_code = EXIT_SUCCESS;
 static int shutdown_signal;
 static pid_t shutdown_pid;
 static int powerdown_requested;
@@ -664,6 +665,13 @@ void qemu_system_killed(int signal, pid_t pid)
     qemu_notify_event();
 }
 
+void qemu_system_shutdown_request_with_code(ShutdownCause reason,
+                                            int exit_code)
+{
+    shutdown_exit_code = exit_code;
+    qemu_system_shutdown_request(reason);
+}
+
 void qemu_system_shutdown_request(ShutdownCause reason)
 {
     trace_qemu_system_shutdown_request(reason);
@@ -725,7 +733,9 @@ static bool main_loop_should_exit(int *status)
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
             vm_stop(RUN_STATE_SHUTDOWN);
         } else {
-            if (request == SHUTDOWN_CAUSE_GUEST_PANIC &&
+            if (shutdown_exit_code != EXIT_SUCCESS) {
+                *status = shutdown_exit_code;
+            } else if (request == SHUTDOWN_CAUSE_GUEST_PANIC &&
                 panic_action == PANIC_ACTION_EXIT_FAILURE) {
                 *status = EXIT_FAILURE;
             }
-- 
2.25.1


