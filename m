Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83kR-00081t-Km
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kO-0007z1-DU
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:20 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kM-0007p6-78
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:20 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-14455716674so20124935fac.7
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAX2+OwNFeeUZjBeEsjIZKrfL1qZu8pl6CTdHwneZDo=;
 b=lmVNY9jigG2n8XdPsnYOei82O3CSSAvM2aMj7tMAkdRR7JOc2FFEfdRu/zzzzZKe4y
 Opzq05q+1qYOM1ZfAIzrF2V0+fCPvpNJqVQTLsDJBuOemf4iAjOud/f/xAeOzJ3QTPLZ
 GbY3AEfePHJgrMCz5rmALLeakfUml9j9ik/0GfP8cBOE9Ew23UduZkskz82ZH4w/eNoe
 v0fLfzWuLfiBxpPiC4tt1EYzD2SJ5NWrbvBn8IPBfgsXZ+gohXi4NvZXafh1Ykd2Hybr
 nviipxGuNRn8CjdNfpFkcsCQVrEi8QM+ZvPnaAQIY7Ns1w/TjdXJuyqRAwLmLYcnXZ/r
 0ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAX2+OwNFeeUZjBeEsjIZKrfL1qZu8pl6CTdHwneZDo=;
 b=e3mCi3jPrSYEx7/x/Y0C3GVk6duia2Ve0APFG15dBmL0XxqSJYWE8uhEGGWmLg46Fu
 4dTaDrEPvSjrMbnMHLq4D+MYg/ivAjwkJvT0UOV6sf9WbgpfbsT5wkDeOhHLKyOzLoH7
 mtYw6NpSwAUCj+Zul3Mxhiop5rAIXv0DkfZ85rRnBL5xsfFdys8XTN4rU2PHu4VovpAv
 V3noOx+TNW0kBQLModzPJfEGbUs5aKi2t8e7MF/o05v8pfuKINQwksEwivIyMtfD5SKl
 xYnrrj2QOOrmSSJFhhxNqqCEgoEn0SrAX9256G7UpNmFd60HTAYpnDG2WGn156+L6YiT
 xE6w==
X-Gm-Message-State: AFqh2kogKSGQ1cxJJUS2pWKmPn82GvL0MsBv+zPlI/24zTG1ezr+cZtb
 +tRRtgGdUXJkmiS+hBC9omeZEw==
X-Google-Smtp-Source: AMrXdXuuPWUhrqpbC+EXNpi+uFRSkHTzvkEu/xrt7R5ehmNG8jOVZlj8Yb4OQSj2fdANxSOM3wGPVA==
X-Received: by 2002:a05:6870:238f:b0:144:9783:54dd with SMTP id
 e15-20020a056870238f00b00144978354ddmr1462648oap.11.1671646996592; 
 Wed, 21 Dec 2022 10:23:16 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
Date: Wed, 21 Dec 2022 15:22:46 -0300
Message-Id: <20221221182300.307900-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:20 -0000

This test is used to do a quick sanity check to ensure that we're able
to run the existing QEMU FW image.

'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
RISCV32_BIOS_BIN firmware with minimal options.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tests/avocado/riscv_opensbi.py

diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
new file mode 100644
index 0000000000..abc99ced30
--- /dev/null
+++ b/tests/avocado/riscv_opensbi.py
@@ -0,0 +1,65 @@
+# opensbi boot test for RISC-V machines
+#
+# Copyright (c) 2022, Ventana Micro
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
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
-- 
2.38.1


