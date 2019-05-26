Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxV-0003ja-1I
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxG-0003S6-KK
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgG-0006Pi-V9
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgG-0006PC-PR
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id s11so7490357pfm.12
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=lgmEqxyiwMV1Ti/O3OydvGHQpr3dTuAGNT7RYvHKmXU=;
	b=t3vMwMbWkzh9GNEkBtwaG5qepXtFkj1N459X6+x6gX+QYAPbxkb7dXFfMuUSCx2s52
	V/q/2m+7rh3F2Xe5UsxeiwbdiOlp4EzG0AZS5v4LofpebVUpKCY+Lx73L0+qQznKYsQn
	cbTUEy1w/QtN7+CjvwX/EvHkIostxuobZsexb/FgHdThFlX13DRhN2XxKp+tg+XB1Hh8
	ho1mlgAPg6a1SJp5M0s7qUPjsw9II7Acgi32JsOmd5NSNoGCPb17k4uWuAdfGNGwKwJg
	cVgyk4C+wNYPripKMBIT8drrFf53ElW9aKEiTD60sj1BH1DMfdTBzDh2yr1gT65SjugK
	++0w==
X-Gm-Message-State: APjAAAWsf/Rk5/3l6qa/baQG80he3mtXt6lfIc+Tc9J8NUdPvh6sJbG3
	Q1OePIgbGzX2QCh1iDMjz9blnrYalL8=
X-Google-Smtp-Source: APXvYqxdqUW5vrXTFgqdFuWPM0Md4nZfvb/ye6xN3/Z5tOWFGK8yKhPbkkYl2JeXiMfG4AeOQ0ACCQ==
X-Received: by 2002:a63:1c4:: with SMTP id 187mr89182910pgb.317.1558833031392; 
	Sat, 25 May 2019 18:10:31 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	r71sm14305215pjb.2.2019.05.25.18.10.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:30 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:40 -0700
Message-Id: <20190526010948.3923-22-palmer@sifive.com>
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
X-Received-From: 209.85.210.196
Subject: [Qemu-riscv] [PULL 21/29] target/riscv: Improve the scause logic
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
X-List-Received-Date: Sun, 26 May 2019 01:28:07 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

No functional change, just making the code easier to read.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7318da289f6e..c577a262b8b4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -515,7 +515,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         s = set_field(s, MSTATUS_SPP, env->priv);
         s = set_field(s, MSTATUS_SIE, 0);
         env->mstatus = s;
-        env->scause = cause | ~(((target_ulong)-1) >> async);
+        env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
         env->sepc = env->pc;
         env->sbadaddr = tval;
         env->pc = (env->stvec >> 2 << 2) +
-- 
2.21.0


