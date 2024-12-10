Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90863E77180
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 20:50:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tL75s-0007S6-Js; Tue, 10 Dec 2024 15:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75b-0007Bc-9a
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:15 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL75N-00024P-FB
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:44:15 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385ed7f6605so2712808f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733863440; x=1734468240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HRwD3Xk/RE1GAmonVu05a0HKbmwgTGs+7B2YTG5x8w=;
 b=TawC/hXlSiAL32jZ3lmfGCkg+qr32jBkN4F3nemKpK3FO76QgVvMyNovOANUNpdB2m
 jJxnZFti1NE3o+CWxKmvJUlTTcdYTnpQPpatf4yl0ZkPWHQvr3MYl7KoIKOKMjw5B3Wr
 jlV9oYNhEqAIlEQ2ByY9RU3TgUcmoYRKFVYkdBMCokGsMHEVGjipxzLLqu8aCokFecPi
 /lHxMIfOS+PBjiP9W8cKBTnrOt5FY/5FTM4vkGqx3DhMvKMH0DT0DyQwDBSeadU6TimU
 uHkGvcZIf6sTp/em9iWyHCabQe6n7qKgyON+k50DjM5CAvKbKrmvqkj7nGnn7ifhX2CE
 Mkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863440; x=1734468240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HRwD3Xk/RE1GAmonVu05a0HKbmwgTGs+7B2YTG5x8w=;
 b=qS7mVaqBLuXb54cJY46qhnMWvgJXhN9AGDFc6D8LGRfAjtJlmCrMwTNMhJMgQJh7oN
 yG52FSEfDwVDORrQUUUR0Imxtp9MVGcMERS/KgTUYyClCNNLaJjq2c18AVuXayC+FQfC
 lky9vhLheQwLFQ7ky63YcoRVE/38usmgGjf5udHDCsjTs7EYfEaEqPSU0j2iE2AjySFH
 YYumkhHAaLgXiCRO33RanrT+KEDi7Zk5KPvTQbwy5xH9F8qxjpj+2yXFv7fkBw0IMIbt
 eEj3srZTNjBYH+mWikyAF1cOuZ9+4+cQP2B+G4KypFdZeuGz0veQIJ6qRCoX75m2dMBb
 zesg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaBQJUXA2VKEazCGpUU7/LJQQZXun2LKEjoh98J8dYamLWd5tXtBQn/e3Hr7IM+7spHGLnRvfVx0Et@nongnu.org
X-Gm-Message-State: AOJu0Yz3WvodeskAu81rRCeZ6yj/uLd0bwju4P9nI7rJpsSHFUXTRajd
 it7mO/XdNuDCK/eXt8EI27SKGT51ytTi9vwnW2CK0QP5GkUMe21mOXSl99/397I=
X-Gm-Gg: ASbGncueo0KAFS+BP93XuBIA5pSHw0JQKiqEuKlPYVzT1OinuoL1Gp4FuseVQPsGG4I
 Vh2K97SXOhuAbetUTVwL+MuCaTN8vFmlvW9MIH8J8DDW9/F/tKDGJe8njul6Vosc0ebgAEfGIiU
 pZ8f0AHuzfhP2XFUjeL3SwBUXvsEWijW6UQoWCYl7QGxwKq16GY8vq99BJNfILlx2PR/a6Dv13l
 W4BzjQq7/6KmwR1olntjwl0uM5/6k9XkMYS0IlAsNjBAJCPCIWV
X-Google-Smtp-Source: AGHT+IHq2T+gcmyKuDV8D626sye8AgfmtLn4NAc6bBpmLa9dQxWimWBoA6KnrEVJVH2Zu6kkt/OZPQ==
X-Received: by 2002:adf:e192:0:b0:385:ee40:2d75 with SMTP id
 ffacd0b85a97d-3864ce559camr421357f8f.20.1733863439964; 
 Tue, 10 Dec 2024 12:43:59 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861f4a85f2sm16563189f8f.29.2024.12.10.12.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:43:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 593C35FD4D;
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
Subject: [PATCH 11/20] tests/functional: update the riscv64 tuxrun tests
Date: Tue, 10 Dec 2024 20:43:40 +0000
Message-Id: <20241210204349.723590-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Note we re-use the riscv32 kernel and rootfs for test_riscv64_rv32.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-32-alex.bennee@linaro.org>
---
 tests/functional/test_riscv64_tuxrun.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_riscv64_tuxrun.py b/tests/functional/test_riscv64_tuxrun.py
index 4e2449539c..0d8de36204 100755
--- a/tests/functional/test_riscv64_tuxrun.py
+++ b/tests/functional/test_riscv64_tuxrun.py
@@ -17,18 +17,18 @@
 class TuxRunRiscV64Test(TuxRunBaselineTest):
 
     ASSET_RISCV64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/riscv64/Image',
-        'cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv64/Image',
+        '2bd8132a3bf21570290042324fff48c987f42f2a00c08de979f43f0662ebadba')
     ASSET_RISCV64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/riscv64/rootfs.ext4.zst',
-        'b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv64/rootfs.ext4.zst',
+        'aa4736a9872651dfc0d95e709465eedf1134fd19d42b8cb305bfd776f9801004')
 
     ASSET_RISCV32_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/riscv32/Image',
-        '89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv32/Image',
+        '872bc8f8e0d4661825d5f47f7bec64988e9d0a8bd5db8917d57e16f66d83b329')
     ASSET_RISCV32_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/riscv32/rootfs.ext4.zst',
-        '7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv32/rootfs.ext4.zst',
+        '511ad34e63222db08d6c1da16fad224970de36517a784110956ba6a24a0ee5f6')
 
     def test_riscv64(self):
         self.set_machine('virt')
-- 
2.39.5


