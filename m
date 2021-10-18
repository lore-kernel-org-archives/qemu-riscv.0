Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIYy-0004SU-UG
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYx-0004QB-UA
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:39:43 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYw-0006VR-4N
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524782; x=1666060782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/kOVIVdvAiZLWeXZLafi4U1Nbb8L8qJl11aUdhkU9k=;
 b=dbNbtQ1BFnzoZiU/H0bAzPAp+/2dgn3MdFc+t0OJssbpJ1Yc/3eOdoKx
 sPqB6yJ7NzI7wUOmcPx58axBCC8iWO0rjRJo0DxmuC2dJqwhxGDwfNrY1
 3+GnRCz4iGLNaF1vxZTDJRhebAx7fxvZDfoW6bhY2MJb/M6cxZD9NQAhA
 il9N0uvaKa0BsbExsYzNUkStrZkKVoZnO2EHwSVF+1ePOATl+QdxNr28q
 S18PLKCXlE0vhRUMab7ZespSv1gCwsAfaik4iJxTQ8FJVMdndpgwCUqv/
 T8gdPcpIqjzHz8psn9NYl5zwNRwB39OKEhy3Cp9B/eUPhZseJ6JM9hqye w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="184083899"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:39 +0800
IronPort-SDR: cjs6zrYzUPCJgDTxo89M+Gy/nORWWDHMYaHNzcsKBNvmY3BpWMDD4dg46ox/at5WJgK1OvDLGU
 X1HhuIMJwpfgzcWPLy4loNnNwEC2oB9vwfUGEGlhbFoCgC3tns3DGSkFBzq4JZw0CWUOLkJgI/
 a7V8IzUN/OsUfqx1oDCahZtXk7NSy0rWqiUxSUZm/XbtNdCN4d07MwXwV57VRbgJFiDnt3xqTZ
 clSBaV3IgYqnRWHRtnuET2x0b8uti4fUKdkww76dXSms22YkTu36vEc7p0x+PfmfLhs4w0PkD3
 9YstFYOU1v24W4rj6gitz4ex
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:15:19 -0700
IronPort-SDR: /qx5O/WGg2sYmGOJvHJfNNui4JVQmmwPAXOBdVfNSr2singND6c3JPziZPWV0L1lQdTu2xFnvP
 lbAdf+6LuwY+5lLphgLZs24zzEuEWZXOKf1gveleaWpCASW+RMWtNCSzBiBHck3VjLFT1VjlXB
 u4txMnLAn6ze6lJgKNRYSk1TSU/7H2Or0bQawyozeMdZ+KS/fOBEXybd7h4BRezItdQyZJqlAv
 A/p/nIuCnPmXvRnaRsedgk+SxcvNFmvFrkTy+200EaogAzRlYm6rp7erCIqxBhrvnP42dfjSAQ
 ZA4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh0p6qG9z1Rvm0
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:39:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524778; x=1637116779; bh=I/kOVIVdvAiZLWeXZL
 afi4U1Nbb8L8qJl11aUdhkU9k=; b=n705YXXpEVpS+W0qF91fqmFTiNaqipB9cq
 KiBgR0jQGkX/Dp0RjluQQMytTbmyGvPZNmr/olnCZTtuEODTvRWCJTY4TLKVL1NJ
 CCeDtamOGBWUmWmIig9JtA+wbopooVGMG8y8LI/CGgCMZI5/gSNF/Dixx847ta7g
 7O7ocZ8yFncvvkV6brRr/3RKyCeRxab4r31MxY/eOEvMctV5H9qyoUVv+Paf47IS
 sgnpVs/kKPaSuMylzGWFIKEF4n+8yGJVJZJUYUFw+2b4Gig5qFoAQNvFGGavgjDs
 gjtFv4+7bmeN+WeGZodorqEFfZJnO733sMfY4h59z3T+hB4bjvgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2jI_3b3_qbq2 for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 19:39:38 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh0j58rPz1RvlJ;
 Sun, 17 Oct 2021 19:39:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 4/9] hw/intc: sifive_plic: Cleanup the realize function
Date: Mon, 18 Oct 2021 12:39:26 +1000
Message-Id: <b94c098cb221e744683349b1ac794c23102ef471.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 18 Oct 2021 02:39:44 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 45 +++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f0e2799efc..d77a5ced23 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -422,35 +422,38 @@ static void sifive_plic_irq_request(void *opaque, i=
nt irq, int level)
=20
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
 {
-    SiFivePLICState *plic =3D SIFIVE_PLIC(dev);
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
     int i;
=20
-    memory_region_init_io(&plic->mmio, OBJECT(dev), &sifive_plic_ops, pl=
ic,
-                          TYPE_SIFIVE_PLIC, plic->aperture_size);
-    parse_hart_config(plic);
-    plic->bitfield_words =3D (plic->num_sources + 31) >> 5;
-    plic->num_enables =3D plic->bitfield_words * plic->num_addrs;
-    plic->source_priority =3D g_new0(uint32_t, plic->num_sources);
-    plic->target_priority =3D g_new(uint32_t, plic->num_addrs);
-    plic->pending =3D g_new0(uint32_t, plic->bitfield_words);
-    plic->claimed =3D g_new0(uint32_t, plic->bitfield_words);
-    plic->enable =3D g_new0(uint32_t, plic->num_enables);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
-    qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
-
-    plic->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
-    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
-
-    plic->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
-    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
+    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_plic_ops, s,
+                          TYPE_SIFIVE_PLIC, s->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    parse_hart_config(s);
+
+    s->bitfield_words =3D (s->num_sources + 31) >> 5;
+    s->num_enables =3D s->bitfield_words * s->num_addrs;
+    s->source_priority =3D g_new0(uint32_t, s->num_sources);
+    s->target_priority =3D g_new(uint32_t, s->num_addrs);
+    s->pending =3D g_new0(uint32_t, s->bitfield_words);
+    s->claimed =3D g_new0(uint32_t, s->bitfield_words);
+    s->enable =3D g_new0(uint32_t, s->num_enables);
+
+    qdev_init_gpio_in(dev, sifive_plic_irq_request, s->num_sources);
+
+    s->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->s_external_irqs, s->num_harts);
+
+    s->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
=20
     /* We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
      * hardware controlled when a PLIC is attached.
      */
-    for (i =3D 0; i < plic->num_harts; i++) {
-        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(plic->hartid_base + i))=
;
+    for (i =3D 0; i < s->num_harts; i++) {
+        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
             error_report("SEIP already claimed");
             exit(1);
--=20
2.31.1


