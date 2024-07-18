Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81176C3DA49
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 09:48:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sUNhl-0003nq-0M; Thu, 18 Jul 2024 05:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sUNhj-0003gf-Ay
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 05:45:39 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sUNhd-0007dz-IA
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 05:45:39 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a79fe8e6282so62631766b.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Jul 2024 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721295932; x=1721900732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y96L2Gm/13AJ5RhhShqLNnx0hUTQIR5fDVZBbdIxXM=;
 b=yOgMT/ZjMuDtH1ZTaQF/WMemtnEGu8H7XJaJsSq7C0ScksGdA4WmNu/EjxhJCQTYH9
 DgOSjzemBeb3A670wuHSBZZyVIof11L60BQ8keSGCBzwLk6XpQkhdcMHAvIlvAWSdGD5
 r6cVWJ49NIshYiFPXld2n+eV1dVV1zbTc0HBj+RHZ69ycfAQ0p/a9RdL/yoPvipy63Oq
 5nPTRgHKTLmZcSSa3JPQJTNDoE3rlLIVDarBy2HE7I1zX7SD33ZE/lLBP5AkjRvrRRcC
 IKNK3p4pEGf0IqiKsnPyXNwLXK/Zb9YjnjsxIYJmBlCDBelbGqHog7b/kYNNH2EGtGdz
 7P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721295932; x=1721900732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y96L2Gm/13AJ5RhhShqLNnx0hUTQIR5fDVZBbdIxXM=;
 b=ZN71zidpEHTVPxaMGNK+J86pDZB4h0ge+U/HCMaaPQ87Hp9KROO0mlU2bMlF/1xxI+
 9cIgOQ5qUuPU41ENirDJcCTqibVaNLfTeLFftbqgcao44iwCPzhqrCWfr8u3amxCeCEn
 IATqoUhgnDJd69ixJ520mZQcXbS+pBHChsR6uER9Uirg9NY3vzRXQsPQ5ZmGZHDi0kaD
 TSyGpqlX77dy5xKCoU/EfJLQiIv5oc+M+BpewPcC7y0BR0dEba4xc8hm+eGO+67cabz+
 Pi2u/4kudkrv67di3JvHrlX4JOYHe3TLJ5ZlITr8l3ezOysYKiMiJmfCKl7K0QPeKRbQ
 QSPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/nfg3W7R2SD1+1zna1emRXZTVs5f8In6EWXBulcQyHGLG58MQAw9v0DInEkCrrdHY3E4tc8PCghBIjz1n5Y5jpvzZQZk=
X-Gm-Message-State: AOJu0Yw+qhPhRLmTBaQvIye0Wz8UZhaBxrb7M2SGU9ykwKDPgfQbb2+t
 fCx07AvJdLaHPkyi9RAVDNAw6sviwRfkIWOHsHPWZVthSXDWlYikuV68RLhAQM8=
X-Google-Smtp-Source: AGHT+IEMtgQWa2SWM8LGmU7v2S283Kd75ZJnOHlBnAjVQMBqZRp26CAKLl31k2ZBNLXywoJsS8YIvw==
X-Received: by 2002:a17:906:5fd7:b0:a77:d8c9:ae23 with SMTP id
 a640c23a62f3a-a7a013bf072mr309693766b.59.1721295931807; 
 Thu, 18 Jul 2024 02:45:31 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b7f28sm535903766b.70.2024.07.18.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 02:45:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9404F5FA39;
 Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 06/15] tests/plugins: use qemu_plugin_outs for inline stats
Date: Thu, 18 Jul 2024 10:45:14 +0100
Message-Id: <20240718094523.1198645-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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

Using bare printf's in plugins is perfectly acceptable but they do
rather mess up the output of "make check-tcg". Convert the printfs to
use g_string and then output with the plugin output helper which will
already be captured to .pout files by the test harness.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/inline.c | 58 ++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/tests/plugin/inline.c b/tests/plugin/inline.c
index cd63827b7d..73dde99578 100644
--- a/tests/plugin/inline.c
+++ b/tests/plugin/inline.c
@@ -71,10 +71,12 @@ static void stats_insn(void)
     const uint64_t cond_track_left = qemu_plugin_u64_sum(insn_cond_track_count);
     const uint64_t conditional =
         cond_num_trigger * cond_trigger_limit + cond_track_left;
