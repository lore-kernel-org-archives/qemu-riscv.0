Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLWgO-0003km-AX
	for mharc-qemu-riscv@gnu.org; Tue, 30 Apr 2019 13:36:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hLWgK-0003ik-2v
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 13:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hLWgH-000127-5L
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 13:36:40 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:38154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hLWgA-0000wk-N1; Tue, 30 Apr 2019 13:36:31 -0400
Received: by mail-lf1-x12f.google.com with SMTP id v1so11503179lfg.5;
	Tue, 30 Apr 2019 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=QtZivRwQs+3Md6ht780CSzroumzlvmP+q77ExQQ8mqQ=;
	b=On7ouQlhkHkYhOpskOGIe8vLYTcsHNkqZbzO7cZqOtUpekKfW77hKzVdOLasJfP2Qi
	VN9I34FzYSNv/Ast1/joopl/XBztJbyd+Wwk3Iqw0eDmTPju2LIh6Ji/qtYNjtkui0WO
	YbUtoHEMPFzDdND4klI4/vbm2241fONljs2agtDx/0ViPxfWlD0qImJ81a0kR6rwldzT
	uGadsVghK2GEJFdAxAU9+3tTN49XtnfE1zzNas7R/G4yxXZRlmR6VS/iDGewF6VhhQu1
	1+8jPo6OdwUtidGa1iD1Fvw76vRsxmo0VfcVeqiH5Q+v5rnW1o9hiChX/tdafhoNV0D7
	w2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=QtZivRwQs+3Md6ht780CSzroumzlvmP+q77ExQQ8mqQ=;
	b=TJ4ZCzNzs7BR7aHOi5ABG3sIeu+DhgwnDbDXEXdDDAK9Sb7Wq1corhIe/uif4hQKEQ
	DPX9T/6iKMewkqSeFPk9mHbV3Eg8DzMCnhtYcKj/BrkUGvCs/zW5qE/6q89koKSRMHMS
	t0LPgjG2Nb/3vx9n3UB0wQ2tghtBjhU2w6AnenSaODYi0J2SLY+dKbqYUNBCJCeKa8Gr
	EulcCKR7QoX5YFlPOMZiwr1jRHsfqQMaJ6ZS/Fv0gNL6R4U/lRbu3wHpVg4C+P7sjfnU
	4GYQv9o/ldvadjskKyl4rbVU351pSAPkMT4A/i/FqfMFOaI8dTR8knQmtsRFrka2Zbiy
	aPrg==
X-Gm-Message-State: APjAAAUSSR2yI1QxebISwlJmvF+dLnC5v00U4L/v0IuXuxyZHWF0WGQ5
	OuTNjPqvPBAyWWUQBvaney91+gn7bzkaM1kqkEF5X4Q4i+o=
X-Google-Smtp-Source: APXvYqxxErVHhvM9qIX6+unrzeKN95lKwtos+IKhbn552BcrlZ1N8fQoxGRVgb7hAFxto6rj6le5MeyQdR3mwGbmiSE=
X-Received: by 2002:ac2:538a:: with SMTP id g10mr28012907lfh.141.1556645787991;
	Tue, 30 Apr 2019 10:36:27 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Behrens <fintelia@gmail.com>
Date: Tue, 30 Apr 2019 13:36:01 -0400
Message-ID: <CANnJOVH_Jt0pCeqnqpZdCY97pUf72EiABXtOvHWLAkpfqhKbqg@mail.gmail.com>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003c05c00587c2d722"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::12f
Subject: [Qemu-riscv] [PATCH for 4.1 v2] target/riscv: Expose time CSRs when
 allowed by [m|s]counteren
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
X-List-Received-Date: Tue, 30 Apr 2019 17:36:43 -0000

--0000000000003c05c00587c2d722
Content-Type: text/plain; charset="UTF-8"

Currently mcounteren.TM acts as though it is hardwired to zero, even though
QEMU allows it to be set. This change resolves the issue by allowing reads
to the time and timeh control registers when running in a privileged mode
where such accesses are allowed.

The frequency of the time register is stored in the time_freq field of each
hart so that it is accessible during CSR reads, but must be the same across
all harts. Each board can initialize it to a custom value, although all
currently use a 10 MHz frequency.
---
 hw/riscv/riscv_hart.c           |  4 ++++
 hw/riscv/sifive_clint.c         | 30 ++++++++++++++++++++++--------
 hw/riscv/sifive_e.c             |  2 ++
 hw/riscv/sifive_u.c             |  4 +++-
 hw/riscv/spike.c                |  6 +++++-
 hw/riscv/virt.c                 |  4 +++-
 include/hw/riscv/riscv_hart.h   |  1 +
 include/hw/riscv/sifive_clint.h |  4 ----
 include/hw/riscv/sifive_e.h     |  4 ++++
 include/hw/riscv/sifive_u.h     |  1 +
 include/hw/riscv/spike.h        |  1 +
 include/hw/riscv/virt.h         |  1 +
 target/riscv/cpu.h              |  2 ++
 target/riscv/csr.c              | 17 +++++++++++------
 14 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index e34a26a0ef..c39cd55330 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -19,6 +19,7 @@
  */

 #include "qemu/osdep.h"
+#include "qemu/timer.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
@@ -27,6 +28,8 @@
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
+    DEFINE_PROP_UINT64("timebase-frequency", RISCVHartArrayState,
time_freq,
+                       NANOSECONDS_PER_SECOND),
     DEFINE_PROP_END_OF_LIST(),
 };

@@ -49,6 +52,7 @@ static void riscv_harts_realize(DeviceState *dev, Error
**errp)
                                 sizeof(RISCVCPU), s->cpu_type,
                                 &error_abort, NULL);
         s->harts[n].env.mhartid = n;
+        s->harts[n].env.time_freq = s->time_freq;
         qemu_register_reset(riscv_harts_cpu_reset, &s->harts[n]);
         object_property_set_bool(OBJECT(&s->harts[n]), true,
                                  "realized", &err);
diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
index d4c159e937..71edf4dcc6 100644
--- a/hw/riscv/sifive_clint.c
+++ b/hw/riscv/sifive_clint.c
@@ -26,10 +26,10 @@
 #include "hw/riscv/sifive_clint.h"
 #include "qemu/timer.h"

