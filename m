Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNd-0005ym-BB
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNY-0005xC-VI; Mon, 29 Mar 2021 13:08:41 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNT-0004TU-Rf; Mon, 29 Mar 2021 13:08:40 -0400
Received: by mail-qt1-x82d.google.com with SMTP id y2so9789399qtw.13;
 Mon, 29 Mar 2021 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkoEeGh9mk/Lm6Pt/z5k0lRkrzMvuzoohdKpLTtxqGw=;
 b=AWqrP6mfTdxHoeKBcTr37aAgg+TDinW7EHLJ+zbO6aOH4JbV7gb1P6IrGtxo/xksTH
 uG1BGJ2wHMyRHDD3JHiV/UQtY1I87nuYvuapXpt7o6aUhzvihwwyB6uk0zZfKtpAilWl
 3sckr9+PjnwHS9bhFk7tmY6ATW/+s45vYiEb34Qcqj+GqJvtdvhUBnNRi7J12mcr4F+c
 DNwG8NNdFVMGlv4DBoWapsFKvtkUQpYFhVnCcP1obpTjD2s92kOcVIXdqWU9YpKLkp9C
 CuarJI899AP4joHgU7InJnVbbqyWh7hCtUw7J+1tPKgR2ztUf/trEIr5J8nti50qfoZk
 VdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkoEeGh9mk/Lm6Pt/z5k0lRkrzMvuzoohdKpLTtxqGw=;
 b=pUc1KHmYSrP1es3tjTbsloDQm8JdVCFbzSeL/h3/AWXTmoEcKvQWZDBnuPRc+5oMoC
 0PpDrcLAiS6cYe285Oq51SClbdu53wMG0CZHNSHjraiILNEkhRbKzK2CQ1NpsDV7laYR
 UpgOItkaGwSzzas7CpEiTmm3EDqMk7W7PNZjJw5GPizKqjqbFGLMr9JPLQZic2tauGSA
 wOM0QTx6xVwWpfoFcUFvCEO24luNnkmoTELkYuWQeapUP4ZpWVrxlv7xMhIUvkBGDNlo
 V4vNO3Nd6bY6GPUHJ2qBJofdtefpY/p2axf9/OU3hKiWnnW1EaYFn/zVvvpX85He2V7s
 5jKw==
X-Gm-Message-State: AOAM530Xeo3rPB3NKico29wJBIsu2Z1jo80URD9lZ1tauufd9Bo0zCKO
 JYgFQXoNZr1+cneL3Dhr0kA=
X-Google-Smtp-Source: ABdhPJzq+yBuTNj0eZxmnrGsiG35iuUJhupSmVhN7xLLMpyJwwkrjnxZLiAfG6FiJRmTj5fyA+3nkA==
X-Received: by 2002:a05:622a:1c5:: with SMTP id
 t5mr22672810qtw.49.1617037714697; 
 Mon, 29 Mar 2021 10:08:34 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 4/8] hw/riscv: Support the official PLIC DT bindings
Date: Tue, 30 Mar 2021 01:08:14 +0800
Message-Id: <20210329170818.23139-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82d.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:43 -0000

From: Bin Meng <bin.meng@windriver.com>

The official DT bindings of PLIC uses "sifive,plic-1.0.0" as the
compatible string in the upstream Linux kernel. "riscv,plic0" is
now legacy and has to be kept for backward compatibility of legacy
systems.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 4 +++-
 hw/riscv/virt.c     | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7f696ebc12..651a439528 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -98,6 +98,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     char *nodename;
     const char *ethclk_names[2] = { "pclk", "hclk" };
     const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
+    const char *plic_compat[2] = { "sifive,plic-1.0.0", "riscv,plic0" };
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
@@ -269,7 +270,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
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
index 5b4fac015d..d04733d97c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -194,6 +194,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     char *mem_name, *cpu_name, *core_name, *intc_name;
     char *name, *clint_name, *plic_name, *clust_name;
     const char *clint_compat[2] = { "sifive,clint0", "riscv,clint0" };
+    const char *plic_compat[2] = { "sifive,plic-1.0.0", "riscv,plic0" };
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
@@ -318,7 +319,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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


