Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7A6C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:01:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0MD-0000rW-77; Fri, 03 Nov 2023 16:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0L8-0008EG-Hh
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:31 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Kt-0005ZT-Gh
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:20 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5028e5b88so34523321fa.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041605; x=1699646405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbQqPl1wVNYxd0CzmxfNEkNdh3wsVxsN8qD8MQTh82Y=;
 b=Y78hCaDASpWa5A9W2s217PIst86iYtoBQrOAh8i6JmCTqNRBV8jPJxlXUCbGtv+5NW
 F2Ik+y/nCXmaqfwpBGurZ6MHl4aDbti9uUoC7beeQQXI/Fg1KOsmzKRljiYcmLY+oc1R
 wnXrUImJti6EGVYaTUZ6oAzWDznkWRLc8dppQM+dxc6o6jahGCTiQDT19vczHlyOMOHy
 s8EXtfVLvyUejXwaUGecSkqHUgeQbmdF8gtpuoCd/Y6j2kQKv9eiSKrcUCewZywdAz4N
 dsm5RNO26fP1l9/RrsMN64j6OhjYNfmwnH/xfjvor3WPaOsSepDhbCBjTZefqdz6C8jG
 UqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041605; x=1699646405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbQqPl1wVNYxd0CzmxfNEkNdh3wsVxsN8qD8MQTh82Y=;
 b=ny1py54GCiVprCedxFV6vbC9v1B5BB6eOerr4RFF9sdjB/0TM4OTbqS2DA6wCjoLFG
 v3ngcC0JPjR5oQRn8DkU7KPsxIg2ZFfXMiqQH2LvUHrtNAgbcwzbBCdJSuyarwYTRfoE
 hoIlsyhzo9jaVMWvwm0K0wBDx/y1rqS5dBIUb49IvQsVKLk78F+hgNauQJoXb2tLjumO
 OwXG56frwNrbCne130nTknOms/28BAK0GiujcsuuPPS3Fy5Z4NPTjDYc/RckfCh/kxPr
 13v0NbuEfKhfseIS/G2alSWtnKDL9a9W0zsOTnbytWARlf66f/xoBlrkI6xKAdQFxrXS
 31pQ==
X-Gm-Message-State: AOJu0Yy0GnQfQVWOUKIRbm2X1ofTUMCi3EFpzYx+NRMt9dRcXgUE8Kee
 kZ7MqadBGCwgNLbPzRLHizZpYg==
X-Google-Smtp-Source: AGHT+IEMGxG9Ojt80622JeLUfN/qU7UYMPAMxUNlKbrJW2/TF43g0r/5eIvOiknzDBZnCXNnHwBaEg==
X-Received: by 2002:a2e:be0c:0:b0:2c5:1bd9:f95c with SMTP id
 z12-20020a2ebe0c000000b002c51bd9f95cmr21692618ljq.53.1699041605096; 
 Fri, 03 Nov 2023 13:00:05 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i20-20020a05600c355400b0040839fcb217sm3520792wmq.8.2023.11.03.12.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:00:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3C4AD65745;
 Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Luis Machado <luis.machado@linaro.org>
Subject: [PATCH 06/29] tests/tcg: add an explicit gdbstub register tester
Date: Fri,  3 Nov 2023 19:59:33 +0000
Message-Id: <20231103195956.1998255-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x229.google.com
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

We already do a couple of "info registers" for specific tests but this
is a more comprehensive multiarch test. It also has some output
helpful for debugging the gdbstub by showing which XML features are
advertised and what the underlying register numbers are.

My initial motivation was to see if there are any duplicate register
names exposed via the gdbstub while I was reviewing the proposed
register interface for TCG plugins.

Mismatches between the xml and remote-desc are reported for debugging
but do not fail the test.

Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Luis Machado <luis.machado@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231012170426.1335442-1-alex.bennee@linaro.org>

---
v2
  - remove python2 compat bits
  - add SPDX header, clean up comment lines
  - fix duplicate check
  - use field 6 (Rmt Nr) instead of field 1 (Nr) for cross-check
  - more useful output on finding a duplicates and missing regs
  - handle non-XML targets cleanly
---
 tests/tcg/multiarch/Makefile.target           |  11 +-
 tests/tcg/multiarch/gdbstub/registers.py      | 188 ++++++++++++++++++
 .../multiarch/system/Makefile.softmmu-target  |  13 +-
 3 files changed, 210 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/registers.py

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index f3bfaf1a22..d31ba8d6ae 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -93,12 +93,21 @@ run-gdbstub-thread-breakpoint: testthread
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
 	hitting a breakpoint on non-main thread)
+
+run-gdbstub-registers: sha512
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/registers.py, \
+	checking register enumeration)
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
 endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