-static uint64_t cpu_riscv_read_rtc(void)
+static uint64_t cpu_riscv_read_rtc(CPURISCVState *env)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-        SIFIVE_CLINT_TIMEBASE_FREQ, NANOSECONDS_PER_SECOND);
+        env->time_freq, NANOSECONDS_PER_SECOND);
 }

 /*
@@ -41,7 +41,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
uint64_t value)
     uint64_t next;
     uint64_t diff;

-    uint64_t rtc_r = cpu_riscv_read_rtc();
+    uint64_t rtc_r = cpu_riscv_read_rtc(&cpu->env);

     cpu->env.timecmp = value;
     if (cpu->env.timecmp <= rtc_r) {
@@ -56,7 +56,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
uint64_t value)
     diff = cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-        muldiv64(diff, NANOSECONDS_PER_SECOND, SIFIVE_CLINT_TIMEBASE_FREQ);
+        muldiv64(diff, NANOSECONDS_PER_SECOND, cpu->env.time_freq);
     timer_mod(cpu->env.timer, next);
 }

@@ -107,11 +107,25 @@ static uint64_t sifive_clint_read(void *opaque,
hwaddr addr, unsigned size)
             return 0;
         }
     } else if (addr == clint->time_base) {
-        /* time_lo */
-        return cpu_riscv_read_rtc() & 0xFFFFFFFF;
+        /* All harts must have the same time frequency, so just use hart 0
*/
+        CPUState *cpu = qemu_get_cpu(0);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            error_report("clint: hart 0 not valid?!");
+        } else {
+            /* time_lo */
+            return cpu_riscv_read_rtc(env) & 0xFFFFFFFF;
+        }
     } else if (addr == clint->time_base + 4) {
-        /* time_hi */
-        return (cpu_riscv_read_rtc() >> 32) & 0xFFFFFFFF;
+        /* All harts must have the same time frequency, so just use hart 0
*/
+        CPUState *cpu = qemu_get_cpu(0);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            error_report("clint: hart 0 not valid?!");
+        } else {
+            /* time_hi */
+            return (cpu_riscv_read_rtc(env) >> 32) & 0xFFFFFFFF;
+        }
     }

     error_report("clint: invalid read: %08x", (uint32_t)addr);
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index b1cd11363c..0a6bb629b6 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -146,6 +146,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
                             &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), SIFIVE_E_TIMEBASE_FREQ,
+                            "timebase-frequency", &error_abort);
 }

 static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5ecc47cea3..ab2b00106b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -116,7 +116,7 @@ static void create_fdt(SiFiveUState *s, const struct
MemmapEntry *memmap,

     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        SIFIVE_U_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);

@@ -329,6 +329,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
                             &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), SIFIVE_U_TIMEBASE_FREQ,
+                            "timebase-frequency", &error_abort);

     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2a000a5800..6b85083308 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -105,7 +105,7 @@ static void create_fdt(SpikeState *s, const struct
MemmapEntry *memmap,

     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        SPIKE_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);

@@ -179,6 +179,8 @@ static void spike_v1_10_0_board_init(MachineState
*machine)
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
                             &error_abort);
+    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
+                            "timebase-frequency", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                             &error_abort);

@@ -261,6 +263,8 @@ static void spike_v1_09_1_board_init(MachineState
*machine)
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
                             &error_abort);
+    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
+                            "timebase-frequency", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                             &error_abort);

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3526463034..beeccba4ac 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -185,7 +185,7 @@ static void *create_fdt(RISCVVirtState *s, const struct
MemmapEntry *memmap,

     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-                          SIFIVE_CLINT_TIMEBASE_FREQ);
+                          VIRT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);

@@ -403,6 +403,8 @@ static void riscv_virt_board_init(MachineState *machine)
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
                             &error_abort);
+    object_property_set_int(OBJECT(&s->soc), VIRT_TIMEBASE_FREQ,
+                            "timebase-frequency", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                             &error_abort);

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 0671d88a44..2e82e85b2b 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -33,6 +33,7 @@ typedef struct RISCVHartArrayState {
     /*< public >*/
     uint32_t num_harts;
     char *cpu_type;
+    uint64_t time_freq;
     RISCVCPU *harts;
 } RISCVHartArrayState;

diff --git a/include/hw/riscv/sifive_clint.h
b/include/hw/riscv/sifive_clint.h
index e2865be1d1..aaa2a58c6e 100644
--- a/include/hw/riscv/sifive_clint.h
+++ b/include/hw/riscv/sifive_clint.h
@@ -47,8 +47,4 @@ enum {
     SIFIVE_TIME_BASE    = 0xBFF8
 };

-enum {
-    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
-};
-
 #endif
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 7b6d8aed96..b83e60493e 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -67,6 +67,10 @@ enum {
     SIFIVE_E_UART1_IRQ = 4
 };

+enum {
+    SIFIVE_E_TIMEBASE_FREQ = 10000000,
+};
+
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
 #define SIFIVE_E_PLIC_NUM_SOURCES 127
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index be13cc1304..e94eb89866 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -63,6 +63,7 @@ enum {
 };

 enum {
+    SIFIVE_U_TIMEBASE_FREQ = 10000000,
     SIFIVE_U_CLOCK_FREQ = 1000000000,
     SIFIVE_U_GEM_CLOCK_FREQ = 125000000
 };
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index 641b70da67..2d391d1559 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -36,6 +36,7 @@ enum {
 };

 enum {
+    SPIKE_TIMEBASE_FREQ = 10000000,
     SPIKE_CLOCK_FREQ = 1000000000
 };

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index f12deaebd6..f807bbfe1e 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -53,6 +53,7 @@ enum {
 };

 enum {
+    VIRT_TIMEBASE_FREQ = 10000000,
     VIRT_CLOCK_FREQ = 1000000000
 };

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 20bce8742e..67b1769ad3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,7 +173,9 @@ struct CPURISCVState {
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
+
     uint64_t timecmp;
+    uint64_t time_freq;

     /* physical memory protection */
     pmp_table_t pmp_state;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e1d91b6c60..6083c782a1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env, int
csrno, target_ulong *val)
 }
 #endif /* TARGET_RISCV32 */

-#if defined(CONFIG_USER_ONLY)
 static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                    env->time_freq, NANOSECONDS_PER_SECOND);
+#else
     *val = cpu_get_host_ticks();
+#endif
     return 0;
 }

 #if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                    env->time_freq, NANOSECONDS_PER_SECOND) >> 32;
+#else
     *val = cpu_get_host_ticks() >> 32;
+#endif
     return 0;
 }
 #endif

-#else /* CONFIG_USER_ONLY */
+#if !defined(CONFIG_USER_ONLY)

 /* Machine constants */

