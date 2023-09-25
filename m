Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D85CE7A95
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn3O-0000Jw-NW; Mon, 25 Sep 2023 10:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn36-0008LJ-BG
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2s-0002FE-9F
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:58:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32172f8a5dbso5537129f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653924; x=1696258724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzgHDvkSEQDHi8J0pZ97uLL1mOaFrktKKPN/mU4z0S8=;
 b=mzQuBc8APVtviKLxBms2E4zW8c584CMrVl3ikNySRg92S7TcXpecXd1H36fVj7HiPR
 pF6yJLqEb25mubZMC09MzpGpiOgAmQGBHtxug++86+7caqY9ueAl0JzsQMorAJbA/PPt
 wmAEBrnLlRb1Tsq/0BCJUT77Iz+iGCQOvxbxC3KfTJGZpBxSS7AikP30NSh+ovhH+ZVw
 TkBYxRNEah9je01MPtde7BvHhppw1kTWlB6l0uehbabr4dgY4dELac9p0HXJ+PWKBMic
 Cw1Hpp8NGEH7FyMEYt19x5ypHm/0zt8HBffdySr8kvM2rXhTz5yCEhEE8yrHXmYIhZh2
 NQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653924; x=1696258724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzgHDvkSEQDHi8J0pZ97uLL1mOaFrktKKPN/mU4z0S8=;
 b=HoIbVutRGPp/WRx/0EexN75yGvj/5v89Kn7icZvZyx3V4oabdyPMOwM+dKS9q7836H
 wAMPPZp2TUTvOi6M81l159e7P89klSQsQ2O8qXpiBQLaxv+TFezP/dqSkxMRL2kqLYG6
 rBdbY2ExbxLnlQIpF1pg4v+5d+ECHlACiEdTsfb0xeqYZKWUm/QeiRwd6rZV4qBa6Ye3
 MyNh0mxp5znofwd4lyKyYnEcslKS7B4aOdlwLTEs05TUhEaRB8Y8Q+cq0D/QMr7aRIAy
 0S6rKxUgrp0AwBgKJX5IAZnASul1SlO216Iy+IvOLb6rk8z6enlXY+pEv1E80860wQLI
 dIJw==
X-Gm-Message-State: AOJu0YxcL4nrewhFWy0sHp/yXqoR1BKR/HOS+hBrfcmWKSFdnDhG0pk9
 VT/e6DVghaObI2xdjWIP64sqkg==
X-Google-Smtp-Source: AGHT+IEK0Goz+dxJRznfKltKNgQq9qAmubNsDzadXtMcGR/Rnpytq7dHIOItqTM3umFDNRkCiWgnKA==
X-Received: by 2002:adf:fe49:0:b0:321:6fb0:9a84 with SMTP id
 m9-20020adffe49000000b003216fb09a84mr6392006wrs.37.1695653924221; 
 Mon, 25 Sep 2023 07:58:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a5d49c7000000b003176aa612b1sm12043674wrs.38.2023.09.25.07.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73C1E1FFD2;
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
Subject: [RFC PATCH 28/31] qtest: use cpu interface in qtest_clock_warp
Date: Mon, 25 Sep 2023 15:48:51 +0100
Message-Id: <20230925144854.1872513-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

This generalises the qtest_clock_warp code to use the AccelOps
handlers for updating its own sense of time. This will make the next
patch which moves the warp code closer to pure code motion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230519170454.2353945-6-alex.bennee@linaro.org>
---
 include/sysemu/qtest.h | 1 +
 accel/qtest/qtest.c    | 1 +
 softmmu/qtest.c        | 6 +++---
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/qtest.h b/include/sysemu/qtest.h
index 85f05b0e46..e1f69783d6 100644
--- a/include/sysemu/qtest.h
+++ b/include/sysemu/qtest.h
@@ -35,5 +35,6 @@ void qtest_server_set_send_handler(void (*send)(void *, const char *),
 void qtest_server_inproc_recv(void *opaque, const char *buf);
 
 int64_t qtest_get_virtual_clock(void);
+void qtest_set_virtual_clock(int64_t count);
 
 #endif
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index f6056ac836..53182e6c2a 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -52,6 +52,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
+    ops->set_virtual_clock = qtest_set_virtual_clock;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 35b643a274..bac1962efb 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -331,14 +331,14 @@ int64_t qtest_get_virtual_clock(void)
     return qatomic_read_i64(&qtest_clock_counter);
 }
 
-static void qtest_set_virtual_clock(int64_t count)
+void qtest_set_virtual_clock(int64_t count)
 {
     qatomic_set_i64(&qtest_clock_counter, count);
 }
 
 static void qtest_clock_warp(int64_t dest)
 {
-    int64_t clock = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t clock = cpus_get_virtual_clock();
     AioContext *aio_context;
     assert(qtest_enabled());
     aio_context = qemu_get_aio_context();
@@ -347,7 +347,7 @@ static void qtest_clock_warp(int64_t dest)
                                                       QEMU_TIMER_ATTR_ALL);
         int64_t warp = qemu_soonest_timeout(dest - clock, deadline);
 
-        qtest_set_virtual_clock(qtest_get_virtual_clock() + warp);
+        cpus_set_virtual_clock(cpus_get_virtual_clock() + warp);
 
         qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
         timerlist_run_timers(aio_context->tlg.tl[QEMU_CLOCK_VIRTUAL]);
-- 
2.39.2


