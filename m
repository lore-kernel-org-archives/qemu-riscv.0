Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpaZq-0000Pv-O9
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaUK-0006G0-3x
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaUG-0004WA-75
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:44:32 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.236]:37940)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaUF-0004Ux-Jz; Mon, 22 Jul 2019 11:44:28 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:40:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:44:24 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:44:24 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <david@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <mst@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <claudio.fontana@huawei.com>, <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, 
 <amarkovic@wavecomp.com>, <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v2 06/20] tcg: Rename get_memop to
 get_tcgmemop
Thread-Index: AQHVQKRWuilU/GWOfUKTTPphRrvupQ==
Date: Mon, 22 Jul 2019 15:44:24 +0000
Message-ID: <1563810264064.38406@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381026406438406btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.236
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:50:10 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 06/20] tcg: Rename get_memop to
 get_tcgmemop
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2019 15:44:35 -0000

--_000_156381026406438406btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Correct naming as there is now both MemOp and TCGMemOp.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c           |  6 +++---
 tcg/aarch64/tcg-target.inc.c |  8 ++++----
 tcg/arm/tcg-target.inc.c     |  8 ++++----
 tcg/i386/tcg-target.inc.c    |  8 ++++----
 tcg/mips/tcg-target.inc.c    | 10 +++++-----
 tcg/optimize.c               |  2 +-
 tcg/ppc/tcg-target.inc.c     |  8 ++++----
 tcg/riscv/tcg-target.inc.c   | 10 +++++-----
 tcg/s390/tcg-target.inc.c    |  8 ++++----
 tcg/sparc/tcg-target.inc.c   |  4 ++--
 tcg/tcg.c                    |  2 +-
 tcg/tcg.h                    |  4 ++--
 tcg/tci.c                    |  8 ++++----
 13 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bb9897b..184fc54 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1133,7 +1133,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, tar=
get_ulong addr,
     uintptr_t index =3D tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *tlbe =3D tlb_entry(env, mmu_idx, addr);
     target_ulong tlb_addr =3D tlb_addr_write(tlbe);
-    TCGMemOp mop =3D get_memop(oi);
+    TCGMemOp mop =3D get_tcgmemop(oi);
     int a_bits =3D get_alignment_bits(mop);
     int s_bits =3D mop & MO_SIZE;
     void *hostaddr;
@@ -1257,7 +1257,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
         offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read=
);
     const MMUAccessType access_type =3D
         code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
-    unsigned a_bits =3D get_alignment_bits(get_memop(oi));
+    unsigned a_bits =3D get_alignment_bits(get_tcgmemop(oi));
     void *haddr;
     uint64_t res;

