Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxD-0003Pc-Qt
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxB-0003Hg-Dy
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgS-0006Wl-JD
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgQ-0006Vm-M8
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id b76so7496648pfb.5
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=Agfb1SlQX+MWgq+cbXEGuNIXzEdqOpc8hLIv6mAYUKI=;
	b=IZBZ9JjtxiHVqRLM9TRzKrzGS5eInIfRZwJ8nq735KaWCFoQ2XM2aueUJRBbHmouZq
	iWYZL+llsCzXa5ZUted+g5hSonCsQaKisiDFOxa3L0tLKufu3vwspAupj4Zas9Qh4mse
	N/mdy7nLbUiOsTyGnZtaKReMLRCkvajqw+jCi0t01y7dxvNOLjayL563FDl5femCuiH0
	+PupmOlQ3JZMnmy7nNuAvpZWJJIl/1GsW3NTotI4ttMTqkAAb6BCiXg+pBqyX2QBxSpa
	66pT4SuS32/wuRKgLHhy2w2KmqXy6xSCRrEE7QddiOhyazOCvL2iZWnszldsIL9g44Dc
	2xYw==
X-Gm-Message-State: APjAAAUjMl/HjhQSh5PYhlpAdPBOnheArVMh2nfwOH/qbRfRSztyhrk8
	QFy18nFrFyq7XP8wAm1SxbRtUV+2F14=
X-Google-Smtp-Source: APXvYqxYoHRXva8OWtznNd2GUVtwg9iQihnLoAeecut6/jgWLYhdlybpZx0Z8NV8xKIgzDl9YUUAHg==
X-Received: by 2002:a63:c5b:: with SMTP id 27mr65314208pgm.70.1558833041202;
	Sat, 25 May 2019 18:10:41 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id z7sm7916145pfr.23.2019.05.25.18.10.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:40 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:48 -0700
Message-Id: <20190526010948.3923-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Jonathan Behrens <jonathan@fintelia.io>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-riscv] [PULL 29/29] target/riscv: Only flush TLB if SATP.ASID
 changes
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
X-List-Received-Date: Sun, 26 May 2019 01:28:02 -0000

From: Jonathan Behrens <jonathan@fintelia.io>

There is an analogous change for ARM here:
https://patchwork.kernel.org/patch/10649857

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0f51c7eae241..f9e2910643f8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -723,7 +723,9 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return -1;
         } else {
-            tlb_flush(CPU(riscv_env_get_cpu(env)));
+            if((val ^ env->satp) & SATP_ASID) {
+                tlb_flush(CPU(riscv_env_get_cpu(env)));
+            }
             env->satp = val;
         }
     }
-- 
2.21.0


