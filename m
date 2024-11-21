Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB50D7879B
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:01:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWU-0005sr-Ja; Thu, 21 Nov 2024 11:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVy-0004wb-92
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:50 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVZ-00087V-Vn
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso9041555e9.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208300; x=1732813100; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKrSgwoOIB4OSiNtMwyKChP9Qz69Q67QpefEexGi4Oc=;
 b=ebjAlxAGwzwKtcWnYogBE6Kpd5q88FB6VIwRiM8EI3Ofk8RARqwCLjaNcYjgevqVTl
 Iu5r5+Khd4RF6NLpXKsTKfPyf0LXiVsGNJy7gpfC67R8vc0OMyG4FJ0gMttBI0vvkLM5
 Q2mOUtCC7/oT/EKl6C/r0lxxJBVfB1UBYceimI2psh10EqIpeq7n4ACfUYQ0vbNOpGDW
 /hidDNvPm2+X8c8xVpNw6k+8QReQmYtIigGHA4ZFHp43EOMPa3vbuwFMC/X/3pp58FJW
 nN0u07SkVcLXBz20Kuc+gg4LJRXKVgmBFJi7wRz3563c1TUauA2GcZV6fg4ttAt2g9mm
 GiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208300; x=1732813100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKrSgwoOIB4OSiNtMwyKChP9Qz69Q67QpefEexGi4Oc=;
 b=tI2idH//ICP/14yMJk/9+oXlWyG5b1EIIw/DcrM/pxoHRYKnU7pAwyc7JMB/sg/PLo
 AUaMPRAdsRthBsPyc9kUY7E9fUJI9HmfccFRV5atmmInorgj8pVbFX7V2dnc08jbPl7c
 HEp8XJwXOg7xPyi+ccgQUyBCjs9yBIohaHY7i/373/fcW8xptbGWfMCzeoGf5SGiWE1z
 SqlJCHtOqKOBNyGLDfKLevgVpcxuGY+PYmA8BNOWEi8aDQ2QO+Q+bR0O1zasv6ekt4Ku
 XyBz5nLbbw9N/PCiNXxhNP9hzlyGUmYr+ZWipjA9LH53N1lX3wRSpsyS2k7RKKHlctll
 bkdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtqERXwcqR5ssDOQam/1XFEZoqhC/qJg/+xlP5SuTbGrrZYgj5I0NjAFnzAIK9n0oYhwpcWhOe3imn@nongnu.org
X-Gm-Message-State: AOJu0YwOD8x1qPiIR9wgwcD0k+9u+KCbLAX71O7TLDWvM8d0YNC4Rz/P
 M+J3fc4Qyss9h5z1i7//inyPyk2p8LHXkzRwYYildGrhJv6ke7DVLZLJynXkf54=
X-Gm-Gg: ASbGncsMmJ+KT3oftMfY7HuyMGBGtdTZlLgKm6WEoBWuj03sR7HXLIg532D9SaJAi/T
 YDo/baQtgy5tvQnMg1sYE+OzR5ifGsHoCxEg31dkpaz0AKqcQKYzJ1D8RlZmsux3lNCz0v/hfEZ
 1E8ruNWs4/V4RYuU/y+QA+L0dF5kzuXN8h02KgoV5VXosdHI/2yfsTYXFnE1UAH9kPrMGzKiMYs
 UqvLyUg9VPXZR9qs2lJszJ3UqDvEEifN/paEtZN6+5ck8aZ
X-Google-Smtp-Source: AGHT+IHsTUPjdhW4QKhCICloxld3LZS72QBJj+Twfdsm0pls9bwmpzKF1bHQYiEWBQqZO2P9Mg09Rw==
X-Received: by 2002:a05:600d:3:b0:433:c463:62dd with SMTP id
 5b1f17b1804b1-433c463659emr45431445e9.27.1732208299880; 
 Thu, 21 Nov 2024 08:58:19 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825faf9829sm26910f8f.31.2024.11.21.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 613005F940;
 Thu, 21 Nov 2024 16:58:09 +0000 (GMT)
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
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 32/39] tests/functional: update the s390x tuxrun tests
Date: Thu, 21 Nov 2024 16:57:59 +0000
Message-Id: <20241121165806.476008-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Now there are new upto date images available we should update to them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/test_s390x_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_s390x_tuxrun.py b/tests/functional/test_s390x_tuxrun.py
index dcab17c68b..a7db4bfd84 100755
--- a/tests/functional/test_s390x_tuxrun.py
+++ b/tests/functional/test_s390x_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunS390xTest(TuxRunBaselineTest):
 
     ASSET_S390X_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/s390/bzImage',
-        '0414e98dd1c3dafff8496c9cd9c28a5f8d04553bb5ba37e906a812b48d442ef0')
+        'https://storage.tuxboot.com/buildroot/20241119/s390/bzImage',
+        'ee67e91db52a2aed104a7c72b2a08987c678f8179c029626789c35d6dd0fedf1')
     ASSET_S390X_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/s390/rootfs.ext4.zst',
-        '88c37c32276677f873a25ab9ec6247895b8e3e6f8259134de2a616080b8ab3fc')
+        'https://storage.tuxboot.com/buildroot/20241119/s390/rootfs.ext4.zst',
+        'bff7971fc2fef56372d98afe4557b82fd0a785a241e44c29b058e577ad1bbb44')
 
     def test_s390(self):
         self.wait_for_shutdown=False
-- 
2.39.5


