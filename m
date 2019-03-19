Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EU5-0007fy-AM
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6ETw-0007Uw-FJ
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGf-0005Pu-UK
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:58 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGf-0005PK-Oh
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:57 -0400
Received: by mail-pg1-x535.google.com with SMTP id q206so13791896pgq.4
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=aq+PQvBAYMr9TetDYzbxFa3L+q/hLP72QO5baDAOzCs=;
	b=TwaEkY9Xaf3kGW6ka0Ojwyy/G9HGLg4OFFZvMADRNUy3zql2URAi4SY08ZZ9Y1D+65
	5DCx3f1haqXfpCYfLkCV/jhh/UBmyVpw31y9BQ/S7xH5uVvgZowXLlq++Xc/jtTPYURc
	/lxHp8OhkysG00kOs6Y3pb3xLQFRQszDFW1DbQyt5hSZRbq4uBiniqixKoPoe52o25Gs
	DeJ1nM2uZL1jQycKEsufa7j4uG/cTZQESI7+jrftB3iiRzJFcmpde8lQVZb2gQ5dK8Eh
	gIisnY5l14gj2UBavn5CGQbNC5xzCF8xcGsc0DuE/uwO+fFypXl+QFaxUq248ZvmCeuB
	qmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=aq+PQvBAYMr9TetDYzbxFa3L+q/hLP72QO5baDAOzCs=;
	b=RV00faBqVXaBoxYopxRr4+byuJiYdplBKRAS1Y2chGbSE57rWNLlYn7JRmSHhoKhoH
	dE0flO7u1w0BRF+P76O60Bz1wlE2jHW4SSmVbCpekp6RmygiRdJQOubyltpSoQiEOKC6
	/6xQR6+w79Adi4TwQgOiQJBGEpAdkpLJt6jgp0UzdN39Y+81yfvP1yGwZ9vIKpk603aQ
	ab3sQJRnUI8UfUa55EerbOLHbV0rNYYHMQNIMHjIHNEaLxjjmmtNcCcor8xQ3rO15Hcr
	pbe6IlUd0cG/N60f0/Q0DjZj/Oz/B3jFFnbNfKyRMX4xOc3wZktceHyhIJfhW5ajZl6U
	6W8A==
X-Gm-Message-State: APjAAAWs2eZ7L2vgSn5EFSplp8uUpg+FqedxawQ5foY1jfnN4QFv6bni
	D79r22WSBYahQ3Gf23a49jFM4SwVg65tsEOD
X-Google-Smtp-Source: APXvYqz/VowbQOdKtwVano1Wcgfzsu5s7FIY48OjAflh2B8MPUvEWduuUXEe7Yy/wggX8i4SUAUuXg==
X-Received: by 2002:a65:6656:: with SMTP id z22mr1631391pgv.95.1553000096504; 
	Tue, 19 Mar 2019 05:54:56 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	u13sm22740348pfa.169.2019.03.19.05.54.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:55 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:59 -0700
Message-Id: <20190319124803.13826-16-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::535
Subject: [Qemu-riscv] [PULL 15/19] RISC-V: Update load reservation comment
 in do_interrupt
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:41 -0000

From: Michael Clark <mjc@sifive.com>

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6d3fbc340165..b17f169681ad 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -525,7 +525,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
     }
-    /* TODO yield load reservation  */
+
+    /* NOTE: it is not necessary to yield load reservations here. It is only
+     * necessary for an SC from "another hart" to cause a load reservation
+     * to be yielded. Refer to the memory consistency model section of the
+     * RISC-V ISA Specification.
+     */
+
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.19.2


