Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C53CE77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:29:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwno-0007dL-De; Wed, 18 Dec 2024 11:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnU-0007Ro-IY
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:16 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnO-0006eO-4u
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:16 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso12117098a12.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538868; x=1735143668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ8UT6jHrgv7BkeIPE8IB1TgPopOqtqdb8E+kOWH8C0=;
 b=E75Bq10f2tiRsG5tnW0y1JrSyEw+xPCoz9P12p+FC5DDpQM79nzFUQBnypqQAM16MI
 oybtBhYr4MbOyiVsTMqzSmTep9CcJTRij5oHOitBplXjgsnZJCxN1PMM3zjBoWIjB6rI
 d2XH2fbk8BFhynTFXuaBiEcdJKoqg8KKmmLH7Zgqa2a06rgI6u0UgnbJDJ1K6aqSTQX3
 y1o4lCK0aiUFF2Pc0iz1p6kKIWpmJyxoYcJLJMojfX2NFw7QNGK9M2E+d8omSt7r2La3
 5BbZ7OB5pEOBjZw7DQ7hr4SaTvO1eRyP1F0W4kYPUR9mZ5CLjBs+Uvq/NpDaL6B37+hf
 uUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538868; x=1735143668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ8UT6jHrgv7BkeIPE8IB1TgPopOqtqdb8E+kOWH8C0=;
 b=LDvYfP3AodgBH6Vz+/N7XrkK8veO5YU5sgD+qnBpnwGGwwue77739UoKzQPoZPjEJ6
 VRmfvGcWsBM7ptv1SZoHtgo6ERoeLY24hR1R5myX42UNnYq1NI6u0SsYaZv3yRRiruwK
 jfHNdmpuLiYQCXfXXz4k945u8BSeTbfMe0b/3Hysj4Lhb51MOckNwazWxyzgQ0TCOCL5
 zfJAEwd0fiUm+AiSwU1wBGDblw3cxhU2kJQrVdbaQ2s31Wd0BcdwnxDqLxBAkwO0A3YM
 5tG+hzEoT8BBADMOYUpCfE59cX7kQ7xbj8oNs5q1DRVje+rU62y/Lz9Diabt2P5Guf17
 BaVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRHi1OHapTbzOtpFnOKRvkjPf0aqaYg78bXLOwLtJqgdAAiqj+EDS2RGlH9nqtWa3WKMznSOuoMCXP@nongnu.org
X-Gm-Message-State: AOJu0Ywk8oNZvQ/5OhlNdaNXOUtG5/+TF4HL7DL7nHSkWsL/+ZGZZLDe
 OwosW727FHiwZSj1HQL/0XlzcGuGMtJp+rDyMReG3VmUXhdHvBBb4Q/T/ReH3GE=
X-Gm-Gg: ASbGncsFXe6wfPHomg2dlKy7SHEbdAF2PuIXLPKN63Ljfcz9Q/gq1Cq2Cz2HOi7dIBr
 8wGL0D5e8CmJdA3ojMu4bD8uMYoVvvfMdhPK07y20x1gp/Fg6NRVFDgCI6GPKI7mmchheFWP8fC
 C/cBTuMa0jHQCchmjbvaNe4M9XdJenbu7V/qXgTw/mCuNFqlzWpoEsMnppVXmcSFPFmggshL0D2
 lpwE8ZPe4oP8WwJIt1Avk5+aSY2hkI76QcTWWVunXIL85F2nAAgFd0=
X-Google-Smtp-Source: AGHT+IGfN6nIn4H77MosXQRyNukPFYFK7lw+HIcDde91XQq3D2LR0qDyKvmGAMZ+6PBTI9sw59vJXw==
X-Received: by 2002:a05:6402:528f:b0:5d0:e73c:b7f2 with SMTP id
 4fb4d7f45d1cf-5d7ee3a2916mr3596861a12.7.1734538868315; 
 Wed, 18 Dec 2024 08:21:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ad17fasm5502715a12.22.2024.12.18.08.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7C89B5FC8A;
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
Subject: [PATCH v2 04/27] tests/functional: update the mips32 tuxrun tests
Date: Wed, 18 Dec 2024 16:20:40 +0000
Message-Id: <20241218162104.3493551-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Message-Id: <20241121165806.476008-25-alex.bennee@linaro.org>
---
 tests/functional/test_mips_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips_tuxrun.py b/tests/functional/test_mips_tuxrun.py
index 6fec44c2bf..6771dbd57e 100755
--- a/tests/functional/test_mips_tuxrun.py
+++ b/tests/functional/test_mips_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMipsTest(TuxRunBaselineTest):
 
     ASSET_MIPS_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips32/vmlinux',
-        'bfd2172f8b17fb32970ca0c8c58f59c5a4ca38aa5855d920be3a69b5d16e52f0')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32/vmlinux',
+        'b6f97fc698ae8c96456ad8c996c7454228074df0d7520dedd0a15e2913700a19')
     ASSET_MIPS_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips32/rootfs.ext4.zst',
-        'fc3da0b4c2f38d74c6d705123bb0f633c76ed953128f9d0859378c328a6d11a0')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32/rootfs.ext4.zst',
+        '87055cf3cbde3fd134e5039e7b87feb03231d8c4b21ee712b8ba3308dfa72f50')
 
     def test_mips32(self):
         self.set_machine('malta')
-- 
2.39.5


