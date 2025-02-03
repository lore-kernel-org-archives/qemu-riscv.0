Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1973C02196
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:50:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1texlR-0000tJ-KD; Mon, 03 Feb 2025 09:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlM-0000qU-Cf
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:49:25 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1texlI-0003HW-Uz
 for qemu-riscv@nongnu.org; Mon, 03 Feb 2025 09:49:24 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab7157cf352so376720866b.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Feb 2025 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738594148; x=1739198948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkJVfCavNsBQMZBi92Kjm0ej3U2Pdiir6so6tZSVLo8=;
 b=llWg49HQy7LIUgk0ureWH1hH7ychITM+21b+zGQ9yzmdGmqRViUBr0irDAHrJ4V0UV
 V5a6JeZuJWokCU+LOtF55WqN+QIbQT8uPcqvIlT0uKWzmmhqPSY0rTBatFjR/rYHnqmU
 rQ/Y4tXI9C909GlVi1bh/ZUF2gpFVEOXZBH3PupnVSZ5Fidu0RAJb+1BMaTO+4tsvtoN
 ujGMavj8W3GfS+L4gMzvqS5tHyw8G4Qo41IrSwEgT7AdZl+XAj3+C45KNCRcUtF4enwI
 WjMcqDuzo4weH5mund4uAcgNCxxpx5ZdHmvzj4zKDXxMNbbaaS14eR6irKactMWMhq3l
 9Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738594148; x=1739198948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkJVfCavNsBQMZBi92Kjm0ej3U2Pdiir6so6tZSVLo8=;
 b=ifk5bK7pC2CqCvwe6fHni2F5rwNFjw69sl/vT09SMi0GZnk5tAicbdDUpKHhkdUx/r
 kQFpAiMC4tiKA8JbAMxKVsUmBK/v1hdLLPUEI92q/p2N40HpsTZzAaCJRU8qjeblkJS5
 nwXgnUzPqggZ7JZmazyHiBuV/aLJA5DVTBho0CtbaAiHgHPlUDDTQ8SIG/tJdHKurZ/u
 QujKNLcAjy/g5vqwZp4LVe6XQ///jENUNOwhlsqr8lyM4Ys1zh5voyLG5AbIebs4HURB
 Upphy5Wk9KYggIedbE+t/gebSQP33h6N9wlqRqOtexmzbdqGQYJ4dRjCgBWD+5bYGGxm
 HFNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7LpksGzYawDMJbExvd4xRhMDhZY07DW9oybYtH2h8jPGVwb71d4nMgIoGObLszWChf5WscELDXOIV@nongnu.org
X-Gm-Message-State: AOJu0YwKHhWPgPQ2iNse/z95G5Zlaep5D/sfYGsDoN7YSBx3Kmb7szZG
 SFf+ppVExWFur/tedeWRDRt9qOKx7LClnzAcib3f3AfPeaf0IPpgGCYUpGLStB4=
X-Gm-Gg: ASbGncvk/aTR2yRAK3rs79+szu//AXXA+KIxqlcK5+xRrbzyVx7aFasl5qK5F9texK8
 8topjhXFU+BRCz3iqGIlTmxVudEXV6b1pm5z4X1Q5GlDe4svEnO1MGXk7iOXg9atyVfFnRcVV0e
 Zh+uADsy+wCVaed5oa+TejmS2Bq8coEoISZhFfVYK8LNiVA85611gIXseLXwdjujUmGQpmJ/Frh
 iQKc3d42B4+Gi6kNlqJUsMGu4wPXm75U80uT6GBLyGhdzdPCsf93IMQnoTgTn8Ob9RSzQMAZSJj
 /0TrgIc31QyCT3B1YA==
X-Google-Smtp-Source: AGHT+IG/R51KQCA20rloLv6h0Yx+mgpOInhWpoetLZCdqvmzyD8160ZmwTltdG6Jk/YZg+WP0W0CNg==
X-Received: by 2002:a17:906:6a09:b0:aab:8311:951f with SMTP id
 a640c23a62f3a-ab6e0bc1e0fmr2196191966b.6.1738594147989; 
 Mon, 03 Feb 2025 06:49:07 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a318fasm764533766b.134.2025.02.03.06.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:49:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6901060E67;
 Mon,  3 Feb 2025 14:40:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-rust@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 17/18] tests/tcg: Add late gdbstub attach test
Date: Mon,  3 Feb 2025 14:40:47 +0000
Message-Id: <20250203144048.2131117-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203144048.2131117-1-alex.bennee@linaro.org>
References: <20250203144048.2131117-1-alex.bennee@linaro.org>
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.
Make sure that host_interrupt_signal is not visible to the guest.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20250117001542.8290-9-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/late-attach.c          | 41 ++++++++++++++++++++++
 tests/guest-debug/run-test.py              | 15 ++++++--
 tests/tcg/multiarch/Makefile.target        |  9 ++++-
 tests/tcg/multiarch/gdbstub/late-attach.py | 28 +++++++++++++++
 4 files changed, 90 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/multiarch/late-attach.c
 create mode 100644 tests/tcg/multiarch/gdbstub/late-attach.py

