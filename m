Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWZ5-0004cT-Lr
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 08:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZ4-0004bh-Lw
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:50 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAWZ3-0008Al-0f
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 08:33:50 -0500
Received: by mail-oi1-x231.google.com with SMTP id r11so14799426oie.13
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 05:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hbm0SUMgOyGVm9UYUYsWKLbt1FN4F94mBirfTGyOnNA=;
 b=MYXdVhuYh3XS7uMOlqTaMiRl6Lqywy+7hzWtnSwgYmb3x7SEA45fo3bh+NPC49R6b6
 9931hqsOZEKwBx0TAm1eHQS7z8xRYMeut1YsiFNVUm66+RPd5U5SxrnethglIJAzN12U
 tDYScwP6caq5uyS4VyCAWCyKwW3Jeadwezcsh9QmiDWmWHOm02jXxy2JkbesfL/nagDA
 T+tSrT0AhHqXfxi8Jk18oULZOAbMakEHa+I0ghJoUYj/qtcH9SgtBWvRnS+kB9avecbx
 au0tdbPKQILPzPfy29zWpYvFqrB2AUkVSu1je2bg1D/rl447hSJzQcdEHWVPEyK9hZsp
 ZPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hbm0SUMgOyGVm9UYUYsWKLbt1FN4F94mBirfTGyOnNA=;
 b=k/WNdwuAAI4qUEZHxQQHd9JLYN1r+XDaccDvI3W0e/JoAdgQ8kD+m2tl+XK3XIWLxr
 07KV4zMy7tQlSZM4VeKhm5bJZH8kZJwR7F+Syxj39IDkFiFh9i/yZ/PxDIAsAq/gF5Xm
 iUUhGDCmWvhA6JwG/De1nB8YVHAz0xIydhneGcl2mpXt3UVoEIpU1LYAO/gkVXw7Cb1z
 ru+XOTX/Zlg6GPGNHdF+1HJraTLWk4Qosx/oqTmC40AFy5Y7hA+LbDxUe8RHN8efzooD
 aunG50MfznwtBLQuu0SHBv0uy30xVZP9z/7Hj8QLPU0slHCmuiIP3pCwndadfws99XsD
 0A5w==
X-Gm-Message-State: AFqh2kpmbwd2NwYjt5Qe8tPpUnZjQkLAijldIE0A4lqR5WCuScoy82XN
 BneGWGrMMo6EmVar6lxLAtRN2w==
X-Google-Smtp-Source: AMrXdXuZoWC5/AZUnEONG+Ef2jKWLWewi+gKetbmM0zh2Pk36Pep0OA+j33dG8hJJk044bUOdJB2aw==
X-Received: by 2002:a05:6808:bc3:b0:360:d800:d10c with SMTP id
 o3-20020a0568080bc300b00360d800d10cmr15595466oik.34.1672234427736; 
 Wed, 28 Dec 2022 05:33:47 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 bl22-20020a056808309600b0035e7d07bf9dsm6991626oib.16.2022.12.28.05.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 05:33:47 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/10] tests/avocado: add RISC-V opensbi boot test
Date: Wed, 28 Dec 2022 10:33:27 -0300
Message-Id: <20221228133336.197467-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228133336.197467-1-dbarboza@ventanamicro.com>
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 13:33:50 -0000

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
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tests/avocado/riscv_opensbi.py

diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
new file mode 100644
index 0000000000..3549d36a11
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
+class RiscvOpensbi(QemuSystemTest):
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
+    def test_riscv64_virt(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
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
+    def test_riscv32_sifive_u(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:sifive_u
+        """
+        self.boot_opensbi()
+
+    @skip("requires OpenSBI fix to work")
+    def test_riscv32_spike(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:spike
+        """
+        self.boot_opensbi()
-- 
2.38.1


