Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A746E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:27:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwnQ-0007O4-Ge; Wed, 18 Dec 2024 11:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnP-0007NL-GK
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:11 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnM-0006c4-5a
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:11 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so1326841666b.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538866; x=1735143666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/SJr+0xAZP15vcEaFWAWnIHAp8JE9E44SGnC3D++lo=;
 b=IrrQjMVbhR9RdwYEWLL4oHpMcpoquerc/UfDV6TyNf5L2XAPS8ZjbHuROd6wV2Yz1K
 IHulQGx3NuiE+TR+6s8KM8yuemAxgrHkpgxSWIb6YYvCL7tRMigxWoxos4d3sUXKvINy
 1dqq1SCFfgR/WC6gsQMXdVZZo6BFQjxPdo+EkqU8m6/vRd9yEEtNWhDjCpz5xQtvqPpn
 Ga/HL/4fk3D5ur4YyBUQNteIPe1lJzTZyj2oUYN2OvuavD0wZ/oP9xt4X0pDZTnZNANb
 PK6ouf1jgRyF+guqSFp3krxqWKkB5g/2hc4DVytr2naKOucuKsd3M+dN0F+naP69F4eo
 bKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538866; x=1735143666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/SJr+0xAZP15vcEaFWAWnIHAp8JE9E44SGnC3D++lo=;
 b=Lhooo0dIgV4AbMnXLJ9bQLD5Tj/XlZInad28u1vOCR2ty+z42bpbcXkCSAo641oTkt
 q8VWvC6BacR72rz73NIZDVBZ0DW6I+S4QsNU+I80/Hrp2ypuq7LDGus8z52dFoN9KgFK
 zqyDYT45DAkBAOQ9bG69gf5UOIbeW8aLynptw7/It9GfC81DLhFzB42dRwUEUa+Qiobc
 7r7+Ne9JYD5hgPAUbs5PSVCQ57VKgcECHbzq0/IJxPOYy1sFf8ItJC4BXDZlYdzEyS/6
 qHxYF77RjKBfHz4rIsGfWMRDiu+bhcmZcDBpk48KqCCoqRZNPDZGUWG6Vcul7wvg5Luw
 WYUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDLPiZgMJMtzAsGelRGGKz4q7Gl15HpkzI4eyvTdqZsfVHGO7OkXsMUszgJFuq7v0cZofRJyEwpa+L@nongnu.org
X-Gm-Message-State: AOJu0Yz/rcIsVZ5+ZGPmAhO0UkmbjAkS8oOVSmRPRyNkNeMTGqA+DMJu
 6XSxIIMxnx9D7pOkfhJG7O7wcEKCecbhV3JEv9Cbck1BBqCTon08JEuk6otk3Ug=
X-Gm-Gg: ASbGncsAU4XCv3BFtH71/jQh5Ge+0ojEzS+znYojebkae80rGOVl6yvutlSs1R/qwV3
 6hzLsg7F3LpJHBRCXP3Y1KlMpwmf+Hx6nljYOFvtIhhpGNzz2vsCgOSgF2J2ztGQ+o8LhDKpUCr
 If6JZSdhy42gEzp/emj0hXcVo6DMs++Y0Cin0qLsCLbKnSoKyDGNFDmz8w0UF0p93ld9NV6tu/U
 FjC3r48IYvjKwsj/JnDircOE2Op+9JfwPfCzKjOeUA8xkbxrsDXqzI=
X-Google-Smtp-Source: AGHT+IFthPzbx6DY1sb7DlSTaktUVG3pixyKVA6o1865T4/8OhNarRdwyKxeCGIcknXole4IQIqUjA==
X-Received: by 2002:a17:906:c104:b0:aab:dfef:8136 with SMTP id
 a640c23a62f3a-aabf475c2e7mr274489866b.24.1734538866182; 
 Wed, 18 Dec 2024 08:21:06 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96359c8dsm573844466b.130.2024.12.18.08.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 492A25FB2E;
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
Subject: [PATCH v2 02/27] tests/functional: update the i386 tuxrun tests
Date: Wed, 18 Dec 2024 16:20:38 +0000
Message-Id: <20241218162104.3493551-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Message-Id: <20241121165806.476008-23-alex.bennee@linaro.org>
---
 tests/functional/test_i386_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_i386_tuxrun.py b/tests/functional/test_i386_tuxrun.py
index c593ffbe8c..f3ccf11ae8 100755
--- a/tests/functional/test_i386_tuxrun.py
+++ b/tests/functional/test_i386_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunI386Test(TuxRunBaselineTest):
 
     ASSET_I386_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/i386/bzImage',
-        'a3e5b32a354729e65910f5a1ffcda7c14a6c12a55e8213fb86e277f1b76ed956')
+        'https://storage.tuxboot.com/buildroot/20241119/i386/bzImage',
+        '47fb44e38e34101eb0f71a2a01742b959d40ed5fd67cefb5608a39be11d3b74e')
     ASSET_I386_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/i386/rootfs.ext4.zst',
-        'f15e66b2bf673a210ec2a4b2e744a80530b36289e04f5388aab812b97f69754a')
+        'https://storage.tuxboot.com/buildroot/20241119/i386/rootfs.ext4.zst',
+        'a1a3b3b4c9dccd6475b58db95c107b468b736b700f6620985a8ed050a73d51c8')
 
     def test_i386(self):
         self.set_machine('q35')
-- 
2.39.5