@@ -1506,7 +1506,7 @@ store_helper(CPUArchState *env, target_ulong addr, ui=
nt64_t val,
     CPUTLBEntry *entry =3D tlb_entry(env, mmu_idx, addr);
     target_ulong tlb_addr =3D tlb_addr_write(entry);
     const size_t tlb_off =3D offsetof(CPUTLBEntry, addr_write);
-    unsigned a_bits =3D get_alignment_bits(get_memop(oi));
+    unsigned a_bits =3D get_alignment_bits(get_tcgmemop(oi));
     void *haddr;

     /* Handle CPU specific unaligned behaviour */
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index d14afa9..886da51 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -1580,7 +1580,7 @@ static inline void tcg_out_adr(TCGContext *s, TCGReg =
rd, void *target)
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGMemOp size =3D opc & MO_SIZE;

     if (!reloc_pc19(lb->label_ptr[0], s->code_ptr)) {
@@ -1605,7 +1605,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGMemOp size =3D opc & MO_SIZE;

     if (!reloc_pc19(lb->label_ptr[0], s->code_ptr)) {
@@ -1804,7 +1804,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
MemOp memop,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi, TCGType ext)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    TCGMemOp memop =3D get_tcgmemop(oi);
     const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64 ? TCG_TYPE_I64 : TC=
G_TYPE_I32;
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
@@ -1829,7 +1829,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg dat=
a_reg, TCGReg addr_reg,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    TCGMemOp memop =3D get_tcgmemop(oi);
     const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64 ? TCG_TYPE_I64 : TC=
G_TYPE_I32;
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 70eeb8a..98c5b47 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -1348,7 +1348,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 {
     TCGReg argreg, datalo, datahi;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     void *func;

     if (!reloc_pc24(lb->label_ptr[0], s->code_ptr)) {
@@ -1412,7 +1412,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 {
     TCGReg argreg, datalo, datahi;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);

     if (!reloc_pc24(lb->label_ptr[0], s->code_ptr)) {
         return false;
@@ -1589,7 +1589,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is64)
     addrlo =3D *args++;
     addrhi =3D (TARGET_LONG_BITS =3D=3D 64 ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #ifdef CONFIG_SOFTMMU
     mem_index =3D get_mmuidx(oi);
@@ -1720,7 +1720,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is64)
     addrlo =3D *args++;
     addrhi =3D (TARGET_LONG_BITS =3D=3D 64 ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #ifdef CONFIG_SOFTMMU
     mem_index =3D get_mmuidx(oi);
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 3a73334..e4525ca 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1810,7 +1810,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool i=
s_ld, bool is_64,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGReg data_reg;
     tcg_insn_unit **label_ptr =3D &l->label_ptr[0];
     int rexw =3D (l->type =3D=3D TCG_TYPE_I64 ? P_REXW : 0);
@@ -1895,7 +1895,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGMemOp s_bits =3D opc & MO_SIZE;
     tcg_insn_unit **label_ptr =3D &l->label_ptr[0];
     TCGReg retaddr;
@@ -2114,7 +2114,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is64)
     addrlo =3D *args++;
     addrhi =3D (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #if defined(CONFIG_SOFTMMU)
     mem_index =3D get_mmuidx(oi);
@@ -2232,7 +2232,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is64)
     addrlo =3D *args++;
     addrhi =3D (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #if defined(CONFIG_SOFTMMU)
     mem_index =3D get_mmuidx(oi);
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index ef31fc8..010afd0 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1215,7 +1215,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg ba=
se, TCGReg addrl,
                              TCGReg addrh, TCGMemOpIdx oi,
                              tcg_insn_unit *label_ptr[2], bool is_load)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     unsigned s_bits =3D opc & MO_SIZE;
     unsigned a_bits =3D get_alignment_bits(opc);
     int mem_index =3D get_mmuidx(oi);
@@ -1313,7 +1313,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is=
_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGReg v0;
     int i;

@@ -1363,7 +1363,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGMemOp s_bits =3D opc & MO_SIZE;
     int i;

@@ -1532,7 +1532,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
     addr_regl =3D *args++;
     addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
@@ -1635,7 +1635,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is_64)
     addr_regl =3D *args++;
     addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
diff --git a/tcg/optimize.c b/tcg/optimize.c
index d2424de..422bcbb 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1014,7 +1014,7 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(qemu_ld):
             {
                 TCGMemOpIdx oi =3D op->args[nb_oargs + nb_iargs];
-                TCGMemOp mop =3D get_memop(oi);
+                TCGMemOp mop =3D get_tcgmemop(oi);
                 if (!(mop & MO_SIGN)) {
                     mask =3D (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
                 }
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 13a2437..0ab4faa 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -1633,7 +1633,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool i=
s_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGReg hi, lo, arg =3D TCG_REG_R3;

     if (!reloc_pc14(lb->label_ptr[0], s->code_ptr)) {
@@ -1680,7 +1680,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGMemOp s_bits =3D opc & MO_SIZE;
     TCGReg hi, lo, arg =3D TCG_REG_R3;

@@ -1755,7 +1755,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
     addrlo =3D *args++;
     addrhi =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);
     s_bits =3D opc & MO_SIZE;

 #ifdef CONFIG_SOFTMMU
@@ -1830,7 +1830,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is_64)
     addrlo =3D *args++;
     addrhi =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);
     s_bits =3D opc & MO_SIZE;

 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 90363df..ab4e035 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -970,7 +970,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addr=
l,
                              TCGReg addrh, TCGMemOpIdx oi,
                              tcg_insn_unit **label_ptr, bool is_load)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     unsigned s_bits =3D opc & MO_SIZE;
     unsigned a_bits =3D get_alignment_bits(opc);
     tcg_target_long compare_mask;
@@ -1044,7 +1044,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is=
_ld, TCGMemOpIdx oi,
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGReg a0 =3D tcg_target_call_iarg_regs[0];
     TCGReg a1 =3D tcg_target_call_iarg_regs[1];
     TCGReg a2 =3D tcg_target_call_iarg_regs[2];
@@ -1077,7 +1077,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     TCGMemOpIdx oi =3D l->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
     TCGMemOp s_bits =3D opc & MO_SIZE;
     TCGReg a0 =3D tcg_target_call_iarg_regs[0];
     TCGReg a1 =3D tcg_target_call_iarg_regs[1];
@@ -1183,7 +1183,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGA=
rg *args, bool is_64)
     addr_regl =3D *args++;
     addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
@@ -1254,7 +1254,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGA=
rg *args, bool is_64)
     addr_regl =3D *args++;
     addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi =3D *args++;
