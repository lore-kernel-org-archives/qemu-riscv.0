Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxg-00040E-SQ
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxV-0003GC-91
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhfo-0005kn-Nq
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:05 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhfo-0005kF-Iw
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id n27so7086688pgm.4
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=yDGQ4+HggXB9R3Qtb8ZMANhv1eldTmfa42TH+xr+FjE=;
	b=OCMoaA8RqjjKzFK64J9EAynpNjdS+y9odhhN1S7zIbQ/C9wZW8h3VjB7FiaQgh+yLr
	BILdg97/MbGbo8Ozn/Zw2M0AyXKuD2cmmBCHdimDv+8KAjMf8KYPJCI5Ochg7XKQkdg3
	hoIIVjphBQILCMJJgxhfg7qJPWKgMDPl+I2T9KmywLIYX8hwo1WcRGhv2GmX4WbOK1dT
	3rSBmx+1vj0vjYUprISlh82Q37Z/+O7/fn7/8/egsqx17y8wcqp/z/UKzCSNgGW8Q7Vu
	Zz0PaM29X/I59dm8eOQjYyLFRCMzyYgv2l8puvxXcAh7add4X36KwhTUPO2IOoXRC+3H
	VOKg==
X-Gm-Message-State: APjAAAU0eNHdZku1LsGIGtPqgVrXLdDqr+/jH8kLxU/AMilHbWQQUq6R
	oPFQn1YegGShmcLxP+wASUj7IWcq3vg=
X-Google-Smtp-Source: APXvYqzLUQo5ik98V6oXKyBUiFNfsoMxHw/pQuVny4qTPZhHWMEfGWsPGhoEHCtjsNeW15F+3FGhuA==
X-Received: by 2002:a63:5c1a:: with SMTP id q26mr5202873pgb.260.1558833003089; 
	Sat, 25 May 2019 18:10:03 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	x28sm7331487pfo.78.2019.05.25.18.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:02 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:21 -0700
Message-Id: <20190526010948.3923-3-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Jonathan Behrens <fintelia@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, 
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PULL 02/29] target/riscv: Do not allow sfence.vma
 from user mode
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
X-List-Received-Date: Sun, 26 May 2019 01:28:22 -0000

From: Jonathan Behrens <fintelia@gmail.com>

The 'sfence.vma' instruction is privileged, and should only ever be allowed
when executing in supervisor mode or higher.

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/op_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index b7dc18a41e21..644d0fb35f16 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -145,9 +145,10 @@ void helper_tlb_flush(CPURISCVState *env)
 {
     RISCVCPU *cpu = riscv_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
-    if (env->priv == PRV_S &&
-        env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TVM)) {
+    if (!(env->priv >= PRV_S) ||
+        (env->priv == PRV_S &&
+         env->priv_ver >= PRIV_VERSION_1_10_0 &&
+         get_field(env->mstatus, MSTATUS_TVM))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         tlb_flush(cs);
-- 
2.21.0


