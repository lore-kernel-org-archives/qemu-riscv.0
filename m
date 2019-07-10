Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlGjs-0001WJ-1l
	for mharc-qemu-riscv@gnu.org; Wed, 10 Jul 2019 13:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hlGjp-0001Sq-3s
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 13:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hlGjn-0006lH-Vj
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 13:50:41 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40290)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hlGjn-0006jf-QL
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 13:50:39 -0400
Received: by mail-pl1-x642.google.com with SMTP id a93so1587977pla.7
 for <qemu-riscv@nongnu.org>; Wed, 10 Jul 2019 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1GCsi4BIUSnxiBHAMkfzcUMMzqZQxWCpZrkscVs0YSU=;
 b=QBgmalqqkDyg6XBfx8a0I35nQZmePG6mk8O1AUr2Az+yGKqB3lA1R04khVzaxVRjw0
 iUx2nNxn4W+IGsWDwHle5meWonmGHKn+l1QKCWGKWwwLb+SeIZbQ+PJHkUR0XAA3+3Ee
 C5BQlcMwG7e+L3usSyJscrjVv4FMeZJYRje6KCiI7KbmRi+tvfqYX1TcQr5NkDbITyw0
 3jjISgoeWVBQBFO8DPVQsodasjYVys17p0UllW2UD94WpwQbX/f+y+X7FzChQDcqic44
 H9wznJXrO/ndCjfhjNbvZU5e9q3QLue7eRc0r+0ZyxpTxsYB1zCjQHN9RZFGqVqxjdm/
 ZSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1GCsi4BIUSnxiBHAMkfzcUMMzqZQxWCpZrkscVs0YSU=;
 b=GgR1Xfr1ZjpdmDNDZa8pqgtpplm7NK5HZNtZ1hvFWrGI2SGTU00+kqua/suEfzRmDU
 chepu1WVEp57QJd7xg0EIn2ebSmIDeWiQkISNmGpT8lnjGJ3Y/HzEtohBn4LbwUNlZD3
 p4bFkYAA2CFHRZFXCOXdoxZEC+dt0Kjak8rbNvL+uIYutbY9Bgq9EryvVq3BKfwMvplt
 NkNxXw1o3xuy56pF+6U3IPXg+iHx9IPqKsOqheDgNYo3Cd5SVIOTQaPtU3Je1KskeqBn
 e7QcO1hx3ZxER+vlo5mx41xKdNnMAaaKO+WiEkEKdh4SiU6FPxOJke3y/mxHcNr/UylB
 nK/w==
X-Gm-Message-State: APjAAAUsz6Zgbkq61y0tXXdKsDM1zXU+oAtNA3Z40Gi4aXPdYPF73JlC
 w9hogzwwRkAvm+YVx6qvLl+l4w==
X-Google-Smtp-Source: APXvYqz0lxMkhLBTuScdgjgw6yensoXAKWGmzQY9A4/SVWMbAI0Uj5A+FCUlpvg8wkc9cEGr4+CSfw==
X-Received: by 2002:a17:902:7c05:: with SMTP id
 x5mr18598444pll.321.1562781037653; 
 Wed, 10 Jul 2019 10:50:37 -0700 (PDT)
Received: from gamma06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id o11sm7323891pfh.114.2019.07.10.10.50.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 10 Jul 2019 10:50:36 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Caio Carrara <ccarrara@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Date: Wed, 10 Jul 2019 10:50:23 -0700
Message-Id: <1562781026-27570-1-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH] tests/boot_linux_console: add a test for
 riscv64 + virt
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jul 2019 17:50:42 -0000

Similar to the mips + malta test, it boots a Linux kernel on a virt
board and verify the serial is working.  Also, it relies on the serial
device set by the machine itself.

If riscv64 is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:riscv64" tags.

Alternatively, this test can be run using:

  $ avocado run -t arch:riscv64 tests/acceptance

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 3215950..bbc6b06 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -354,3 +354,43 @@ class BootLinuxConsole(Test):
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
+
+    def test_riscv64_virt(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        """
+
+        kernel_url = ('https://github.com/chihminchao/test-binary/raw/'
+                      '0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/'
+                      'bbl_w_kernel.gz')
+        kernel_hash = 'c7f6cc7967975ad42dc61ee0535db01c9cbd0968'
+        kernel_path_gz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        kernel_path = self.workdir + "bbl_w_kernel"
+
+        with gzip.open(kernel_path_gz, 'rb') as f_in:
+            with open(kernel_path, 'wb') as f_out:
+                shutil.copyfileobj(f_in, f_out)
+
+        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
+                      '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
+                      'riscv64/rootfs.cpio.gz')
+        initrd_hash = 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        self.vm.set_machine('virt')
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
+                               + 'console=ttyS0 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'isa')
+        self.exec_command_and_wait_for_pattern('uname -a',
+                                               'sifive')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
-- 
2.7.4