-    opc =3D get_memop(oi);
+    opc =3D get_tcgmemop(oi);

 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c
index db1102e..4d8078b 100644
--- a/tcg/s390/tcg-target.inc.c
+++ b/tcg/s390/tcg-target.inc.c
@@ -1614,7 +1614,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     TCGReg addr_reg =3D lb->addrlo_reg;
     TCGReg data_reg =3D lb->datalo_reg;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);

     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)s->code_ptr, 2)) {
@@ -1639,7 +1639,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     TCGReg addr_reg =3D lb->addrlo_reg;
     TCGReg data_reg =3D lb->datalo_reg;
     TCGMemOpIdx oi =3D lb->oi;
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);

     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)s->code_ptr, 2)) {
@@ -1694,7 +1694,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGR=
eg *addr_reg,
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
@@ -1721,7 +1721,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg dat=
a_reg, TCGReg addr_reg,
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_re=
g,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp opc =3D get_tcgmemop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index =3D get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index 7c50118..e6cf2c4 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -1164,7 +1164,7 @@ static const int qemu_st_opc[16] =3D {
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
                             TCGMemOpIdx oi, bool is_64)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    TCGMemOp memop =3D get_tcgmemop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned memi =3D get_mmuidx(oi);
     TCGReg addrz, param;
@@ -1246,7 +1246,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg dat=
a, TCGReg addr,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
                             TCGMemOpIdx oi)
 {
-    TCGMemOp memop =3D get_memop(oi);
+    TCGMemOp memop =3D get_tcgmemop(oi);
 #ifdef CONFIG_SOFTMMU
     unsigned memi =3D get_mmuidx(oi);
     TCGReg addrz, param;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index be2c33c..492d7c6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2056,7 +2056,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_pre=
fs)
             case INDEX_op_qemu_st_i64:
                 {
                     TCGMemOpIdx oi =3D op->args[k++];
-                    TCGMemOp op =3D get_memop(oi);
+                    TCGMemOp op =3D get_tcgmemop(oi);
                     unsigned ix =3D get_mmuidx(oi);

                     if (op & ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 18b91fe..8a3f912 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -1197,12 +1197,12 @@ static inline TCGMemOpIdx make_memop_idx(TCGMemOp o=
p, unsigned idx)
 }

 /**
- * get_memop
+ * get_tcgmemop
  * @oi: combined op/idx parameter
  *
  * Extract the memory operation from the combined value.
  */
-static inline TCGMemOp get_memop(TCGMemOpIdx oi)
+static inline TCGMemOp get_tcgmemop(TCGMemOpIdx oi)
 {
     return oi >> 4;
 }
diff --git a/tcg/tci.c b/tcg/tci.c
index 33edca1..b3c5795 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -1109,7 +1109,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
             t0 =3D *tb_ptr++;
             taddr =3D tci_read_ulong(regs, &tb_ptr);
             oi =3D tci_read_i(&tb_ptr);
-            switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
+            switch (get_tcgmemop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp32 =3D qemu_ld_ub;
                 break;
@@ -1146,7 +1146,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
             }
             taddr =3D tci_read_ulong(regs, &tb_ptr);
             oi =3D tci_read_i(&tb_ptr);
-            switch (get_memop(oi) & (MO_BSWAP | MO_SSIZE)) {
+            switch (get_tcgmemop(oi) & (MO_BSWAP | MO_SSIZE)) {
             case MO_UB:
                 tmp64 =3D qemu_ld_ub;
                 break;
@@ -1195,7 +1195,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
             t0 =3D tci_read_r(regs, &tb_ptr);
             taddr =3D tci_read_ulong(regs, &tb_ptr);
             oi =3D tci_read_i(&tb_ptr);
-            switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
+            switch (get_tcgmemop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(t0);
                 break;
@@ -1219,7 +1219,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t=
 *tb_ptr)
             tmp64 =3D tci_read_r64(regs, &tb_ptr);
             taddr =3D tci_read_ulong(regs, &tb_ptr);
             oi =3D tci_read_i(&tb_ptr);
-            switch (get_memop(oi) & (MO_BSWAP | MO_SIZE)) {
+            switch (get_tcgmemop(oi) & (MO_BSWAP | MO_SIZE)) {
             case MO_UB:
                 qemu_st_b(tmp64);
                 break;
--
1.8.3.1




--_000_156381026406438406btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">Correct naming as there is now both M=
emOp and TCGMemOp.</span><br>
</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;accel/tcg/cputlb.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;6 =
&#43;&#43;&#43;---</div>
<div>&nbsp;tcg/aarch64/tcg-target.inc.c | &nbsp;8 &#43;&#43;&#43;&#43;----<=
/div>
<div>&nbsp;tcg/arm/tcg-target.inc.c &nbsp; &nbsp; | &nbsp;8 &#43;&#43;&#43;=
&#43;----</div>
<div>&nbsp;tcg/i386/tcg-target.inc.c &nbsp; &nbsp;| &nbsp;8 &#43;&#43;&#43;=
&#43;----</div>
<div>&nbsp;tcg/mips/tcg-target.inc.c &nbsp; &nbsp;| 10 &#43;&#43;&#43;&#43;=
&#43;-----</div>
<div>&nbsp;tcg/optimize.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
| &nbsp;2 &#43;-</div>
<div>&nbsp;tcg/ppc/tcg-target.inc.c &nbsp; &nbsp; | &nbsp;8 &#43;&#43;&#43;=
&#43;----</div>
<div>&nbsp;tcg/riscv/tcg-target.inc.c &nbsp; | 10 &#43;&#43;&#43;&#43;&#43;=
-----</div>
<div>&nbsp;tcg/s390/tcg-target.inc.c &nbsp; &nbsp;| &nbsp;8 &#43;&#43;&#43;=
&#43;----</div>
<div>&nbsp;tcg/sparc/tcg-target.inc.c &nbsp; | &nbsp;4 &#43;&#43;--</div>
<div>&nbsp;tcg/tcg.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;| &nbsp;2 &#43;-</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;| &nbsp;4 &#43;&#43;--</div>
<div>&nbsp;tcg/tci.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;| &nbsp;8 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;13 files changed, 43 insertions(&#43;), 43 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c</div>
<div>index bb9897b..184fc54 100644</div>
<div>--- a/accel/tcg/cputlb.c</div>
<div>&#43;&#43;&#43; b/accel/tcg/cputlb.c</div>
<div>@@ -1133,7 &#43;1133,7 @@ static void *atomic_mmu_lookup(CPUArchState =
*env, target_ulong addr,</div>
<div>&nbsp; &nbsp; &nbsp;uintptr_t index =3D tlb_index(env, mmu_idx, addr);=
</div>
<div>&nbsp; &nbsp; &nbsp;CPUTLBEntry *tlbe =3D tlb_entry(env, mmu_idx, addr=
);</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong tlb_addr =3D tlb_addr_write(tlbe);</d=
iv>
<div>- &nbsp; &nbsp;TCGMemOp mop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp mop =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;int a_bits =3D get_alignment_bits(mop);</div>
<div>&nbsp; &nbsp; &nbsp;int s_bits =3D mop &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;void *hostaddr;</div>
<div>@@ -1257,7 &#43;1257,7 @@ load_helper(CPUArchState *env, target_ulong =
addr, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;offsetof(CPUTLBEntry, addr_code) : o=
ffsetof(CPUTLBEntry, addr_read);</div>
<div>&nbsp; &nbsp; &nbsp;const MMUAccessType access_type =3D</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;code_read ? MMU_INST_FETCH : MMU_DAT=
A_LOAD;</div>
<div>- &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_memop(oi));<=
/div>
<div>&#43; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_tcgmemop=
(oi));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t res;</div>
<div>&nbsp;</div>
<div>@@ -1506,7 &#43;1506,7 @@ store_helper(CPUArchState *env, target_ulong=
 addr, uint64_t val,</div>
<div>&nbsp; &nbsp; &nbsp;CPUTLBEntry *entry =3D tlb_entry(env, mmu_idx, add=
r);</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong tlb_addr =3D tlb_addr_write(entry);</=
div>
<div>&nbsp; &nbsp; &nbsp;const size_t tlb_off =3D offsetof(CPUTLBEntry, add=
r_write);</div>
<div>- &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_memop(oi));<=
/div>
<div>&#43; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(get_tcgmemop=
(oi));</div>
<div>&nbsp; &nbsp; &nbsp;void *haddr;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Handle CPU specific unaligned behaviour */</div=
>
<div>diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc=
.c</div>
<div>index d14afa9..886da51 100644</div>
<div>--- a/tcg/aarch64/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/aarch64/tcg-target.inc.c</div>
<div>@@ -1580,7 &#43;1580,7 @@ static inline void tcg_out_adr(TCGContext *s=
, TCGReg rd, void *target)</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp size =3D opc &amp; MO_SIZE;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc19(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1605,7 &#43;1605,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp size =3D opc &amp; MO_SIZE;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc19(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1804,7 &#43;1804,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGMemOp memop,</div>
<div>&nbsp;static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, TCGType ext)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp memop =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64=
 ? TCG_TYPE_I64 : TCG_TYPE_I32;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>@@ -1829,7 &#43;1829,7 @@ static void tcg_out_qemu_ld(TCGContext *s, T=
CGReg data_reg, TCGReg addr_reg,</div>
<div>&nbsp;static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp memop =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;const TCGType otype =3D TARGET_LONG_BITS =3D=3D 64=
 ? TCG_TYPE_I64 : TCG_TYPE_I32;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c</div>
<div>index 70eeb8a..98c5b47 100644</div>
<div>--- a/tcg/arm/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/arm/tcg-target.inc.c</div>
<div>@@ -1348,7 &#43;1348,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg argreg, datalo, datahi;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;void *func;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc24(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1412,7 &#43;1412,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg argreg, datalo, datahi;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc24(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>@@ -1589,7 &#43;1589,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp; &nbsp; &nbsp;addrlo =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addrhi =3D (TARGET_LONG_BITS =3D=3D 64 ? *args&#43=
;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;mem_index =3D get_mmuidx(oi);</div>
<div>@@ -1720,7 &#43;1720,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp; &nbsp; &nbsp;addrlo =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addrhi =3D (TARGET_LONG_BITS =3D=3D 64 ? *args&#43=
;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;mem_index =3D get_mmuidx(oi);</div>
<div>diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c</di=
v>
<div>index 3a73334..e4525ca 100644</div>
<div>--- a/tcg/i386/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/i386/tcg-target.inc.c</div>
<div>@@ -1810,7 &#43;1810,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, bool is_ld, bool is_64,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_reg;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit **label_ptr =3D &amp;l-&gt;label_ptr=
[0];</div>
<div>&nbsp; &nbsp; &nbsp;int rexw =3D (l-&gt;type =3D=3D TCG_TYPE_I64 ? P_R=
EXW : 0);</div>
<div>@@ -1895,7 &#43;1895,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit **label_ptr =3D &amp;l-&gt;label_ptr=
[0];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg retaddr;</div>
<div>@@ -2114,7 &#43;2114,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp; &nbsp; &nbsp;addrlo =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addrhi =3D (TARGET_LONG_BITS &gt; TCG_TARGET_REG_B=
ITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;mem_index =3D get_mmuidx(oi);</div>
<div>@@ -2232,7 &#43;2232,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is64)</div>
<div>&nbsp; &nbsp; &nbsp;addrlo =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addrhi =3D (TARGET_LONG_BITS &gt; TCG_TARGET_REG_B=
ITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;mem_index =3D get_mmuidx(oi);</div>
<div>diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c</di=
v>
<div>index ef31fc8..010afd0 100644</div>
<div>--- a/tcg/mips/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/mips/tcg-target.inc.c</div>
<div>@@ -1215,7 &#43;1215,7 @@ static void tcg_out_tlb_load(TCGContext *s, =
TCGReg base, TCGReg addrl,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg addrh, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_insn_unit *label_ptr[2], bool is_loa=
d)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(opc);</div>
<div>&nbsp; &nbsp; &nbsp;int mem_index =3D get_mmuidx(oi);</div>
<div>@@ -1313,7 &#43;1313,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, int is_ld, TCGMemOpIdx oi,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg v0;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>@@ -1363,7 &#43;1363,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>&nbsp;</div>
<div>@@ -1532,7 &#43;1532,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;addr_regl =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addr_regh =3D (TCG_TARGET_REG_BITS &lt; TARGET_LON=
G_BITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi=
, label_ptr, 1);</div>
<div>@@ -1635,7 &#43;1635,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;addr_regl =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addr_regh =3D (TCG_TARGET_REG_BITS &lt; TARGET_LON=
G_BITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi=
, label_ptr, 0);</div>
<div>diff --git a/tcg/optimize.c b/tcg/optimize.c</div>
<div>index d2424de..422bcbb 100644</div>
<div>--- a/tcg/optimize.c</div>
<div>&#43;&#43;&#43; b/tcg/optimize.c</div>
<div>@@ -1014,7 &#43;1014,7 @@ void tcg_optimize(TCGContext *s)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CASE_OP_32_64(qemu_ld):</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp=
Idx oi =3D op-&gt;args[nb_oargs &#43; nb_iargs];</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp mop =
=3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp =
mop =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!(mo=
p &amp; MO_SIGN)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;mask =3D (2ULL &lt;&lt; ((8 &lt;&lt; (mop &amp; MO_SIZE)) - 1)) - 1;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c</div>
<div>index 13a2437..0ab4faa 100644</div>
<div>--- a/tcg/ppc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/ppc/tcg-target.inc.c</div>
<div>@@ -1633,7 &#43;1633,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, bool is_ld, TCGMemOpIdx oi,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg hi, lo, arg =3D TCG_REG_R3;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!reloc_pc14(lb-&gt;label_ptr[0], s-&gt;code_pt=
r)) {</div>
<div>@@ -1680,7 &#43;1680,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *lb)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg hi, lo, arg =3D TCG_REG_R3;</div>
<div>&nbsp;</div>
<div>@@ -1755,7 &#43;1755,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;addrlo =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addrhi =3D (TCG_TARGET_REG_BITS &lt; TARGET_LONG_B=
ITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>@@ -1830,7 &#43;1830,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;addrlo =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addrhi =3D (TCG_TARGET_REG_BITS &lt; TARGET_LONG_B=
ITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp;</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c</=
div>
<div>index 90363df..ab4e035 100644</div>
<div>--- a/tcg/riscv/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/riscv/tcg-target.inc.c</div>
<div>@@ -970,7 &#43;970,7 @@ static void tcg_out_tlb_load(TCGContext *s, TC=
GReg addrl,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TCGReg addrh, TCGMemOpIdx oi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_insn_unit **label_ptr, bool is_load)=
</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;unsigned s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;unsigned a_bits =3D get_alignment_bits(opc);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_target_long compare_mask;</div>
<div>@@ -1044,7 &#43;1044,7 @@ static void add_qemu_ldst_label(TCGContext *=
s, int is_ld, TCGMemOpIdx oi,</div>
<div>&nbsp;static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a0 =3D tcg_target_call_iarg_regs[0];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a1 =3D tcg_target_call_iarg_regs[1];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a2 =3D tcg_target_call_iarg_regs[2];</div>
<div>@@ -1077,7 &#43;1077,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp;static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQem=
uLdst *l)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D l-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp s_bits =3D opc &amp; MO_SIZE;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a0 =3D tcg_target_call_iarg_regs[0];</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg a1 =3D tcg_target_call_iarg_regs[1];</div>
<div>@@ -1183,7 &#43;1183,7 @@ static void tcg_out_qemu_ld(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;addr_regl =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addr_regh =3D (TCG_TARGET_REG_BITS &lt; TARGET_LON=
G_BITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_tlb_load(s, addr_regl, addr_regh, oi, labe=
l_ptr, 1);</div>
<div>@@ -1254,7 &#43;1254,7 @@ static void tcg_out_qemu_st(TCGContext *s, c=
onst TCGArg *args, bool is_64)</div>
<div>&nbsp; &nbsp; &nbsp;addr_regl =3D *args&#43;&#43;;</div>
<div>&nbsp; &nbsp; &nbsp;addr_regh =3D (TCG_TARGET_REG_BITS &lt; TARGET_LON=
G_BITS ? *args&#43;&#43; : 0);</div>
<div>&nbsp; &nbsp; &nbsp;oi =3D *args&#43;&#43;;</div>
<div>- &nbsp; &nbsp;opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp;#if defined(CONFIG_SOFTMMU)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_tlb_load(s, addr_regl, addr_regh, oi, labe=
l_ptr, 0);</div>
<div>diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c</di=
v>
<div>index db1102e..4d8078b 100644</div>
<div>--- a/tcg/s390/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/s390/tcg-target.inc.c</div>
<div>@@ -1614,7 &#43;1614,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_reg =3D lb-&gt;addrlo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_reg =3D lb-&gt;datalo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!patch_reloc(lb-&gt;label_ptr[0], R_390_PC16DB=
L,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (intptr_t)s-&gt;code_ptr, 2)) {</div>
<div>@@ -1639,7 &#43;1639,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addr_reg =3D lb-&gt;addrlo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg data_reg =3D lb-&gt;datalo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOpIdx oi =3D lb-&gt;oi;</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (!patch_reloc(lb-&gt;label_ptr[0], R_390_PC16DB=
L,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (intptr_t)s-&gt;code_ptr, 2)) {</div>
<div>@@ -1694,7 &#43;1694,7 @@ static void tcg_prepare_user_ldst(TCGContext=
 *s, TCGReg *addr_reg,</div>
<div>&nbsp;static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr;</div>
<div>@@ -1721,7 &#43;1721,7 @@ static void tcg_out_qemu_ld(TCGContext* s, T=
CGReg data_reg, TCGReg addr_reg,</div>
<div>&nbsp;static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGR=
eg addr_reg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp opc =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp opc =3D get_tcgmemop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned mem_index =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_insn_unit *label_ptr;</div>
<div>diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c</=
div>
<div>index 7c50118..e6cf2c4 100644</div>
<div>--- a/tcg/sparc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/sparc/tcg-target.inc.c</div>
<div>@@ -1164,7 &#43;1164,7 @@ static const int qemu_st_opc[16] =3D {</div>
<div>&nbsp;static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg a=
ddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi, bool is_64)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp memop =3D get_tcgmemop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned memi =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrz, param;</div>
<div>@@ -1246,7 &#43;1246,7 @@ static void tcg_out_qemu_ld(TCGContext *s, T=
CGReg data, TCGReg addr,</div>
<div>&nbsp;static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg a=
ddr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp memop =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp memop =3D get_tcgmemop(oi);</div>
<div>&nbsp;#ifdef CONFIG_SOFTMMU</div>
<div>&nbsp; &nbsp; &nbsp;unsigned memi =3D get_mmuidx(oi);</div>
<div>&nbsp; &nbsp; &nbsp;TCGReg addrz, param;</div>
<div>diff --git a/tcg/tcg.c b/tcg/tcg.c</div>
<div>index be2c33c..492d7c6 100644</div>
<div>--- a/tcg/tcg.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg.c</div>
<div>@@ -2056,7 &#43;2056,7 @@ static void tcg_dump_ops(TCGContext *s, bool=
 have_prefs)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case INDEX_op_qemu_st_=
