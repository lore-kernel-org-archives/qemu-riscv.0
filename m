Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK4F-0005s8-9R
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK49-0005eB-F7
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJud-0004FG-BZ
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:47:48 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:51627)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJuc-00046f-1p; Fri, 24 May 2019 19:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741667; x=1590277667;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=8W/Bpt+bnTxpriny1g+X2aDXu+9emJzs2m4jnMhgMXE=;
	b=FgUhBVd7Uul69hKWXMr0IL+RvmE5QLFwL7pOZxX1b0emtdlFDHRBs0tP
	/LqUIDPD83SwjYAROTaIKzYXcPjguaxdEcQ3FgXp+85H3G922N0pHIzJu
	4PHdGW9Zz504lxlPU078K8hEJNmGyrEbPneY3MwZuPd7q0tFPbx8t9Si3
	8gUd6tj6aaJ2Dm38axLah2LUxzmAD5fGiky+eejYwT5qE9kAY062jftPJ
	oj75VWZxYV1CMQ87EXekWTHOHh83P0PVFMum7S8ezHtqH1goW6Nwo6aVc
	FvSfQtZXyFTl9tAmOuqf1zM4mOuUkGer5EFx9RfP1nuX8/kMOpktGhQzp Q==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="110307763"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:47:46 +0800
IronPort-SDR: lA1CSAWamz4KuB63bbdv6mSvwjf85qYRi65r5ED4CIwGCZ4NqCRu3L7Cp2EOM5PSkbskunfgoh
	3o2lKoCieQBrnJongogq7DoQAKWKobMiNiKcIrSSrCcTgUPvrU34Olq+MgTY+W5ywiCPkbTEMT
	2mRf4aDdauTXqt4lJgmFpvD2msaUWb9EawrNV9dfoGOQnpiIUr/e5HD2KgfM6L/gWHBJDBp2Es
	6XWqoJ2PNjQjnHeSUd8HNUuQCjuGjgFSyuk1k7c7oywZfHBNGM1q2rmVTI7vA47qkaymFJ2jyI
	l2ciVC9r5JXsYN2/hHGi75a5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP; 24 May 2019 16:25:25 -0700
IronPort-SDR: 2sIWyjCoeXGiVvMSbcmPXz/rEljj2QnCA05+K/Q6rCt+lo9bdK4xI2rH9g56dq7bktMusJNwIe
	51paDrLFjz+201Sekdpy1Nl/RNBWk0698udLs6KEd6PCGysT83zPM0jRyIn3XyrT5Uddk/PMaL
	0Xm6LRRxLD1X0i+N1eiTX1OcVR6MHWqMjY9UR3N51q6FMZOdQ0bZS2vhE+INx44GUT5q26Pcny
	oPrlkVIIUxCVsD5SS24/WpdRSuvxro0QKtLFPrA1QWjUh0C16Kx4wrBuXYDBof5eoKBt3vC7sT
	LLU=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 24 May 2019 16:47:45 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:45:51 -0700
Message-Id: <c5c48ddbbc09c4a8c3e1418d49796a32287717b9.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 06/23] target/riscv: Dump Hypervisor registers
 if enabled
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
X-List-Received-Date: Fri, 24 May 2019 23:57:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 65556ac543..c1495ef037 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -220,14 +220,41 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bstatus ", env->bsstatus);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ",
                  (target_ulong)atomic_read(&env->mip));
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bsip    ",
+                     (target_ulong)atomic_read(&env->bsip));
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bsie    ", env->bsie);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bstvec  ", env->bstvec);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bsepc   ", env->bsepc);
+    }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
+    if (riscv_has_ext(env, RVH)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bscause ", env->bscause);
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.21.0


