Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNKv-00009H-2p
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKs-000058-Pk; Fri, 30 Apr 2021 03:13:14 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKq-0000O1-Ip; Fri, 30 Apr 2021 03:13:14 -0400
Received: by mail-ej1-x631.google.com with SMTP id w3so103755315ejc.4;
 Fri, 30 Apr 2021 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xOvNP79h5k0ipvW8dOj5SnVBHNc0TchMfqvMAAD0ZMI=;
 b=V+NSzWr653hHLfoqf+zZxoeBL6/fOpenbfbpHORdmBm2mLtJ4I2aQdTzQFpQUsvTlU
 BKiHdAnmKGYKJPN4EZmPaP4Un+nyNb22fdaulWYW8N7BRm22fxNgUFGMGv15jMp5ITSF
 vmo5ZbQS0zIcBWewD2BqSW6LfnugAfEbt0/zD6yYtXRwVTR1yE1yEfgKIbtrBSVpCL9T
 032OSFuTA/Vr8MOCUs3h7XBJz3oYfRQh1fph88LoXYcp9cOcRHRMo0YH9ZGEavsnMrjd
 zydP9/ccfrmo1bEaHpq6TJR8b1QVWsrCNnL6n2vakjlbitzGu+3hJRJD86NZc6Id1wtW
 mLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOvNP79h5k0ipvW8dOj5SnVBHNc0TchMfqvMAAD0ZMI=;
 b=ZqH2n1unszVIH0VIcoxc1o2t4PgFy17TnklZBwE6Dh1uTU+EeKQleoMXy88MTEBC2Q
 lXI2PlH14YSJbRdvys7AFWoHSM4oCW/mMhQnCl6OGs5+3HM9BIiu/i1tJqKl7gU9DjHj
 0IQtExDMqK+hkHZCn/4Ba8zIHDkKI37IophbwIKTwOvqhTxCbrfvWmhmoyKGvpPkXff2
 wl4kJ03zTbvkYiJIhE9ttoGdmIhv9ggNqsaweg3f5P295LaoTEgk/pZyumkjdzwuyvvu
 CkKY9i6GCRA9Nt7A3gR/u/iADvh+QSrU7x7P3jXR/6peirb0lcM/WMVPajX5g+V8yX7G
 +8kA==
X-Gm-Message-State: AOAM533YEWb0EFzsI3oAPiyIcmWd1/AuDYai3wcHyB8eheb50MgtFja4
 XBn3X3YWyPBHq0w+AWZbVoK/kJ3mwFA=
X-Google-Smtp-Source: ABdhPJx7JHTL3Qrfdf31ToHERKW9Bf34cm8n9MIPtf+AJwq993c1n06dVEscJm0NJQhwfGtmEtIToQ==
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr2642679ejo.314.1619766790763; 
 Fri, 30 Apr 2021 00:13:10 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 3/8] hw/riscv: Support the official CLINT DT bindings
Date: Fri, 30 Apr 2021 15:12:57 +0800
Message-Id: <20210430071302.1489082-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 30 Apr 2021 07:13:15 -0000

From: Bin Meng <bin.meng@windriver.com>

Linux kernel commit a2770b57d083 ("dt-bindings: timer: Add CLINT bindings")
adds the official DT bindings for CLINT, which uses "sifive,clint0"
as the compatible string. "riscv,clint0" is now legacy and has to
be kept for backward compatibility of legacy systems.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2:
- use "static const char * const" for clint_compat

 hw/riscv/sifive_u.c | 6 +++++-
 hw/riscv/spike.c    | 6 +++++-
 hw/riscv/virt.c     | 6 +++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 1b8af0c07a..fd5cf7513b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -99,6 +99,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
     static const char * const ethclk_names[2] = { "pclk", "hclk" };
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -210,7 +213,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     nodename = g_strdup_printf("/soc/clint@%lx",
         (long)memmap[SIFIVE_U_DEV_CLINT].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,clint0");
+    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
+        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_CLINT].base,
         0x0, memmap[SIFIVE_U_DEV_CLINT].size);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index ec7cb2f707..f094bb2158 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -60,6 +60,9 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
     char *core_name, *cpu_name, *intc_name;
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -153,7 +156,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             (memmap[SPIKE_CLINT].size * socket);
         clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
         qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
+        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
+            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 992f1c58a9..4b32dc734f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -195,6 +195,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name, *clint_name, *plic_name, *clust_name;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
 
     if (mc->dtb) {
         fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -300,7 +303,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             (memmap[VIRT_CLINT].size * socket);
         clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
         qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
+        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
+            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
-- 
2.25.1


