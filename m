Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAxNg-0006sJ-H1
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 13:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNe-0006nQ-HQ
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:50 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNc-0003XQ-GV
 for qemu-riscv@nongnu.org; Thu, 29 Dec 2022 13:11:50 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-14455716674so22483556fac.7
 for <qemu-riscv@nongnu.org>; Thu, 29 Dec 2022 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=El5BtKP8M3KbNCpgAktit+5SzgD7c9WEtKo3+OXsigQ=;
 b=JhNiFibXnsF1wwYcl34w7zDlKxXwtXh/Zne0U7OnOfC86KKk9/YcifH9bUEt+FP7OD
 clf2it9wSiAQMm2wppcDjAE8NcQFzOmoutZBOjVMeIsV5grl/WhmQv/35+3t+h8FobLF
 o2DEZw1Cro4sjnaoi+kgZWeGg+pizAGzRxqB/QFFhHHf9N9jkDBZP4dn8JJdeCknQ18T
 PpMDWeq5oGC6EHyvr5BZe8nfu2CKOQ+gLypp5RTqvrFGYKdVgl66QfZwguBsKGJNI6vd
 fuVc9rdW04tJSQo2JA8Nl3DhYq0HlbiU6yu8waKTVxWA0eKmHliVQge3yuUIqbVQ9/Iq
 h+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=El5BtKP8M3KbNCpgAktit+5SzgD7c9WEtKo3+OXsigQ=;
 b=1gDRs5GFUzDvbiaS41IUjqUk8K14f26z3t19IF/yQGz6+ETpIUXqQ0AcIq8X+NjMoI
 TOBHMoBgidKBwLoRN6y4N+V8i7/Ehe2TFW/ayy0TJwqlV8YS02fq6tCLZ7c2sLfEniYY
 aoS3kL/xwyh2Jje3fksJesB4xzieIwQPdX4s3SHprVyBldoIC5dJ0Fzgd1yNumvXEQkU
 2TNmcKJ/yHYNO9VuEGwUsBd6WQbs9WtDVgdbdEwWu09hqEJJieOGD6I1xdTsjo63yh/U
 DuDqhdnc6nH7v/1VSP+WRLFn0SkwY9H4J6piAWGosgRSzbxL4OEbz8nXvLUr9EojFkca
 iPXQ==
X-Gm-Message-State: AFqh2kr0Fal+hm8zoa7WA7xMNNnX3LDaTyLgPEPfFV340eB8FH5tgLDi
 lD8Eb2Z/31/fDiHMStfjh9QTbw==
X-Google-Smtp-Source: AMrXdXvZNq1HoNi7pc/MmBPK+uVQliIvey9GFnDjwTrGcEOpGCLt/z+I7fyIsWXPNAur2noI6TUKmA==
X-Received: by 2002:a05:6870:c8f:b0:14f:b85a:bec5 with SMTP id
 mn15-20020a0568700c8f00b0014fb85abec5mr8990981oab.43.1672337507093; 
 Thu, 29 Dec 2022 10:11:47 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v4 01/11] tests/avocado: add RISC-V OpenSBI boot test
Date: Thu, 29 Dec 2022 15:11:25 -0300
Message-Id: <20221229181135.270661-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 18:11:50 -0000

This test is used to do a quick sanity check to ensure that we're able
to run the existing QEMU FW image.

'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
RISCV32_BIOS_BIN firmware with minimal options.

The riscv32 'spike' machine isn't bootable at this moment, requiring an
OpenSBI fix [1] and QEMU side changes [2]. We could just leave at that
or add a 'skip' test to remind us about it. To work as a reminder that
we have a riscv32 'spike' test that should be enabled as soon as OpenSBI
QEMU rom receives the fix, we're adding a 'skip' test:

(06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike:
        SKIP: requires OpenSBI fix to work

[1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
[2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Tested-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tests/avocado/riscv_opensbi.py

diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
new file mode 100644
index 0000000000..e02f0d404a
--- /dev/null
+++ b/tests/avocado/riscv_opensbi.py
@@ -0,0 +1,65 @@
+# OpenSBI boot test for RISC-V machines
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
+class RiscvOpenSBI(QemuSystemTest):
+    """
+    :avocado: tags=accel:tcg
+    """
+    timeout = 5
+
+    def boot_opensbi(self):
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
+        self.boot_opensbi()
+
+    def test_riscv64_spike(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:spike
+        """
+        self.boot_opensbi()
+
+    def test_riscv32_sifive_u(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:sifive_u
+        """
+        self.boot_opensbi()
+
+    def test_riscv64_sifive_u(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:sifive_u
+        """
+        self.boot_opensbi()
+
+    def test_riscv32_virt(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:virt
+        """
+        self.boot_opensbi()
+
+    def test_riscv64_virt(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        """
+        self.boot_opensbi()
-- 
2.38.1


