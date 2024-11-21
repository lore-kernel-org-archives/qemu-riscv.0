Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93CBD78797
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:01:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAW6-0004x0-QT; Thu, 21 Nov 2024 11:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVf-0004ez-U2
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVT-00081f-8T
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so10238565e9.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208293; x=1732813093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZyRU/wbphexjcfx9boVViUiFcAlCnY6CkVEXtnxhu4=;
 b=hhYGvOSPNGsw9Jepc46UN4BQPqIEj54M9ukqOJKUEAY42KlRfdXWlHM2RKF4JFxyQj
 cBxoFBvXOPEa3vPbj5iFtL7XdxVJMsBFXpKXgYNDaITDdsZfFBczlblJ/lpxsvUStiQE
 cGefjNPx+o4S3k8OfElo4V0qgBjMtB2N586oG8yeWhSCMfEpszE3RQV3V7u1gND5Cn97
 zNHJB3CAp2t/X8ZrrLymGKauOc2ClQZludwLPFEZ0kQFHVrkfaemyEdOjR0pzS5JkVxy
 PeuHrLESl2ZMfaUDSLtQ4QRG7B1WJTUvgbb18m5peCdh0RUrOS7NOjK8M6Ikr7qjjLWp
 F1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208293; x=1732813093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ZyRU/wbphexjcfx9boVViUiFcAlCnY6CkVEXtnxhu4=;
 b=LsvkywlJps0CP8heH9IpDSVpqqrfzt3PMFXy5L8pdOECn8a5z5fTS1sRQTXzwiI+L8
 N+s6iwza/TmCGg3ZmcRUKT21MC+7hc807kN/qM59cz63n+yJ0Ai8PYKznYsCH6T6/dxh
 PxZxZPBfo2pKBgM0Q9S2JPVul8vrsVvLsSlFEt7hCDy9sblWXgStlUoz7hYr6s5xCuxC
 HlRiOz4QB2Xb6d4LeFK+GWiBQwGHKGLlLhgRmnO0vcnYjJ/5LukdilVjHEyjF9fwHtIG
 WbHAo6ufYuUN+AEOKjcbNfyTry+xamnmsNT6wn8RB3AKLcnGBJq9XvEG64XlBApM3ibs
 wZjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUz8hruuP4YzgZaEickYL+p95MqwrJ+UtZen0FA1JEZYdM0S9IAE9Qj7Hp+zDQ9cre7M4LutXo4aGr@nongnu.org
X-Gm-Message-State: AOJu0YxTYA9UsnxV+8z001cRe9h1z5lCaea6Q99P5cWZ/JMXIDRHq+cS
 +wNQh9h4j5Q+kfQamRjoGXPrGrewGNtKl8ieYZvZlPyylCSBXqVgLCldqxeZh/E=
X-Gm-Gg: ASbGncuaP8y1PceExVE51MeFt22A8Yd4Yx76OLlL0l6M/NBcHX+bvutlGOsLIAutZ1C
 4h6yhkSU0U14fALzoER2VDgdYiAmv6IwtIEa/QTFoYk9oglxsypXBDZmA6DCtCZvX92v7OwGSWU
 +aT8WnaYuAkI+gESAomCn0u4cpY1/ln46DUDTTxavQp4h1udr4v7700oiAOPs5mM1UsihRJcCy6
 3PbbB3YZ7u20iFOYB8pdBrS3sgROYC8AqKI6yMdlGeZC43f
X-Google-Smtp-Source: AGHT+IG8ZaZHt07S0HtzgwKkgyl829XD6j1o75J0q8rbSHTP4tU6eE5Le7QKO8DRkJ/rmWriGFxJlQ==
X-Received: by 2002:a05:6000:4604:b0:382:5aae:87cf with SMTP id
 ffacd0b85a97d-3825aae8da4mr2729457f8f.31.1732208293386; 
 Thu, 21 Nov 2024 08:58:13 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b463bd19sm61028815e9.44.2024.11.21.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 342085FC75;
 Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 08/39] tests/functional: honour self.workdir in ACPI bits tests
Date: Thu, 21 Nov 2024 16:57:35 +0000
Message-Id: <20241121165806.476008-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

The ACPI bits test sets up its own private temporary directory into it
creates scratch files. This is justified by a suggestion that we need
to be able to preserve the scratch files. We have the ability to
preserve the scratch dir with our functional harness, so there's no
reason to diverge from standard practice in file placement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-9-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_acpi_bits.py | 44 +++++++++---------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/tests/functional/test_acpi_bits.py b/tests/functional/test_acpi_bits.py
index 4c192d95cc..3498b96787 100755
--- a/tests/functional/test_acpi_bits.py
+++ b/tests/functional/test_acpi_bits.py
@@ -150,7 +150,6 @@ class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
     def __init__(self, *args, **kwargs):
         super().__init__(*args, **kwargs)
         self._vm = None
-        self._workDir = None
         self._baseDir = None
 
         self._debugcon_addr = '0x403'
@@ -169,7 +168,7 @@ def copy_bits_config(self):
         config_file = 'bits-cfg.txt'
         bits_config_dir = os.path.join(self._baseDir, 'acpi-bits',
                                        'bits-config')
