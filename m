Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUiv-0001kB-Gy
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUit-0001g2-Am; Mon, 18 Oct 2021 11:38:47 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mcUiq-00075U-Ir; Mon, 18 Oct 2021 11:38:47 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso268459pjb.1; 
 Mon, 18 Oct 2021 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lV+aLeVSqXPlal1y7APPh6mTOPbkMZ+BIaiDrhI+Vow=;
 b=YOlrHII3YNTZWQ2FjJlObwbHgo9qn0TRMsEUqhO1Cpn3e+DFPgWsjVSHTxv5xvPrkr
 HVT+XixdGyUiAezzhchRdPqPYfIsvqBiDoA8gg/JJiuDIXtEgGMeiQmE+/TKY4UZ97v6
 CQjk+pcb6gQSlFKjolQB5QostNAeCw2HxVXc5q4VLQpbQtSu0i3S09k5YrU0uRjei/Eb
 r/Y62sFcB3weWFxyZJleiKJqqnl4I5wC5NADXS0N7FBl9rHnoLA2hKTRQf5JuxthMORy
 2cD04+ywKCR/2Iyr1pds+IRBnXTHk9tXKbLrlEm+4Hm040EntPkDw8+mRaW3w52vT9fB
 9faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV+aLeVSqXPlal1y7APPh6mTOPbkMZ+BIaiDrhI+Vow=;
 b=eJob1rU9ymydgFHY650stwnIrqdEdhboA42iU94jjIBbIIGDL+/ffHMX9PaEw+j5aI
 ZQwrguyIrA0fFjtwn4QQ+c0Er+YE0iMgTzx9P6aB/h0g68zNOzeGyvG611cwB7YqNIqu
 +8jwfIPzemkTU5TnSSpqGah0HsiqxAOCnLbpGA2a/TtoMyZQj3FTr3vwpUAkwHIgh1VL
 GdGx7OQPY5ooIvJEkYvz3dj6kB84Izbr2dJWsNPWPhLrv1JnTFF7VzpLCRgEJKgImZfl
 kEvpZXYIpk8sWur/Zo3jO2BNn0cx264a8s7LV40iYJxD8xW8NkhSfBZG0PS/Ip/ZibUv
 NymQ==
X-Gm-Message-State: AOAM530DcrzSjos6659qaKRVwg8V2jOsGlB0iKnGyjiUNaxqHJWPaQiB
 FiRBYqXMWwwJLELG7KxgO0w=
X-Google-Smtp-Source: ABdhPJyVu+41rSRH4eqACYdOvtX4MHvNgabsj1PloH4/jZqgxNbosKAz+3btAl/Jo4wh2N4k+tO8Mg==
X-Received: by 2002:a17:902:d353:b0:13f:a15d:3d71 with SMTP id
 l19-20020a170902d35300b0013fa15d3d71mr14900023plk.77.1634571522915; 
 Mon, 18 Oct 2021 08:38:42 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a30sm13899649pfr.64.2021.10.18.08.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:38:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Mon, 18 Oct 2021 23:38:27 +0800
Message-Id: <20211018153829.24382-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 15:38:47 -0000

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_e.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 6e95ea5896..caae860664 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -75,7 +75,6 @@ static void sifive_e_machine_init(MachineState *machine)
 
     SiFiveEState *s = RISCV_E_MACHINE(machine);
     MemoryRegion *sys_mem = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     int i;
 
     /* Initialize SoC */
@@ -83,10 +82,8 @@ static void sifive_e_machine_init(MachineState *machine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
     /* Data Tightly Integrated Memory */
-    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
-        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
     memory_region_add_subregion(sys_mem,
-        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
+        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
 
     /* Mask ROM reset vector */
     uint32_t reset_vec[4];
@@ -142,6 +139,7 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
     mc->init = sifive_e_machine_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = SIFIVE_E_CPU;
+    mc->default_ram_id = "riscv.sifive.e.ram";
 
     object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
                                    sifive_e_machine_set_revb);
-- 
2.25.1


