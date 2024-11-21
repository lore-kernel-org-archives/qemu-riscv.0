Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94538D78797
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:00:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWS-0005gG-00; Thu, 21 Nov 2024 11:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVu-0004rr-Nv
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVZ-000878-8p
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso9626565e9.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208299; x=1732813099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVOduFNiYSGefBbOFbS+1jp6t89niUE1m09Jm4dirSI=;
 b=j2ySktE1jhYo1R8NzQMO4dm2OzZm2KTAdM9jfyCOe8cKF7rQrGpQG4b8aWX41shvYt
 f/sFweJzT1VBlyWXLOjes1bfl7Fx2dS93GgwcZLg3Akfrd4+8g/NxfdabipKeT7fkF50
 uUBcBX+C7My1SRDdIH252sLWNFJTaRSeOMa4nf3B3A+1l0gnrMdgJ4kaj5VMecBT4aHf
 0LQV5U2zMOu2OKypbqogu3Bl9e4/BMkZ8Axt451/nQ7uG8TFQmwimAicA0IkJi/kNqvc
 M4x31jr0rdQlrZ4esraNI7VzbaknHS0Hzxr8RXUYSpoy5EdYmNdmUF2UhuZD1pPHUjdO
 H6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208299; x=1732813099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVOduFNiYSGefBbOFbS+1jp6t89niUE1m09Jm4dirSI=;
 b=aV9hmnvV65MY+5eTnyONIDSbYIjjro7jpqMm7B7ONFgC3p21F3DghS3CCzGKIH3Cxr
 TxdAW9fXzZ0gu2jvhmHXmf4S7MeGJ18HLWGZ8CDzbw4WbCh4omMadtVlYw7bnG+nhTsI
 Qnpw736aejcHRqsaRy9jK2y+JiohFoZUEQ9GeRyRwjbHLqL89SMCsSlGfYq8GJd7ulgr
 JmAA6weNLK1YGLg1nTkddtbGII7jzB6jdP6C6u/bnk73DFos32b2E10QSsWBCpTLMchR
 /KwOgQabv0RXqDZay58aa+gC/z0c+IapR1DiPIYEl8tgGuxJGJ2XgbEZpFXMx/6ywzQG
 ZJaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMT962w0lDGotopeVlJXv+1Vz3Lc+9NrGpNMi24jkl1zCkTgdyFA2FAy52OQ6yCbFhhXaVgED0Lden@nongnu.org
X-Gm-Message-State: AOJu0Ywb2gSBa1zZjs0kxX0KOR6fDkID/XA4E0I+7YryVBvAtsePtcTd
 i3UPR/xOLjYNqspyM6ACBV2qKp1ExjIfHp4xAZrO1WEGD8fnn+ifAhbG78Ape5s=
X-Gm-Gg: ASbGncsKnboFJY8Yv0wFXw1o5YUWU8UPudPCxXLTwgoaCCimRKogkz1SCH0PT34QXsm
 RUPt++pgcEvXPDrohy8xOkEgWB6J3B5NMDERXuTCmfsYTrjQxSLfw2kofNm9QjwgfOWx7iHgdRZ
 YFVhlx3OWtw39sdXS4bLsuzY69aQYVu4dgBYcqqzvd5q0DvcPxIQK+kZEiYB99JcaUTJMWCmAbX
 EI3Fdf6i9p0KYs3d+lQyoM6u4j36riRSjpKv+1pjhlQXN6j
X-Google-Smtp-Source: AGHT+IGaNoTenMq4yd1trvHnQqdRzPi72130iVE6sq2mK9vKa8Jgd3GGN9F4ActKhbIdPkEo0s+NwA==
X-Received: by 2002:a05:600c:a06:b0:42f:8fcd:486c with SMTP id
 5b1f17b1804b1-4334f02a5f5mr59380005e9.33.1732208299513; 
 Thu, 21 Nov 2024 08:58:19 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45bd4d1sm63017515e9.12.2024.11.21.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:18 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8C376604CC;
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
Subject: [PATCH 34/39] tests/functional: update the x86_64 tuxrun tests
Date: Thu, 21 Nov 2024 16:58:01 +0000
Message-Id: <20241121165806.476008-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
 tests/functional/test_x86_64_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_x86_64_tuxrun.py b/tests/functional/test_x86_64_tuxrun.py
index 4f96139871..fcbc62b1b0 100755
--- a/tests/functional/test_x86_64_tuxrun.py
+++ b/tests/functional/test_x86_64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunX86Test(TuxRunBaselineTest):
 
     ASSET_X86_64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/x86_64/bzImage',
-        '2bc7480a669ee9b6b82500a236aba0c54233debe98cb968268fa230f52f03461')
+        'https://storage.tuxboot.com/buildroot/20241119/x86_64/bzImage',
+        'f57bfc6553bcd6e0a54aab86095bf642b33b5571d14e3af1731b18c87ed5aef8')
     ASSET_X86_64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/x86_64/rootfs.ext4.zst',
-        'b72ac729769b8f51c6dffb221113c9a063c774dbe1d66af30eb593c4e9999b4b')
+        'https://storage.tuxboot.com/buildroot/20241119/x86_64/rootfs.ext4.zst',
+        '4b8b2a99117519c5290e1202cb36eb6c7aaba92b357b5160f5970cf5fb78a751')
 
     def test_x86_64(self):
         self.set_machine('q35')
-- 
2.39.5