diff --git a/tests/tcg/multiarch/late-attach.c b/tests/tcg/multiarch/late-attach.c
new file mode 100644
index 0000000000..20a364034b
--- /dev/null
+++ b/tests/tcg/multiarch/late-attach.c
@@ -0,0 +1,41 @@
+/*
+ * Test attaching GDB to a running process.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+static const char *phase = "start";
+
+int main(void)
+{
+    sigset_t set;
+    int sig;
+
+    assert(sigfillset(&set) == 0);
+    assert(sigprocmask(SIG_BLOCK, &set, NULL) == 0);
+
+    /* Let GDB know it can send SIGUSR1. */
+    phase = "sigwait";
+    if (getenv("LATE_ATTACH_PY")) {
+        assert(sigwait(&set, &sig) == 0);
+        if (sig != SIGUSR1) {
+            fprintf(stderr, "Unexpected signal %d\n", sig);
+            return EXIT_FAILURE;
+        }
+    }
+
+    /* Check that the guest does not see host_interrupt_signal. */
+    assert(sigpending(&set) == 0);
+    for (sig = 1; sig < NSIG; sig++) {
+        if (sigismember(&set, sig)) {
+            fprintf(stderr, "Unexpected signal %d\n", sig);
+            return EXIT_FAILURE;
+        }
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 5a091db8be..75e9c92e03 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -36,6 +36,8 @@ def get_args():
     parser.add_argument("--gdb-args", help="Additional gdb arguments")
     parser.add_argument("--output", help="A file to redirect output to")
     parser.add_argument("--stderr", help="A file to redirect stderr to")
+    parser.add_argument("--no-suspend", action="store_true",
+                        help="Ask the binary to not wait for GDB connection")
 
     return parser.parse_args()
 
@@ -73,10 +75,19 @@ def log(output, msg):
 
     # Launch QEMU with binary
     if "system" in args.qemu:
+        if args.no_suspend:
+            suspend = ''
+        else:
+            suspend = ' -S'
         cmd = f'{args.qemu} {args.qargs} {args.binary}' \
-            f' -S -gdb unix:path={socket_name},server=on'
+            f'{suspend} -gdb unix:path={socket_name},server=on'
     else:
-        cmd = f'{args.qemu} {args.qargs} -g {socket_name} {args.binary}'
+        if args.no_suspend:
+            suspend = ',suspend=n'
+        else:
+            suspend = ''
+        cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
+            f' {args.binary}'
 
     log(output, "QEMU CMD: %s" % (cmd))
     inferior = subprocess.Popen(shlex.split(cmd))
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 18d3cf4ae0..688a6be203 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -130,6 +130,13 @@ run-gdbstub-follow-fork-mode-parent: follow-fork-mode
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/follow-fork-mode-parent.py, \
 	following parents on fork)
 
+run-gdbstub-late-attach: late-attach
+	$(call run-test, $@, env LATE_ATTACH_PY=1 $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" --no-suspend \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/late-attach.py, \
+	attaching to a running process)
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
@@ -139,7 +146,7 @@ EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
 	      run-gdbstub-registers run-gdbstub-prot-none \
 	      run-gdbstub-catch-syscalls run-gdbstub-follow-fork-mode-child \
 	      run-gdbstub-follow-fork-mode-parent \
-	      run-gdbstub-qxfer-siginfo-read
+	      run-gdbstub-qxfer-siginfo-read run-gdbstub-late-attach
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/late-attach.py b/tests/tcg/multiarch/gdbstub/late-attach.py
new file mode 100644
index 0000000000..1d40efb5ec
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/late-attach.py
@@ -0,0 +1,28 @@
+"""Test attaching GDB to a running process.
+
+SPDX-License-Identifier: GPL-2.0-or-later
+"""
+from test_gdbstub import main, report
+
+
+def run_test():
+    """Run through the tests one by one"""
+    try:
+        phase = gdb.parse_and_eval("phase").string()
+    except gdb.error:
+        # Assume the guest did not reach main().
+        phase = "start"
+
+    if phase == "start":
+        gdb.execute("break sigwait")
+        gdb.execute("continue")
+        phase = gdb.parse_and_eval("phase").string()
+    report(phase == "sigwait", "{} == \"sigwait\"".format(phase))
+
+    gdb.execute("signal SIGUSR1")
+
+    exitcode = int(gdb.parse_and_eval("$_exitcode"))
+    report(exitcode == 0, "{} == 0".format(exitcode))
+
+
+main(run_test)
-- 
2.39.5