-    printf("insn: %" PRIu64 "\n", expected);
-    printf("insn: %" PRIu64 " (per vcpu)\n", per_vcpu);
-    printf("insn: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
-    printf("insn: %" PRIu64 " (cond cb)\n", conditional);
+    g_autoptr(GString) stats = g_string_new("");
+    g_string_append_printf(stats, "insn: %" PRIu64 "\n", expected);
+    g_string_append_printf(stats, "insn: %" PRIu64 " (per vcpu)\n", per_vcpu);
+    g_string_append_printf(stats, "insn: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    g_string_append_printf(stats, "insn: %" PRIu64 " (cond cb)\n", conditional);
+    qemu_plugin_outs(stats->str);
     g_assert(expected > 0);
     g_assert(per_vcpu == expected);
     g_assert(inl_per_vcpu == expected);
@@ -91,10 +93,12 @@ static void stats_tb(void)
     const uint64_t cond_track_left = qemu_plugin_u64_sum(tb_cond_track_count);
     const uint64_t conditional =
         cond_num_trigger * cond_trigger_limit + cond_track_left;
-    printf("tb: %" PRIu64 "\n", expected);
-    printf("tb: %" PRIu64 " (per vcpu)\n", per_vcpu);
-    printf("tb: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
-    printf("tb: %" PRIu64 " (conditional cb)\n", conditional);
+    g_autoptr(GString) stats = g_string_new("");
+    g_string_append_printf(stats, "tb: %" PRIu64 "\n", expected);
+    g_string_append_printf(stats, "tb: %" PRIu64 " (per vcpu)\n", per_vcpu);
+    g_string_append_printf(stats, "tb: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    g_string_append_printf(stats, "tb: %" PRIu64 " (conditional cb)\n", conditional);
+    qemu_plugin_outs(stats->str);
     g_assert(expected > 0);
     g_assert(per_vcpu == expected);
     g_assert(inl_per_vcpu == expected);
@@ -107,9 +111,11 @@ static void stats_mem(void)
     const uint64_t per_vcpu = qemu_plugin_u64_sum(count_mem);
     const uint64_t inl_per_vcpu =
         qemu_plugin_u64_sum(count_mem_inline);
-    printf("mem: %" PRIu64 "\n", expected);
-    printf("mem: %" PRIu64 " (per vcpu)\n", per_vcpu);
-    printf("mem: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    g_autoptr(GString) stats = g_string_new("");
+    g_string_append_printf(stats, "mem: %" PRIu64 "\n", expected);
+    g_string_append_printf(stats, "mem: %" PRIu64 " (per vcpu)\n", per_vcpu);
+    g_string_append_printf(stats, "mem: %" PRIu64 " (per vcpu inline)\n", inl_per_vcpu);
+    qemu_plugin_outs(stats->str);
     g_assert(expected > 0);
     g_assert(per_vcpu == expected);
     g_assert(inl_per_vcpu == expected);
@@ -118,6 +124,7 @@ static void stats_mem(void)
 static void plugin_exit(qemu_plugin_id_t id, void *udata)
 {
     const unsigned int num_cpus = qemu_plugin_num_vcpus();
+    g_autoptr(GString) stats = g_string_new("");
     g_assert(num_cpus == max_cpu_index + 1);
 
     for (int i = 0; i < num_cpus ; ++i) {
@@ -135,20 +142,21 @@ static void plugin_exit(qemu_plugin_id_t id, void *udata)
             qemu_plugin_u64_get(insn_cond_num_trigger, i);
         const uint64_t insn_cond_left =
             qemu_plugin_u64_get(insn_cond_track_count, i);
-        printf("cpu %d: tb (%" PRIu64 ", %" PRIu64
-               ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
-               ") | "
-               "insn (%" PRIu64 ", %" PRIu64
-               ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
-               ") | "
-               "mem (%" PRIu64 ", %" PRIu64 ")"
-               "\n",
-               i,
-               tb, tb_inline,
-               tb_cond_trigger, cond_trigger_limit, tb_cond_left,
-               insn, insn_inline,
-               insn_cond_trigger, cond_trigger_limit, insn_cond_left,
-               mem, mem_inline);
+        g_string_printf(stats, "cpu %d: tb (%" PRIu64 ", %" PRIu64
+                        ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
+                        ") | "
+                        "insn (%" PRIu64 ", %" PRIu64
+                        ", %" PRIu64 " * %" PRIu64 " + %" PRIu64
+                        ") | "
+                        "mem (%" PRIu64 ", %" PRIu64 ")"
+                        "\n",
+                        i,
+                        tb, tb_inline,
+                        tb_cond_trigger, cond_trigger_limit, tb_cond_left,
+                        insn, insn_inline,
+                        insn_cond_trigger, cond_trigger_limit, insn_cond_left,
+                        mem, mem_inline);
+        qemu_plugin_outs(stats->str);
         g_assert(tb == tb_inline);
         g_assert(insn == insn_inline);
         g_assert(mem == mem_inline);
-- 
2.39.2


