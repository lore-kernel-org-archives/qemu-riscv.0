Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNV-0005w9-IG
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNP-0005tf-LE; Mon, 29 Mar 2021 13:08:31 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNN-0004Qf-Kp; Mon, 29 Mar 2021 13:08:31 -0400
Received: by mail-qv1-xf32.google.com with SMTP id cx5so6786344qvb.10;
 Mon, 29 Mar 2021 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ih20dGSxpLlL1BkR6m8Np/BFCqUcCDovNPTSrcRDno=;
 b=EvqisE2tQLPCJaiHwIhocqPcN5Jb6mVSk8le3Phf//l5RY495rwYDJ3zu/BJnLMNWC
 J0mpjarDYyzcwcB7mDHT4M2J9DXeAwk7g1iR6fPq7NxcpzeXjxCb1w+N7EmhSrF8aIqY
 cDwGHjK0npvnajmKDt5YFFio0Obw9x5N6pLa689awvsNTFpL+nQM6XzyWxhI55tN8yKe
 eD20tsielTM/sUAzb2AHaMCK89eyfLvyG8pnOjcN3zMhf61nTqwSbDn/TbVAVv6WPquA
 VDwW4CjkFmM2o/JcZSkApZjQgijM0Gw9N8swCm6EHsJ0O11VICcVOCTGU62kbYy0aKMe
 uOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ih20dGSxpLlL1BkR6m8Np/BFCqUcCDovNPTSrcRDno=;
 b=foW5+8CEjQC1EF2YCqtJspgRx6pYEk/xpQq5sn1yz0S2hGvC4B6ey2um6xwhKN88ls
 JRSqvjemnuzJh43Qjl/QXiyNMaFvfsdaSvOn3TR85EYOauxwQUQw38P24GSid6Jnuv/W
 P1IfZWzUFWPJ8eCfzh4l8Era2sUURyGtiSOsvEDAadb4WG0yk74PkOtHQ6j+KFpFeNdk
 zPqYg353SNl3cz3jEP3pA4McwLyhWNAxhcraeYmkrEETet5cfiiuqG/b4vgsX1M4bU5M
 +J3s7qfA1MSzIAHwr3JV/GTrisRCSZ50A6Xxim4dWkJjPZ1lX3roisI0g/YN357p1vVp
 iilQ==
X-Gm-Message-State: AOAM532nwAEK66jtN4Z7/0KayJD2zJGDq6/wYyaZ5uZSS7MX8xwAE3a5
 H6isIoAE76fpOSiTK2r8ZMA=
X-Google-Smtp-Source: ABdhPJxqtSUogkUdQZT+Zw0vs/vIHpv8R1/uFkGy0XyX/ex+36KO2UtCTzFetDwYp+vlkrz4MEmffg==
X-Received: by 2002:a0c:ea81:: with SMTP id d1mr26446240qvp.57.1617037708248; 
 Mon, 29 Mar 2021 10:08:28 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
Date: Tue, 30 Mar 2021 01:08:11 +0800
Message-Id: <20210329170818.23139-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf32.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:33 -0000

From: Bin Meng <bin.meng@windriver.com>

Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
we can use the new helper to set the clock name for the ethernet
controller node.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7b59942369..f06b3b2e64 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -96,7 +96,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    char ethclk_names[] = "pclk\0hclk";
+    const char *ethclk_names[2] = { "pclk", "hclk" };
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
@@ -413,8 +413,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
-    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
-        sizeof(ethclk_names));
+    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
+        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
     qemu_fdt_setprop(fdt, nodename, "local-mac-address",
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
-- 
2.25.1


