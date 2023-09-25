Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46661CE7A95
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:59:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkn3J-0000Ar-VW; Mon, 25 Sep 2023 10:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn35-0008Kv-9a
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:59:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkn2r-0002Eb-K3
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 10:58:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40537481094so64524765e9.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653924; x=1696258724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKXyxkZjkgMHzhbh3Oq/XROWT/WyaO+gDU9Mjp58TiI=;
 b=v4+LzZ0qKbYpVrBm6g7rdVJQ8kcfUnpsf7UwmNcPdeG0i8DpQt38mJXhXdN/ITGRnG
 zrFI6EgINpKA3T4dRNzEHwrTS3syn4Ai/GcfIkxAUGtWKYb0VqUTVW1E9Qs/NLokJmk+
 kLyRC2wPJ0EOc/LpE7YntaKyfRbDusE+6R/yqB7B88ALXPnPQYgAqt/3c3GlcdvdPDfG
 wXKMTIzVzy/wURDyvciSnr8JFdjkfWFlWvRFYDt93vPUSzmexosIj0dmYweq706Gfg5w
 g4t5+fJplIs4N5tBzI0qKgZgPojh16fpONsjvzIpaoJR8sK0xSCqfILVepQRL2ou0mJK
 rgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653924; x=1696258724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKXyxkZjkgMHzhbh3Oq/XROWT/WyaO+gDU9Mjp58TiI=;
 b=PbtNpH13TsktDCOACVLPVDOte7Wx8oSAL70s1tX55HNGBAhWiiipVsTT12tJHm/Q0n
 gdrw32d7hXN6xhcdBgLRqsLe0XPF77bJX6QApeNstGYGpKInilYDfMoOuyEP3locJIX4
 1bXbPurNPNUwhq+UEYjKoyGzpJ/p8QRPJ9qOeKcUXwBxIe2EgSDZJiAWni227YZkIzKy
 0nrT9dkpbjzPr0t6n9JdvTHzaj+8S8qlufINYY8se+DS5Pn9S2sMAwNjg2JYI0z9przm
 gmWFbriymWl8e4xq6Cw0p1QQ0NnNmlhJPSklUh/jszMzaYjEcO61pvDHFg6rUQ4TtmXB
 +y6g==
X-Gm-Message-State: AOJu0YxxmH7skPg2baZwtMKMU5bHxfqNd1x5ohPabwcacPGZXSJwpLrE
 HluLuFPUL6EqCvZZSiSNdqGXRg==
X-Google-Smtp-Source: AGHT+IGWbUjxohdjoGUz1NACjFC7lPrzbzSjOIinfeWPBprq1qiMF15BclJ+KgJx8fxJhUxcDhDCPA==
X-Received: by 2002:a05:600c:230b:b0:3fe:d448:511a with SMTP id
 11-20020a05600c230b00b003fed448511amr6821322wmo.9.1695653923716; 
 Mon, 25 Sep 2023 07:58:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a7bc40c000000b00403038d7652sm12457849wmi.39.2023.09.25.07.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:58:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D967B1FFD6;
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
Subject: [RFC PATCH 31/31] contrib/plugins: add iops plugin example for cost
 modelling
Date: Mon, 25 Sep 2023 15:48:54 +0100
Message-Id: <20230925144854.1872513-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

This plugin uses the new time control interface to make decisions
about the state of time during the emulation. The algorithm is
currently very simple. The user specifies an iops rate which applies
per core. If the core runs ahead of its allocated execution time the
plugin sleeps for a bit to let real time catch up. Either way time as
updated for the emulation as a function of total executed instructions
with some adjustments for cores that idle.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230519170454.2353945-9-alex.bennee@linaro.org>

---
v2
  - fix various style issues
---
 contrib/plugins/iops.c   | 261 +++++++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile |   1 +
 2 files changed, 262 insertions(+)
 create mode 100644 contrib/plugins/iops.c