-        target_config_dir = os.path.join(self._workDir,
+        target_config_dir = os.path.join(self.workdir,
                                          'bits-%d' %self.BITS_INTERNAL_VER,
                                          'boot')
         self.assertTrue(os.path.exists(bits_config_dir))
@@ -186,7 +185,7 @@ def copy_test_scripts(self):
 
         bits_test_dir = os.path.join(self._baseDir, 'acpi-bits',
                                      'bits-tests')
-        target_test_dir = os.path.join(self._workDir,
+        target_test_dir = os.path.join(self.workdir,
                                        'bits-%d' %self.BITS_INTERNAL_VER,
                                        'boot', 'python')
 
@@ -225,8 +224,8 @@ def fix_mkrescue(self, mkrescue):
             the directory where we have extracted our pre-built bits grub
             tarball.
         """
-        grub_x86_64_mods = os.path.join(self._workDir, 'grub-inst-x86_64-efi')
-        grub_i386_mods = os.path.join(self._workDir, 'grub-inst')
+        grub_x86_64_mods = os.path.join(self.workdir, 'grub-inst-x86_64-efi')
+        grub_i386_mods = os.path.join(self.workdir, 'grub-inst')
 
         self.assertTrue(os.path.exists(grub_x86_64_mods))
         self.assertTrue(os.path.exists(grub_i386_mods))
@@ -247,11 +246,11 @@ def generate_bits_iso(self):
         """ Uses grub-mkrescue to generate a fresh bits iso with the python
             test scripts
         """
-        bits_dir = os.path.join(self._workDir,
+        bits_dir = os.path.join(self.workdir,
                                 'bits-%d' %self.BITS_INTERNAL_VER)
-        iso_file = os.path.join(self._workDir,
+        iso_file = os.path.join(self.workdir,
                                 'bits-%d.iso' %self.BITS_INTERNAL_VER)
-        mkrescue_script = os.path.join(self._workDir,
+        mkrescue_script = os.path.join(self.workdir,
                                        'grub-inst-x86_64-efi', 'bin',
                                        'grub-mkrescue')
 
@@ -290,17 +289,7 @@ def setUp(self): # pylint: disable=arguments-differ
 
         self._baseDir = Path(__file__).parent
 
-        # workdir could also be avocado's own workdir in self.workdir.
-        # At present, I prefer to maintain my own temporary working
-        # directory. It gives us more control over the generated bits
-        # log files and also for debugging, we may chose not to remove
-        # this working directory so that the logs and iso can be
-        # inspected manually and archived if needed.
-        self._workDir = tempfile.mkdtemp(prefix='acpi-bits-',
-                                         suffix='.tmp')
-        self.logger.info('working dir: %s', self._workDir)
-
-        prebuiltDir = os.path.join(self._workDir, 'prebuilt')
+        prebuiltDir = os.path.join(self.workdir, 'prebuilt')
         if not os.path.isdir(prebuiltDir):
             os.mkdir(prebuiltDir, mode=0o775)
 
@@ -321,10 +310,10 @@ def setUp(self): # pylint: disable=arguments-differ
 
         # extract the bits software in the temp working directory
         with zipfile.ZipFile(bits_zip_file, 'r') as zref:
-            zref.extractall(self._workDir)
+            zref.extractall(self.workdir)
 
         with tarfile.open(grub_tar_file, 'r', encoding='utf-8') as tarball:
-            tarball.extractall(self._workDir)
+            tarball.extractall(self.workdir)
 
         self.copy_test_scripts()
         self.copy_bits_config()
@@ -334,7 +323,7 @@ def parse_log(self):
         """parse the log generated by running bits tests and
            check for failures.
         """
-        debugconf = os.path.join(self._workDir, self._debugcon_log)
+        debugconf = os.path.join(self.workdir, self._debugcon_log)
         log = ""
         with open(debugconf, 'r', encoding='utf-8') as filehandle:
             log = filehandle.read()
@@ -360,25 +349,18 @@ def tearDown(self):
         """
         if self._vm:
             self.assertFalse(not self._vm.is_running)
-        if not os.getenv('BITS_DEBUG') and self._workDir:
-            self.logger.info('removing the work directory %s', self._workDir)
-            shutil.rmtree(self._workDir)
-        else:
-            self.logger.info('not removing the work directory %s ' \
-                             'as BITS_DEBUG is ' \
-                             'passed in the environment', self._workDir)
         super().tearDown()
 
     def test_acpi_smbios_bits(self):
         """The main test case implementation."""
 
-        iso_file = os.path.join(self._workDir,
+        iso_file = os.path.join(self.workdir,
                                 'bits-%d.iso' %self.BITS_INTERNAL_VER)
 
         self.assertTrue(os.access(iso_file, os.R_OK))
 
         self._vm = QEMUBitsMachine(binary=self.qemu_bin,
-                                   base_temp_dir=self._workDir,
+                                   base_temp_dir=self.workdir,
                                    debugcon_log=self._debugcon_log,
                                    debugcon_addr=self._debugcon_addr)
 
-- 
2.39.5


