Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CBCE7717F
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 20:46:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tL75N-00070C-L8; Tue, 10 Dec 2024 15:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75K-0006wf-MW
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:43:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75F-0001yd-9S
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:43:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so2044721f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733863432; x=1734468232; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/SJr+0xAZP15vcEaFWAWnIHAp8JE9E44SGnC3D++lo=;
 b=fR4Wf653JANAA1X874Da/i25RssYad1RS+VEWpp64BW9Jh2nENwNmEJHERFuxnMYXR
 8h/SMo0hUOlymgtG57XZbkRkknktvpOsGdy0WGt8UKBgHL0CtegMv1KHq4hkn8vrOYJm
 wPWrpmAgidScy4s0XHDaAv2KHQUU38noGEzQsh2Zzbq9xBhQT0/rRCGsE3OroAGTicHb
 jJxNBJG/VBAoGHctEuc7wS6WdaklQggPl+onRasmIMqcNL4hNC0jpfh29WTL3freoEY1
 6BR2YEaXBnLbr7K8tHaKphy8OS5oizUTnHmUcgfhsIYsp05/pSmpyN9Gvva4c28lzS2o
 yZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863432; x=1734468232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/SJr+0xAZP15vcEaFWAWnIHAp8JE9E44SGnC3D++lo=;
 b=XWv0XotuBor+tTaFsjCDOS9m2vwn5fVxvG5/y1ZOxyBCp9VzSN2GDNwBgz7LJ7bj/b
 eSxPGbxqoF27YnO/B3+1VQpL2SEB9TK5s2M/skSS9n5570INq/ognRdGdiWqTmWXB0KM
 ZJIS6OqCwcZOJOeqpphP0T7PAPfSAZ5jQCRe0bXYN0sBHlyrAeItgvqgRfxWh4u3EAyw
 1+7dnFMoRyubcE8F2C5VPK+XYeypzWKeN+GMKIf38aeDf1rKLDfjGQmIC/wuA57tBcrU
 TUhLPbvqk9Acgw3FKWyqZgIWyffLJmdQVq1s4xvjz11bShnlFix9DWONhbQTkLEbgjyl
 OQGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfa+YBSepx9GmeAaDjakuat8Y8//kBY71lXkH1UBWdIKDe4rkf01TYDo6ZH0k5nulHgVOIyO7qIefK@nongnu.org
X-Gm-Message-State: AOJu0Yw/WSF+VEXj/5/93SL+pnb1UJ1DYkXb+uyJg11OfDAhTo1KWYaV
 WMplbuhJADdmzCWRjsQDzoQZuUZRiH03OvOf+5S8yrWmicIOxqNLIRhIxvyk5nM=
X-Gm-Gg: ASbGncvV8lgX32x71SlS1Xlnps6GSWp4bKQUZaeWr6/3/MIEsBtg+8VZsE7vyzirTbD
 TwMNyAIsridKplJa4yT662LEKs2UxqGRDtwti5cMNGwCX25WFjZk1Bt4AcRLTHP6Mt4qTACFuFN
 0+ZGwYFQkUTokcNkYYcSvXy6GLCPwHxyTvqvc/4bMxFdnIe3+XMG6V56Au6nb4dZ5JxRrbKBCeZ
 HPiDCKwbW4kGDdPckHZzg1JFA3fY7ZUXFaZrJVbbMU6j9TmdP2O
X-Google-Smtp-Source: AGHT+IHF1W9QIuzbrH4eQO3ZP0uTd3oXHQ3X6MBgBg/bfwT2ooK+QKw8HkWZSye1Ctqj156bq/S+Ug==
X-Received: by 2002:a5d:598f:0:b0:385:e43a:4ded with SMTP id
 ffacd0b85a97d-3864ced94aemr329044f8f.57.1733863431763; 
 Tue, 10 Dec 2024 12:43:51 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621fbbc14sm17123273f8f.87.2024.12.10.12.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:43:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 959BE5F9FB;
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
Subject: [PATCH 02/20] tests/functional: update the i386 tuxrun tests
Date: Tue, 10 Dec 2024 20:43:31 +0000
Message-Id: <20241210204349.723590-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


