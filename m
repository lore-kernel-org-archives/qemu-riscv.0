Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3E0CA0FF6
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeDAP-0004bX-NC; Thu, 07 Sep 2023 07:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDA8-0004IQ-O1
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:05 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeD9z-00063y-Vu
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:04 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31f6ddb3047so714966f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1694086012; x=1694690812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk4BYECTK9VZ3/Su8VFwEGn9G5CRlLBreIRbOvNSXRI=;
 b=ake7k+3jlq9Mxja2rILsu+Kq+R1BAvqZkdOe9QtDy2Zx/PDZWGKhcv/35NhT1rcAI8
 jGbV7ymu9dymGurJ6hme55u4EPHkRAQ3RLZg2IPJzLXOGDEsHZRFAnmvMkmKBMsXka3e
 DEw6q0r7KqTQQ4Ykq9h4dkD3EgHVeJ4khBnD+6+SEa3U1UX1Fqli4P3cLFUQYn4aTqUY
 AsevXPwhSPP1uK5UletTHmy8LiFiAdDThdcLYZFaTiXLp0gSHICt5BRcV57GIw7xBRDE
 ZLxxzZ+W2Gz8xd98rb6EsZ2h646Jn+BoVpEGtfz97i+sr/lLBltjpWgC+dUxEwZVS+F7
 SfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694086012; x=1694690812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk4BYECTK9VZ3/Su8VFwEGn9G5CRlLBreIRbOvNSXRI=;
 b=bV2PMSyIzbwvZ3hKmgYeuwmyWQAopXrjnTlXljHByrYR8e5nmA11agOSaXnzPqLKqB
 jzBgnwxqTuUjWJshC+RGJ6DVCIcyf0SDSGRGznCZHgrdnVPVOEzTvHeeqFCwGd4pW+s6
 wFn3Jq89IDq7m7+EQXvYrWWwBcfEzfelYUallw5YFE5SJN5AAx4gHuJksNM12bje0M97
 ALBQ0vYEvfB6oSIBoDxsM9ePOxl8dAjdOKALsTCnspgMZeL1h3Gpl5SV2ylK3qALYKc5
 I4GcU3uEMd07aOpkF0Tpyc1EM1uAVL1CmzyXkI9UfXdjqaeqT0ij4hJPxqvkoAng0SSB
 MwIA==
X-Gm-Message-State: AOJu0YxzwDga+vwwlGTbYNSKa3fOVG9Nuu/ctXxvFzbM1693IgWRtjIq
 63TTbF1lm5adHn3AD9UASXu+PFk1YlBUnhdDk/M=
X-Google-Smtp-Source: AGHT+IF4z9Slhz4+0IAQf1x4pT9fsld634wp+vlskJqzFSGrXWlIgawZhfT1sZVyivqZWEUagWCc+Q==
X-Received: by 2002:adf:f38e:0:b0:315:8a13:ef17 with SMTP id
 m14-20020adff38e000000b003158a13ef17mr4726117wro.65.1694086012429; 
 Thu, 07 Sep 2023 04:26:52 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:c2c3:52c5:8306:a161])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b00317909f9985sm22998755wrm.113.2023.09.07.04.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 04:26:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 1/5] softmmu: add means to pass an exit code when
 requesting a shutdown
Date: Thu,  7 Sep 2023 13:26:36 +0200
Message-Id: <20230907112640.292104-2-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907112640.292104-1-chigot@adacore.com>
References: <20230907112640.292104-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x42a.google.com
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
---
 include/sysemu/runstate.h |  2 ++
 softmmu/runstate.c        | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index 7beb29c2e2..1e59e0b12b 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -61,6 +61,8 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
+void qemu_system_shutdown_request_with_code(ShutdownCause reason,
+                                            int exit_code);
 void qemu_system_shutdown_request(ShutdownCause reason);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index f3bd862818..ee27e26048 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -345,6 +345,7 @@ void vm_state_notify(bool running, RunState state)
 
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
+static int shutdown_exit_code = EXIT_SUCCESS;
 static int shutdown_signal;
 static pid_t shutdown_pid;
 static int powerdown_requested;
@@ -624,6 +625,13 @@ void qemu_system_killed(int signal, pid_t pid)
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
@@ -685,7 +693,9 @@ static bool main_loop_should_exit(int *status)
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


