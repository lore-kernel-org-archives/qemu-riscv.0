Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46376CE7A96
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:59:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn2t-0008Fp-Ql; Mon, 25 Sep 2023 10:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2s-0008EN-DZ
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:58:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2o-0002Bs-Mr
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:58:46 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-405524e6768so43187615e9.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653921; x=1696258721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jM0GTpB8x8Pq4p+VnmvbtC3PXJVxvgAV0ON8qJJlT10=;
 b=qlCqC3xYjyDw/7bRVCE+hiWh5B6TGj1Qq3Ix+iSlBYQTl9vq+bYevMNeK9qQ+9JfIJ
 zrJCA+Hd8IMbGAIGQpsB85R261ST9XmWeHk6rBHo788lotywzs8W7x/XlsiWpUHqLuMY
 N1bnQVO8w3WY14BhRAizKVJawiLX1yEk9CW9rhrFt/N6dHmXhvXFd/G55QO7NwBhgVkW
 ZPy+pMlv73lsx5q5iUxcDQ7p7Gl2UePsefkD4JTT6kK/axZSP8qT4nXV8ulOEIKtJRxm
 28oFh+jk/HIISseTisAWiX5CNbC6nvHB3sqfedZlxHLGpoMib4EQ6+0P5MbFrJxrl09k
 nj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653921; x=1696258721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jM0GTpB8x8Pq4p+VnmvbtC3PXJVxvgAV0ON8qJJlT10=;
 b=Lz+3zu+w4tvuAHNlpcIpWgkHzlztiAQaBOy5sKn9aV3XkV/WKzOlRKg7eBAD68cq0j
 dv7yc30qIuqKpJAopAHdKACnmrcQ/ZIRRhBNqXqokRx67jwEd28BHrljtINUwtckq1z1
 9QKvHpYgBqsuzo1rpmREyR5n7dbzxTfiBpHwzV+pPB8qI1bDY8g3CQtva8juP6qerTrl
 7/ouMwN+s+F7dZltIfmgIUaEfgq5iQgISk+81R6Yvj2MdSlBsVj29Pu+ekAJ1ujOe1o6
 9UObZ8ZKRuAK95ViOYb9uDEK+ry33qQdKPnYTtNLot0rRdxv5sCsU7nJMvuHgl5BKG05
 mKdQ==
X-Gm-Message-State: AOJu0Yw8g3DnVIQ1yVwkMdmWit9jTwYiQtC+gw+4TIHMYkCytUXNl+3f
 lKBWvy3bvAEDtvfgagfg+Psi6A==
X-Google-Smtp-Source: AGHT+IF8BA3ifVNy6i7gY71DWPUdbeluWJ79bFNawmMMYbWpuO1wDrk0vftXMDDmYRbTdAoWSBTIsQ==
X-Received: by 2002:a05:600c:247:b0:401:b6f6:d90c with SMTP id
 7-20020a05600c024700b00401b6f6d90cmr6079242wmj.35.1695653921019; 
 Mon, 25 Sep 2023 07:58:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b004058e6379d8sm3826355wmz.23.2023.09.25.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:40 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 532431FFD1;
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
Subject: [RFC PATCH 27/31] sysemu: add set_virtual_time to accel ops
Date: Mon, 25 Sep 2023 15:48:50 +0100
Message-Id: <20230925144854.1872513-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

We are about to remove direct calls to individual accelerators for
this information and will need a central point for plugins to hook
into time changes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230519170454.2353945-5-alex.bennee@linaro.org>

---
v2
  - more kerneldoc annotations
---
 include/sysemu/accel-ops.h                    | 18 ++++++++++++-
 include/sysemu/cpu-timers.h                   | 27 ++++++++++++++++++-
 softmmu/cpus.c                                | 11 ++++++++
 ...t-virtual-clock.c => cpus-virtual-clock.c} |  5 ++++
 stubs/meson.build                             |  2 +-
 5 files changed, 60 insertions(+), 3 deletions(-)
 rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 3c1fab4b1e..224e85a649 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -20,7 +20,12 @@
 typedef struct AccelOpsClass AccelOpsClass;
 DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
 
