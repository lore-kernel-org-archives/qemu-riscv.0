Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcNKx-0000DZ-EW
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 03:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKw-0000BJ-0J; Fri, 30 Apr 2021 03:13:18 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lcNKt-0000Px-UX; Fri, 30 Apr 2021 03:13:17 -0400
Received: by mail-ej1-x632.google.com with SMTP id y7so4847000ejj.9;
 Fri, 30 Apr 2021 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTo+qubNAt3kjobjXQXWOvHrGRuvHNBJyAxqZYokNYw=;
 b=Dd+HItGou5XBWf815r3SuV0z2j89rK2whcQTtt0oNDyOhWBRIm57UzgWS9eWSdYxGy
 rrITKnGjenZ4aVlIlgEZavbnc69R4/amlkYegozj5yKdA+n2Lu6Eus1RrLj4z1LXXZJx
 9sEgMOCl8QEZGcu0iirmEShff2nDahDcvF/6KHCgdnkxz45vUhLl5pOWXT2HojLB5X4I
 +OFm/UrhW7Ea8zEHBv0xhAHOinc1/pAAnkLxofPJlEbnSgyMk3fHaRSfkfdkXnUlBRxY
 XpZPBEUbnnzV+Q266CXsljq49owypRw1HyvZhghQcFivOhMYWSJoXQF8xx2trWgGHp7e
 FXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTo+qubNAt3kjobjXQXWOvHrGRuvHNBJyAxqZYokNYw=;
 b=T2JclQR5+Aby6uyQzLIn1uKv4KakufnC1f5byJ3kx7DS7A06Yma25uvp2qb+ZIvRaT
 fhhyQA02P11ltq4TeLC7xOtk7k5khPEFBVdY+Fc5EH1opx/SlvzEWAZSZ4U3n0f3Foeq
 otUyZJVOWW8760wN+OuxbVzv/dUCTWDT7WqJm5LUTnZr2sHsEmOJc422skvgeiDTGspi
 pgdry1N94GuefCUMB2NRlcYBf5RQg+jcYLsTzhAUbOYVnJJsRv8nAKDDEPM6rM5mdSzz
 UgsztxMPYbOnjtJVGDrW1uVKBa7/sdQJefFo0Icj7S8DsvqyBWGgg7TNbr/sGZtLX+7R
 W6EQ==
X-Gm-Message-State: AOAM533pe7MgemK6ZjYalA2+Ykn6cVbsHEC3lN7Zs8kXukLvij+WHq5B
 heQFq1fZQ3hi9Ko2LXqihzo=
X-Google-Smtp-Source: ABdhPJyoRa4VmQ2Rrg2mU4dKEDpA2HcJmvz4TlVxbGje9yoUHAZP40rbHC8tMwDaODc2xV1XlYZbCw==
X-Received: by 2002:a17:906:6703:: with SMTP id
 a3mr2686374ejp.240.1619766794255; 
 Fri, 30 Apr 2021 00:13:14 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id b19sm574462edd.66.2021.04.30.00.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 00:13:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 4/8] hw/riscv: Support the official PLIC DT bindings
Date: Fri, 30 Apr 2021 15:12:58 +0800
Message-Id: <20210430071302.1489082-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Fri, 30 Apr 2021 07:13:18 -0000

From: Bin Meng <bin.meng@windriver.com>

The official DT bindings of PLIC uses "sifive,plic-1.0.0" as the
compatible string in the upstream Linux kernel. "riscv,plic0" is
now legacy and has to be kept for backward compatibility of legacy
systems.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2:
- use "static const char * const" for plic_compat

 hw/riscv/sifive_u.c | 6 +++++-
 hw/riscv/virt.c     | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fd5cf7513b..b55e56890c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -102,6 +102,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
     };
+    static const char * const plic_compat[2] = {
+        "sifive,plic-1.0.0", "riscv,plic0"
+    };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -271,7 +274,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
+    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
+        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4b32dc734f..8a8ff04dab 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -198,6 +198,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
     };
+    static const char * const plic_compat[2] = {
+        "sifive,plic-1.0.0", "riscv,plic0"
+    };
 
     if (mc->dtb) {
         fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -320,7 +323,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             "#address-cells", FDT_PLIC_ADDR_CELLS);
         qemu_fdt_setprop_cell(fdt, plic_name,
             "#interrupt-cells", FDT_PLIC_INT_CELLS);
-        qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
+        qemu_fdt_setprop_string_array(fdt, plic_name, "compatible",
+            (char **)&plic_compat, ARRAY_SIZE(plic_compat));
         qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
             plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-- 
2.25.1


