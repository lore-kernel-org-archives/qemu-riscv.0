Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrZ-0004Xf-8b
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:20:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrX-0004UG-00
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrV-0007xL-Qy
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:54 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:34959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrT-0007rd-8p
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:53 -0500
Received: by mail-qt1-x832.google.com with SMTP id v11so17877856qtc.2
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=tnbr8NQlLnEwyDk6jq23yeNCNXL8rh7xi2hs6eUQisk=;
	b=MCTcCgKEuIsDzv4ERa4r2oGv/ipCRZ0Eo7Z+RbldxxUMaRf9xwFRRL/ZXxpzfa2dg2
	e2b7SPOsoxVkMXoOYGy4jFmHAn/K02jbf+zwxCz17vk9QNC6M6PV6KWBkGyV2qFc1BxB
	0qx5yYpshTweDq38c7YXC9fa/jVJPT7bZAeGhKrTP0CoBdaKaaAxc23Vu0oM2G7xB0wp
	KiPc0WxhK6nBZ+zwDSALPQGx5q17Qm2R12UzsTuas8MepT7yuiHI7+mR3KWZpMSK8zjR
	ibPH2BQ6W6Nii76hmaNkLjbTGatG2YHVIcqc09c5nu3O6IqwSGhWOv+fD5niI+ua560r
	OAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=tnbr8NQlLnEwyDk6jq23yeNCNXL8rh7xi2hs6eUQisk=;
	b=m5Sz4i3Hc5R7IONCtopUYTabsrz8727B25b2kMXhiF9DjAGKcrvzpAzWbxV3/TF7oW
	/bcEqgfgqHWXZy8E/zTM4cQ3YAFhdXnieMPA5HHd4Q9SvYRC952YQu/vT+bz0mfe5x6B
	2cPHuw0eO5ekKhCn2grKwLfpxYehPqCvwo9Xs3IBkezMIqVeziq3sP0uA5LC+/ZcldRY
	1agTZ7aDV6ogTcgiOzgvwuXd6Ib6bHWJibkCv1foXAgZWuMKUMxU9IQM8xhVoMc9Br1e
	maJyjDgnVujy5mnNrvGx68JEKGowl7FFbwQ05KdOflTjDOLPBF4mokkr4nmZ4QzPui6g
	B0Aw==
X-Gm-Message-State: AJcUukeextgK5u0fXUebgb8kKKgo50VpoRyU3SIOdkLZtyt0/oxoBfMx
	lEI6wT3eShmU2d/gc4WJtW63BL7GWA4=
X-Google-Smtp-Source: ALg8bN6OSZHuNb+qWxL/LJZgQSTD2YPrhU+RjbZrZ7V987okAqSBHSPixUbeGjqs12lhhOX07cG+WA==
X-Received: by 2002:a0c:f50c:: with SMTP id j12mr18973572qvm.149.1545844837514;
	Wed, 26 Dec 2018 09:20:37 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	c11sm11728719qtn.95.2018.12.26.09.20.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:36 -0800 (PST)
Date: Wed, 26 Dec 2018 09:20:04 -0800
Message-Id: <20181226172005.26990-14-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::832
Subject: [Qemu-riscv] [PULL 13/14] riscv/cpu: use
 device_class_set_parent_realize
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Dec 2018 17:20:56 -0000

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a025a0a3baac..5e8a2cb2ba61 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -330,8 +330,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
 
-    mcc->parent_realize = dc->realize;
-    dc->realize = riscv_cpu_realize;
+    device_class_set_parent_realize(dc, riscv_cpu_realize,
+                                    &mcc->parent_realize);
 
     mcc->parent_reset = cc->reset;
     cc->reset = riscv_cpu_reset;
-- 
2.18.1