-	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint
+	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint \
+	      run-gdbstub-registers
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/registers.py b/tests/tcg/multiarch/gdbstub/registers.py
new file mode 100644
index 0000000000..2aa0c30165
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/registers.py
@@ -0,0 +1,188 @@
+# Exercise the register functionality by exhaustively iterating
+# through all supported registers on the system.
+#
+# This is launched via tests/guest-debug/run-test.py but you can also
+# call it directly if using it for debugging/introspection:
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import gdb
+import sys
+import xml.etree.ElementTree as ET
+
+initial_vlen = 0
+failcount = 0
+
+def report(cond, msg):
+    "Report success/fail of test."
+    if cond:
+        print("PASS: %s" % (msg))
+    else:
+        print("FAIL: %s" % (msg))
+        global failcount
+        failcount += 1
+
+
+def fetch_xml_regmap():
+    """
+    Iterate through the XML descriptions and validate.
+
+    We check for any duplicate registers and report them. Return a
+    reg_map hash containing the names, regnums and initial values of
+    all registers.
+    """
+
+    # First check the XML descriptions we have sent. Most arches
+    # support XML but a few of the ancient ones don't in which case we
+    # need to gracefully fail.
+
+    try:
+        xml = gdb.execute("maint print xml-tdesc", False, True)
+    except (gdb.error):
+        print("SKIP: target does not support XML")
+        return None
+
+    total_regs = 0
+    reg_map = {}
+    frame = gdb.selected_frame()
+
+    tree = ET.fromstring(xml)
+    for f in tree.findall("feature"):
+        name = f.attrib["name"]
+        regs = f.findall("reg")
+
+        total = len(regs)
+        total_regs += total
+        base = int(regs[0].attrib["regnum"])
+        top = int(regs[-1].attrib["regnum"])
+
+        print(f"feature: {name} has {total} registers from {base} to {top}")
+
+        for r in regs:
+            name = r.attrib["name"]
+            regnum = int(r.attrib["regnum"])
+            value = frame.read_register(name).__str__()
+            entry = { "name": name, "initial": value, "regnum": regnum }
+
+            if name in reg_map:
+                report(False, f"duplicate register {entry} vs {reg_map[name]}")
+                continue
+
+            reg_map[name] = entry
+
+    # Validate we match
+    report(total_regs == len(reg_map.keys()),
+           f"counted all {total_regs} registers in XML")
+
+    return reg_map
+
+def crosscheck_remote_xml(reg_map):
+    """
+    Cross-check the list of remote-registers with the XML info.
+    """
+
+    remote = gdb.execute("maint print remote-registers", False, True)
+    r_regs = remote.split("\n")
+
+    total_regs = len(reg_map.keys())
+    total_r_regs = 0
+
+    for r in r_regs:
+        fields = r.split()
+        # Some of the registers reported here are "pseudo" registers that
+        # gdb invents based on actual registers so we need to filter them
+        # out.
+        if len(fields) == 8:
+            r_name = fields[0]
+            r_regnum = int(fields[6])
+
+            # check in the XML
+            try:
+                x_reg = reg_map[r_name]
+                x_reg["seen"] = True
+            except KeyError:
+                report(False, "{r_name} not in XML description")
+                continue
+
+            x_regnum = x_reg["regnum"]
+            if r_regnum != x_regnum:
+                report(False, f"{r_name} {r_regnum} == {x_regnum} (xml)")
+            else:
+                total_r_regs += 1
+
+    # Just print a mismatch in totals as gdb will filter out 64 bit
+    # registers on a 32 bit machine. Also print what is missing to
+    # help with debug.
+    if total_regs != total_r_regs:
+        print(f"xml-tdesc ({total_regs}) and remote-registers ({total_r_regs}) do not agree")
+
+        for x_key in reg_map.keys():
+            x_reg = reg_map[x_key]
+            if "seen" not in x_reg:
+                print(f"{x_reg} wasn't seen in remote-registers")
+
+def complete_and_diff(reg_map):
+    """
+    Let the program run to (almost) completion and then iterate
+    through all the registers we know about and report which ones have
+    changed.
+    """
+    # Let the program get to the end and we can check what changed
+    gdb.Breakpoint("_exit")
+    gdb.execute("continue")
+
+    frame = gdb.selected_frame()
+    changed = 0
+
+    for e in reg_map.values():
+        name = e["name"]
+        old_val = e["initial"]
+
+        try:
+            new_val = frame.read_register(name).__str__()
+        except:
+            report(False, f"failed to read {name} at end of run")
+            continue
+
+        if new_val != old_val:
+            print(f"{name} changes from {old_val} to {new_val}")
+            changed += 1
+
+    # as long as something changed we can be confident its working
+    report(changed > 0, f"{changed} registers were changed")
+
+
+def run_test():
+    "Run through the tests"
+
+    reg_map = fetch_xml_regmap()
+
+    if reg_map is not None:
+        crosscheck_remote_xml(reg_map)
+        complete_and_diff(reg_map)
+
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
+try:
+    inferior = gdb.selected_inferior()
+    arch = inferior.architecture()
+    print("ATTACHED: %s" % arch.name())
+except (gdb.error, AttributeError):
+    print("SKIPPING (not connected)", file=sys.stderr)
+    exit(0)
+
+if gdb.parse_and_eval('$pc') == 0:
+    print("SKIP: PC not set")
+    exit(0)
+
+try:
+    run_test()
+except (gdb.error):
+    print ("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    pass
+
+print("All tests complete: %d failures" % failcount)
+exit(failcount)
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index dee4f58dea..32dc0f9830 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -48,9 +48,20 @@ run-gdbstub-untimely-packet: hello
 	$(call quiet-command, \
 		(! grep -Fq 'Packet instead of Ack, ignoring it' untimely-packet.gdb.err), \
 		"GREP", file untimely-packet.gdb.err)
+
+run-gdbstub-registers: memory
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(GDB) \
+		--qemu $(QEMU) \
+		--output $<.registers.gdb.out \
+		--qargs \
+		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/registers.py, \
+	softmmu gdbstub support)
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
 endif
 
-MULTIARCH_RUNS += run-gdbstub-memory run-gdbstub-interrupt run-gdbstub-untimely-packet
+MULTIARCH_RUNS += run-gdbstub-memory run-gdbstub-interrupt \
+	run-gdbstub-untimely-packet run-gdbstub-registers
-- 
2.39.2


