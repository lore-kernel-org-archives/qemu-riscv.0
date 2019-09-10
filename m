Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwe-0000MQ-SJ
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwa-0000FZ-9g
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwZ-0006zG-3d
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwY-0006yt-Tf
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:39 -0400
Received: by mail-wm1-f67.google.com with SMTP id t9so2380345wmi.5
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=9GK2Bf5OnfdKtfsKMa0SLxJhchcsTnh1ghEkn9cP/2k=;
 b=L+X0GmO0cLbjtjTt4uNvOVfDXjXSzD3qsUjLQHHsP5t9QOIcsgjSdPzjSgwHboxazD
 dWyfq0IbQBAYQfUw3syeh2tMJOQ2qdEOo3taVv1qTEDS/NM0N5XMNGp5PTiE/t+MZf44
 RRuC4+aHkxmo20h9CejM2Ld9ycv9/2lmHs0HuyqbRhjgV3mV1bu699HQCqthM5NI0Yky
 GpEyajOtlXTH8pka7ITccRSF0NHYDr6LDEJS3gWJ0/+A3Ihw0BpIli2pWjI8nqmkaH2R
 7cnN/Y5g8+WFpF+T3Si29Vm78IDo7HjlRj1A7oSc3V9R7c2d1H7QG116oOHD17jvDOKh
 gPTQ==
X-Gm-Message-State: APjAAAUTOgpbjSL/z2Et/JPNOE1LWl3lq+b7r5/tHyKKT7joI7i/mO7s
 fDfgyTGKnb2pSDPcITDcvqRggUwDoMTdAQ==
X-Google-Smtp-Source: APXvYqx4b8fcm6+z2J9BVueXQJB06f9sWQr/czlXgu6hflbrH2E7AjcsVWjE2V0klFemMixIpkLP1g==
X-Received: by 2002:a1c:1acc:: with SMTP id a195mr2834573wma.106.1568190337504; 
 Wed, 11 Sep 2019 01:25:37 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id x17sm2039918wmj.19.2019.09.11.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:37 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:11 -0700
Message-Id: <20190910190513.21160-46-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: [Qemu-riscv] [PULL 45/47] target/riscv: Use both register name and
 ABI name
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 08:25:43 -0000

From: Atish Patra <atish.patra@wdc.com>

Use both the generic register name and ABI name for the general purpose
registers and floating point registers.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6d52f97d7c..f13e298a36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,17 +34,20 @@
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
-  "zero", "ra", "sp",  "gp",  "tp", "t0", "t1", "t2",
-  "s0",   "s1", "a0",  "a1",  "a2", "a3", "a4", "a5",
-  "a6",   "a7", "s2",  "s3",  "s4", "s5", "s6", "s7",
-  "s8",   "s9", "s10", "s11", "t3", "t4", "t5", "t6"
+  "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
+  "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
+  "x14/a4",  "x15/a5", "x16/a6", "x17/a7", "x18/s2", "x19/s3",  "x20/s4",
+  "x21/s5",  "x22/s6", "x23/s7", "x24/s8", "x25/s9", "x26/s10", "x27/s11",
+  "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
 };
 
 const char * const riscv_fpr_regnames[] = {
-  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
-  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
-  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
-  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
+  "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
+  "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
+  "f12/fa2",  "f13/fa3", "f14/fa4",  "f15/fa5",  "f16/fa6", "f17/fa7",
+  "f18/fs2",  "f19/fs3", "f20/fs4",  "f21/fs5",  "f22/fs6", "f23/fs7",
+  "f24/fs8",  "f25/fs9", "f26/fs10", "f27/fs11", "f28/ft8", "f29/ft9",
+  "f30/ft10", "f31/ft11"
 };
 
 const char * const riscv_excp_names[] = {
-- 
2.21.0


