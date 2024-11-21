Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F771D78798
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 16:58:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAVU-0004TB-Lj; Thu, 21 Nov 2024 11:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVS-0004Rc-Aq
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVO-0007yA-Rk
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38231f84dccso794463f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208289; x=1732813089; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yY9M4nXaCJ2neB5ZRMCPvZw3DACi8uIco1VZWqAc51U=;
 b=RVW+Sp+BhRGH1OLGo4Qvw8zhS01M8U8JnIsmK60orhZx5jryg3rXg+00/xiJTAyX3B
 iV/cjhxcmuhI2Xefv77N/YTy7vgcMx4RKh6Ii3G1mdcEu6n9wLfcz9ZQ25sWhW6/LAMb
 7AAAxKRmHTD61LYr+PkHhOkLglqKfBE9/twfj60M+q+abWZnBW5VxiF1uRgFk/2BhI6H
 ZNXSMjMsHjkqS/++j7XqRxaqkebpc32h/oN6tPW2FBHKNbfJ60Aw2RMPIUiozv3521Oa
 LD+qNeEN1UP3E6y+RgG14Qj2mpM9PhwDt5M/rcmH9gdvlAhyNKz5iQ1agxm0ulcEqn9/
 ec3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208289; x=1732813089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yY9M4nXaCJ2neB5ZRMCPvZw3DACi8uIco1VZWqAc51U=;
 b=Mz9ALBki7HshOtvzOx3Eh9uAA9NMCqQTQ/g0u0JTVYdH2NoLQCEXrrc1wXntnjOZI0
 1+bacre1k0SWZ9hsuFc8e5ycy6sqQ9e49PbpnLvq/VVn+dTLP43Q8HEAh+VoJZpY+Omg
 7ywU415pte1vEud+0b2dLWQDF4on9Zx/t+t+FD4mEo2sWp5YLaKMjXvfdRaq4V+hHzGP
 ECmMthCt+f3Aqnybk7JcomvN4rqI/F+UmZYTCjFrboi1ufksxQ3iDw6R7SKKf2STeEhk
 uGRzXIiPcT3hBkzhwVR46mp1XiPJN09XuK9dwuAOfjWarz8ddl7waw9I8aOlXIG5Q4a7
 iIuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4w8+0OyB9Y3mrf9XzfQGS4uZSmpLhpuog0zoywHDvvdFV9mWynFs6ck8yOeM+6s4c9j7TYxWFeqH7@nongnu.org
X-Gm-Message-State: AOJu0Yx+mGE41+DbomcW0MV+qdZm2p+nlotaAxHwBamanyyY5hYAKkMI
 n6LawPWaJD+Qj6/FpRDd5inQBdsDpivYwydfbYlqIl3J4XOhKBQZIwdNhb0zjTE=
X-Gm-Gg: ASbGnctAtQvBxjfjnEolAaxDS1qARBXeCDU3Jsi4FghY8XPKF79UDigqxLt6FHoUn2f
 yD8sfDdOtC1vlh3CY94yS2dYCCm4MeeVwEcKOJQG86i7x91l9s5vFTePcOWj4DER+udvQPLIcMa
 XN4i1lZMCl5RgixK5kz9/Vl/fRB1rlDX3VaI+Zx1d1qhYnz3ImwMYHBnghhIGOsSS0y/hJCJf+S
 KP6PosKod9nYSPDTfrQZkE1CZRL61OjLPcj88y+6u7U+Zk0
X-Google-Smtp-Source: AGHT+IF8GSqlkmw1CWsVIpaNvgqu6+SlebdLtm04hJzKWCmEWIr+XGtZAqq/ZpdKEt5Zl9EyASIDSg==
X-Received: by 2002:a05:6000:2c8:b0:37d:4389:e9de with SMTP id
 ffacd0b85a97d-38254adecefmr6619313f8f.1.1732208289215; 
 Thu, 21 Nov 2024 08:58:09 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad5f59sm38965f8f.10.2024.11.21.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9B2825F940;
 Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
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
Subject: [PATCH 02/39] tests/functional: automatically clean up scratch files
 after tests
Date: Thu, 21 Nov 2024 16:57:29 +0000
Message-Id: <20241121165806.476008-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

The build/tests/functional subdirectories are consuming huge amounts
of disk space.

Split the location for scratch files into a 'scratch' sub-directory,
separate from log files, and delete it upon completion of each test.
The new env variable QEMU_TEST_KEEP_SCRATCH can be set to preserve
this scratch dir for debugging access if required.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing/functional.rst      |  6 ++++++
 tests/functional/qemu_test/testcase.py | 14 +++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/devel/testing/functional.rst b/docs/devel/testing/functional.rst
index bf6f1bb81e..6b5d0c5b98 100644
--- a/docs/devel/testing/functional.rst
+++ b/docs/devel/testing/functional.rst
@@ -65,6 +65,12 @@ to the QEMU binary that should be used for the test, for example::
   $ export QEMU_TEST_QEMU_BINARY=$PWD/qemu-system-x86_64
   $ python3 ../tests/functional/test_file.py
 
+The test framework will automatically purge any scratch files created during
+the tests. If needing to debug a failed test, it is possible to keep these
+files around on disk by setting ```QEMU_TEST_KEEP_SCRATCH=1``` as an env
+variable.  Any preserved files will be deleted the next time the test is run
+without this variable set.
+
 Overview
 --------
 
diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index 411978b5ef..b9418e2ac0 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -13,8 +13,9 @@
 
 import logging
 import os
-import subprocess
 import pycotap
+import shutil
+import subprocess
 import sys
 import unittest
 import uuid
@@ -40,11 +41,12 @@ def setUp(self, bin_prefix):
         self.assertIsNotNone(self.qemu_bin, 'QEMU_TEST_QEMU_BINARY must be set')
         self.arch = self.qemu_bin.split('-')[-1]
 
-        self.workdir = os.path.join(BUILD_DIR, 'tests/functional', self.arch,
-                                    self.id())
+        self.outputdir = os.path.join(BUILD_DIR, 'tests', 'functional',
+                                      self.arch, self.id())
+        self.workdir = os.path.join(self.outputdir, 'scratch')
         os.makedirs(self.workdir, exist_ok=True)
 
-        self.logdir = self.workdir
+        self.logdir = self.outputdir
         self.log_filename = os.path.join(self.logdir, 'base.log')
         self.log = logging.getLogger('qemu-test')
         self.log.setLevel(logging.DEBUG)
@@ -56,6 +58,8 @@ def setUp(self, bin_prefix):
         self.log.addHandler(self._log_fh)
 
     def tearDown(self):
+        if "QEMU_TEST_KEEP_SCRATCH" not in os.environ:
+            shutil.rmtree(self.workdir)
         self.log.removeHandler(self._log_fh)
 
     def main():
@@ -108,7 +112,7 @@ def setUp(self):
 
         console_log = logging.getLogger('console')
         console_log.setLevel(logging.DEBUG)
-        self.console_log_name = os.path.join(self.workdir, 'console.log')
+        self.console_log_name = os.path.join(self.logdir, 'console.log')
         self._console_log_fh = logging.FileHandler(self.console_log_name,
                                                    mode='w')
         self._console_log_fh.setLevel(logging.DEBUG)
-- 
2.39.5


