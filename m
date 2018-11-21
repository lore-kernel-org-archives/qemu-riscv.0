Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPcL2-0006Yn-Hh
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 18:55:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPcKw-0006Tw-RI
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPcKs-00058B-U0
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:14 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43436)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPcKq-00051h-Qi
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 18:55:10 -0500
Received: by mail-pl1-x644.google.com with SMTP id gn14so7676184plb.10
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 15:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=kpofsyvNhScQEI5gH8wT/08wxouwuLWWIJjXwHlk18s=;
	b=AtAta2rmc/MY3tjblXAimVR8D335EtXxUfSwzwF0fUcIp+MtKqcuz82IXll8CJf4Xc
	TOGjGyNmuYkhOtuSDs9yPC1rJz2fNAOeHWMEXgCfA0fhOeGkDI/Ui97MfHeWGmYVCBUC
	wls27E76Yl/HVSBn2jY8sM6/tgl/UJaeA3rDiLOj0FIzGJJMRSJ9zWEVJ5p8gfr1JGmc
	5Vf/JLRiJcTMdZT3Wrwtk/gGCSoGREYuNg68FPQ4GSMSr1UGBijKAdHrnC/xkLJSrAN0
	sH9qbLixjq5CVQKQrx7gMk5C81Z7ocBZcHYuR43NopfP5dmyAmG2QL7Brf8q9/hNfZBD
	1hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=kpofsyvNhScQEI5gH8wT/08wxouwuLWWIJjXwHlk18s=;
	b=gJHoZoG0HUvn2d6jEczHPyt7r6JXnospoqxKKN+tWzNC6qJiI9QfqrQ9N9ygusYhNH
	KtM1cYVNXRO7Gce99CHfrraDANFQFKquZgGWvghm0cEo3CQqjX85rlniFamw7QdsSiP3
	amPVerXzhZU5id77BKVSFW2v1RpeltHOLgqnJbAb6IEXwt+DL5taYmaSA7vHntahGzAs
	ZtLDeXdJKOohmKKrnRVlpvx27Qs4szXA1JFB158SjIgcTEiWIH+ajITBxmben6mNJWfu
	62qr7hobUnjlv/PHGZdHF6Qa66r3qmEWcHEhjsk1F9bmnGbdVNg+2rzIwyFPP1e4z94M
	PHeQ==
X-Gm-Message-State: AA+aEWaChS5iOcDrcRkDeggcQe+jTWe3oG6lv66em6eRmCFRCBHTV9jP
	Y6qe7wy5xwEsNb0Zm8A2aPmX4w==
X-Google-Smtp-Source: AFSGD/WwtI4BZGwifUPbINlauxRg44QvWUtXNkOc/hXlEbUP4RTk86SVSYrok420rcVgDkCj0VlQKg==
X-Received: by 2002:a65:63d3:: with SMTP id n19mr7986333pgv.179.1542844497790; 
	Wed, 21 Nov 2018 15:54:57 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	19sm49767430pfs.108.2018.11.21.15.54.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 15:54:56 -0800 (PST)
Date: Wed, 21 Nov 2018 15:31:23 -0800
Message-Id: <20181121233123.6408-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH for-3.2] RISC-V: Deprecate hifive_e and
 hifive_u machines
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
X-List-Received-Date: Wed, 21 Nov 2018 23:55:16 -0000

These machines had names that were too general: there are many E
and U machines, and it's easy for users to get confused about which one
is which.  The one configuration that can faithfully match an existing
ASIC-based board has been renamed to 'sifive-hifive1', we'll work
through the emulation fidelity issues apparent in the other targets
before adding machines for those.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_e.c  | 26 ++++++++++++++++++++++++--
 hw/riscv/sifive_u.c  |  2 ++
 qemu-deprecated.texi |  7 +++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index cb513cc3bb50..439d20e0efe7 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -95,7 +95,7 @@ static void sifive_mmio_emulate(MemoryRegion *parent, const char *name,
     memory_region_add_subregion(parent, offset, mock_mmio);
 }
 
-static void riscv_sifive_e_init(MachineState *machine)
+static void riscv_sifive_hifive1_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_e_memmap;
 
@@ -135,6 +135,17 @@ static void riscv_sifive_e_init(MachineState *machine)
     }
 }
 
+static void riscv_sifive_e_init(MachineState *machine)
+{
+#if defined(TARGET_RISCV32)
+    warn_report("The sifive_e machine is deprecated in favor of sifive-hifive1");
+#else
+    warn_report("The sifive_e machine is deprecated.");
+#endif
+
+    return riscv_sifive_hifive1_init(machine);
+}
+
 static void riscv_sifive_e_soc_init(Object *obj)
 {
     SiFiveESoCState *s = RISCV_E_SOC(obj);
@@ -213,13 +224,24 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
 static void riscv_sifive_e_machine_init(MachineClass *mc)
 {
-    mc->desc = "RISC-V Board compatible with SiFive E SDK";
+    mc->desc = "(deprecated) RISC-V Board compatible with SiFive E SDK";
     mc->init = riscv_sifive_e_init;
     mc->max_cpus = 1;
 }
 
 DEFINE_MACHINE("sifive_e", riscv_sifive_e_machine_init)
 
+#if defined(TARGET_RISCV32)
+static void riscv_sifive_hifive1_machine_init(MachineClass *mc)
+{
+    mc->desc = "SiFive's HiFive1 Development Board";
+    mc->init = riscv_sifive_hifive1_init;
+    mc->max_cpus = 1;
+}
+
+DEFINE_MACHINE("sifive-hifive1", riscv_sifive_hifive1_machine_init)
+#endif
+
 static void riscv_sifive_e_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ef07df244241..0ce6a9dd2609 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -238,6 +238,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
 
 static void riscv_sifive_u_init(MachineState *machine)
 {
+    warn_report("The sifive_u machine is deprecated.");
+
     const struct MemmapEntry *memmap = sifive_u_memmap;
 
     SiFiveUState *s = g_new0(SiFiveUState, 1);
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index cb4291f1e5bc..f50696d3dc53 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -148,6 +148,13 @@ This machine type uses an unmaintained firmware, broken in lots of ways,
 and unable to start post-2004 operating systems. 40p machine type should be
 used instead.
 
+@subsection sifive_e and sifive_u (RISC-V) (since 3.2)
+
+The names for these machine types are a bit too ambiguous.  The 32-bit sifive_e
+machine has been replaced by the 'sifive-hifive1' machine, which closely
+matches that hardware.  The 'virt' machine type should be used instead of all
+others.
+
 @section Device options
 
 @subsection Block device options
-- 
2.18.1


