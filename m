Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34043E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUv9-0001It-OK; Wed, 08 Jan 2025 07:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUu4-0000Y2-7x
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:20 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUtt-0007DT-Lt
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:11 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so4755341a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338256; x=1736943056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/SJr+0xAZP15vcEaFWAWnIHAp8JE9E44SGnC3D++lo=;
 b=LedUve/Tb/8EPyz9h0ATQzSjSHUneHA/DrB1dNw91PsOrI+uD9XGtF/Y0XrnMnB/bD
 NbKbtzXQGj4qyAupGGrVU+yClN3oYvC+4OZ89E9K8gEDsFynLOyjBTEg3DeFHUmBS8F0
 3QZZYAriZEbAnSIFxfWDKiLMOsle6PuFvOq07Jv4usDtsmrV/smyCNZM6t6uJXlNmQ01
 MylCvdSfWFBhr6Kyp+C5iB0hi0XvmVMy/A5PbXlUgLLk3pxSwkdsIBSuLIEq9c0Tp/TL
 FfcEmqwGg9EPosZS+j/bku30NwOWJsNJTMKC1XqMhNyPa97o/ywSsO0CrkZ1ZM9QpPLI
 2FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338256; x=1736943056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/SJr+0xAZP15vcEaFWAWnIHAp8JE9E44SGnC3D++lo=;
 b=Sn99Zc5kECV5/T7lf8kZsksTkagXS+/ZtgXWPxLy62E9pe/ceJyFYlDehtvBMWRPUZ
 YnX/aER+/pPbvzcR6l1yjlJSWKbcFGFG0iuM6b2h6uszv3StX6DUe3qfVvF5vu9uyymo
 wARomLQd73cJITzBQ8gA+n7uieLiFLbzHM+Ikdnd8J9AatP04ABfHK4EJNFVIjJHjzCc
 Z9bYDqHFLmYNhQa3D6RDyzCHH37crtO/Hq5+JpD4RSZEPZWC2EwzVsKzN7MTvMzRaOPc
 k9cBDXT6lOoce204yqycf7lkAXAWQ9RY3Nm/R3CfIFRAPqplav5QxAodinqA1nKGHBqG
 pT0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfd19vBXYMnkdWVhIWWh8FdvCd8Z9DPDkKUPhB4nqeElwboPdPw8hOnnwfsATQg0tbzpXbS6MR3pPy@nongnu.org
X-Gm-Message-State: AOJu0YwnqT/8N5BdG/M8E1itJB9fpcdfECKsaahRsWR9cJzwkdaWDgTL
 N7r3UVQ1hgxRlMcKP4JC/Ku/1kbmBYF9Zs5wKd+pn4mb2Bhv+PGClVO85dOtilc=
X-Gm-Gg: ASbGncuNn+RfUTYq4vQ49J3a4UMxVRy8M+/IY6ex6ihbQ5u1SgndsvmaBmlOS+Q4oLi
 MskL6kDYJoVzODx6IRGzyF90UW4pGeKqKvVb3YJ5wFsMVmrXjF1DjWevu4VgC60gQoiR/HWkP6m
 bsoMQvpBQ7/tO63PHgXS1q46zzFSv+MDZFLyUjRDi7CSNZ8DMmyPOd+Uj3BCrs4NbRIRDLMH4BR
 CXm3RXrespg7lawZQB0JOuCUn4BLxHp2OMz4FRmjX9YgSynkD/LqaE=
X-Google-Smtp-Source: AGHT+IEEA12rMpqycQBrvfGPhrnKmPmV+o7n3arimbUVTvaaqmwMpbrvWiimuU0OZiu9x3h3NI+usA==
X-Received: by 2002:a05:6402:3888:b0:5d1:2377:5afc with SMTP id
 4fb4d7f45d1cf-5d972dfb38amr2155460a12.3.1736338256233; 
 Wed, 08 Jan 2025 04:10:56 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe494dsm2516818066b.101.2025.01.08.04.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:10:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BD24F5F91D;
 Wed,  8 Jan 2025 12:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v4 02/32] tests/functional: update the i386 tuxrun tests
Date: Wed,  8 Jan 2025 12:10:24 +0000
Message-Id: <20250108121054.1126164-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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