diff --git a/contrib/plugins/iops.c b/contrib/plugins/iops.c
new file mode 100644
index 0000000000..6f8baca6f7
--- /dev/null
+++ b/contrib/plugins/iops.c
@@ -0,0 +1,261 @@
+/*
+ * iops rate limiting plugin.
+ *
+ * This plugin can be used to restrict the execution of a system to a
+ * particular number of Instructions Per Second (IOPS). This controls
+ * time as seen by the guest so while wall-clock time may be longer
+ * from the guests point of view time will pass at the normal rate.
+ *
+ * This uses the new plugin API which allows the plugin to control
+ * system time.
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdio.h>
+#include <glib.h>
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+#define SLICES 10 /* the number of slices per second we compute delay */
+
+static GMutex global_state_lock;
+
+static uint64_t iops = 1000000;  /* iops rate, per core, per second */
+static uint64_t current_ticks;   /* current global ticks */
+static uint64_t next_check;      /* the next checkpoint for time */
+static bool precise_execution;   /* count every instruction */
+
+static int64_t systime_at_start;  /* time we started the first vCPU */
+
+static const uint64_t nsec_per_sec = 1000000000;
+static const void *time_handle;
+
+/*
+ * We need to track the number of instructions each vCPU has executed
+ * as well as what its current state is. We need to account for time
+ * passing while a vCPU is idle.
+ */
+
+typedef enum {
+    UNKNOWN = 0,
+    CREATED,
+    EXECUTING,
+    IDLE,
+    FINISHED
+} vCPUState;
+
+typedef struct {
+    /* pointer to vcpu counter entry */
+    uint64_t *counter;
+    vCPUState state;
+    /* timestamp when vCPU entered state */
+    uint64_t state_time;
+    /* number of ns vCPU was idle */
+    uint64_t total_idle;
+} vCPUTime;
+
+GArray *vcpus;
+uint64_t *vcpu_counters;
+
+/*
+ * Get the vcpu structure for this vCPU. We don't do any locking here
+ * as only one vCPU will ever access its own structure.
+ */
+static vCPUTime *get_vcpu(int cpu_index)
+{
+    return &g_array_index(vcpus, vCPUTime, cpu_index);
+}
+
+/*
+ * When emulation is running faster than real time this is the point
+ * we can throttle the execution of a given vCPU. Either way we can
+ * now tell the system to move time forward.
+ */
+static void update_system_time(int64_t vcpu_ticks)
+{
+    int64_t now = g_get_real_time();
+    int64_t real_runtime_ns = now - systime_at_start;
+
+    g_mutex_lock(&global_state_lock);
+    /* now we have the lock double check we are fastest */
+    if (vcpu_ticks > next_check) {
+
+        int64_t tick_runtime_ns = (vcpu_ticks / iops) * nsec_per_sec;
+        if (tick_runtime_ns > real_runtime_ns) {
+            int64_t sleep_us = (tick_runtime_ns - real_runtime_ns) / 1000;
+            g_usleep(sleep_us);
+        }
+
+        /* Having slept we can now move the clocks forward */
+        qemu_plugin_update_ns(time_handle, vcpu_ticks);
+        current_ticks = vcpu_ticks;
+        next_check = iops / SLICES;
+    }
+    g_mutex_unlock(&global_state_lock);
+}
+
+/*
+ * State tracking
+ */
+static void vcpu_init(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    vCPUTime *vcpu = get_vcpu(cpu_index);
+    vcpu->state = CREATED;
+    vcpu->state_time = *vcpu->counter;
+
+    g_mutex_lock(&global_state_lock);
+    if (!systime_at_start) {
+        systime_at_start = g_get_real_time();
+    }
+    g_mutex_unlock(&global_state_lock);
+}
+
+static void vcpu_idle(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    vCPUTime *vcpu = get_vcpu(cpu_index);
+    vcpu->state = IDLE;
+    vcpu->state_time = *vcpu->counter;
+
+    /* handle when we are the last vcpu to sleep here */
+}
+
+static void vcpu_resume(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    vCPUTime *vcpu = get_vcpu(cpu_index);
+
+    /*
+     * Now we need to reset counter to something approximating the
+     * current time, however we only update current_ticks when a block
+     * exceeds next_check. If the vCPU has been asleep for awhile this
+     * will probably do, otherwise lets pick somewhere between
+     * current_ticks and the next_check value.
+     */
+    if (vcpu->state_time < current_ticks) {
+        *vcpu->counter = current_ticks;
+    } else {
+        int64_t window = next_check - vcpu->state_time;
+        *vcpu->counter = next_check - (window / 2);
+    }
+
+    vcpu->state = EXECUTING;
+    vcpu->state_time = *vcpu->counter;
+}
+
+static void vcpu_exit(qemu_plugin_id_t id, unsigned int cpu_index)
+{
+    vCPUTime *vcpu = get_vcpu(cpu_index);
+    vcpu->state = FINISHED;
+    vcpu->state_time = *vcpu->counter;
+}
+
+/*
+ * tb exec
+ */
+static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
+{
+    vCPUTime *vcpu = get_vcpu(cpu_index);
+    uint64_t count = *vcpu->counter;
+
+    count += GPOINTER_TO_UINT(udata);
+
+    if (count >= next_check) {
+        update_system_time(count);
+    }
+}
+
+/*
+ * We have two choices at translation time. In imprecise mode we just
+ * install a tb execution callback with the total number of
+ * instructions in the block. This ignores any partial execution
+ * effects but it reasonably fast. In precise mode we increment a
+ * per-vCPU counter for every execution.
+ */
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    size_t n_insns = qemu_plugin_tb_n_insns(tb);
+    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
+                                         QEMU_PLUGIN_CB_NO_REGS,
+                                         GUINT_TO_POINTER(n_insns));
+}
+
+/**
+ * Install the plugin
+ */
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    /* This plugin only makes sense for system emulation */
+    if (!info->system_emulation) {
+        fprintf(stderr, "iops plugin only works with system emulation\n");
+        return -1;
+    }
+
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "iops") == 0) {
+            iops = g_ascii_strtoull(tokens[1], NULL, 10);
+            if (!iops && errno) {
+                fprintf(stderr, "%s: couldn't parse %s (%s)\n",
+                        __func__, tokens[1], g_strerror(errno));
+                return -1;
+            }
+
+        } else if (g_strcmp0(tokens[0], "precise") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1],
+                                        &precise_execution)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
+    }
+
+    /*
+     * Setup the tracking information we need to run.
+     */
+    vcpus = g_array_new(true, true, sizeof(vCPUTime));
+    g_array_set_size(vcpus, info->system.max_vcpus);
+    vcpu_counters = g_malloc0_n(info->system.max_vcpus, sizeof(uint64_t));
+    for (int i = 0; i < info->system.max_vcpus; i++) {
+        vCPUTime *vcpu = get_vcpu(i);
+        vcpu->counter = &vcpu_counters[i];
+    }
+
+    /*
+     * We are going to check the state of time every slice so set the
+     * first check at t0 + iops/SLICES
+     */
+    next_check = iops / SLICES;
+
+    /*
+     * Only one plugin can request time control, if we don't get the
+     * handle there isn't much we can do.
+     */
+    time_handle = qemu_plugin_request_time_control();
+    if (!time_handle) {
+        fprintf(stderr, "%s: not given permission to control time\n", __func__);
+        return -1;
+    }
+
+    /*
+     * To track time we need to measure how many instructions each
+     * core is executing as well as when each vcpu enters/leaves the
+     */
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+
+    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
+    qemu_plugin_register_vcpu_idle_cb(id, vcpu_idle);
+    qemu_plugin_register_vcpu_resume_cb(id, vcpu_resume);
+    qemu_plugin_register_vcpu_exit_cb(id, vcpu_exit);
+
+    return 0;
+}
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 8ba78c7a32..3f45a46a03 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -21,6 +21,7 @@ NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
+NAMES += iops
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
-- 
2.39.2


