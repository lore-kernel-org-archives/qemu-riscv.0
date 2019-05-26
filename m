Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxL-0003ZS-3A
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxE-0003HK-UB
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgJ-0006RU-Ei
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44528)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgJ-0006Qu-9K
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id c5so5633460pll.11
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=XBhUGLLDCqlPrL4Y4ENmCJmXPWom5sz/dBlkDrNXnDE=;
	b=GMgtwfUvEMuYMXCGp5UxgWzvS8H4qDwBlj6EOymKs67Ju7bwhsuTcBLbeR6ZWuyPlW
	lwr9OCXm48H7t3ZHheqT8BBm6Jn4MZtizuwiQZT6hIY807DVcHALIMxqh23FgTPHFEYB
	KYMPxvpwYLmQgJK4QGsttnbZjeTpsi/8VbovacxcF8a238Pitf9CDBdNh4vi+Db+fJbi
	TtTzJCtkJAvWO11PJYa3wibOzzqpjfjAWEzHeUAsejIjVwsYeZFCOYnCcqSpQScuSxe4
	fvFlaPkkRgvcxZ1/GB+8CfkQKansn2v3CexGbDrK/D4EBxSEg42W0v0GSAvfGAX3OuYW
	TwHQ==
X-Gm-Message-State: APjAAAUzhHfgypo/lBjMrTipeaOs+h51+PV4BoEYdpdnNZ+KnlxS7G0M
	KlsJEJfiZhr/V9A+1i4Lez2i8S8jZFI=
X-Google-Smtp-Source: APXvYqy5S9tSZkUyRQwqUKgWOFqFq2ytw2Ni6rzsi6AFQrXL1cRdX7k52Urgb1+JJDTJuGEwcxOQ3w==
X-Received: by 2002:a17:902:8a91:: with SMTP id
	p17mr52728975plo.60.1558833033700; 
	Sat, 25 May 2019 18:10:33 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id k3sm6902397pfa.36.2019.05.25.18.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:33 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:42 -0700
Message-Id: <20190526010948.3923-24-palmer@sifive.com>
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
X-Received-From: 209.85.214.196
Subject: [Qemu-riscv] [PULL 23/29] target/riscv: Allow setting mstatus
 virtulisation bits
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
X-List-Received-Date: Sun, 26 May 2019 01:28:06 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Revieweb-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f9d8d150e012..e6d68a99560d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -290,7 +290,6 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
     target_ulong mstatus = env->mstatus;
     target_ulong mask = 0;
-    target_ulong mpp = get_field(val, MSTATUS_MPP);
 
     /* flush tlb on mstatus fields that affect VM */
     if (env->priv_ver <= PRIV_VERSION_1_09_1) {
@@ -305,7 +304,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
                 MSTATUS_VM : 0);
     }
     if (env->priv_ver >= PRIV_VERSION_1_10_0) {
-        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP |
+        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
                 MSTATUS_MPRV | MSTATUS_SUM)) {
             tlb_flush(CPU(riscv_env_get_cpu(env)));
         }
@@ -313,13 +312,13 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
             MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
             MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
             MSTATUS_TW;
-    }
-
-    /* silenty discard mstatus.mpp writes for unsupported modes */
-    if (mpp == PRV_H ||
-        (!riscv_has_ext(env, RVS) && mpp == PRV_S) ||
-        (!riscv_has_ext(env, RVU) && mpp == PRV_U)) {
-        mask &= ~MSTATUS_MPP;
+#if defined(TARGET_RISCV64)
+            /*
+             * RV32: MPV and MTL are not in mstatus. The current plan is to
+             * add them to mstatush. For now, we just don't support it.
+             */
+            mask |= MSTATUS_MPP | MSTATUS_MPV;
+#endif
     }
 
     mstatus = (mstatus & ~mask) | (val & mask);
-- 
2.21.0


