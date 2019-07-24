Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqB2M-0004Yl-2c
	for mharc-qemu-riscv@gnu.org; Wed, 24 Jul 2019 02:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60847)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hqB2I-0004Sb-F5
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2019 02:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hqB2G-0006C4-N9
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2019 02:46:02 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hqB2G-0006BG-8w
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2019 02:46:00 -0400
Received: by mail-pg1-x531.google.com with SMTP id t132so20683767pgb.9
 for <qemu-riscv@nongnu.org>; Tue, 23 Jul 2019 23:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=mQHYqjl7zwiKo7RpLdyEPwUd7jBGOinHVQZgIaKHPfc=;
 b=EU1yyHcR5in3AvCrtLXBP7w6O64LWByXenVYpe1x121krfg2ZDSdMDzIDWWGnLAGtn
 XI/dFEQcMnDSCa5vODuc/46L1AJCdXI34sdvIWrqKsS3VABXf4KlVwISE5irpkQpHnor
 ZXA9aUR77BJNgE3ZxN1zjTlIiSgeqD2KBknskGqVC6jMukSWnY3unV69JV/IJ+Iib8MI
 xpAN4vIIwv5oqDm8nf4sL2FSSpG0U7oyOy9IpoMppPuHH+SvGaF4MEUAOgaBpFAesejb
 8XQLjFTtIOf4GmDmj7iKMajXQDYc71CI7kOwcg5I8SrINb0ULF+bOoKW4GQ4Jgq1qo8/
 Rpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mQHYqjl7zwiKo7RpLdyEPwUd7jBGOinHVQZgIaKHPfc=;
 b=GaVNSC4Cec+JnfnFiV8WAOWdi0MnoyS+5UbfrSKfmEvaKv8yJ755+nYqGpDEK98Cu+
 c0kOTX84euwRVgcqipEOhMEFPh+DSAd4hjxJnv6AH88pMuFExf0yV7B2JTZw3PvXFXmE
 SKqHG8rNY1xPMlz+YMZjZojewRtQMwy+D6Zpf0Gaqx7xmvrsyipLtpWbu+jAodcwxcCe
 7A3ZvyVemxZ1zw/4eX9z1qskGSJnHgi8DdGYNvdvG4lvTliJ/+f2y27dR9jx41/Y0dAE
 jDrFjEMmB87IB4ABGtHedtSoX4MXQqcGCpOUj886w1U8kXniRo6zki/Kpgr1abfUeN88
 auVQ==
X-Gm-Message-State: APjAAAWQO4bNYxpE99zpkS1lwF9JD2yHD3n0PAGzbAL/l4Zo0WSbNWib
 F66QIQ3Iyq+nNZaL5NW1N5J0CA==
X-Google-Smtp-Source: APXvYqyTreHgev5fWt6Qa4+cwtVd1P9HGzKX8PoyRjV26G8pifoHznknjvDb3SDih/6U42Gobcw1ew==
X-Received: by 2002:a17:90a:1ae1:: with SMTP id
 p88mr82664440pjp.26.1563950758640; 
 Tue, 23 Jul 2019 23:45:58 -0700 (PDT)
Received: from gamma06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id f6sm47012449pga.50.2019.07.23.23.45.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Jul 2019 23:45:57 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Date: Tue, 23 Jul 2019 23:45:34 -0700
Message-Id: <1563950742-22592-1-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: [Qemu-riscv] [PATCH v3] tests/boot_linux_console: add a test for
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
X-List-Received-Date: Wed, 24 Jul 2019 06:46:04 -0000

Similar to the mips + malta test, it boots a Linux kernel on a virt
board and verify the serial is working.  Also, it relies on the serial
device set by the machine itself.

If riscv64 is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:riscv64" tags.

Alternatively, this test can be run using:

  $ avocado run -t arch:riscv64 tests/acceptance

packages
  debian official
    binutils-riscv64-linux-gnu_2.32-8
    opensbi_0.4-1_all
    linux-image-5.0.0-trunk-riscv64 5.0.2-1~exp1
  third-party
    https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
    (the repo is also used in mips target acceptance)

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 .travis.yml                            |  2 +-
 tests/acceptance/boot_linux_console.py | 67 ++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index caf0a1f..7ba9952 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -232,7 +232,7 @@ matrix:
 
     # Acceptance (Functional) tests
     - env:
-        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
+        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
         - TEST_CMD="make check-acceptance"
       after_failure:
         - cat tests/results/latest/job.log
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 3215950..b0569b9 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -354,3 +354,70 @@ class BootLinuxConsole(Test):
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
+
+    def test_riscv64_virt(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        """
+        deb_url = ('https://snapshot.debian.org/archive/debian/'
+                         '20190424T171759Z/pool/main/b/binutils/'
+                         'binutils-riscv64-linux-gnu_2.32-8_amd64.deb')
+        deb_hash = ('7fe376fd4452696c03acd508d6d613ca553ea15e')
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        objcopy_path = '/usr/bin/riscv64-linux-gnu-objcopy'
+        objcopy_path = self.extract_from_deb(deb_path, objcopy_path)
+        libbfd_path = '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64.so'
+        libbfd_path = self.extract_from_deb(deb_path, libbfd_path)
+        process.run('ls -al %s' % (objcopy_path))
+
+        deb_url = ('https://snapshot.debian.org/archive/debian/'
+                   '20190708T032337Z/pool/main/o/opensbi/'
+                   'opensbi_0.4-1_all.deb')
+        deb_hash = ('2319dcd702958291d323acf5649fd98a11d90112')
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        opensbi_path = ('/usr/lib/riscv64-linux-gnu/opensbi/'
+                        'qemu/virt/fw_jump.elf')
+        opensbi_path = self.extract_from_deb(deb_path, opensbi_path)
+
+        deb_url = ('https://snapshot.debian.org/archive/debian-ports/'
+                   '20190319T205124Z/pool-riscv64/main/l/linux/'
+                   'linux-image-5.0.0-trunk-riscv64_5.0.2-1~exp1_riscv64.deb')
+        deb_hash = ('90155ed4b36673cbf7746a37cf3159c8f0b2857a')
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = '/boot/vmlinux-5.0.0-trunk-riscv64'
+        kernel_path = self.extract_from_deb(deb_path, kernel_path)
+        kimage_path = self.workdir + "/Image"
+        env = os.environ
+        env['LD_LIBRARY_PATH'] = ('%s:' % (os.path.dirname(libbfd_path)) +
+                                 env.get('LD_LIBRARY_PATH', ''))
+        process.run(('%s -O binary -O binary -R'
+                     '.note -R .note.gnu.build-id -R .comment -S %s %s') %
+                     (objcopy_path, kernel_path, kimage_path))
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
+        self.vm.add_args('-bios', "none",
+                '-kernel', opensbi_path,
+                '-device', 'loader,file=%s,addr=0x80200000' % (kimage_path),
+                '-initrd', initrd_path,
+                '-append', kernel_command_line,
+                '-no-reboot')
+
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
+                                               'isa')
+        self.exec_command_and_wait_for_pattern('uname -a',
+                                               'SMP Debian')
+        self.exec_command_and_wait_for_pattern('reboot',
+                                               'reboot: Restarting system')
-- 
2.7.4