i64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;TCGMemOpIdx oi =3D op-&gt;args[k&#43;&#43;];</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;TCGMemOp op =3D get_memop(oi);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;TCGMemOp op =3D get_tcgmemop(oi);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;unsigned ix =3D get_mmuidx(oi);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (op &amp; ~(MO_AMASK | MO_BSWAP | MO_SSIZE)) {</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index 18b91fe..8a3f912 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -1197,12 &#43;1197,12 @@ static inline TCGMemOpIdx make_memop_idx(T=
CGMemOp op, unsigned idx)</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>- * get_memop</div>
<div>&#43; * get_tcgmemop</div>
<div>&nbsp; * @oi: combined op/idx parameter</div>
<div>&nbsp; *</div>
<div>&nbsp; * Extract the memory operation from the combined value.</div>
<div>&nbsp; */</div>
<div>-static inline TCGMemOp get_memop(TCGMemOpIdx oi)</div>
<div>&#43;static inline TCGMemOp get_tcgmemop(TCGMemOpIdx oi)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;return oi &gt;&gt; 4;</div>
<div>&nbsp;}</div>
<div>diff --git a/tcg/tci.c b/tcg/tci.c</div>
<div>index 33edca1..b3c5795 100644</div>
<div>--- a/tcg/tci.c</div>
<div>&#43;&#43;&#43; b/tcg/tci.c</div>
<div>@@ -1109,7 &#43;1109,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env=
, uint8_t *tb_ptr)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t0 =3D *tb_ptr&#43;&#4=
3;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;taddr =3D tci_read_ulo=
ng(regs, &amp;tb_ptr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oi =3D tci_read_i(&amp=
;tb_ptr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_memop(oi) &amp;=
 (MO_BSWAP | MO_SSIZE)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_tcgmemop(oi=
) &amp; (MO_BSWAP | MO_SSIZE)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tmp32 =
=3D qemu_ld_ub;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -1146,7 &#43;1146,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env=
, uint8_t *tb_ptr)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;taddr =3D tci_read_ulo=
ng(regs, &amp;tb_ptr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oi =3D tci_read_i(&amp=
;tb_ptr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_memop(oi) &amp;=
 (MO_BSWAP | MO_SSIZE)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_tcgmemop(oi=
) &amp; (MO_BSWAP | MO_SSIZE)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tmp64 =
=3D qemu_ld_ub;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -1195,7 &#43;1195,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env=
, uint8_t *tb_ptr)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t0 =3D tci_read_r(regs=
, &amp;tb_ptr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;taddr =3D tci_read_ulo=
ng(regs, &amp;tb_ptr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oi =3D tci_read_i(&amp=
;tb_ptr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_memop(oi) &amp;=
 (MO_BSWAP | MO_SIZE)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_tcgmemop(oi=
) &amp; (MO_BSWAP | MO_SIZE)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_st_=
b(t0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -1219,7 &#43;1219,7 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env=
, uint8_t *tb_ptr)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tmp64 =3D tci_read_r64=
(regs, &amp;tb_ptr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;taddr =3D tci_read_ulo=
ng(regs, &amp;tb_ptr);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oi =3D tci_read_i(&amp=
;tb_ptr);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_memop(oi) &amp;=
 (MO_BSWAP | MO_SIZE)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (get_tcgmemop(oi=
) &amp; (MO_BSWAP | MO_SIZE)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_st_=
b(tmp64);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381026406438406btcom_--

