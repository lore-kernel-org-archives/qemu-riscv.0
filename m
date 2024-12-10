Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1DFE7717F
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 20:49:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tL75o-0007OC-Cu; Tue, 10 Dec 2024 15:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75X-00078r-W9
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75M-00023H-Bb
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434ab114753so40270195e9.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 12:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733863439; x=1734468239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WD+OCh9xieXyi8aUL7na7hMYPj/U0GHInutd7eRNwQ=;
 b=yrRhrutqlaoWrmKr2ZIeDdnKg8oBdXEGjMG7f/tPiJyGAcxy6TME+T3Wf0OFwjHSll
 t+G2eHVP7ndkafza1/Ly8+Ev5E6+0RSCX9VTTEixP77W3VEJP+YvLqOuMM9j+5F3Nh9c
 SfLgxllslQgD83Z88pP4oLOi9fQ4thbDUmtcXVJcZrhefFWpdS0Q8S54TlG8ocJhhAfp
 qj1axKz//xojVFZ3eBl0y2JFlmhoADn2m3fOIWlMRqDU7PsRoMWi0guQBScCxTVQkzO8
 DxIQJGkcP5X/z2GrDBugyj3fBS0CupA5/oNAOAO/8sGxSdThuIHFRyzJZfxJgR8sMVAk
 zmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863439; x=1734468239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WD+OCh9xieXyi8aUL7na7hMYPj/U0GHInutd7eRNwQ=;
 b=h2EywXQ7FewWrxTpHilTJc/4agDuKFDQlbI0E0uXLc6TJWe80O+vlCQcmgN798KglR
 Xm53STTO9HbRUh1i9ZrlMx/+qPSLwH1GPiqoX/u2VE8sgtu3+hTcLPIdGpv84F21gNMK
 WoE8rBa+XyNScO7LAESsCwmYKS7L0mo0aPHt8bVnV/bnw+ODx2xmK01YgsCdrIZduFlK
 yZD1Cxrem/iYkULM1uEvvWGD9UyI2XUmU3VBDpMEPHQdRZOh93ED9avMzMQ4JesdJjyG
 jYQS1VQZmiQ1pIq+5bbtP+dcxeWMRZm3tNrD1/twB5goTzqg9teSYJ6N70EAT7XIkLBY
 ezXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfVEiEaQSSKpok2Bc7XU9CMu2wk3bgt/drguObsoGBKXzv7WMEEVW7PzqRPOW9vgY6Q+vf3ymvrNyN@nongnu.org
X-Gm-Message-State: AOJu0Ywweh0r8hEojSgWT+rwlT1x8cjW6vIcosjfrNkLatrr37VEMz95
 HRGnSXPCXVz9bZ6kVSQNf2dwsDEAO1ge/oF9ESk57EdL38t6rTnkpHvZJexPQ50=
X-Gm-Gg: ASbGnctHYxAU546et0ccryZi/qHtFMEeJk8crOZs052D+DaNxPJcu5cz9ssUYnuQVKB
 KWXKlenh/7+duHOzgQtgGsRYzhg7X39YxIVIx4GBYJKgd51ItfBD82vHQ1uzLg3GTl9jMec+4Dm
 xKPdYSCsoTuuSxrhYWLOXSjwPsnutyBeyhBtNO4idW2P5Q1Rn6TDul2H2qd2qyba+0tH3xuwxwI
 s08lQUNjhHgBgdf9s8pCd0ZwK355PH37fdCTBRVZh/t12uJpQoy
X-Google-Smtp-Source: AGHT+IGlft8dLIiYeE6+z+aH5Sxx5T90YfKk1dd/kvWpubSTf3Lq2qY9Z66+aOjBFtVnWeKYJF58Og==
X-Received: by 2002:a05:600c:1907:b0:434:ffd7:6fca with SMTP id
 5b1f17b1804b1-4361c34469amr2048685e9.2.1733863438723; 
 Tue, 10 Dec 2024 12:43:58 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43502fef1eesm35935295e9.0.2024.12.10.12.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:43:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6D7345FE31;
 Tue, 10 Dec 2024 20:43:50 +0000 (GMT)
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
Subject: [PATCH 12/20] tests/functional: update the s390x tuxrun tests
Date: Tue, 10 Dec 2024 20:43:41 +0000
Message-Id: <20241210204349.723590-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Message-Id: <20241121165806.476008-33-alex.bennee@linaro.org>
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


