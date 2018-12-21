Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHY-0001oQ-PJ
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHP-0001gH-Co
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHN-0004EY-CC
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:03 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:33998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHN-0004Bl-3A
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: by mail-qk1-x732.google.com with SMTP id q8so3364394qke.1
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=tnbr8NQlLnEwyDk6jq23yeNCNXL8rh7xi2hs6eUQisk=;
	b=mFl6Z5azvogZ9jJPXFPruvbA9SbiO4GkQV8grB0yT4t5k4U9y/JlSch+ceztPgE1Yx
	+ETdBUbuEIMdWib2/w/0/KDdgSOnfrDhDeCb3AUpv0Z846Z/EKJES2Gzh1nHYYaU9DEZ
	Y6ZNeOodMjNsNbpGzkkmMcIimGH+SBwZF9lskKOU/eMx5J6vhsfLbwqg7MIRGeiSa15C
	QkoQRMfOLlHW5Zrw0gf+X7jkB94ppsat4AeYINa7yFBy8yM0bIJ6HKpABA3qT6YQbEcG
	MCKse4gChsaH0RnoPPFWMoW2xCEWqulmaJrWTonxQh94o76TR+hb+zQpQrsHLrGgU3/I
	hqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=tnbr8NQlLnEwyDk6jq23yeNCNXL8rh7xi2hs6eUQisk=;
	b=ecck5H4GKxPlsaAHeZjvNLWjEBsZOp4Mxb6EH7qXApdARZ4jpkusPAVeUgU0wDOOLx
	WoqGM54ZVDdFeFXEVLHV2x3dfu0JjjqSiRY3bmbaeqnuMqZY0CtvddIO3PCrKebBlYr7
	ZWuDAWR6ndF9PfC9Fjn4IMZ7CWtAn04aW4hI+E1VoSOekt2AFV7lfiHTDJewUXi0QVm5
	d+mleW6VhSwfsPFz6iNbmbdvAQge2ZmqA98kZ4e7CqOmDQxJOPlRslVmHW5nRtVM7w+T
	tbZSjJ7dgT9K6oVhmWWbeiLXj258Ad4HVaPgkOY7hgSosilAXCMGIi7JCzG6kAz3K/80
	Bx+g==
X-Gm-Message-State: AJcUukfDK+dDHSZR82khniUuksb0GjhmYBPCirUsngz07QQ4f5h6WbHp
	VH1NECbz0DE6EOAL0Rl7Hgga5A==
X-Google-Smtp-Source: ALg8bN7KRmM2VX/iRzWCAqmI5J62TMLWFDcOwY2wu4BZEr/5qRmoInpDlcG78FcsvQuzzfYGJrScuQ==
X-Received: by 2002:a37:ba06:: with SMTP id k6mr2860378qkf.115.1545408236411; 
	Fri, 21 Dec 2018 08:03:56 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	a68sm6069751qkj.63.2018.12.21.08.03.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:55 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:06 -0800
Message-Id: <20181221160307.14819-14-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::732
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:07 -0000

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


