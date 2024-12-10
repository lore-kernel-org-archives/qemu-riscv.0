Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABBCE77182
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 20:48:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tL75f-0007Ft-L4; Tue, 10 Dec 2024 15:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75Q-00072i-Q9
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75I-00020C-3R
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so17179f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733863434; x=1734468234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FzFnlzkuRqAIG729x/b7511sIkBqkjnI6qfjXVG1TA=;
 b=rqUT2/BVl06dk9sWshYqzryWM3Q3iBu3v3Cv742+Zg9K9wRoFmQMdJ1punrEEPfE4A
 QvI/GSi+M9BX24oHqBbmXMYEHUQt/mCTld/6O3xpnXmEI2M5hrqobkVYCRZdYFdSkGSq
 25XQAe9M2YjjsVAsgOk2WxHe75AXKpL7aA3P/fykef6I8AGMml1uU5Aus6EpsbJxmrh7
 8y+LNoS4rxQsx4KTakqQ+1itUJySqDWW2glpGaVaKNisHCIg93g7cSiGUFLFLXZh/j6t
 is9Gm5yoZy0j7ZiRsbw5qw+Mx2kLEYVxeQ5dJkgDuoCBaz4I96zePRF5XxonraSM7aY/
 fyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863434; x=1734468234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FzFnlzkuRqAIG729x/b7511sIkBqkjnI6qfjXVG1TA=;
 b=iRmiLT+9KmX/uBXi9wFJv738DLQNXf3x6EJHPZyC8q2hlynp4yP57JaA+U25loM1Kl
 rPYTWEVsT1c+uDp3ktSuLoRS1yNcpm29TD5yv5Ck/6rjeZc1DQLHSIa7AbC9bBxla4uE
 ZpgtEofXSNnMq9mAOeb3g23rme87xP7q3fjjURPBpKCeeHpm5gGTr7Gfg5tyvHEpn3ZP
 JmtBst4vh4M3SgleXFJuqOhGD+9w3zBFc5PDsMEGRQoV6S3sog/OurqSLaGNs49xnSeG
 pbmDgA1ljienBj2cwDYQpvAWu9W/exytjPSW2SDy9pm5/X+74y/EVm1Tq4YBb6jdeOrC
 YRWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmk8PZqi3oNoVjnQOSRefsGAM704FZqNUl8Rc3YMr5CWQMxTf1SYiUKqP5OCTA/xUWz0SKizjS5d2s@nongnu.org
X-Gm-Message-State: AOJu0YzUgc5YZ5Yo9Irxq7JDK/R0YK0xFucgJGEjApwvI8g+FStLtR7N
 TP9BfGxA+BTN9RGBOg1Y3EPiPnn3HIwsYcwpdGApCHoJLi5NN1U9uIUIS+LvZW4=
X-Gm-Gg: ASbGncvTvR0jYM/Lds2cWKd+KTT+wurkfKEjoVXWZUZnUq4tlFz6frMTycgXlJ8osqn
 O+RcQ38xJc7r/TMguE2a/ZLsYBLcWT50Sk8SVK9WkjnTJGQ2MlRU0wrbnbFF+m3Yatys05YAnY6
 YQAXIW3Xu9KoayyC8lFTiWS4WqGTBrcqJE1Ozz1U6n3GJSv0PAEU6BynsPB1pSQ6d/aqLWbAwaw
 4tiMBd2G2K1XTN7fsBEyzZAUGO8oSQt7kVUN2h9sXLXUf5/iIcd
X-Google-Smtp-Source: AGHT+IEm5nhnKQVhY/Ram0da8uu1obyzHjBkHQRntTqTuEcuUD3DVLAH2DGTaKfbVJl4vttLuxHWRg==
X-Received: by 2002:a5d:6c6f:0:b0:385:fa30:4f87 with SMTP id
 ffacd0b85a97d-3864db0cb09mr151941f8f.0.1733863434540; 
 Tue, 10 Dec 2024 12:43:54 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862f0e6ea2sm13170912f8f.79.2024.12.10.12.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:43:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E7F9C5FCAE;
 Tue, 10 Dec 2024 20:43:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 06/20] tests/functional: update the mips64 tuxrun tests
Date: Tue, 10 Dec 2024 20:43:35 +0000
Message-Id: <20241210204349.723590-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20241121165806.476008-27-alex.bennee@linaro.org>
---
 tests/functional/test_mips64_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips64_tuxrun.py b/tests/functional/test_mips64_tuxrun.py
index 54af1ae794..0e4c65961d 100755
--- a/tests/functional/test_mips64_tuxrun.py
+++ b/tests/functional/test_mips64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMips64Test(TuxRunBaselineTest):
 
     ASSET_MIPS64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips64/vmlinux',
-        '09010e51e4b8bcbbd2494786ffb48eca78f228e96e5c5438344b0eac4029dc61')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64/vmlinux',
+        'fe2882d216898ba2c56b49ba59f46ad392f36871f7fe325373cd926848b9dbdc')
     ASSET_MIPS64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips64/rootfs.ext4.zst',
-        '69d91eeb04df3d8d172922c6993bb37d4deeb6496def75d8580f6f9de3e431da')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64/rootfs.ext4.zst',
+        'b8c98400216b6d4fb3b3ff05e9929aa015948b596cf0b82234813c84a4f7f4d5')
 
     def test_mips64(self):
         self.set_machine('malta')
-- 
2.39.5


