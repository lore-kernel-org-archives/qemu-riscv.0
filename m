Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F088AE77197
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:55:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCoy-0004HH-2K; Tue, 07 Jan 2025 11:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCom-00048I-Cv
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:52:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoQ-0005qC-AC
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:52:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso114293245e9.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268733; x=1736873533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAm5CLLg9CbkGcsm6UEr9S48g/0qIqAr62CjoayD1as=;
 b=fGMjofNlrO2Mc/CaesCKAvcrvBZO5DO2tho1nxAq/Tglt8XhqM8NObugHOLTaK2s30
 QegZNPe6rBkpjpxLgJRRFc2nNRUrbC3YtuKk/j05W/DeNJzMdCQpY8foK/1439jzouhJ
 w6Mr75mwTBj/kvr2wOu4X624rJyHBY7uV2DDIxo5nO6aT2MeSjsafjB+8NICLmt6EU0i
 DIKB4QAfXoFbbzvGVEENKL3/61TekxKOiH3/WSecNlRocUd3U57AFLmd4A7211ExMMvf
 vc2vfqbB5P30A0yGY4jiRlMjEJFw73kGYmI5yZRSS87hUYCeLFhZioIb+WAliITuaVMx
 wBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268733; x=1736873533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAm5CLLg9CbkGcsm6UEr9S48g/0qIqAr62CjoayD1as=;
 b=M1J92k+fyyDjpr7bQx439rceiPwA4HXDspI6k7VXdYNOgANw9thRXVs56kez3mP3E0
 xO3Ruva5mXRJMKST15PjTuqglkpSiwkE31MGXBumjD+ZoYzSgrJkftAL2goJ6+kL6O3s
 XaS+RLTdiOzRSTnm1QCDSI56Ds0vlj+R9fXGVp+y4ulNfJt4EhQopvuBpIpGp+GavZ/n
 lzJnspEnDqksUO6d18kqxu0gJUZ4XwiptBG4v2l0f7/xVD9/9+Ab/KPo6pzc35XI4IwM
 KGkdfvQq/hcD4MoxrjzXror1BQOY5/DpRsxIH4U9Ov8EHL9CFjF57MsaRyGJE37LD8kF
 r3RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSLVhe4BQixMx6yowLyd9Gv7v9cH+iN/16ce3jePPaLoxmVuO6K9aF0oLd46G+ZnToHRxFEa17z3bi@nongnu.org
X-Gm-Message-State: AOJu0YzR7zGb5tp/5/c3pyiFsZYQvKk0gxA6DJ9Co32BdZ4J83z9Lp+0
 G3JXQ9QWA9LaUXj8vuUiMKWWigCOT2ROhjKEvjjRSRuNaHhMmopZY8HDVInKiAs=
X-Gm-Gg: ASbGncv6M0+rwtXNz5dfm8kTix6LqdOnDZwj9AJkFgP2kdu7cTqDxk+DgMSLLepxHy9
 SXmSpiSYbdnUYZsPGwEiuP+acm8boF88vIDQQY1Ezladkhhvn/3YeIzc1i3oEQAq/wb2HqGmbet
 wFnFDJ6tcAOyiL8zKU8z7eVMhM0OiOThvsMEWPMw1Gn9VzL8rkI+LCGi5rN03T3i+fsRqew9IKK
 m3eKv0tgsTEwr5g0zzsdbtalYHnKZsI0b+ov11HDV5n5urVwKpffUc=
X-Google-Smtp-Source: AGHT+IGioCwy/MktanB+hVlb46/WW89VYn7JrfuFRCWmCdTPcDUUVEo16uqps/X0wgRcsCV9iiguqQ==
X-Received: by 2002:a05:600c:1986:b0:434:fdbc:5cf7 with SMTP id
 5b1f17b1804b1-43668b7a0a8mr500485875e9.27.1736268732891; 
 Tue, 07 Jan 2025 08:52:12 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4274csm639215485e9.38.2025.01.07.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7F3C45F932;
 Tue,  7 Jan 2025 16:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3 05/29] tests/functional: update the mips32el tuxrun tests
Date: Tue,  7 Jan 2025 16:51:43 +0000
Message-Id: <20250107165208.743958-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Message-Id: <20241121165806.476008-26-alex.bennee@linaro.org>
---
 tests/functional/test_mipsel_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mipsel_tuxrun.py b/tests/functional/test_mipsel_tuxrun.py
index 2965bbd913..d4b39baab5 100755
--- a/tests/functional/test_mipsel_tuxrun.py
+++ b/tests/functional/test_mipsel_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMipsELTest(TuxRunBaselineTest):
 
     ASSET_MIPSEL_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips32el/vmlinux',
-        '8573867c68a8443db8de6d08bb33fb291c189ca2ca671471d3973a3e712096a3')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32el/vmlinux',
+        '660dd8c7a6ca7a32d37b4e6348865532ab0edb66802e8cc07869338444cf4929')
     ASSET_MIPSEL_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips32el/rootfs.ext4.zst',
-        'e799768e289fd69209c21f4dacffa11baea7543d5db101e8ce27e3bc2c41d90e')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32el/rootfs.ext4.zst',
+        'c5d69542bcaed54a4f34671671eb4be5c608ee02671d4d0436544367816a73b1')
 
     def test_mips32el(self):
         self.set_machine('malta')
-- 
2.39.5


