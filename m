Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B21E77199
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:17:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUzf-00076a-DC; Wed, 08 Jan 2025 07:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuJ-0000hc-T8
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:38 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuA-0007F4-KF
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:27 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso726717666b.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338259; x=1736943059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZ8UT6jHrgv7BkeIPE8IB1TgPopOqtqdb8E+kOWH8C0=;
 b=YAyeAsr3q3eP0WzE6k/6rW4clLY1Yhm8J+2lNLeroZv3RFkwhkEe8Z9TM/dj2vo4vR
 RPL/3ivggFkjqdu42bNPcFB65/lcxS/aQ1ypH6Dhbuv7lZQC2ot648Fi0cTDtEsELXkm
 AgGY7wUH4rwavFIpIfbTRo2ZGslsZvJnnEvpPkS4/4fWmyNuRW0nmBAu+gUx29JjvRlv
 sNipUP9yuYitTRolXYbmlsrhbFYFSeMy15u/njfYDPvxxlT0IAokSo4NGig46aUykOEN
 ByFC3YnyJFKY/N3cTNCku0F13dKgwHVgVVl8LXdfMRLQ/yIaoaSVPV/7BuMCG9JGIV+S
 +i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338260; x=1736943060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ8UT6jHrgv7BkeIPE8IB1TgPopOqtqdb8E+kOWH8C0=;
 b=NOajVFxli5ysMu+vAJ8M4sk7mJrfL/DD9MhRDypjdvCBrIJI7wuBZtQG0UlLDgQl8c
 sbPDSNRPIOBkqhPGlJDXbObjrdM3usVty2lWChoNhdlNwDhaTqayZtk8ZwhMgtRQbhVX
 NUHM1idN2fhLhKgzud8DiPzTsdglR6gwviG4yFQ/HQAbRR+IBMtFXxwoEPPdkCerY/KF
 3jYmx+s7PtVoMIV7kd64g1cny5mIfaccRmlDCeak5Vw8yBg7jfIWt8HYtxSdLCIWNwwH
 /DpM0mHE/sp0Rj1pyQyexhitE1oUAdJmaKNXFQxJYumc+0caNg+7t65+15nXNNfl/OF9
 5X0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCURfOAfars8tNSaG2BZRZltkOaJYE0kBikCIjAwztf5wScYL3sHA5JvL36t7Y1U4SUkTVaCTUtD9PyR@nongnu.org
X-Gm-Message-State: AOJu0YyxoEegjZ7AdxFmkMZNGw8SU0NgFaCToy3ZqpkRzPionmYFLZZ7
 1pe9jYJj3SZL0lPO4Cq37IjVnnr/cnzwtbIK2lchIhp8HZfXOjZ5kTIc94HK0qo=
X-Gm-Gg: ASbGncvKSEmKkK++3/Gewnu+YbvtaChvxpK7XndT7uA7caEmT2TSl/bU/dkH9j6yV+g
 YeYgrtywmkx9jjGn2ga/Z7PDDG3Ot8eV7g2j+muG1DGjogNoNfn+slYTg+iRgPkWTkCfE4jXEeD
 j5oU2Zl8VX+QZm5+pVTD5Uiy3PQViS6KFctFs+dHsUhbhWuu2g9ZMe8x/O6nR3IJ0sUVxBeCimF
 nN+tSlCpL7Gb5av+NDUSE2VVnkzo7UxFycgwK/NYiC7ysV8x24AOBw=
X-Google-Smtp-Source: AGHT+IFiBKVTmc1AqQKc9Sk8OkcYj8QrWKGNEa5nIkvz1p8IlrVHmopJdJt0eP4+s9NoRYdDBtocxA==
X-Received: by 2002:a17:907:3e21:b0:aa6:7107:db00 with SMTP id
 a640c23a62f3a-ab2ab70940amr176355466b.50.1736338257907; 
 Wed, 08 Jan 2025 04:10:57 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f011f7csm2483614466b.138.2025.01.08.04.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:10:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EB30B5F92B;
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
Subject: [PATCH v4 04/32] tests/functional: update the mips32 tuxrun tests
Date: Wed,  8 Jan 2025 12:10:26 +0000
Message-Id: <20250108121054.1126164-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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


