Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8512CE7A95
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:02:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn3P-0000Ky-Hh; Mon, 25 Sep 2023 10:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn35-0008KI-4S
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2p-0002C5-TI
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:58:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405524e6740so43651105e9.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653921; x=1696258721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGpqbinWgFdcTh8orlOkSkjWWt1Ye8Jo/m++la5kzCk=;
 b=xO0RVHuo1+8EFKXadIV1xnk7eX9cWjIVRGvb+VBCWxFJkCJcwh+FA7TFVzeFwEhbUr
 M7xpbo+kgNF4QPeoojHwCRCncfxhnJShhL2M+wFvTSeP2uQ3vo6Tts2EBt/JO3LaVAdr
 gj9dnLVUYdhV1tBNqyriGS6bnZjCElXaTjd6N7jDI0pZxAT8o5E0XQwZ7yjo6YrVZj/u
 Vze4A1ecK7XRpP8Tx0fsxpCGuv0fx47iS071lH+ldQMdYr6JeaNrXgEjagehCZFXynoc
 zSkR+Sz0LVpJoRYRSMRP59dwlo7LJRb7aXGgPZrvcmeGcolYADofOyqEJgfBB16qQPO1
 3+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653921; x=1696258721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGpqbinWgFdcTh8orlOkSkjWWt1Ye8Jo/m++la5kzCk=;
 b=Tegw98rUPscOjPV5A96ZfybEuB1hhlEO90e9cuCDW4mtVIEQ/CNiX4IHxrsB5XE/JM
 lJOD7Fc1I5aQlLDOcinmuYPL4Hrbw2cHAieOlfaPOSvk/JfB8R0QlT72Ho16Go+SYqPf
 5yRoqh8kDFsndLTfUMOzmmY8UYaw9a3EqKdfW3gKlJtMqYfLlwPSydl1d4rlO7n4Mq5u
 1SIx869EEH+jIUr4Bg6DZc5NfXhqbOniXt9bDSTZYdrSfHpNWP0u548Gf0ZA9jBgzQb0
 hJgIEyA33sIOhG3/xpsGEHSEElNquNeKQNqAz53Le9cSIQDcsWI/HrYMMCrLCtVIflbJ
 OHLQ==
X-Gm-Message-State: AOJu0YwP8n499WNvsp75KMNVDOuLrEClpJAQrgzF2AHbR3QCi2mD1nAo
 0yYwRUgGiwz0SNvhZ19R7tWoNA==
X-Google-Smtp-Source: AGHT+IEb+hpsuPjYkc0JIZMBH1wz3xDTFHvAV+RFdtX6oPkfs0s1EF9T4PwglEGeZejoz0zpOAsSzA==
X-Received: by 2002:a05:600c:2296:b0:405:3455:de37 with SMTP id
 22-20020a05600c229600b004053455de37mr5597736wmf.1.1695653921200; 
 Mon, 25 Sep 2023 07:58:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a5d60c6000000b0031f300a4c26sm12038543wrt.93.2023.09.25.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:40 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 926931FFD3;
 Mon, 25 Sep 2023 15:48:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 29/31] sysemu: generalise qtest_warp_clock as
 qemu_clock_advance_virtual_time
Date: Mon, 25 Sep 2023 15:48:52 +0100
Message-Id: <20230925144854.1872513-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Move the key functionality of moving time forward into the clock
sub-system itself. This will allow us to plumb in time control into
plugins.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230519170454.2353945-7-alex.bennee@linaro.org>

---
v2
  - rename arg to target_ns
---
 include/qemu/timer.h | 15 +++++++++++++++
 softmmu/qtest.c      | 24 ++----------------------
 util/qemu-timer.c    | 26 ++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 9a91cb1248..aa30f693b0 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -245,6 +245,21 @@ bool qemu_clock_run_timers(QEMUClockType type);
  */
 bool qemu_clock_run_all_timers(void);
 
+/**
+ * qemu_clock_advance_virtual_time(): advance the virtual time tick
+ * @target_ns: target time in nanoseconds
+ *
+ * This function is used where the control of the flow of time has
+ * been delegated to outside the clock subsystem (be it qtest, icount
+ * or some other external source). You can ask the clock system to
+ * return @early at the first expired timer.
+ *
+ * Time can only move forward, attempts to reverse time would lead to
+ * an error.
+ *
+ * Returns: new virtual time.
+ */
+int64_t qemu_clock_advance_virtual_time(int64_t target_ns);
 
 /*
  * QEMUTimerList
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index bac1962efb..72a2ee7a31 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -336,26 +336,6 @@ void qtest_set_virtual_clock(int64_t count)
     qatomic_set_i64(&qtest_clock_counter, count);
 }
 
-static void qtest_clock_warp(int64_t dest)
-{
-    int64_t clock = cpus_get_virtual_clock();
-    AioContext *aio_context;
-    assert(qtest_enabled());
-    aio_context = qemu_get_aio_context();
-    while (clock < dest) {
-        int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
-                                                      QEMU_TIMER_ATTR_ALL);
-        int64_t warp = qemu_soonest_timeout(dest - clock, deadline);
-
-        cpus_set_virtual_clock(cpus_get_virtual_clock() + warp);
-
-        qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
-        timerlist_run_timers(aio_context->tlg.tl[QEMU_CLOCK_VIRTUAL]);
-        clock = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    }
-    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
-}
-
 static bool (*process_command_cb)(CharBackend *chr, gchar **words);
 
 void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words))
@@ -754,7 +734,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             ns = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                             QEMU_TIMER_ATTR_ALL);
         }
-        qtest_clock_warp(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns);
+        qemu_clock_advance_virtual_time(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns);
         qtest_send_prefix(chr);
         qtest_sendf(chr, "OK %"PRIi64"\n",
                     (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
@@ -780,7 +760,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(words[1]);
         ret = qemu_strtoi64(words[1], NULL, 0, &ns);
         g_assert(ret == 0);
-        qtest_clock_warp(ns);
+        qemu_clock_advance_virtual_time(ns);
         qtest_send_prefix(chr);
         qtest_sendf(chr, "OK %"PRIi64"\n",
                     (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 6a0de33dd2..213114be68 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -645,6 +645,11 @@ int64_t qemu_clock_get_ns(QEMUClockType type)
     }
 }
 
+static void qemu_virtual_clock_set_ns(int64_t time)
+{
+    return cpus_set_virtual_clock(time);
+}
+
 void init_clocks(QEMUTimerListNotifyCB *notify_cb)
 {
     QEMUClockType type;
@@ -675,3 +680,24 @@ bool qemu_clock_run_all_timers(void)
 
     return progress;
 }
+
+int64_t qemu_clock_advance_virtual_time(int64_t dest)
+{
+    int64_t clock = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    AioContext *aio_context;
+    aio_context = qemu_get_aio_context();
+    while (clock < dest) {
+        int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
+                                                      QEMU_TIMER_ATTR_ALL);
+        int64_t warp = qemu_soonest_timeout(dest - clock, deadline);
+
+        qemu_virtual_clock_set_ns(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + warp);
+
+        qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
+        timerlist_run_timers(aio_context->tlg.tl[QEMU_CLOCK_VIRTUAL]);
+        clock = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    }
+    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
+
+    return clock;
+}
-- 
2.39.2


