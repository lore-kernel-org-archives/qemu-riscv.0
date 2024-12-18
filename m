Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3DAE77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:24:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwo2-00082L-Bx; Wed, 18 Dec 2024 11:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnb-0007UH-JK
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:26 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnQ-0006mc-VG
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:21 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so11924747a12.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538871; x=1735143671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0JqfhsmeygXn7vgTHEJChr0z2trV4kJFC93MfdFa5w=;
 b=LO07bYYEk2Q7hmZVobMwdNf6ZLAk/pWljRprPKniTSYskWxEpU4yhXj/FKPweM+ind
 dcBCDXsnbY4E+swmzea0tXokr0TeSY3W/xxT65QQnDvplcstEkWF8gt9MUfD3HStVcXg
 Tw82HEB3jjSzBPl8O0OJslY9anrKpsssYjFEX/UtljeJ0pqHVqtnsUrw/yt5z38pEOYJ
 ADwTG/E7xXLO7xyf7zpl3ytrHZOHZtsfBSuPaeEopXwrUQKizYz26fRKaGLDW/dy5NIM
 8h/eJ5hBYQaRBD1vxTYQmtgb/ZTrJtLvNE5B/ZGHKt3/FbJYT39dJld6Ihk4j2M/Hbs9
 YcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538871; x=1735143671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0JqfhsmeygXn7vgTHEJChr0z2trV4kJFC93MfdFa5w=;
 b=C2oqgNSqkA/j6bYE8ElweON1tdC/ckwjcYX/vQEPRPAcT9rtVuX1GVxFdvtyvhmD+7
 Q/CMUQPd9lLgn/s7EyfNaygGs1s5aULmJ54dNFIdfd3BFnGqnG9NJZo6+jCh0lbX5717
 H2xBkeFc32hXThtFk53b8hqelqoULacRDlStMbu/Eo20eohalhs9s74Z7OKjopIhiU2K
 3DNbRuBa+DXuDMiO+JMzFJ0DyULlK0njSkNd5GSvjPLFe9x5k+96mlGoBbCRWi3Tynn2
 0C1IjEjlqe2etrIS+P8Z6WxMEW/W4/ZgQ9CmuD8Q+AspGBJs0M+nBZ+yErI3HT7g+EFV
 5rGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxlLHNh8SOmWpt4XPMV0X+caPswHd2Pv5TZsQcuoCVrGOrGcwyIDD6AwU8G3m/esGqRRDaXWnJ2mA6@nongnu.org
X-Gm-Message-State: AOJu0YxgVw7fGhtOMuZMm1MAujiNnQa5doEjptDw0PP+cnmaofdW0eMG
 iQwLq8DH/DBW800TpO0C/QZB/OVUUZjzDecP+lPOUSBh6x9+X1yPyytEyqAyDuI=
X-Gm-Gg: ASbGncvI6qxD3RAk97jt5KAGXV0qzFickNCjKbMS5MYFNc46GBkA2q+WGA5Unqi/ZlJ
 6veJIozBumZmXm8kriwrOi+lM6ebdFoEoU/OYeSgaabBliRA+GIuL+8aAD2oSfChpfX13BrLgIl
 OxIRpklZdumXPfc2RHwhacFUDzGEGWpKsxPwMR8ufmvxWVP6l3Y7STh+5vduNcoyTTMHfNcnE5+
 hw5J1UNhS0Rco7zYCtaO3+wBQCWnu3Odl1S5+xvs+WNNdH3LvpBgJ8=
X-Google-Smtp-Source: AGHT+IHbrJBSB2qGSFF53Xm1Bk4mqWvQLAySompUigBIHXblU1jA1X1cNs17orP5jR9DE6A0QdTOgg==
X-Received: by 2002:a05:6402:524d:b0:5d0:aa2d:6eee with SMTP id
 4fb4d7f45d1cf-5d7ee3eb36dmr3461877a12.26.1734538871136; 
 Wed, 18 Dec 2024 08:21:11 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ae13b9sm5484250a12.43.2024.12.18.08.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 320CB5F86B;
 Wed, 18 Dec 2024 16:21:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2 01/27] tests/functional: update the arm tuxrun tests
