Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK3t-0005VA-7U
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK3q-0005Kz-NY
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJvN-0004oC-06
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:48:33 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:5536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJvL-0004l4-Gp; Fri, 24 May 2019 19:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741711; x=1590277711;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Q417YyWRkJW+frGSJUz87YKMObdZQ7KF7pmDlZ3Rq0g=;
	b=BU2Jkq8hMpCItnzGNKbAFZO7TPccsc35EvUAJZduCa5FOR6+VGSS6X8I
	ggfYV9hK832CcjR9I/lBZknGnMliqVMR4ltT47aum5ue5cVfYOUDWHGK/
	fZbIOX3CYIJGh9qlo9ioT84vGWlsDxYF7QAPPH/ll8lbyDdaJED36TesN
	UZJrNnKfZrHEV9q2e4QLlRnjlCZG9/Dhrgr+Sgfy7amhMdU5fX9Vo/b9C
	7hHHXR7VQNR2k2Rmbe6rEKfCHsf3UL3CB2378oilPfss5MGZN+q6jirxJ
	FL/NTDR+bVpFYOPBUtHRHoGM6kYUHffX6vuBAPwStEQeFE/8fQeuf4M8Q Q==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="215265042"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:48:30 +0800
IronPort-SDR: 4iqjTt33V8tk0yPgbnrIZWolHOdZQywo2TeIcNT3ZL59YwTRS6ud7K4vI/2lidMxS5785EIpbm
	dayluGzo4hAj63+gFp3/18xXrptO+H+qpkJ4JeJS7XL8WfSUAiQoKc2BqrFHFQavI0HTaOhnwo
	e1MbGi9tOa4G3R5uI4bRbZgfrPY6SHpMYz1Y/S5I2sivMAkhKh13UQG+TLnOlugejrkvuAZSGW
	LXIIVwnAviUG/Rk4c6O11j+c8BcFPm12UgSuelzjMGrHnolbqPnyxgH6F+bizvjNux7hHAvzua
	wZz75qB43j/aUeytmNZnL3MN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 24 May 2019 16:26:10 -0700
IronPort-SDR: C4BDV/o8KqCWpunJWlO5TEhGOSfZS425QX29HVKX6dWvu7PHeh3Lgkr5PelSm7FDFzeX+eFBGp
	dffLU0yUyPU3LEUn/znqi3lAyfAKSBgY/otHaGtsgHnvJx8x8aLZqha9xaUTBZWNH6U2VPv40h
	OaUjswCAQUEvjqLxI37ZWyDxPKvoaxqfzPlB3k+etpF+aZhHKnYNCsWBnfpsHf6p73UXYFaKh7
	C/e9BTfn4USfAGrUeyXu040icdUu86i0faxDzveS2TDSiKsH7mMHH/vbNbeSsfHHVrAXsCx0QK
	9rY=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 May 2019 16:48:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:46:36 -0700
Message-Id: <0c227e8cc03a2b33f67e497b94e6d8283e98d96e.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 23/23] target/riscv: Allow enabling the
 Hypervisor extension
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
X-List-Received-Date: Fri, 24 May 2019 23:57:19 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c1495ef037..b17dfb86c6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -436,6 +436,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_u) {
             target_misa |= RVU;
         }
+        if (cpu->cfg.ext_h) {
+            target_misa |= RVH;
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -472,6 +475,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("user_spec", RISCVCPU, cfg.user_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9897392ab7..d2cfc69e9a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -259,6 +259,7 @@ typedef struct RISCVCPU {
         bool ext_c;
         bool ext_s;
         bool ext_u;
+        bool ext_h;
 
         char *priv_spec;
         char *user_spec;
-- 
2.21.0