@@ -854,14 +863,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
{
     [CSR_INSTRETH] =            { ctr,
read_instreth                       },
 #endif

-    /* User-level time CSRs are only available in linux-user
-     * In privileged mode, the monitor emulates these CSRs */
-#if defined(CONFIG_USER_ONLY)
     [CSR_TIME] =                { ctr,
read_time                           },
 #if defined(TARGET_RISCV32)
     [CSR_TIMEH] =               { ctr,
read_timeh                          },
 #endif
-#endif

 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
-- 
2.20.1

--0000000000003c05c00587c2d722
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+Q3VycmVudGx5IG1j
b3VudGVyZW4uVE0gYWN0cyBhcyB0aG91Z2ggaXQgaXMgaGFyZHdpcmVkIHRvIHplcm8sIGV2ZW4g
dGhvdWdoIFFFTVUgYWxsb3dzIGl0IHRvIGJlIHNldC4gVGhpcyBjaGFuZ2UgcmVzb2x2ZXMgdGhl
IGlzc3VlIGJ5IGFsbG93aW5nIHJlYWRzIHRvIHRoZSB0aW1lIGFuZCB0aW1laCBjb250cm9sIHJl
Z2lzdGVycyB3aGVuIHJ1bm5pbmcgaW4gYSBwcml2aWxlZ2VkIG1vZGUgd2hlcmUgc3VjaCBhY2Nl
c3NlcyBhcmUgYWxsb3dlZC48L2Rpdj48ZGl2IGRpcj0ibHRyIj48YnI+PC9kaXY+PGRpdj5UaGUg
ZnJlcXVlbmN5IG9mIHRoZSB0aW1lIHJlZ2lzdGVyIGlzIHN0b3JlZCBpbiB0aGUgdGltZV9mcmVx
IGZpZWxkIG9mIGVhY2ggaGFydCBzbyB0aGF0IGl0IGlzIGFjY2Vzc2libGUgZHVyaW5nIENTUiBy
ZWFkcywgYnV0IG11c3QgYmUgdGhlIHNhbWUgYWNyb3NzIGFsbCBoYXJ0cy4gRWFjaCBib2FyZCBj
YW4gaW5pdGlhbGl6ZSBpdCB0byBhIGN1c3RvbSB2YWx1ZSwgYWx0aG91Z2ggYWxsIGN1cnJlbnRs
eSB1c2UgYSAxMCBNSHogZnJlcXVlbmN5Ljxicj48L2Rpdj48ZGl2Pi0tLTxicj48L2Rpdj48ZGl2
IGRpcj0ibHRyIj7CoGh3L3Jpc2N2L3Jpc2N2X2hhcnQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA0ICsrKys8YnI+wqBody9yaXNjdi9zaWZpdmVfY2xpbnQuY8KgwqDCoMKgwqDCoMKgwqAgfCAz
MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS08YnI+wqBody9yaXNjdi9zaWZpdmVfZS5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrPGJyPsKgaHcvcmlzY3Yvc2lmaXZlX3Uu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKystPGJyPsKgaHcvcmlzY3Yvc3Bpa2Uu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKysrKy08YnI+wqBody9yaXNj
di92aXJ0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKystPGJyPsKg
aW5jbHVkZS9ody9yaXNjdi9yaXNjdl9oYXJ0LmjCoMKgIHzCoCAxICs8YnI+wqBpbmNsdWRlL2h3
L3Jpc2N2L3NpZml2ZV9jbGludC5oIHzCoCA0IC0tLS08YnI+wqBpbmNsdWRlL2h3L3Jpc2N2L3Np
Zml2ZV9lLmjCoMKgwqDCoCB8wqAgNCArKysrPGJyPsKgaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVf
dS5owqDCoMKgwqAgfMKgIDEgKzxicj7CoGluY2x1ZGUvaHcvcmlzY3Yvc3Bpa2UuaMKgwqDCoMKg
wqDCoMKgIHzCoCAxICs8YnI+wqBpbmNsdWRlL2h3L3Jpc2N2L3ZpcnQuaMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEgKzxicj7CoHRhcmdldC9yaXNjdi9jcHUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICsrPGJyPsKgdGFyZ2V0L3Jpc2N2L2Nzci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxNyArKysrKysrKysrKy0tLS0tLTxicj7CoDE0IGZpbGVzIGNoYW5nZWQsIDYwIGlu
c2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKTxicj48YnI+ZGlmZiAtLWdpdCBhL2h3L3Jpc2N2
L3Jpc2N2X2hhcnQuYyBiL2h3L3Jpc2N2L3Jpc2N2X2hhcnQuYzxicj5pbmRleCBlMzRhMjZhMGVm
Li5jMzljZDU1MzMwIDEwMDY0NDxicj4tLS0gYS9ody9yaXNjdi9yaXNjdl9oYXJ0LmM8YnI+Kysr
IGIvaHcvcmlzY3YvcmlzY3ZfaGFydC5jPGJyPkBAIC0xOSw2ICsxOSw3IEBAPGJyPsKgICovPGJy
PsKgPGJyPsKgI2luY2x1ZGUgJnF1b3Q7cWVtdS9vc2RlcC5oJnF1b3Q7PGJyPisjaW5jbHVkZSAm
cXVvdDtxZW11L3RpbWVyLmgmcXVvdDs8YnI+wqAjaW5jbHVkZSAmcXVvdDtxYXBpL2Vycm9yLmgm
cXVvdDs8YnI+wqAjaW5jbHVkZSAmcXVvdDtody9zeXNidXMuaCZxdW90Ozxicj7CoCNpbmNsdWRl
ICZxdW90O3RhcmdldC9yaXNjdi9jcHUuaCZxdW90Ozxicj5AQCAtMjcsNiArMjgsOCBAQDxicj7C
oHN0YXRpYyBQcm9wZXJ0eSByaXNjdl9oYXJ0c19wcm9wc1tdID0gezxicj7CoMKgwqDCoCBERUZJ
TkVfUFJPUF9VSU5UMzIoJnF1b3Q7bnVtLWhhcnRzJnF1b3Q7LCBSSVNDVkhhcnRBcnJheVN0YXRl
LCBudW1faGFydHMsIDEpLDxicj7CoMKgwqDCoCBERUZJTkVfUFJPUF9TVFJJTkcoJnF1b3Q7Y3B1
LXR5cGUmcXVvdDssIFJJU0NWSGFydEFycmF5U3RhdGUsIGNwdV90eXBlKSw8YnI+K8KgwqDCoCBE
RUZJTkVfUFJPUF9VSU5UNjQoJnF1b3Q7dGltZWJhc2UtZnJlcXVlbmN5JnF1b3Q7LCBSSVNDVkhh
cnRBcnJheVN0YXRlLCB0aW1lX2ZyZXEsPGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBOQU5PU0VDT05EU19QRVJfU0VDT05EKSw8YnI+wqDCoMKgwqAgREVG
SU5FX1BST1BfRU5EX09GX0xJU1QoKSw8YnI+wqB9Ozxicj7CoDxicj5AQCAtNDksNiArNTIsNyBA
QCBzdGF0aWMgdm9pZCByaXNjdl9oYXJ0c19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9y
ICoqZXJycCk8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoUklTQ1ZDUFUpLCBzLSZndDtjcHVfdHlwZSw8YnI+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAmYW1wO2Vycm9yX2Fib3J0LCBOVUxMKTs8YnI+wqDCoMKgwqDCoMKgwqDCoCBzLSZn
dDtoYXJ0c1tuXS5lbnYubWhhcnRpZCA9IG47PGJyPivCoMKgwqDCoMKgwqDCoCBzLSZndDtoYXJ0
c1tuXS5lbnYudGltZV9mcmVxID0gcy0mZ3Q7dGltZV9mcmVxOzxicj7CoMKgwqDCoMKgwqDCoMKg
IHFlbXVfcmVnaXN0ZXJfcmVzZXQocmlzY3ZfaGFydHNfY3B1X3Jlc2V0LCAmYW1wO3MtJmd0O2hh
cnRzW25dKTs8YnI+wqDCoMKgwqDCoMKgwqDCoCBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2woT0JK
RUNUKCZhbXA7cy0mZ3Q7aGFydHNbbl0pLCB0cnVlLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7cmVhbGl6
ZWQmcXVvdDssICZhbXA7ZXJyKTs8YnI+ZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L3NpZml2ZV9jbGlu
dC5jIGIvaHcvcmlzY3Yvc2lmaXZlX2NsaW50LmM8YnI+aW5kZXggZDRjMTU5ZTkzNy4uNzFlZGY0
ZGNjNiAxMDA2NDQ8YnI+LS0tIGEvaHcvcmlzY3Yvc2lmaXZlX2NsaW50LmM8YnI+KysrIGIvaHcv
cmlzY3Yvc2lmaXZlX2NsaW50LmM8YnI+QEAgLTI2LDEwICsyNiwxMCBAQDxicj7CoCNpbmNsdWRl
ICZxdW90O2h3L3Jpc2N2L3NpZml2ZV9jbGludC5oJnF1b3Q7PGJyPsKgI2luY2x1ZGUgJnF1b3Q7
cWVtdS90aW1lci5oJnF1b3Q7PGJyPsKgPGJyPi1zdGF0aWMgdWludDY0X3QgY3B1X3Jpc2N2X3Jl
YWRfcnRjKHZvaWQpPGJyPitzdGF0aWMgdWludDY0X3QgY3B1X3Jpc2N2X3JlYWRfcnRjKENQVVJJ
U0NWU3RhdGUgKmVudik8YnI+wqB7PGJyPsKgwqDCoMKgIHJldHVybiBtdWxkaXY2NChxZW11X2Ns
b2NrX2dldF9ucyhRRU1VX0NMT0NLX1ZJUlRVQUwpLDxicj4twqDCoMKgwqDCoMKgwqAgU0lGSVZF
X0NMSU5UX1RJTUVCQVNFX0ZSRVEsIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQpOzxicj4rwqDCoMKg
wqDCoMKgwqAgZW52LSZndDt0aW1lX2ZyZXEsIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQpOzxicj7C
oH08YnI+wqA8YnI+wqAvKjxicj5AQCAtNDEsNyArNDEsNyBAQCBzdGF0aWMgdm9pZCBzaWZpdmVf
Y2xpbnRfd3JpdGVfdGltZWNtcChSSVNDVkNQVSAqY3B1LCB1aW50NjRfdCB2YWx1ZSk8YnI+wqDC
oMKgwqAgdWludDY0X3QgbmV4dDs8YnI+wqDCoMKgwqAgdWludDY0X3QgZGlmZjs8YnI+wqA8YnI+
LcKgwqDCoCB1aW50NjRfdCBydGNfciA9IGNwdV9yaXNjdl9yZWFkX3J0YygpOzxicj4rwqDCoMKg
IHVpbnQ2NF90IHJ0Y19yID0gY3B1X3Jpc2N2X3JlYWRfcnRjKCZhbXA7Y3B1LSZndDtlbnYpOzxi
cj7CoDxicj7CoMKgwqDCoCBjcHUtJmd0O2Vudi50aW1lY21wID0gdmFsdWU7PGJyPsKgwqDCoMKg
IGlmIChjcHUtJmd0O2Vudi50aW1lY21wICZsdDs9IHJ0Y19yKSB7PGJyPkBAIC01Niw3ICs1Niw3
IEBAIHN0YXRpYyB2b2lkIHNpZml2ZV9jbGludF93cml0ZV90aW1lY21wKFJJU0NWQ1BVICpjcHUs
IHVpbnQ2NF90IHZhbHVlKTxicj7CoMKgwqDCoCBkaWZmID0gY3B1LSZndDtlbnYudGltZWNtcCAt
IHJ0Y19yOzxicj7CoMKgwqDCoCAvKiBiYWNrIHRvIG5zIChub3RlIGFyZ3Mgc3dpdGNoZWQgaW4g
bXVsZGl2NjQpICovPGJyPsKgwqDCoMKgIG5leHQgPSBxZW11X2Nsb2NrX2dldF9ucyhRRU1VX0NM
T0NLX1ZJUlRVQUwpICs8YnI+LcKgwqDCoMKgwqDCoMKgIG11bGRpdjY0KGRpZmYsIE5BTk9TRUNP
TkRTX1BFUl9TRUNPTkQsIFNJRklWRV9DTElOVF9USU1FQkFTRV9GUkVRKTs8YnI+K8KgwqDCoMKg
wqDCoMKgIG11bGRpdjY0KGRpZmYsIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQsIGNwdS0mZ3Q7ZW52
LnRpbWVfZnJlcSk7PGJyPsKgwqDCoMKgIHRpbWVyX21vZChjcHUtJmd0O2Vudi50aW1lciwgbmV4
dCk7PGJyPsKgfTxicj7CoDxicj5AQCAtMTA3LDExICsxMDcsMjUgQEAgc3RhdGljIHVpbnQ2NF90
IHNpZml2ZV9jbGludF9yZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsIHVuc2lnbmVkIHNp
emUpPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDs8YnI+wqDCoMKgwqDCoMKg
wqDCoCB9PGJyPsKgwqDCoMKgIH0gZWxzZSBpZiAoYWRkciA9PSBjbGludC0mZ3Q7dGltZV9iYXNl
KSB7PGJyPi3CoMKgwqDCoMKgwqDCoCAvKiB0aW1lX2xvICovPGJyPi3CoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gY3B1X3Jpc2N2X3JlYWRfcnRjKCkgJmFtcDsgMHhGRkZGRkZGRjs8YnI+K8KgwqDCoMKg
wqDCoMKgIC8qIEFsbCBoYXJ0cyBtdXN0IGhhdmUgdGhlIHNhbWUgdGltZSBmcmVxdWVuY3ksIHNv
IGp1c3QgdXNlIGhhcnQgMCAqLzxicj4rwqDCoMKgwqDCoMKgwqAgQ1BVU3RhdGUgKmNwdSA9IHFl
bXVfZ2V0X2NwdSgwKTs8YnI+K8KgwqDCoMKgwqDCoMKgIENQVVJJU0NWU3RhdGUgKmVudiA9IGNw
dSA/IGNwdS0mZ3Q7ZW52X3B0ciA6IE5VTEw7PGJyPivCoMKgwqDCoMKgwqDCoCBpZiAoIWVudikg
ezxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJvcl9yZXBvcnQoJnF1b3Q7Y2xpbnQ6IGhh
cnQgMCBub3QgdmFsaWQ/ISZxdW90Oyk7PGJyPivCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugezxicj4r
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB0aW1lX2xvICovPGJyPivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBjcHVfcmlzY3ZfcmVhZF9ydGMoZW52KSAmYW1wOyAweEZGRkZGRkZGOzxi
cj4rwqDCoMKgwqDCoMKgwqAgfTxicj7CoMKgwqDCoCB9IGVsc2UgaWYgKGFkZHIgPT0gY2xpbnQt
Jmd0O3RpbWVfYmFzZSArIDQpIHs8YnI+LcKgwqDCoMKgwqDCoMKgIC8qIHRpbWVfaGkgKi88YnI+
LcKgwqDCoMKgwqDCoMKgIHJldHVybiAoY3B1X3Jpc2N2X3JlYWRfcnRjKCkgJmd0OyZndDsgMzIp
ICZhbXA7IDB4RkZGRkZGRkY7PGJyPivCoMKgwqDCoMKgwqDCoCAvKiBBbGwgaGFydHMgbXVzdCBo
YXZlIHRoZSBzYW1lIHRpbWUgZnJlcXVlbmN5LCBzbyBqdXN0IHVzZSBoYXJ0IDAgKi88YnI+K8Kg
wqDCoMKgwqDCoMKgIENQVVN0YXRlICpjcHUgPSBxZW11X2dldF9jcHUoMCk7PGJyPivCoMKgwqDC
oMKgwqDCoCBDUFVSSVNDVlN0YXRlICplbnYgPSBjcHUgPyBjcHUtJmd0O2Vudl9wdHIgOiBOVUxM
Ozxicj4rwqDCoMKgwqDCoMKgwqAgaWYgKCFlbnYpIHs8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZXJyb3JfcmVwb3J0KCZxdW90O2NsaW50OiBoYXJ0IDAgbm90IHZhbGlkPyEmcXVvdDspOzxi
cj4rwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHs8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
dGltZV9oaSAqLzxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gKGNwdV9yaXNjdl9y
ZWFkX3J0YyhlbnYpICZndDsmZ3Q7IDMyKSAmYW1wOyAweEZGRkZGRkZGOzxicj4rwqDCoMKgwqDC
oMKgwqAgfTxicj7CoMKgwqDCoCB9PGJyPsKgPGJyPsKgwqDCoMKgIGVycm9yX3JlcG9ydCgmcXVv
dDtjbGludDogaW52YWxpZCByZWFkOiAlMDh4JnF1b3Q7LCAodWludDMyX3QpYWRkcik7PGJyPmRp
ZmYgLS1naXQgYS9ody9yaXNjdi9zaWZpdmVfZS5jIGIvaHcvcmlzY3Yvc2lmaXZlX2UuYzxicj5p
bmRleCBiMWNkMTEzNjNjLi4wYTZiYjYyOWI2IDEwMDY0NDxicj4tLS0gYS9ody9yaXNjdi9zaWZp
dmVfZS5jPGJyPisrKyBiL2h3L3Jpc2N2L3NpZml2ZV9lLmM8YnI+QEAgLTE0Niw2ICsxNDYsOCBA
QCBzdGF0aWMgdm9pZCByaXNjdl9zaWZpdmVfZV9zb2NfaW5pdChPYmplY3QgKm9iaik8YnI+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFt
cDtlcnJvcl9hYm9ydCk7PGJyPsKgwqDCoMKgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVD
VCgmYW1wO3MtJmd0O2NwdXMpLCBzbXBfY3B1cywgJnF1b3Q7bnVtLWhhcnRzJnF1b3Q7LDxicj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAm
YW1wO2Vycm9yX2Fib3J0KTs8YnI+K8KgwqDCoCBvYmplY3RfcHJvcGVydHlfc2V0X2ludChPQkpF
Q1QoJmFtcDtzLSZndDtjcHVzKSwgU0lGSVZFX0VfVElNRUJBU0VfRlJFUSw8YnI+K8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDt0aW1l
YmFzZS1mcmVxdWVuY3kmcXVvdDssICZhbXA7ZXJyb3JfYWJvcnQpOzxicj7CoH08YnI+wqA8YnI+
wqBzdGF0aWMgdm9pZCByaXNjdl9zaWZpdmVfZV9zb2NfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2
LCBFcnJvciAqKmVycnApPGJyPmRpZmYgLS1naXQgYS9ody9yaXNjdi9zaWZpdmVfdS5jIGIvaHcv
cmlzY3Yvc2lmaXZlX3UuYzxicj5pbmRleCA1ZWNjNDdjZWEzLi5hYjJiMDAxMDZiIDEwMDY0NDxi
cj4tLS0gYS9ody9yaXNjdi9zaWZpdmVfdS5jPGJyPisrKyBiL2h3L3Jpc2N2L3NpZml2ZV91LmM8
YnI+QEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0aWMgdm9pZCBjcmVhdGVfZmR0KFNpRml2ZVVTdGF0
ZSAqcywgY29uc3Qgc3RydWN0IE1lbW1hcEVudHJ5ICptZW1tYXAsPGJyPsKgPGJyPsKgwqDCoMKg
IHFlbXVfZmR0X2FkZF9zdWJub2RlKGZkdCwgJnF1b3Q7L2NwdXMmcXVvdDspOzxicj7CoMKgwqDC
oCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwoZmR0LCAmcXVvdDsvY3B1cyZxdW90OywgJnF1b3Q7dGlt
ZWJhc2UtZnJlcXVlbmN5JnF1b3Q7LDxicj4twqDCoMKgwqDCoMKgwqAgU0lGSVZFX0NMSU5UX1RJ
TUVCQVNFX0ZSRVEpOzxicj4rwqDCoMKgwqDCoMKgwqAgU0lGSVZFX1VfVElNRUJBU0VfRlJFUSk7
PGJyPsKgwqDCoMKgIHFlbXVfZmR0X3NldHByb3BfY2VsbChmZHQsICZxdW90Oy9jcHVzJnF1b3Q7
LCAmcXVvdDsjc2l6ZS1jZWxscyZxdW90OywgMHgwKTs8YnI+wqDCoMKgwqAgcWVtdV9mZHRfc2V0
cHJvcF9jZWxsKGZkdCwgJnF1b3Q7L2NwdXMmcXVvdDssICZxdW90OyNhZGRyZXNzLWNlbGxzJnF1
b3Q7LCAweDEpOzxicj7CoDxicj5AQCAtMzI5LDYgKzMyOSw4IEBAIHN0YXRpYyB2b2lkIHJpc2N2
X3NpZml2ZV91X3NvY19pbml0KE9iamVjdCAqb2JqKTxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYW1wO2Vycm9yX2Fib3J0KTs8YnI+
wqDCoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZhbXA7cy0mZ3Q7Y3B1cyks
IHNtcF9jcHVzLCAmcXVvdDtudW0taGFydHMmcXVvdDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhbXA7ZXJyb3JfYWJvcnQpOzxi
cj4rwqDCoMKgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgmYW1wO3MtJmd0O2NwdXMp
LCBTSUZJVkVfVV9USU1FQkFTRV9GUkVRLDxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O3RpbWViYXNlLWZyZXF1ZW5jeSZxdW90
OywgJmFtcDtlcnJvcl9hYm9ydCk7PGJyPsKgPGJyPsKgwqDCoMKgIHN5c2J1c19pbml0X2NoaWxk
X29iaihvYmosICZxdW90O2dlbSZxdW90OywgJmFtcDtzLSZndDtnZW0sIHNpemVvZihzLSZndDtn
ZW0pLDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFRZUEVfQ0FERU5DRV9HRU0pOzxicj5kaWZmIC0tZ2l0IGEvaHcvcmlzY3Yvc3Bpa2UuYyBi
L2h3L3Jpc2N2L3NwaWtlLmM8YnI+aW5kZXggMmEwMDBhNTgwMC4uNmI4NTA4MzMwOCAxMDA2NDQ8
YnI+LS0tIGEvaHcvcmlzY3Yvc3Bpa2UuYzxicj4rKysgYi9ody9yaXNjdi9zcGlrZS5jPGJyPkBA
IC0xMDUsNyArMTA1LDcgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2ZkdChTcGlrZVN0YXRlICpzLCBj
b25zdCBzdHJ1Y3QgTWVtbWFwRW50cnkgKm1lbW1hcCw8YnI+wqA8YnI+wqDCoMKgwqAgcWVtdV9m
ZHRfYWRkX3N1Ym5vZGUoZmR0LCAmcXVvdDsvY3B1cyZxdW90Oyk7PGJyPsKgwqDCoMKgIHFlbXVf
ZmR0X3NldHByb3BfY2VsbChmZHQsICZxdW90Oy9jcHVzJnF1b3Q7LCAmcXVvdDt0aW1lYmFzZS1m
cmVxdWVuY3kmcXVvdDssPGJyPi3CoMKgwqDCoMKgwqDCoCBTSUZJVkVfQ0xJTlRfVElNRUJBU0Vf
RlJFUSk7PGJyPivCoMKgwqDCoMKgwqDCoCBTUElLRV9USU1FQkFTRV9GUkVRKTs8YnI+wqDCoMKg
wqAgcWVtdV9mZHRfc2V0cHJvcF9jZWxsKGZkdCwgJnF1b3Q7L2NwdXMmcXVvdDssICZxdW90OyNz
aXplLWNlbGxzJnF1b3Q7LCAweDApOzxicj7CoMKgwqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwo
ZmR0LCAmcXVvdDsvY3B1cyZxdW90OywgJnF1b3Q7I2FkZHJlc3MtY2VsbHMmcXVvdDssIDB4MSk7
PGJyPsKgPGJyPkBAIC0xNzksNiArMTc5LDggQEAgc3RhdGljIHZvaWQgc3Bpa2VfdjFfMTBfMF9i
b2FyZF9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSk8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFtcDtlcnJvcl9hYm9ydCk7PGJy
PsKgwqDCoMKgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgmYW1wO3MtJmd0O3NvYyks
IHNtcF9jcHVzLCAmcXVvdDtudW0taGFydHMmcXVvdDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhbXA7ZXJyb3JfYWJvcnQpOzxi
cj4rwqDCoMKgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgmYW1wO3MtJmd0O3NvYyks
IFNQSUtFX1RJTUVCQVNFX0ZSRVEsPGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7dGltZWJhc2UtZnJlcXVlbmN5JnF1b3Q7LCAm
YW1wO2Vycm9yX2Fib3J0KTs8YnI+wqDCoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKE9C
SkVDVCgmYW1wO3MtJmd0O3NvYyksIHRydWUsICZxdW90O3JlYWxpemVkJnF1b3Q7LDxicj7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYW1w
O2Vycm9yX2Fib3J0KTs8YnI+wqA8YnI+QEAgLTI2MSw2ICsyNjMsOCBAQCBzdGF0aWMgdm9pZCBz
cGlrZV92MV8wOV8xX2JvYXJkX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKTxicj7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYW1wO2Vy
cm9yX2Fib3J0KTs8YnI+wqDCoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZh
bXA7cy0mZ3Q7c29jKSwgc21wX2NwdXMsICZxdW90O251bS1oYXJ0cyZxdW90Oyw8YnI+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFtcDtl
cnJvcl9hYm9ydCk7PGJyPivCoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZh
bXA7cy0mZ3Q7c29jKSwgU1BJS0VfVElNRUJBU0VfRlJFUSw8YnI+K8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDt0aW1lYmFzZS1mcmVx
dWVuY3kmcXVvdDssICZhbXA7ZXJyb3JfYWJvcnQpOzxicj7CoMKgwqDCoCBvYmplY3RfcHJvcGVy
dHlfc2V0X2Jvb2woT0JKRUNUKCZhbXA7cy0mZ3Q7c29jKSwgdHJ1ZSwgJnF1b3Q7cmVhbGl6ZWQm
cXVvdDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZhbXA7ZXJyb3JfYWJvcnQpOzxicj7CoDxicj5kaWZmIC0tZ2l0IGEvaHcvcmlz
Y3YvdmlydC5jIGIvaHcvcmlzY3YvdmlydC5jPGJyPmluZGV4IDM1MjY0NjMwMzQuLmJlZWNjYmE0
YWMgMTAwNjQ0PGJyPi0tLSBhL2h3L3Jpc2N2L3ZpcnQuYzxicj4rKysgYi9ody9yaXNjdi92aXJ0
LmM8YnI+QEAgLTE4NSw3ICsxODUsNyBAQCBzdGF0aWMgdm9pZCAqY3JlYXRlX2ZkdChSSVNDVlZp
cnRTdGF0ZSAqcywgY29uc3Qgc3RydWN0IE1lbW1hcEVudHJ5ICptZW1tYXAsPGJyPsKgPGJyPsKg
wqDCoMKgIHFlbXVfZmR0X2FkZF9zdWJub2RlKGZkdCwgJnF1b3Q7L2NwdXMmcXVvdDspOzxicj7C
oMKgwqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwoZmR0LCAmcXVvdDsvY3B1cyZxdW90OywgJnF1
b3Q7dGltZWJhc2UtZnJlcXVlbmN5JnF1b3Q7LDxicj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0lGSVZFX0NMSU5UX1RJTUVCQVNFX0ZSRVEpOzxi
cj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVklS
VF9USU1FQkFTRV9GUkVRKTs8YnI+wqDCoMKgwqAgcWVtdV9mZHRfc2V0cHJvcF9jZWxsKGZkdCwg
JnF1b3Q7L2NwdXMmcXVvdDssICZxdW90OyNzaXplLWNlbGxzJnF1b3Q7LCAweDApOzxicj7CoMKg
wqDCoCBxZW11X2ZkdF9zZXRwcm9wX2NlbGwoZmR0LCAmcXVvdDsvY3B1cyZxdW90OywgJnF1b3Q7
I2FkZHJlc3MtY2VsbHMmcXVvdDssIDB4MSk7PGJyPsKgPGJyPkBAIC00MDMsNiArNDAzLDggQEAg
c3RhdGljIHZvaWQgcmlzY3ZfdmlydF9ib2FyZF9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSk8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJmFtcDtlcnJvcl9hYm9ydCk7PGJyPsKgwqDCoMKgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50
KE9CSkVDVCgmYW1wO3MtJmd0O3NvYyksIHNtcF9jcHVzLCAmcXVvdDtudW0taGFydHMmcXVvdDss
PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICZhbXA7ZXJyb3JfYWJvcnQpOzxicj4rwqDCoMKgIG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50
KE9CSkVDVCgmYW1wO3MtJmd0O3NvYyksIFZJUlRfVElNRUJBU0VfRlJFUSw8YnI+K8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDt0aW1l
YmFzZS1mcmVxdWVuY3kmcXVvdDssICZhbXA7ZXJyb3JfYWJvcnQpOzxicj7CoMKgwqDCoCBvYmpl
Y3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKCZhbXA7cy0mZ3Q7c29jKSwgdHJ1ZSwgJnF1b3Q7
cmVhbGl6ZWQmcXVvdDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZhbXA7ZXJyb3JfYWJvcnQpOzxicj7CoDxicj5kaWZmIC0tZ2l0
IGEvaW5jbHVkZS9ody9yaXNjdi9yaXNjdl9oYXJ0LmggYi9pbmNsdWRlL2h3L3Jpc2N2L3Jpc2N2
X2hhcnQuaDxicj5pbmRleCAwNjcxZDg4YTQ0Li4yZTgyZTg1YjJiIDEwMDY0NDxicj4tLS0gYS9p
bmNsdWRlL2h3L3Jpc2N2L3Jpc2N2X2hhcnQuaDxicj4rKysgYi9pbmNsdWRlL2h3L3Jpc2N2L3Jp
c2N2X2hhcnQuaDxicj5AQCAtMzMsNiArMzMsNyBAQCB0eXBlZGVmIHN0cnVjdCBSSVNDVkhhcnRB
cnJheVN0YXRlIHs8YnI+wqDCoMKgwqAgLyombHQ7IHB1YmxpYyAmZ3Q7Ki88YnI+wqDCoMKgwqAg
dWludDMyX3QgbnVtX2hhcnRzOzxicj7CoMKgwqDCoCBjaGFyICpjcHVfdHlwZTs8YnI+K8KgwqDC
oCB1aW50NjRfdCB0aW1lX2ZyZXE7PGJyPsKgwqDCoMKgIFJJU0NWQ1BVICpoYXJ0czs8YnI+wqB9
IFJJU0NWSGFydEFycmF5U3RhdGU7PGJyPsKgPGJyPmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Jp
c2N2L3NpZml2ZV9jbGludC5oIGIvaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVfY2xpbnQuaDxicj5p
bmRleCBlMjg2NWJlMWQxLi5hYWEyYTU4YzZlIDEwMDY0NDxicj4tLS0gYS9pbmNsdWRlL2h3L3Jp
c2N2L3NpZml2ZV9jbGludC5oPGJyPisrKyBiL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX2NsaW50
Lmg8YnI+QEAgLTQ3LDggKzQ3LDQgQEAgZW51bSB7PGJyPsKgwqDCoMKgIFNJRklWRV9USU1FX0JB
U0XCoMKgwqAgPSAweEJGRjg8YnI+wqB9Ozxicj7CoDxicj4tZW51bSB7PGJyPi3CoMKgwqAgU0lG
SVZFX0NMSU5UX1RJTUVCQVNFX0ZSRVEgPSAxMDAwMDAwMDxicj4tfTs8YnI+LTxicj7CoCNlbmRp
Zjxicj5kaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVfZS5oIGIvaW5jbHVkZS9o
dy9yaXNjdi9zaWZpdmVfZS5oPGJyPmluZGV4IDdiNmQ4YWVkOTYuLmI4M2U2MDQ5M2UgMTAwNjQ0
PGJyPi0tLSBhL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX2UuaDxicj4rKysgYi9pbmNsdWRlL2h3
L3Jpc2N2L3NpZml2ZV9lLmg8YnI+QEAgLTY3LDYgKzY3LDEwIEBAIGVudW0gezxicj7CoMKgwqDC
oCBTSUZJVkVfRV9VQVJUMV9JUlEgPSA0PGJyPsKgfTs8YnI+wqA8YnI+K2VudW0gezxicj4rwqDC
oMKgIFNJRklWRV9FX1RJTUVCQVNFX0ZSRVEgPSAxMDAwMDAwMCw8YnI+K307PGJyPis8YnI+wqAj
ZGVmaW5lIFNJRklWRV9FX1BMSUNfSEFSVF9DT05GSUcgJnF1b3Q7TSZxdW90Ozxicj7CoCNkZWZp
bmUgU0lGSVZFX0VfUExJQ19OVU1fU09VUkNFUyAxMjc8YnI+wqAjZGVmaW5lIFNJRklWRV9FX1BM
SUNfTlVNX1BSSU9SSVRJRVMgNzxicj5kaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9yaXNjdi9zaWZp
dmVfdS5oIGIvaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVfdS5oPGJyPmluZGV4IGJlMTNjYzEzMDQu
LmU5NGViODk4NjYgMTAwNjQ0PGJyPi0tLSBhL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX3UuaDxi
cj4rKysgYi9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV91Lmg8YnI+QEAgLTYzLDYgKzYzLDcgQEAg
ZW51bSB7PGJyPsKgfTs8YnI+wqA8YnI+wqBlbnVtIHs8YnI+K8KgwqDCoCBTSUZJVkVfVV9USU1F
QkFTRV9GUkVRID0gMTAwMDAwMDAsPGJyPsKgwqDCoMKgIFNJRklWRV9VX0NMT0NLX0ZSRVEgPSAx
MDAwMDAwMDAwLDxicj7CoMKgwqDCoCBTSUZJVkVfVV9HRU1fQ0xPQ0tfRlJFUSA9IDEyNTAwMDAw
MDxicj7CoH07PGJyPmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Jpc2N2L3NwaWtlLmggYi9pbmNs
dWRlL2h3L3Jpc2N2L3NwaWtlLmg8YnI+aW5kZXggNjQxYjcwZGE2Ny4uMmQzOTFkMTU1OSAxMDA2
NDQ8YnI+LS0tIGEvaW5jbHVkZS9ody9yaXNjdi9zcGlrZS5oPGJyPisrKyBiL2luY2x1ZGUvaHcv
cmlzY3Yvc3Bpa2UuaDxicj5AQCAtMzYsNiArMzYsNyBAQCBlbnVtIHs8YnI+wqB9Ozxicj7CoDxi
cj7CoGVudW0gezxicj4rwqDCoMKgIFNQSUtFX1RJTUVCQVNFX0ZSRVEgPSAxMDAwMDAwMCw8YnI+
wqDCoMKgwqAgU1BJS0VfQ0xPQ0tfRlJFUSA9IDEwMDAwMDAwMDA8YnI+wqB9Ozxicj7CoDxicj5k
aWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9yaXNjdi92aXJ0LmggYi9pbmNsdWRlL2h3L3Jpc2N2L3Zp
cnQuaDxicj5pbmRleCBmMTJkZWFlYmQ2Li5mODA3YmJmZTFlIDEwMDY0NDxicj4tLS0gYS9pbmNs
dWRlL2h3L3Jpc2N2L3ZpcnQuaDxicj4rKysgYi9pbmNsdWRlL2h3L3Jpc2N2L3ZpcnQuaDxicj5A
QCAtNTMsNiArNTMsNyBAQCBlbnVtIHs8YnI+wqB9Ozxicj7CoDxicj7CoGVudW0gezxicj4rwqDC
oMKgIFZJUlRfVElNRUJBU0VfRlJFUSA9IDEwMDAwMDAwLDxicj7CoMKgwqDCoCBWSVJUX0NMT0NL
X0ZSRVEgPSAxMDAwMDAwMDAwPGJyPsKgfTs8YnI+wqA8YnI+ZGlmZiAtLWdpdCBhL3RhcmdldC9y
aXNjdi9jcHUuaCBiL3RhcmdldC9yaXNjdi9jcHUuaDxicj5pbmRleCAyMGJjZTg3NDJlLi42N2Ix
NzY5YWQzIDEwMDY0NDxicj4tLS0gYS90YXJnZXQvcmlzY3YvY3B1Lmg8YnI+KysrIGIvdGFyZ2V0
L3Jpc2N2L2NwdS5oPGJyPkBAIC0xNzMsNyArMTczLDkgQEAgc3RydWN0IENQVVJJU0NWU3RhdGUg
ezxicj7CoMKgwqDCoCAvKiB0ZW1wb3JhcnkgaHRpZiByZWdzICovPGJyPsKgwqDCoMKgIHVpbnQ2
NF90IG1mcm9taG9zdDs8YnI+wqDCoMKgwqAgdWludDY0X3QgbXRvaG9zdDs8YnI+Kzxicj7CoMKg
wqDCoCB1aW50NjRfdCB0aW1lY21wOzxicj4rwqDCoMKgIHVpbnQ2NF90IHRpbWVfZnJlcTs8YnI+
wqA8YnI+wqDCoMKgwqAgLyogcGh5c2ljYWwgbWVtb3J5IHByb3RlY3Rpb24gKi88YnI+wqDCoMKg
wqAgcG1wX3RhYmxlX3QgcG1wX3N0YXRlOzxicj5kaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2Nz
ci5jIGIvdGFyZ2V0L3Jpc2N2L2Nzci5jPGJyPmluZGV4IGUxZDkxYjZjNjAuLjYwODNjNzgyYTEg
MTAwNjQ0PGJyPi0tLSBhL3RhcmdldC9yaXNjdi9jc3IuYzxicj4rKysgYi90YXJnZXQvcmlzY3Yv
Y3NyLmM8YnI+QEAgLTE5MSwyMiArMTkxLDMxIEBAIHN0YXRpYyBpbnQgcmVhZF9pbnN0cmV0aChD
UFVSSVNDVlN0YXRlICplbnYsIGludCBjc3JubywgdGFyZ2V0X3Vsb25nICp2YWwpPGJyPsKgfTxi
cj7CoCNlbmRpZiAvKiBUQVJHRVRfUklTQ1YzMiAqLzxicj7CoDxicj4tI2lmIGRlZmluZWQoQ09O
RklHX1VTRVJfT05MWSk8YnI+wqBzdGF0aWMgaW50IHJlYWRfdGltZShDUFVSSVNDVlN0YXRlICpl
bnYsIGludCBjc3JubywgdGFyZ2V0X3Vsb25nICp2YWwpPGJyPsKgezxicj4rI2lmICFkZWZpbmVk
KENPTkZJR19VU0VSX09OTFkpPGJyPivCoMKgwqAgKnZhbCA9IG11bGRpdjY0KHFlbXVfY2xvY2tf
Z2V0X25zKFFFTVVfQ0xPQ0tfVklSVFVBTCksPGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlbnYtJmd0O3RpbWVfZnJlcSwgTkFOT1NFQ09ORFNfUEVSX1NFQ09ORCk7
PGJyPisjZWxzZTxicj7CoMKgwqDCoCAqdmFsID0gY3B1X2dldF9ob3N0X3RpY2tzKCk7PGJyPisj
ZW5kaWY8YnI+wqDCoMKgwqAgcmV0dXJuIDA7PGJyPsKgfTxicj7CoDxicj7CoCNpZiBkZWZpbmVk
KFRBUkdFVF9SSVNDVjMyKTxicj7CoHN0YXRpYyBpbnQgcmVhZF90aW1laChDUFVSSVNDVlN0YXRl
ICplbnYsIGludCBjc3JubywgdGFyZ2V0X3Vsb25nICp2YWwpPGJyPsKgezxicj4rI2lmICFkZWZp
bmVkKENPTkZJR19VU0VSX09OTFkpPGJyPivCoMKgwqAgKnZhbCA9IG11bGRpdjY0KHFlbXVfY2xv
Y2tfZ2V0X25zKFFFTVVfQ0xPQ0tfVklSVFVBTCksPGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlbnYtJmd0O3RpbWVfZnJlcSwgTkFOT1NFQ09ORFNfUEVSX1NFQ09O
RCkgJmd0OyZndDsgMzI7PGJyPisjZWxzZTxicj7CoMKgwqDCoCAqdmFsID0gY3B1X2dldF9ob3N0
X3RpY2tzKCkgJmd0OyZndDsgMzI7PGJyPisjZW5kaWY8YnI+wqDCoMKgwqAgcmV0dXJuIDA7PGJy
PsKgfTxicj7CoCNlbmRpZjxicj7CoDxicj4tI2Vsc2UgLyogQ09ORklHX1VTRVJfT05MWSAqLzxi
cj4rI2lmICFkZWZpbmVkKENPTkZJR19VU0VSX09OTFkpPGJyPsKgPGJyPsKgLyogTWFjaGluZSBj
b25zdGFudHMgKi88YnI+wqA8YnI+QEAgLTg1NCwxNCArODYzLDEwIEBAIHN0YXRpYyByaXNjdl9j
c3Jfb3BlcmF0aW9ucyBjc3Jfb3BzW0NTUl9UQUJMRV9TSVpFXSA9IHs8YnI+wqDCoMKgwqAgW0NT
Ul9JTlNUUkVUSF0gPcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeyBjdHIswqAgcmVhZF9pbnN0cmV0
aMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0sPGJyPsKgI2Vu
ZGlmPGJyPsKgPGJyPi3CoMKgwqAgLyogVXNlci1sZXZlbCB0aW1lIENTUnMgYXJlIG9ubHkgYXZh
aWxhYmxlIGluIGxpbnV4LXVzZXI8YnI+LcKgwqDCoMKgICogSW4gcHJpdmlsZWdlZCBtb2RlLCB0
aGUgbW9uaXRvciBlbXVsYXRlcyB0aGVzZSBDU1JzICovPGJyPi0jaWYgZGVmaW5lZChDT05GSUdf
VVNFUl9PTkxZKTxicj7CoMKgwqDCoCBbQ1NSX1RJTUVdID3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgeyBjdHIswqAgcmVhZF90aW1lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LDxicj7CoCNpZiBkZWZpbmVkKFRBUkdFVF9SSVNDVjMy
KTxicj7CoMKgwqDCoCBbQ1NSX1RJTUVIXSA9wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7
IGN0cizCoCByZWFkX3RpbWVowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfSw8YnI+wqAjZW5kaWY8YnI+LSNlbmRpZjxicj7CoDxicj7CoCNpZiAhZGVm
aW5lZChDT05GSUdfVVNFUl9PTkxZKTxicj7CoMKgwqDCoCAvKiBNYWNoaW5lIFRpbWVycyBhbmQg
Q291bnRlcnMgKi88YnI+LS0gPGJyPjIuMjAuMTxicj48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--0000000000003c05c00587c2d722--

