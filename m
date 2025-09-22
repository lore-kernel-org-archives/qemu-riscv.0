Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EFDCAC5A7
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:47:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d63-0006Qu-HU; Mon, 22 Sep 2025 05:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d58-0005Qn-4D
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:43:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0d4p-00020k-6u
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:43:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46cf7bbfda8so5910705e9.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758534196; x=1759138996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJwj+j8eqB6M9mWpUpDVKvrulXK41G81FN8FC0P+tiM=;
 b=cwnwBw1GD1DQRI8GNGXHNuuUG+pLGOdAmMAUBjvFMpReofIh3+1SYn8Q2Wgts9+iZp
 GRXw7TlPWY0ZXC6cqsBqC1hw0k/bj2Zvr8SyOMZoK3X/fInNA1rrCIiUb8DPsHcYMhVl
 VLqkiTuFykViqnxZa6stEtKN//alvdfhNGdMJHq6NsUnbvFpkNAuVova2yZLfIyVNuhL
 5ijh0uELCEZ4L2OFHwp96Bh3L7wi4DkX8HSPDdShcV9Byzw0oD40TWL+0RWe7VJGnvV6
 qziG0mht5Eh5IHEISc9Cax+TV8VbfuSiYLcwIrG3WaE++HzW6LCY2OefIk7a14cGlG7y
 gINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758534196; x=1759138996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJwj+j8eqB6M9mWpUpDVKvrulXK41G81FN8FC0P+tiM=;
 b=rlLqbKRDahDwTUlZQRXlg+oGZfizDeU/Kib6mcQbqoF/SnwG6COwU8PGdXp56B/JfL
 bcUOxvtPBVCiaIpP5iEWgIBqhalMzaiHpsevxNdZ30oKhFpU3+VChTaTKuKeBj/c1jbn
 O7MPNryw1nvy6mh2hie6sSbkrSuzKZR0KzxR9YTqcx+h+wEYdbOBqmJtQYcc4rT6Hx9P
 aP7FcPIQlRHEooVHCYQRBMOB2cmzDkrQ4vd0geKXJOXx10XE43KbfSe8J7uxhjMobxEv
 r5GtcW/16VABZqqv7Zz4Y7EOTB4o8IzNrbNrkiEFZV4br6GCYQhXGLYMC/Og32QV6ec4
 Wkmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcaQZXDu3LOzD89+YKrh3D/CM9deTSbifmoNL77KtEsTci+mG+sMIJr0iGoCHLZu0W+5LBmxOG7V7I@nongnu.org
X-Gm-Message-State: AOJu0YwNh0sUd/SKBLFtqEbFKJCqcsxti3OHFgTe7jiUYNO+JsuZ9Scn
 UyV9zWO6OfGaBSuyUgZgbLcmcX+/7d+DEZJ7G8yq8r1VGW/0FSzd9g0+G02D5eP4amg=
X-Gm-Gg: ASbGncuQRqVTUsTeTtdnXSbwhWmCguBsSAW+GGJWSikGC9YrFLVWPSC3CGGI+eW/z05
 vu4KAZ2yTiAGb9/eXGYBFeKhUurYHf/SxtLHinxMSTyF+/S9STAxR/E7yWtMk4QxTa7Sov/8LLQ
 CanBl4rP4LmEIignMP4LSEMnrb8ubPyHK7sDALTRLIdla2/HlebhTxX4gO3y6J7AODtafhI9pj1
 bKVqiGN+CI4wtQej6FK4FqZ8WgN92nxi9TcEMkqyyA6MM0qjv45jwHxJCNPbEUeORTCGHKrHYmM
 KByDFH2Pz/Y4KQWQ8x4pdo5uzUYK/hIGGSHLJL5oq9K/f5EtG2iHqlo42/9STCcLoDcKmhDJ1Qp
 EBSh3nDyYQAyUaRM5v1+YnRg=
