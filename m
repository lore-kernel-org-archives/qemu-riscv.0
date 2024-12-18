Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D5E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:22:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwns-0007m9-PZ; Wed, 18 Dec 2024 11:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnb-0007UE-EJ
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnP-0006lv-W0
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:20 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa6aee68a57so983212266b.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538870; x=1735143670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqqTepJSvigFJNtOuIXqMUPxmyV0Odh55cVF5+vDAVM=;
 b=cHQQIafoM1wRH3eVe1yn2N+dCnYDe/SiFhnSE6V2aXiL9CucB939kP2g/8rJLZfGoq
 RP0dAWJk+CU1VtdkA8HM8i0L1xZeY8n8CCeQJOz1hj1erdnf3WF5uqHOxAn/2R+dCe89
 aJWsLp1wwyPdyziI3QE7i9owh5yaRxgeZIi1zdmd1ttxCNxiydmhMsBTfdfvdiNh4PrH
 zoNoQrfUlLYhj1KjwrOZ7KeIOETK6Qc4mg74Z5oTD8dWygUsPlbRJeWrO07PhrF7Gw4y
 CV/FbSYh6dnvE/wbkwjUJYSZ1WWlPOUqBQLACCHEQ+Q7xkXUl6Y10qh6oPf58vhuIZ5A
 YP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538870; x=1735143670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqqTepJSvigFJNtOuIXqMUPxmyV0Odh55cVF5+vDAVM=;
 b=g33bBFA6Fj5RbROCbCZpPHXjrlGJN6QWdh1z9l8EgfQxN4rQR+Lsh7KIeCeJVESe6v
 5PZWdUoBz4eIkoW6Y+a3a31Hv+43XErwe4Ib9iAUInY8H/y4UmJkp0mUGAznZb4Szvvc
 d3chBOPMAukGhq7So9uazRn7tVZPzapQGHPixzlRrI0uFwu39/CCthf70wkiC9DLcQyF
 w8AcEFajWP9EAzvtSOic1o/RP/Dg8UQxGotnDsQUcKo55fLuQTllgEju8dUiTm0yy7Up
 8/8roHgWXFm+DPpHVOY3liM24KCj6nSlDjGn5m7dzFWFvAexRRX+9NY1i7HDaaY99ZSg
 QH+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxhdG//DV+J1O9T6nYHN2AqR1ToxYspfNSPwa/ApiCVD3z9fQAbWYASn9gs8KM7bxlQWNoay7Xhvdl@nongnu.org
X-Gm-Message-State: AOJu0Yxj6UsedtqJMOFIfloKK73dsY8GohJUP8dCzCKsNXtiXaUh52HE
 GPQY9q0Y0rlG8iOKy7jjPuxqKEMWCZgVnikDXqzNun8nfDX+Ixuh6TMOXlS52UY=
X-Gm-Gg: ASbGncvhSdieOJFEHA+BZQzl2cVlQKsMazydxWGPdrVBnbwMk6g3UPeGOwpwlxg+gct
 TfnHGvM/92N8rTscICzPkluedH/h6LUSZFhDqK8sR80FX/eZJAf1PuuRunr4JhYzGDgGv9uMlpF
 mGVrzt8cpbLZWviSmLQNgSTMuPLR55Z0DMEBCVVIpwthfEq/jF2wdMP2DNZRGfEnA7aaD1YPx8e
 SnLU22ZIksGIOEFbv4W5pP4DVdG8B0/j2rWJmDPKSD0gHWEXSe7fwo=
X-Google-Smtp-Source: AGHT+IEGuuBqa/HdsGNCdf0DCAJrFqAJI3d3UHjIHMrS2i8p7lc6QSHvexDwwjJA6cGvKJs8RfGshg==
X-Received: by 2002:a17:907:9705:b0:aa6:800a:128b with SMTP id
 a640c23a62f3a-aabf471f7f4mr252572766b.9.1734538870382; 
 Wed, 18 Dec 2024 08:21:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9606ba75sm567004766b.82.2024.12.18.08.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DB0B35FD17;
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
Subject: [PATCH v2 08/27] tests/functional: update the ppc32 tuxrun tests
Date: Wed, 18 Dec 2024 16:20:44 +0000
Message-Id: <20241218162104.3493551-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Message-Id: <20241121165806.476008-29-alex.bennee@linaro.org>
---
 tests/functional/test_ppc_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_ppc_tuxrun.py b/tests/functional/test_ppc_tuxrun.py
index 50b76946c4..5458a7fb71 100755
--- a/tests/functional/test_ppc_tuxrun.py
+++ b/tests/functional/test_ppc_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunPPC32Test(TuxRunBaselineTest):
 
     ASSET_PPC32_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc32/uImage',
-        '1a68f74b860fda022fb12e03c5efece8c2b8b590d96cca37a8481a3ae0b3f81f')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc32/uImage',
+        'aa5d81deabdb255a318c4bc5ffd6fdd2b5da1ef39f1955dcc35b671d258b68e9')
     ASSET_PPC32_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc32/rootfs.ext4.zst',
-        '8885b9d999cc24d679542a02e9b6aaf48f718f2050ece6b8347074b6ee41dd09')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc32/rootfs.ext4.zst',
+        '67554f830269d6bf53b67c7dd206bcc821e463993d526b1644066fea8117019b')
 
     def test_ppc32(self):
         self.set_machine('ppce500')
-- 
2.39.5


