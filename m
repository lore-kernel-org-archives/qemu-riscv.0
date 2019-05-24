Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUK4I-0005wa-Sw
	for mharc-qemu-riscv@gnu.org; Fri, 24 May 2019 19:57:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUK4A-0005au-Mi
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:57:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJuW-0004Af-Dp
	for qemu-riscv@nongnu.org; Fri, 24 May 2019 19:47:41 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:51627)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=040baf4f1=alistair.francis@wdc.com>)
	id 1hUJuU-00046f-QB; Fri, 24 May 2019 19:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558741660; x=1590277660;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Fvl20bL70W6URC8x1oiu+t8B2haDxcStjjs1M9AXrF0=;
	b=VCIyN+/m6WcPtuGAMZloZHgRQJCRc91LSocy/4kgG5VROcefWyr7fgH6
	63GZxFPBDZJ0vx8vvt95cs7d65wnuyLQApT7qtXc4QGrqf3JzM8Sc92if
	x2A7bHF4m5jgWq3/qku92zjWCpU2+W6sDe0aVF57oty8P/yeOOQhVdlXd
	/IUVMEgKEB+hF+BRfRTQQVZYW6s2ySXz2Lxwx285jRFdKxmRicZ2eoHXt
	FF23BNLbJKhnBswCVbYOnFGub/nhySEsTaxrM7RcbDB2WG2tWa+u9cSQH
	/Vo8vNaJmqh9BOggib4lVEHGIvoZ1nV2GjlLHA6Ow0dCN+MA2ERbjILGY g==;
X-IronPort-AV: E=Sophos;i="5.60,508,1549900800"; d="scan'208";a="110307757"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 07:47:38 +0800
IronPort-SDR: ch4WJuq8osOuPBwMDtoIUgLlb6km+ZDVXvuzvzzRJGOxPmmEHMfy7fcTBBauPRg0Wn/+TiyNqj
	07CUxSUJ1Zbh4LShUi2rwCoah1niV41e3EZ05cd/C8tULGfbeZbudI6yf2haPooew21ZgwVLTA
	BN3VZOOWzaoJDKUlFqmWKEtI0OCo+JE8LetW+yG/6UvhXW1BZ/Pz3YeKtZTE/to8GH5hLvu9Zi
	pUdT3MjwumaFH+otV9pWkUf4t5B2h7aJrTql1csHwNkMMYZHcfnMKKcNmMzl7zJPJ3vJjRc6d5
	SFSsbIsnv5I6JJFFngp8rkcx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 24 May 2019 16:22:56 -0700
IronPort-SDR: 52HxRoIK83FXMmBgnXauBoo2AWL+DxFiO8hleuX9iT/Gzt0FL0mg4vcqY/PkdS+5+6bM5upiD8
	C/hgCkbnzUg/I+xTEd7Ornr261adobfoBmXwIDNGRi8UMsVsRUlks0QbPokYbAZ1YkGehPl5u0
	JfH9Q01ohSt9Z/8/5z/U02r1BZlcfhYZqVHdVyuepGIbg/4J0BI3rgVYCzB6QJG/Bwr3WOes9J
	sXvgI/foLrqrcOg4kXf4IoWvFom5B4TftxP5d6YLhB+dsAA/Nfu4sh7yPPMVM8pKgDSYSV2hCd
	/xs=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 24 May 2019 16:47:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 24 May 2019 16:45:43 -0700
Message-Id: <6ac178e4f6ce4a8286ccf015b3f7b5c42277b3db.1558741334.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1558741334.git.alistair.francis@wdc.com>
References: <cover.1558741334.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 03/23] target/riscv: Add the virtulisation mode
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
X-List-Received-Date: Fri, 24 May 2019 23:57:39 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_bits.h   |  6 ++++++
 target/riscv/cpu_helper.c | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3337d1aef3..de4843b879 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -132,6 +132,8 @@ struct CPURISCVState {
 
 #ifndef CONFIG_USER_ONLY
     target_ulong priv;
+    /* This contains QEMU specific information about the virt state. */
+    target_ulong virt;
     target_ulong resetvec;
 
     target_ulong mhartid;
@@ -278,6 +280,8 @@ void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
+bool riscv_cpu_virt_enabled(CPURISCVState *env);
+void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index dc9d53d4be..07c95e8d2c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -417,6 +417,12 @@
 #define PRV_H 2 /* Reserved */
 #define PRV_M 3
 
+/* Virtulisation modes */
+#define VIRT_OFF            0
+#define VIRT_ON             1
+#define VIRT_MODE_SHIFT     0
+#define VIRT_MODE_MASK      (1 << VIRT_MODE_SHIFT)
+
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
 #define SATP32_ASID         0x7fc00000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 872835177a..5912ae63b7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -71,6 +71,29 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #if !defined(CONFIG_USER_ONLY)
 
+bool riscv_cpu_virt_enabled(CPURISCVState *env)
+{
+    bool tmp;
+
+    if (!riscv_has_ext(env, RVH)) {
+        return false;
+    }
+
+    tmp = (env->virt & VIRT_MODE_MASK) >> VIRT_MODE_SHIFT;
+
+    return tmp == VIRT_ON;
+}
+
+void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    env->virt &= ~VIRT_MODE_MASK;
+    env->virt |= enable << VIRT_MODE_SHIFT;
+}
+
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
-- 
2.21.0