X-Google-Smtp-Source: AGHT+IGDoTsFYJdgqoZIMublxEAaaaQBctARQxcyPBtmde2Zdg4+BEMqIAp5Ohna5qgwCyNPjQuYuQ==
X-Received: by 2002:a05:600c:a02:b0:459:d645:bff7 with SMTP id
 5b1f17b1804b1-467e7f7d5bamr120743635e9.12.1758534196412; 
 Mon, 22 Sep 2025 02:43:16 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d5d437b90sm30823985e9.13.2025.09.22.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:43:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A1D6B5FA53;
 Mon, 22 Sep 2025 10:37:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 22/25] contrib/plugins/uftrace: generate additional files for
 uftrace
Date: Mon, 22 Sep 2025 10:37:07 +0100
Message-ID: <20250922093711.2768983-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Beyond traces per cpu, uftrace expect to find some specific files.
- info: contains information about machine/program run
  those values are not impacting uftrace behaviour (only reported by
  uftrace info), and we simply added empty strings.
- memory mapping: how every binary is mapped in memory. For system mode,
  we generate an empty mapping (uftrace_symbols.py, coming in future
  commit, will take care of that). For user mode, we copy current
  /proc/self/maps. We don't need to do any special filtering, as
  reported addresses will necessarily concern guest program, and not
  QEMU and its libraries.
- task: list of tasks. We present every vcpu/privilege level as a
  separate process, as it's the best view we can have when generating a
  (visual) chrome trace. Using threads is less convenient in terms of
  UI.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250902075042.223990-7-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/uftrace.c | 131 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
index 10abad0673c..2386cc723bc 100644
--- a/contrib/plugins/uftrace.c
+++ b/contrib/plugins/uftrace.c
@@ -118,6 +118,127 @@ static uint64_t gettime_ns(void)
     return now_ns;
 }
 
