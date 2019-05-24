Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK42-0005gD-K4
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK40-0005Kz-MS
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJv1-0004YM-Mf
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:48:12 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:5520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJv0-0004TN-AJ; Fri, 24 May 2019 19:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741690; x=1590277690;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=cjB62V2KEtHPar+ofR4sfzgKIk6//oGfIg0TBm9dQl8=;
	b=NldG89PWbeRdTRLlrL7gJ2vBq8xpemkDKpeqy4rhJziGZyK/hKcWNhiz
	aMkfH6o491lt8uNgcABk6m4ytXiF/+G/X3rRPzhUpgzAKbDV79SQ9P/IM
	7k2GNeCnfDTDQQkB5ROH7AgGEfadEOdS6UROoe4uVNXJxWW8iK6OGWWUE
	/4dhefw4ekkA9uUa/+YjVAB+x1KQraOfHtUPFPQgD2m0JVX7NNt5TaBhh
	p5egQq0wnr35vCyv/a3Px95Ga0WFkx1JaVEGlreJGLg7Wu7rP0aZKBSw/
	AdtCMNnURNFOy6slCFxktx74scke8NNClCHo/0b1ssSbR86oULTiaE89b g==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="215265021"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:48:09 +0800
IronPort-SDR: XNjVrDM54ESSRBaKT0tjefLuEldsfKioXGKXudbLPG8ZebUH2AWGYaaHBVAl8EJoryi1t/o7wx
	lGmpI9dL1x5MtwYOUcUOTDTuLAmwv+c/0J11QQGVb7xC2j1pJuhEAZGDHNyzYU06W4WBVhYwNP
	9gXTTjAet9vOh48UKBvoN56pP3lSUz1E55AfrThdUggrNHLpR74qsIEgaod0s02s1t+OMC4DdD
	QAeIQR8lkruATOGbvHA5OA6vvdHWW2JsVnbaQ9K1aANg1GCtmO6JiYG+HF+G+yLo8g7vhIOcrV
	rgzMexAzV2Se/SDIVCjCHTer
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 24 May 2019 16:25:49 -0700
IronPort-SDR: KUXRPXmHMamj6d6IJFBrER1QRqpriiCQyjMBnbQb2+xlZnzcvjqDL7m9wcP8IXUjFzY/x+tZFr
	fW5CtHfQGl5/OEnFka8oHjiVPYcqk22zSV9CzQ9JZfam72Qo9hlKO8hTNPkStHI7t7E+4dA2xL
	UFHIoOUeoT6AwJIRhMisO/lH95PGkMdKYaPh1dqi3Pk9leeVaMsuv6/ictdfiamc4bB8zAms40
	PgOUlaKRXv0dR86zy0o1LUvcwbS9SpotI4T5lrWd6e0Cjq88VmUQwwBBtUY8CXyEDWk7T/Fpmh
	ugM=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 May 2019 16:48:10 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:46:15 -0700
Message-Id: <cf0b986d310c8040971d844218ed46a73872df57.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 15/23] riscv: plic: Always set sip.SEIP bit
 for HS
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
X-List-Received-Date: Fri, 24 May 2019 23:57:29 -0000

When the PLIC generates an interrupt ensure we always set it for the SIP
CSR that corresponds to the HS (V=0) register.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_plic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 1e7e4c8d51..25da29fa3d 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -147,7 +147,17 @@ static void sifive_plic_update(SiFivePLICState *plic)
             riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
             break;
         case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
+            if (riscv_cpu_virt_enabled(env)) {
+                if (level) {
+                    atomic_or(&env->bsip, MIP_SEIP);
+                    g_assert(riscv_cpu_virt_enabled(env));
+                } else {
+                    atomic_and(&env->bsip, ~MIP_SEIP);
+                    g_assert(riscv_cpu_virt_enabled(env));
+                }
+            } else {
+                riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
+            }
             break;
         default:
             break;
-- 
2.21.0


