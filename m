Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNf-00063L-Ke
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNX-0005wc-4H; Mon, 29 Mar 2021 13:08:39 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNR-0004Sd-Pj; Mon, 29 Mar 2021 13:08:37 -0400
Received: by mail-qt1-x82e.google.com with SMTP id 1so9179857qtb.0;
 Mon, 29 Mar 2021 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VptVUGs4ZQMPximLCQztDlejwWI3x+wlQUyxpSRKq9E=;
 b=kuBTQKh5PpxpcD2PK9+ct0NL9D1lGX/L7aCUSCRMClPO/0nAc8bepQ3HSwoN9ySlJB
 rAzz7sA3vxnLg/zj2upNrHw/FE/CqQYuSFsoq8oqZ/DkMOm0PClXUWg7d2V2BpwWOEZA
 OUSA3Tt3XCxQyaCMbjUSxSpM3LSpwOno9wGV2uAXUmUumczHeuilKVubUeuP1nSOpZf2
 PDAnD8gm19mKHs5cSNlX82d4l9bxxZFmnOfQtzdO3Zw9l4p4STLkV9Vn7JlKKA3IpqpA
 SEsnwZzLY7IL7z+wyeuqgvrokrZjHsR4FXAbuqlaBKIX8VIkAiwK8baJ3K66c1l586ez
 YzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VptVUGs4ZQMPximLCQztDlejwWI3x+wlQUyxpSRKq9E=;
 b=blw/PY86yFnWExWNajgjt/HO8VccRn0vh0trPLmepVP1XyGBjqtTqD+QZoPqjzOOVv
 sk3eUOM3hJBegoK071TEdKj0NAjDQQlYfjb1k3kNrp6MfOQyTeHK7nA+3bftap+uepfg
 Ou6DmfCuupAf0IY5v9yoZ2K7FMiOda6H4odkqgM3VEsWqXRiDQFEa+uyYmBhM2VZlTfd
 dCJDU415tzRruyfhrMWNAPu4WQ1dbv4c1S0DIUfos67+QbjjveiYDLlv/HW+qxfevJLT
 TK4iy5pwHRWBa2D+wWNlU0P9CjYJvbfJt8GzeXuwaMw8VblSYn4MEoT6xQJEyws7rKva
 U2yg==
X-Gm-Message-State: AOAM533Tsd3LKfv+g7AY83ydrv5YuYzP0L+ju9zvjD7KxamFbHYC516O
 sLxllfO0Oubhjm8EPLLQiVYgbcGMsAM=
X-Google-Smtp-Source: ABdhPJwVkRk3BUnyP+cV7qM81IVjFrLUN7OsbRgyY4E9N2FsjZamxbN6N4wUMnaLT38i1LumM9yQDg==
X-Received: by 2002:ac8:45c9:: with SMTP id e9mr22754876qto.178.1617037712500; 
 Mon, 29 Mar 2021 10:08:32 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 3/8] hw/riscv: Support the official CLINT DT bindings
Date: Tue, 30 Mar 2021 01:08:13 +0800
Message-Id: <20210329170818.23139-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82e.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:41 -0000

From: Bin Meng <bin.meng@windriver.com>

Linux kernel commit a2770b57d083 ("dt-bindings: timer: Add CLINT bindings")
adds the official DT bindings for CLINT, which uses "sifive,clint0"
as the compatible string. "riscv,clint0" is now legacy and has to
be kept for backward compatibility of legacy systems.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 4 +++-
 hw/riscv/spike.c    | 4 +++-
 hw/riscv/virt.c     | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f06b3b2e64..7f696ebc12 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -97,6 +97,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     uint32_t *cells;
     char *nodename;
     const char *ethclk_names[2] = { "pclk", "hclk" };
+    const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
@@ -210,7 +211,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
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
index ec7cb2f707..cc33061f23 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -60,6 +60,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
     char *core_name, *cpu_name, *intc_name;
+    const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -153,7 +154,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
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
index 5d0c1e5903..5b4fac015d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -193,6 +193,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
     char *mem_name, *cpu_name, *core_name, *intc_name;
     char *name, *clint_name, *plic_name, *clust_name;
+    const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
@@ -300,7 +301,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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