+static void uftrace_write_map(bool system_emulation)
+{
+    const char *path = "./uftrace.data/sid-0.map";
+
+    if (system_emulation && access(path, F_OK) == 0) {
+        /* do not erase existing map in system emulation, as a custom one might
+         * already have been generated by uftrace_symbols.py */
+        return;
+    }
+
+    FILE *sid_map = fopen(path, "w");
+    g_assert(sid_map);
+
+    if (system_emulation) {
+        fprintf(sid_map,
+                "# map stack on highest address possible, to prevent uftrace\n"
+                "# from considering any kernel address\n");
+        fprintf(sid_map,
+          "ffffffffffff-ffffffffffff rw-p 00000000 00:00 0 [stack]\n");
+    } else {
+        /* in user mode, copy /proc/self/maps instead */
+        FILE *self_map = fopen("/proc/self/maps", "r");
+        g_assert(self_map);
+        for (;;) {
+            int c = fgetc(self_map);
+            if (c == EOF) {
+                break;
+            }
+            fputc(c, sid_map);
+        }
+        fclose(self_map);
+    }
+    fclose(sid_map);
+}
+
+static void uftrace_write_task(const GArray *traces)
+{
+    FILE *task = fopen("./uftrace.data/task.txt", "w");
+    g_assert(task);
+    for (int i = 0; i < traces->len; ++i) {
+        Trace *t = g_array_index(traces, Trace*, i);
+        fprintf(task, "SESS timestamp=0.0 pid=%"PRIu32" sid=0 exename=\"%s\"\n",
+                t->id, t->name->str);
+        fprintf(task, "TASK timestamp=0.0 tid=%"PRIu32" pid=%"PRIu32"\n",
+                t->id, t->id);
+    }
+    fclose(task);
+}
+
+static void uftrace_write_info(const GArray *traces)
+{
+    g_autoptr(GString) taskinfo_tids = g_string_new("taskinfo:tids=");
+    for (int i = 0; i < traces->len; ++i) {
+        Trace *t = g_array_index(traces, Trace*, i);
+        const char *delim = i > 0 ? "," : "";
+        g_string_append_printf(taskinfo_tids, "%s%"PRIu32, delim, t->id);
+    }
+
+    g_autoptr(GString) taskinfo_nr_tid = g_string_new("taskinfo:nr_tid=");
+    g_string_append_printf(taskinfo_nr_tid, "%d", traces->len);
+
+    FILE *info = fopen("./uftrace.data/info", "w");
+    g_assert(info);
+    /*
+     * $ uftrace dump --debug
+     * uftrace file header: magic         = 4674726163652100
+     * uftrace file header: version       = 4
+     * uftrace file header: header size   = 40
+     * uftrace file header: endian        = 1 (little)
+     * uftrace file header: class          = 2 (64 bit)
+     * uftrace file header: features      = 0x1263 (PLTHOOK | ...
+     * uftrace file header: info          = 0x7bff (EXE_NAME | ...
+     *  <0000000000000000>: 46 74 72 61 63 65 21 00  04 00 00 00 28 00 01 02
+     *  <0000000000000010>: 63 12 00 00 00 00 00 00  ff 7b 00 00 00 00 00 00
+     *  <0000000000000020>: 00 04 00 00 00 00 00 00
+     */
+    const uint8_t header[] = {0x46, 0x74, 0x72, 0x61, 0x63, 0x65, 0x21, 0x00,
+                              0x04, 0x00, 0x00, 0x00, 0x28, 0x00, 0x01, 0x02,
+                              0x63, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+                              0xff, 0x7b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+                              0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+    size_t wrote = fwrite(header, sizeof(header), 1, info);
+    g_assert(wrote == 1);
+    const char *info_data[] = {
+        "exename:",
+        "build_id:0000000000000000000000000000000000000000",
+        "exit_status:",
+        "cmdline:",
+        "cpuinfo:lines=2",
+        "cpuinfo:nr_cpus=",
+        "cpuinfo:desc=",
+        "meminfo:",
+        "osinfo:lines=3",
+        "osinfo:kernel=",
+        "osinfo:hostname=",
+        "osinfo:distro=",
+        "taskinfo:lines=2",
+        taskinfo_nr_tid->str,
+        taskinfo_tids->str,
+        "usageinfo:lines=6",
+        "usageinfo:systime=",
+        "usageinfo:usrtime=",
+        "usageinfo:ctxsw=",
+        "usageinfo:maxrss=",
+        "usageinfo:pagefault=",
+        "usageinfo:iops=",
+        "loadinfo:",
+        "record_date:",
+        "elapsed_time:",
+        "pattern_type:regex",
+        "uftrace_version:",
+        "utc_offset:",
+        0};
+    const char **info_data_it = info_data;
+    while (*(info_data_it)) {
+        fprintf(info, "%s\n", *info_data_it);
+        ++info_data_it;
+    }
+    fclose(info);
+}
+
 static Callstack *callstack_new(void)
 {
     Callstack *cs = g_new0(Callstack, 1);
@@ -612,14 +733,22 @@ static void vcpu_end(unsigned int vcpu_index)
 
 static void at_exit(qemu_plugin_id_t id, void *data)
 {
+    bool system_emulation = (bool) data;
+    g_autoptr(GArray) traces = g_array_new(0, 0, sizeof(Trace *));
+
     for (size_t i = 0; i < qemu_plugin_num_vcpus(); ++i) {
         Cpu *cpu = qemu_plugin_scoreboard_find(score, i);
         for (size_t j = 0; j < cpu->traces->len; ++j) {
             Trace *t = g_array_index(cpu->traces, Trace*, j);
             trace_flush(t, true);
+            g_array_append_val(traces, t);
         }
     }
 
+    uftrace_write_map(system_emulation);
+    uftrace_write_info(traces);
+    uftrace_write_task(traces);
+
     for (size_t i = 0; i < qemu_plugin_num_vcpus(); ++i) {
         vcpu_end(i);
     }
@@ -656,7 +785,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     score = qemu_plugin_scoreboard_new(sizeof(Cpu));
     qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
-    qemu_plugin_register_atexit_cb(id, at_exit, NULL);
+    qemu_plugin_register_atexit_cb(id, at_exit, (void *) info->system_emulation);
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
 
     return 0;
-- 
2.47.3


