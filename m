Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16327C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:36:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL587-0003Xr-RJ; Wed, 03 Jan 2024 12:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57w-0003T5-BB
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:00 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57o-0002Mu-6j
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:00 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d88fff7faso24863255e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303230; x=1704908030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdsiaowAjsV2VhJV7X+uJO6SS3PjKGOvNs318qpxEnc=;
 b=udnsPMjkO0Ppej4CA5oKCwErxZtFwGWNbCDUKiCKcw/Nyd7V2bEj1fKMM2jGwEphR0
 9k+mgiYoZPX7IdQgRgu8S/OmUWG/Of/9xZ+X/0VfRD6WcBjHmKUfl0eYOjWdrWHoWU9P
 xUcE2ip5hcOVQ9OAWpSUzl9SulsTdMKljx/hadQKx5D5Lp7jkg7AYbC/ZrhOjfq/rCsj
 +J5kxCJ7TunfMNWdqPvIvokAmmamBGsP6XC+wHKeaXI7fAYmtS5tPWAB93r/ft6bs+kw
 uqMxxAlNsML2tWnyzey16p//YPxmbOrul9xb8F901i+qWYj5umDRz/Ttr0lotXX3AL85
 Q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303230; x=1704908030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdsiaowAjsV2VhJV7X+uJO6SS3PjKGOvNs318qpxEnc=;
 b=Tfkzm/81ipF60EjaPMSFh6xYL8rsH+zxFYG6nen25Hl3NBvOjhgdAZcKeIA1n0f0iJ
 mVQcGGGggmExlr1HDdUb+74YB9xXkpIlIDAqWk39h3MVyiDztFSwsW4TrQEKq5pZ8oW2
 +xcPg+YXCyQZTUnS7u/eF1BAa/coUje6HF20/NG3QpNG4kZm5ZtWan6lRw+cR1QBAEV5
 52oLt72iPXI8f3RSOZS+g06hcfOLWNfntbTnOczekv3528VHPSCgw623fGqULSv3jR8N
 iwqRCBsPGf9F75al9+xaCZngA6+G1dlfFPnNBQY/qa/hkUvWPy2XnKdOhgccftxbaJUO
 2u2Q==
X-Gm-Message-State: AOJu0YxyD9ugFehuSTWI2uyhQdMnnfDrRXBFYpYv9dIUyS4/YaGCnk4h
 ypxjeYXvV8016r9GCKv7w/yVGWbt7nrvWw==
X-Google-Smtp-Source: AGHT+IGeFbtzVvu3T8oVc1zHjuCDZo+RPaHsfV4kjVznDt57AzNWaYV+gZhSH5pdHVRgX2Ots1y9PA==
X-Received: by 2002:a05:600c:491e:b0:40d:5c56:5545 with SMTP id
 f30-20020a05600c491e00b0040d5c565545mr3022779wmp.298.1704303230107; 
 Wed, 03 Jan 2024 09:33:50 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b0040d8d11bf63sm2903966wmo.41.2024.01.03.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6A5105F92D;
 Wed,  3 Jan 2024 17:33:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 01/43] tests/avocado: Add a test for a little-endian
 microblaze machine
Date: Wed,  3 Jan 2024 17:33:07 +0000
Message-Id: <20240103173349.398526-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

From: Thomas Huth <thuth@redhat.com>

We've already got a test for a big endian microblaze machine, but so
far we lack one for a little endian machine. Now that the QEMU advent
calendar featured such an image, we can test the little endian mode,
too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215161851.71508-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/machine_microblaze.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/avocado/machine_microblaze.py b/tests/avocado/machine_microblaze.py
index 8d0efff30d2..807709cd11e 100644
--- a/tests/avocado/machine_microblaze.py
+++ b/tests/avocado/machine_microblaze.py
@@ -5,6 +5,8 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
+import time
+from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
@@ -33,3 +35,27 @@ def test_microblaze_s3adsp1800(self):
         # The kernel sometimes gets stuck after the "This architecture ..."
         # message, that's why we don't test for a later string here. This
         # needs some investigation by a microblaze wizard one day...
+
+    def test_microblazeel_s3adsp1800(self):
+        """
+        :avocado: tags=arch:microblazeel
+        :avocado: tags=machine:petalogix-s3adsp1800
+        """
+
+        self.require_netdev('user')
+        tar_url = ('http://www.qemu-advent-calendar.org/2023/download/'
+                   'day13.tar.gz')
+        tar_hash = '6623d5fff5f84cfa8f34e286f32eff6a26546f44'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/day13/xmaton.bin')
+        self.vm.add_args('-nic', 'user,tftp=' + self.workdir + '/day13/')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+                'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
+                '821cd3cab8efd16ad6ee5acc3642a8ea')
-- 
2.39.2


