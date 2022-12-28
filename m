Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVm4-0005AY-2A
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlr-000588-3H
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:42:59 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlo-0007lg-Hd
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:42:58 -0500
Received: by mail-oi1-x22e.google.com with SMTP id r130so14759121oih.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fWTWcRGCstPSpvJsIpPZFZlCHEmo4/5CSjmUoYXhmX8=;
 b=SUtuDH4HWTninTXn8qMfVsWkB4rAutFvJ5rua/IW9UCYPQaOpcFC+k8v/ByEN12Elv
 LwHzcYhN5hmeqWTHjlZtvd++bv6Sl+KaoQyrZt5L39J2P5hnSvcUhDywS/8S96DJ2geE
 t72M3H3FwCx155vWPLJa6kEMXl4OrUDs4UHbwNMmg6rWa3jfIsaCLMADkrG2v8o2osUj
 kyMAyLsfJQF5jSWo2ZVPcyAYs2vL3TuaKgUjfkljd6TTw1WIuJkhUyd9eEpXtUbxE9/m
 33mo9kWbivTRCnGnmHihkSceTqDoUjgjjE0+hZyc0jnEL+fpMo8p/CECKfqU31C1O0aE
 dZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fWTWcRGCstPSpvJsIpPZFZlCHEmo4/5CSjmUoYXhmX8=;
 b=lBHA1Zb7w3RBOCpBgcvt2D+3AuBQF94N3Oxc7sxBMzfh5iBjEeOghavfBN7d0VgfM9
 EQPdkwf9QN+2WNzoejrtrelysTEUyBnunh9ypAKPfYaC+q65itPG4hyeYwIVv7WLj4Zo
 aEnrBJsvZyLMZt4OJ6ir6otKVjDfzqGMwd212DQ2KpPjGFt1ztSgrNMvWmPByEMGlyF2
 TJe8jLVC0iHA0ioVN7edEbnjEBoM9910howMbAiitLJIlfRl6BDTVXqMPdNs0PaOlWAJ
 nm0ZifS6NjDcEAFVfi9+ZzQ/+Us5zLMt+hKPWDutJalEC/Ak9mN0IHHTzO8UVp27i/Ed
 Qrxw==
X-Gm-Message-State: AFqh2kpLixVwlAiMXlVv4xckxskOPlmeggURAZ4XLJzdvA4NgKB7glp+
 cY1WsP3azA/EBxK9w5Soj84y+Q==
X-Google-Smtp-Source: AMrXdXvOSuwgU1iPIBVFPOhG+dreQAdK/zM1SGRgG0ibOZD+4a+diE/8y0f4xRVepcQ3Ca+uTuvJcA==
X-Received: by 2002:a05:6808:158f:b0:359:affb:35a9 with SMTP id
 t15-20020a056808158f00b00359affb35a9mr16107863oiw.44.1672231374825; 
 Wed, 28 Dec 2022 04:42:54 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:42:54 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/10] tests/avocado: add RISC-V opensbi boot test
Date: Wed, 28 Dec 2022 09:42:33 -0300
Message-Id: <20221228124242.184784-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124242.184784-1-dbarboza@ventanamicro.com>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 12:43:03 -0000

This test is used to do a quick sanity check to ensure that we're able
to run the existing QEMU FW image.

'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
RISCV32_BIOS_BIN firmware with minimal options.

The riscv32 'spike' machine isn't bootable at this moment, requiring an
Opensbi fix [1] and QEMU side changes [2]. We could just leave at that
or add a 'skip' test to remind us about it. To work as a reminder that
we have a riscv32 'spike' test that should be enabled as soon as Opensbi
QEMU rom receives the fix, we're adding a 'skip' test:

(11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike:
        SKIP: requires OpenSBI fix to work

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
[2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 tests/avocado/riscv_opensbi.py | 77 ++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 tests/avocado/riscv_opensbi.py

diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
new file mode 100644
index 0000000000..64fcf3c774
--- /dev/null
+++ b/tests/avocado/riscv_opensbi.py
@@ -0,0 +1,77 @@
+# opensbi boot test for RISC-V machines
+#
+# Copyright (c) 2022, Ventana Micro
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
+from avocado import skip
+from avocado_qemu import wait_for_console_pattern
+
+class RiscvOpensbi(QemuSystemTest):
+    """
+    :avocado: tags=accel:tcg
+    """
+    timeout = 5
+
+    def test_riscv64_virt(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
+
+    def test_riscv64_spike(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:spike
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
+
+    def test_riscv64_sifive_u(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:sifive_u
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
+
+    def test_riscv32_virt(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:virt
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
+
+    def test_riscv32_sifive_u(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:sifive_u
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
+
+    @skip("requires OpenSBI fix to work")
+    def test_riscv32_spike(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:spike
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Platform Name')
+        wait_for_console_pattern(self, 'Boot HART MEDELEG')
-- 
2.38.1


