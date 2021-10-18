Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUiq-0001a4-SI
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUio-0001TX-Jz; Mon, 18 Oct 2021 11:38:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUin-0006r7-2H; Mon, 18 Oct 2021 11:38:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id 75so16650161pga.3;
 Mon, 18 Oct 2021 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=71nxyaPHNGZHuralusOsP6ey6dz0RCECflgf9KIk7mU=;
 b=GYXONXgpNcLY4vONm3X662C2LUYGmbWDzv2Zbqz9hUy7ksknOZtAOvoCJYp+7izuUw
 hVzNoUPT788Vz022HknWLknph8uQMeYmeI+ZQHLPgRoGXXyFq+H1oCXGjWWVD0mtAPjN
 G2XmzLe3FsfN6WKcbje/XrHuPuf+O3/4Qu5HergwItIZFGOqjLGteCOt9qm42eYT8kOJ
 58bRBIr4QpuU6lGnZ6UGQZvYUY7KrRtNjcgHBNAkrKCqUa/k9/beJ3720uS2SuDGQrs1
 dOlyM+ftaBOiYHGsLkU89Z7JbyzemVFvuVcJT791ub+tBoBhi4dLodawikERnkZzeWrG
 YikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71nxyaPHNGZHuralusOsP6ey6dz0RCECflgf9KIk7mU=;
 b=GivBsYLs4UmZ3fIy55KKhKih288rT1vz5RMO5GRODrntClZTo8vERuDc/RAAbmc1kt
 Lq7njqSIhPLCmKyYQZuf3Uj5VZqYsIGxRaHMZLu4H6E4AmsR+mIj7oIpLDjdZMm7aSpF
 byvGlHdBJXC6YBkggwmV6N6X0nd5nTawWjnGk2jj7jZcjmk9IiwWlaxOBtkdUmsTYc5R
 Xzz6oPdUVnfc2/IL+cR2uXL76GzRIXDlQnbCsbiRpzrQuGprz34FHJDQdeIQMQ3cDf2M
 lWCFujpFrJEd22nRxATG31z6lBtB3DY7IBbryS5NvKp9Nbe3iVYYNYlqrUiEY3HUMA/Y
 y4qA==
X-Gm-Message-State: AOAM530D1Jk0xp6yQrFyS7Y9Ts3P7dNmmE9qRT9+n7tKuVVKiTDPbbs9
 jGwS4ehiy4zmzoqymrYl/Y0=
X-Google-Smtp-Source: ABdhPJwwnWcesdA5hOIjwcV15MIEaixDmY4k35BZ69TDyMytF4Jj8uzANsCL2IkkcYazQwKQitH7NA==
X-Received: by 2002:a05:6a00:214d:b0:44d:35e9:4ce2 with SMTP id
 o13-20020a056a00214d00b0044d35e94ce2mr29655621pfk.13.1634571519003; 
 Mon, 18 Oct 2021 08:38:39 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a30sm13899649pfr.64.2021.10.18.08.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:38:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Mon, 18 Oct 2021 23:38:25 +0800
Message-Id: <20211018153829.24382-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 15:38:43 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/opentitan.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 9803ae6d70..c356293d29 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -67,17 +67,14 @@ static void opentitan_board_init(MachineState *machine)
     const MemMapEntry *memmap = ibex_memmap;
     OpenTitanState *s = g_new0(OpenTitanState, 1);
     MemoryRegion *sys_mem = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             TYPE_RISCV_IBEX_SOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
-    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
-        memmap[IBEX_DEV_RAM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[IBEX_DEV_RAM].base, main_mem);
+        memmap[IBEX_DEV_RAM].base, machine->ram);
 
     if (machine->firmware) {
         riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base, NULL);
@@ -95,6 +92,7 @@ static void opentitan_machine_init(MachineClass *mc)
     mc->init = opentitan_board_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
+    mc->default_ram_id = "riscv.lowrisc.ibex.ram";
 }
 
 DEFINE_MACHINE("opentitan", opentitan_machine_init)
-- 
2.25.1


