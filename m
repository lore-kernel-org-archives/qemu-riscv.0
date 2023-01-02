Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCJN7-0007AL-Ea
	for mharc-qemu-riscv@gnu.org; Mon, 02 Jan 2023 06:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN6-00077I-J1
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:52:52 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN4-0002uA-Rz
 for qemu-riscv@nongnu.org; Mon, 02 Jan 2023 06:52:52 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-12c8312131fso33457358fac.4
 for <qemu-riscv@nongnu.org>; Mon, 02 Jan 2023 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AvvnqdKprjFIvB9f/200clWrEJhsrPRPWkNdtTFIhes=;
 b=d5KD1i+Dnr0FcWIBqX0Bi+QmoX2mZsMigqjOIa8JilANGjA9FTfAh9x8qRg4aJXQn/
 n7pq7iB9m24JCk+Mz6es2un0VlivvcjZ42t6FVMvBftee3bpAHSZt2atBWs6dCcnEPtM
 PUkL8zsA9HKQOU0PRz3kAlXF+mhWFY/r5mx+mImb6toGPsM4aaHmYMZsDfqvt2VK1GFc
 CTDrqWXErAD6+2dwQJr3iilbi6oytCWbsyTVkHqcb9nkxbLpfkoi1WKJT984MKwCjDaM
 mOAv+RUUdcgksGILV/8GWpt9VuKKy6fg6f0dZnkkzlnaZO3JH1UlAijHxUrdffL8FFIh
 Q5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AvvnqdKprjFIvB9f/200clWrEJhsrPRPWkNdtTFIhes=;
 b=pgkydDH2+RKNQBzkW/QEIjVsByZ4lg1Xu3OJoCNdwuzoROCtmC/HXQI75Klb4+mo/C
 uCle+0cMq4gvR3DNPHCYVTj3wAxgPgEHG81HTrMhTyp6ctgOdNdBzfE57Jy0+2M0W+cW
 YqdSkgmJbjPfLCnRy+bEVwqc7gpy4Kp+e4N/JCtX3GtrJq5FjSfx2opx3RaTk+kuHr6y
 GzBsNB1hO28t1d4o/xaWPAcqtQt5pDrjkzEPqL+FmLfxUuDyxEmYeosrnuXxE5kSv91w
 uz8fLL5DAFjs0vbk0zdxqty5rKlErZscrJz6/ul1pOJpEV7XYjyZAkRhDFJnT3tjx1yD
 WpZA==
X-Gm-Message-State: AFqh2kqICqm2FfYgj3P33aqdEKCIdT0iAumP9TyPhJT6ykWyxwFQSomp
 qxacUSYULQeKEMZsRKlAVnnj8Q==
X-Google-Smtp-Source: AMrXdXt/kxwM0Acr0Sw/CiUO6Q3YACXnL5N2CoS55xnlzkCIOvZoUfzOgRXlh8KaYTdGX49Mzr9TSQ==
X-Received: by 2002:a05:6871:93:b0:143:e045:7082 with SMTP id
 u19-20020a056871009300b00143e0457082mr5330728oaa.58.1672660369788; 
 Mon, 02 Jan 2023 03:52:49 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:52:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v5 01/11] tests/avocado: add RISC-V OpenSBI boot test
Date: Mon,  2 Jan 2023 08:52:31 -0300
Message-Id: <20230102115241.25733-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Mon, 02 Jan 2023 11:52:52 -0000

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.39.0


