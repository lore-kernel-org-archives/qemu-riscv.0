Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUI-0007u0-AN
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:09:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EUE-0006q2-Nr
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGH-0004g5-LL
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:34 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGH-0004e0-AN
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:33 -0400
Received: by mail-pg1-x542.google.com with SMTP id y3so4564079pgk.12
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=nbai/EUTYvan1AteNdXSS991xRfK72jOZCM/uUlWSQg=;
	b=ZyXztxiqoCzVMJL4u8w3aTleH3w744V5e9cPwfY+9buBz5Us+7cwshmFbAYDkRMsRt
	P8RldsRo6YzJdKZtDsgtBn8ljPIgteRQrNi8iRu7bV3lbVWAk/p6sGPknVxjSrGS/tE9
	VkHvP8bbN/brmO6OCPebu17mkxUdiEcfKbgZvo1+zLiMx+RfOEYTXIUErJzDU9euYuDE
	4gz2p0smPo0OUOY7SC+VZ4y2tdZLzsQ7+V6+HAj9Iff1vj8li7a3qAM4vL21xOR1gPNO
	80AfRFBJLL8gh6S2TM+p71ekf+s6DcAwsxXAZSNgcXB8sTsa9/gkpYdEyohuFdvoZN5A
	kGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=nbai/EUTYvan1AteNdXSS991xRfK72jOZCM/uUlWSQg=;
	b=VemZVQ1dt8fTMv39wW5RF/6SSgrbQGfu2RVwbByShEeE4jjeZ5INHKsNXBd36yIErb
	pekPT7Fg2N3juCQoBACXiC7cu4+Pvi/a2PkE5C1kfQa8S012qVZl4GI5Ivjtm0jXMcGB
	m26vVW9jmB1aLCNkDD8YOeOZHOMQi98MMKFxVRRE3gc++BLUt3SQOKWpRtBIIHLnShqr
	U9/9fJAMnCtkszyvXt+sYKVutN9F+xm53UWD5ItcIC8+5Z5zk6edpgT6TEYUGI8GDgv6
	Rf7AYOCavNICBM8f8wr9utfyR46KQyASqXTLCj6WRg9dNq/e1VP1+LLrcbdxRuKNnHC8
	kFaw==
X-Gm-Message-State: APjAAAVnlw6DYikuXMTHaQJGXIgsJ7rUE6wf5drapeLyBR9MmjkCa9E0
	1WQSKuNAt4Jdo6d4i91qzIwVOs87FwL8ifH5
X-Google-Smtp-Source: APXvYqwer7SGRvea+dWbxuedcbtO/w986KQZgQDyFmgQq5vcsdsLq8mZS4ymljlFc8FBVwMO3zcHKw==
X-Received: by 2002:a17:902:8693:: with SMTP id
	g19mr2392224plo.157.1553000072235; 
	Tue, 19 Mar 2019 05:54:32 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	j12sm9476997pfa.33.2019.03.19.05.54.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:31 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:51 -0700
Message-Id: <20190319124803.13826-8-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PULL 07/19] RISC-V: Replace __builtin_popcount with
 ctpop8 in PLIC
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
X-List-Received-Date: Tue, 19 Mar 2019 13:09:01 -0000

From: Michael Clark <mjc@sifive.com>

The mode variable only uses the lower 4-bits (M,H,S,U) so
replace the GCC specific __builtin_popcount with ctpop8.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index d12ec3fc9a54..b859f919a71d 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -383,7 +383,7 @@ static void parse_hart_config(SiFivePLICState *plic)
     p = plic->hart_config;
     while ((c = *p++)) {
         if (c == ',') {
-            addrid += __builtin_popcount(modes);
+            addrid += ctpop8(modes);
             modes = 0;
             hartid++;
         } else {
@@ -397,7 +397,7 @@ static void parse_hart_config(SiFivePLICState *plic)
         }
     }
     if (modes) {
-        addrid += __builtin_popcount(modes);
+        addrid += ctpop8(modes);
     }
     hartid++;
 
-- 
2.19.2


