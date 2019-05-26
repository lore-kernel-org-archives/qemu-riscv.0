Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxI-0003Vo-6E
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxE-0003GC-C6
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgK-0006S4-A2
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgK-0006Rd-52
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id w22so7086385pgi.6
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=VQ8fcwwFdIxm5HTObYVrKZCT6rKtwie9e2FUMwfKUS4=;
	b=egQeHk/8o7Beik9Zc1keNVuu9qwFMNWm+yQPDR9yi7MFIlqBrBABKMM5uXw2TXa+pM
	KZEudh/TjOOrNNurE9kefIZ3FUQCuTDwoU7BSCg8kbDrGXc+Zuvm3Ep9mYXkAMBKKW9G
	kFAM8jU3mRzFXCClYMeisJ+fImk5KqPo9D2Rzt01lmFV+vtO/2ly11V5ByrHimihzq8j
	PDfJnNL39tE6Ss/fu70QQBidxaRna9Z9z4e+BYKzXwHEDvG0a/PQA9NUxEz+8O+qLyOq
	DR8hoZpMyDKCkCh92KQt/kFsXpb9HtZxkxkBCbOlomDnJR7sO+kelLY13lxHFqhjW5e1
	afKQ==
X-Gm-Message-State: APjAAAXoHdiTgOqff63+pv/pbgacTsyKVofceV/LaSXEyjlIaqhl4b0R
	7EyiuQoHY9mofasDEwOQlBMZNRfWixM=
X-Google-Smtp-Source: APXvYqys2KYuKN4U7KzKmfBzhu9d270erB562S7aRzp/Nrwa0C63vk4UDPQTvdwksXis2on/X3cJTw==
X-Received: by 2002:a63:1150:: with SMTP id 16mr116821920pgr.40.1558833034802; 
	Sat, 25 May 2019 18:10:34 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b4sm6805720pfd.120.2019.05.25.18.10.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:34 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:43 -0700
Message-Id: <20190526010948.3923-25-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PULL 24/29] target/riscv: Add Hypervisor CSR macros
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
X-List-Received-Date: Sun, 26 May 2019 01:28:05 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Add the 1.10.1 Hypervisor CSRs and remove the 1.9.1 spec versions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fe7164754b19..52c21699774f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -202,6 +202,12 @@
 #define CSR_DPC             0x7b1
 #define CSR_DSCRATCH        0x7b2
 
+/* Hpervisor CSRs */
+#define CSR_HSTATUS         0xa00
+#define CSR_HEDELEG         0xa02
+#define CSR_HIDELEG         0xa03
+#define CSR_HGATP           0xa80
+
 /* Performance Counters */
 #define CSR_MHPMCOUNTER3    0xb03
 #define CSR_MHPMCOUNTER4    0xb04
@@ -292,9 +298,6 @@
 #define CSR_MHPMCOUNTER31H  0xb9f
 
 /* Legacy Hypervisor Trap Setup (priv v1.9.1) */
-#define CSR_HSTATUS         0x200
-#define CSR_HEDELEG         0x202
-#define CSR_HIDELEG         0x203
 #define CSR_HIE             0x204
 #define CSR_HTVEC           0x205
 
-- 
2.21.0


