Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK4J-0005xk-S8
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK49-0005Kz-Hk
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJua-0004DQ-NV
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:47:45 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:51627)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJuZ-00046f-EN; Fri, 24 May 2019 19:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741664; x=1590277664;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=BXuqW+Vie67kKzLkoEIoBCOJ2a3oHbLhsnez7FroSYM=;
	b=AyM/iUks8huptKJXEszlYsdbl2yEyzJYNh6//ZinTUuTLs8fttucx5hG
	WxNvAJKFn1pWjh4mxy5OHcEjl7rh7qexEbVfi/u8b7nPwAPEUKBghoWwf
	cRXCXlQRhKzMHwf+iXr4lBz/1PUNC40b7ZRcLjGwacAynKbHOYcC44n8q
	/tLbHEaUTY2PcHriLMD3lXejp+qXVEHv9Q8kX+Hm21wZdL1k4RXlWiODI
	3Xt6DRfh+UznCHiXYzCk4NW47Noz6lUs4sk4fN9UheDvBmbhbO5tMR2te
	XlCZjH6ZLJh1xIuBi6jLKN8SE8KBlZ0hPust+9BS7JNcQDo4Uf5b6PO2Z Q==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="110307761"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:47:44 +0800
IronPort-SDR: XGqGG7BJYF6zheivqY2S8Q7JzmChem+YlFfFQ8yyvD8gtz1Q7wgiUw/NHltU57HK/qY9dpLpEt
	u8VUmCpdzgpgKcQZNCK3ODAkX5OupagfaEV47UKmqODgYoSOdyvwhCrxZu/ItKk8pSLI+DI45f
	6m6vapEcwtM6+rHAmJFZAOWB+PzGk8YDJ6Mt1e0jWWT0VxR5zW48E5AXdNuKFmVHfdK0f3SWbZ
	YMi6HgoCmPHDWgGOeli8jD3E8QFoiT92dPYB23gExgpA1cZ8vVRwlk/KHEHdQED531J+kMWk7q
	I6vBVWpnVItSLtjEHXXbxXwA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 24 May 2019 16:25:22 -0700
IronPort-SDR: 2Xepllq6cPJtavShVtXb79VZyhnrpk50hRDrsGABhBm7ypcsqysbrzcx1ePt7lDPM1UDMbXm7x
	WZPfit96hPR93k9BnHRcMmYjvnnVl/QaMBC6RaO2pDAVp3AhB5vpiFfS/7kPbUM+5v13v0ERAs
	mh4JOEUyPcnUQ9Te4nPsTQim80cVS7MOn/gpBbrrOFE+M5ap392RHzDsObyABAhFFtjerpzKas
	qBn4AWTJ7AChRUvOz6tpV+/BVyki1W7Js+pnJYZPGqmwbrt7jBSdchvQ50awzLPje2p2mQXfrj
	5Rw=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 May 2019 16:47:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:45:48 -0700
Message-Id: <d839eb40ea15076fd348021031da1cba4e55f9c3.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 05/23] target/riscv: Add the Hypervisor CSRs
 to CPUState
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
 target/riscv/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eeb3756c91..b99d2b7af2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -169,12 +169,29 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* Hypervisor CSRs */
+    target_ulong hstatus;
+    target_ulong hedeleg;
+    target_ulong hideleg;
+    target_ulong hgatp;
+
     target_ulong scounteren;
     target_ulong mcounteren;
 
     target_ulong sscratch;
     target_ulong mscratch;
 
+    /* Background CSRs */
+    target_ulong bsstatus;
+    target_ulong bsip;
+    target_ulong bsie;
+    target_ulong bstvec;
+    target_ulong bsscratch;
+    target_ulong bsepc;
+    target_ulong bscause;
+    target_ulong bstval;
+    target_ulong bsatp;
+
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
-- 
2.21.0