Date: Wed, 18 Dec 2024 16:20:37 +0000
Message-Id: <20241218162104.3493551-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-21-alex.bennee@linaro.org>
---
 tests/functional/test_arm_tuxrun.py | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/functional/test_arm_tuxrun.py b/tests/functional/test_arm_tuxrun.py
index 944f0756e1..4ac85f48ac 100755
--- a/tests/functional/test_arm_tuxrun.py
+++ b/tests/functional/test_arm_tuxrun.py
@@ -17,14 +17,14 @@
 class TuxRunArmTest(TuxRunBaselineTest):
 
     ASSET_ARMV5_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/armv5/zImage',
-        'c95af2f27647c12265d75e9df44c22ff5228c59855f54aaa70f41ec2842e3a4d')
+        'https://storage.tuxboot.com/buildroot/20241119/armv5/zImage',
+        '3931a3908dbcf0ec0fe292d035ffc4dfed95f797dedd4a59ccfcf7a46e6f92d4')
     ASSET_ARMV5_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/armv5/rootfs.ext4.zst',
-        '17177afa74e7294da0642861f08c88ca3c836764299a54bf6d1ce276cb9712a5')
+        'https://storage.tuxboot.com/buildroot/20241119/armv5/rootfs.ext4.zst',
+        '60ff78b68c7021df378e4fc2d66d3b016484d1acc7e07fb8920c1d8e30f4571f')
     ASSET_ARMV5_DTB = Asset(
-        'https://storage.tuxboot.com/20230331/armv5/versatile-pb.dtb',
-        '0bc0c0b0858cefd3c32b385c0d66d97142ded29472a496f4f490e42fc7615b25')
+        'https://storage.tuxboot.com/buildroot/20241119/armv5/versatile-pb.dtb',
+        '50988e69ef3f3b08bfb9146e8fe414129990029e8dfbed444953b7e14809530a')
 
     def test_armv5(self):
         self.set_machine('versatilepb')
@@ -37,11 +37,11 @@ def test_armv5(self):
                            drive="virtio-blk-pci")
 
     ASSET_ARMV7_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/armv7/zImage',
-        '4c7a22e9f15875bec06bd2a29d822496571eb297d4f22694099ffcdb19077572')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7/zImage',
+        '1377bc3d90de5ce57ab17cd67429fe8b15c2e9964248c775c682b67e6299b991')
     ASSET_ARMV7_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/armv7/rootfs.ext4.zst',
-        'ab1fbbeaddda1ffdd45c9405a28cd5370c20f23a7cbc809cc90dc9f243a8eb5a')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7/rootfs.ext4.zst',
+        'ed2cbc69bd6b3fbd5cafb5ee961393c7cfbe726446f14301c67d6b1f28bfdb51')
 
     def test_armv7(self):
         self.set_machine('virt')
@@ -52,11 +52,11 @@ def test_armv7(self):
                            rootfs_asset=self.ASSET_ARMV7_ROOTFS)
 
     ASSET_ARMV7BE_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/armv7be/zImage',
-        '7facc62082b57af12015b08f7fdbaf2f123ba07a478367853ae12b219afc9f2f')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7be/zImage',
+        'a244e6da99f1bbd254827ec7681bd4aac9eb1aa05aaebc6b15e5d289ebb683f3')
     ASSET_ARMV7BE_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/armv7be/rootfs.ext4.zst',
-        '42ed46dd2d59986206c5b1f6cf35eab58fe3fd20c96b41aaa16b32f3f90a9835')
+        'https://storage.tuxboot.com/buildroot/20241119/armv7be/rootfs.ext4.zst',
+        'd4f9c57860a512163f30ecc69b2174d1a1bdeb853a43dc49a09cfcfe84e428ea')
 
     def test_armv7be(self):
         self.set_machine('virt')
-- 
2.39.5


