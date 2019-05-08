Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOQX0-0007yg-5j
	for mharc-qemu-riscv@gnu.org; Wed, 08 May 2019 13:39:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41976)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hOQWx-0007x5-J2
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 13:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hOQWw-0007eq-Kg
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 13:38:59 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:32839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hOQWq-0007as-92
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 13:38:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1557337131; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
	Date: Subject: Cc: To: From: Sender;
	bh=YvsWYTSVQUmO5f5aefREeZm0X5cwenQtMoPL4ghpEhc=;
	b=tLnwuyEyI/+B51AbdwTKdxf6UXkYEuWMA73KMEBeWDw5e5mim1X0S3JMUtbawCQwmQV4fhR7
	hf/fNfS9DWD+8iU/fq3xTLBkBB5Ozxz6wZXMX/jfJ23I3c3XP8z93J273up+4gYMg8phSDnU
	/P+pASZLVZ2GibBqbPTuejLkbVs6VLCfZzXIzUkBHdCPnIo/khq/Rq7mcpJ3h00l8FVIpvgX
	Ztp/jqbVmxxZcPWCgnZiwU5waq183PWOp2pnYOxxx9BOJK1yHOILqXp3BgZL7pljdAoPXN7e
	ZZWTYs2fehdUMtCl+CBKt//OWkECMvVPpTUFmIvMnoVMZ2XIypug/g==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cd31425.7fe2f866d350-smtp-out-n02;
	Wed, 08 May 2019 17:38:45 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org
Cc: Jonathan Behrens <fintelia@gmail.com>, qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Jonathan Behrens <jonathan@fintelia.io>
Date: Wed,  8 May 2019 13:38:35 -0400
Message-Id: <20190508173835.14528-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH] target/riscv: Only flush TLB if SATP.ASID
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
X-List-Received-Date: Wed, 08 May 2019 17:39:00 -0000

There is an analogous change for ARM here:
https://patchwork.kernel.org/patch/10649857

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/csr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6083c782a1..1ec1222da1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
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
2.20.1