-/* cpus.c operations interface */
+/**
+ * struct AccelOpsClass - accelerator interfaces
+ *
+ * This structure is used to abstract accelerator differences from the
+ * core CPU code. Not all have to be implemented.
+ */
 struct AccelOpsClass {
     /*< private >*/
     ObjectClass parent_class;
@@ -43,7 +48,18 @@ struct AccelOpsClass {
 
     void (*handle_interrupt)(CPUState *cpu, int mask);
 
+    /**
+     * @get_virtual_clock: fetch virtual clock
+     * @set_virtual_clock: set virtual clock
+     *
+     * These allow the timer subsystem to defer to the accelerator to
+     * fetch time. The set function is needed if the accelerator wants
+     * to track the changes to time as the timer is warped through
+     * various timer events.
+     */
     int64_t (*get_virtual_clock)(void);
+    void (*set_virtual_clock)(int64_t time);
+
     int64_t (*get_elapsed_ticks)(void);
 
     /* gdbstub hooks */
diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index 2e786fe7fb..31ab2bbd4e 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -84,8 +84,33 @@ int64_t cpu_get_clock(void);
 
 void qemu_timer_notify_cb(void *opaque, QEMUClockType type);
 
-/* get the VIRTUAL clock and VM elapsed ticks via the cpus accel interface */
+/**
+ * cpus_get_virtual_clock() - return current virtual clock.
+ *
+ * This is a wrapper around accelerator specific get_virtual_clock()
+ *
+ * Returns: ns of virtual time
+ */
 int64_t cpus_get_virtual_clock(void);
+
+/**
+ * cpus_set_virtual_clock() - set the virtual clock
+ * @new_time: new value in ns
+ *
+ * This is a wrapper around accelerator specific set_virtual_clock()
+ */
+void cpus_set_virtual_clock(int64_t new_time);
+
+/**
+ * cpus_get_elapsed_ticks() - get elapsed host time
+ *
+ * This is usually the current value of the host tick counter (i.e.
+ * not taking into account guest pauses). However some accelerators
+ * which want to keep elapsed time in sync with virtual time will
+ * return the virtual clock.
+ *
+ * Returns: ticks of elapsed host time (usually ns)
+ */
 int64_t cpus_get_elapsed_ticks(void);
 
 #endif /* SYSEMU_CPU_TIMERS_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 0848e0dbdb..b645c462e1 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -221,6 +221,17 @@ int64_t cpus_get_virtual_clock(void)
     return cpu_get_clock();
 }
 
+/*
+ * Signal the new virtual time to the accelerator. This is only needed
+ * by accelerators that need to track the changes as we warp time.
+ */
+void cpus_set_virtual_clock(int64_t new_time)
+{
+    if (cpus_accel && cpus_accel->set_virtual_clock) {
+        cpus_accel->set_virtual_clock(new_time);
+    }
+}
+
 /*
  * return the time elapsed in VM between vm_start and vm_stop.  Unless
  * icount is active, cpus_get_elapsed_ticks() uses units of the host CPU cycle
diff --git a/stubs/cpus-get-virtual-clock.c b/stubs/cpus-virtual-clock.c
similarity index 68%
rename from stubs/cpus-get-virtual-clock.c
rename to stubs/cpus-virtual-clock.c
index fd447d53f3..af7c1a1d40 100644
--- a/stubs/cpus-get-virtual-clock.c
+++ b/stubs/cpus-virtual-clock.c
@@ -6,3 +6,8 @@ int64_t cpus_get_virtual_clock(void)
 {
     return cpu_get_clock();
 }
+
+void cpus_set_virtual_clock(int64_t new_time)
+{
+    /* do nothing */
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index ef6e39a64d..2ea43ee076 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -5,7 +5,7 @@ stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
 stub_ss.add(files('cpu-get-clock.c'))
-stub_ss.add(files('cpus-get-virtual-clock.c'))
+stub_ss.add(files('cpus-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('icount.c'))
 stub_ss.add(files('dump.c'))
-- 
2.39.2


