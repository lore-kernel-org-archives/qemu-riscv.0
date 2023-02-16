Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pShKM-0004Xf-Ud
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKL-0004Vr-E5
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:45 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKJ-0000X6-PR
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:45 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso6544183pju.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gq6R8bMKD8VginRzcmkhaOc5Trofmeu2n8wOI0BvFnc=;
 b=Mo5/ZXo6SLGrEU7I1bpqgjgKG91SjWtyv2reHcsl1DP8R9NAMKnEoVE6VrJjjHIJKY
 Ohs9kLb3ZEXugXvPA4SD9GJj6oagdjcE7VrODgj3njI7ivpvrAjk/VKoddgY1MQsOC/z
 BVP+1qT0wWhOBdBuBxl/xuk+m0R6HG2P0+KO5K1wAA1BaFYTzcTNtruUitwLz8AWfpK/
 EYpuG9qef+FaTzcmlkap+rfTWtJbUTla5dfK1/yrVXId7fyiQyDghAjVLuhuKHlT9+zX
 qXOnteBHDQXVqfs7F7DyfybSeZs5dg7jGMzwddYn5OgPffwaxSzvfBlsq+0S73fuxhgj
 DkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gq6R8bMKD8VginRzcmkhaOc5Trofmeu2n8wOI0BvFnc=;
 b=fqeIhI8Ms1Ld2xveOjDfK4JnRRfw+sTFlbxrFIjDdfCvPMpoeX5FWf4RC/C++clHkQ
 0MPsx2tKBVzVYLW35Pjwynd0l40trGXdPEEcerj8fGM+Y+O2lqjVPcY6ngynbifQXKbm
 X9LtcrlzsI/1AMy/QqmOrrwO+BimwH6vcMuxSeOhT7bG0k7Hvd2inI44USb+JngsVcI7
 zXG4dWdxT4zSjkqYyJPWx6AYAr7rmKUKXOGFZx1qGhvtAPyL7dSzlkKxAtof51gQN6Tf
 x34Omx74fpFS6LT1BvQNWPb18qSJBUGCAbn+BulmtvEw58AHgHYUF7FvIS9YAkTiSKdI
 tshg==
X-Gm-Message-State: AO0yUKUtDEQR6v7yT3b7eWnNEMZoOzrkLE9hebLWcDyCQaUcXbjNQRKF
 1WGGLsP4FZfT23ozr9ZvpSPzaQ==
X-Google-Smtp-Source: AK7set+VNdbdzk4VqobwD/Ta88uhLzCrbYERcU0v8zDbZUizavYbsiiqs5lmiL9zz5iuJdQuAvg13g==
X-Received: by 2002:a17:90b:1c09:b0:234:27a4:fba2 with SMTP id
 oc9-20020a17090b1c0900b0023427a4fba2mr7289267pjb.18.1676565702313; 
 Thu, 16 Feb 2023 08:41:42 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:41 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V3 3/8] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Thu, 16 Feb 2023 22:11:20 +0530
Message-Id: <20230216164125.1945633-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2023 16:41:45 -0000

memmap needs to be exported outside of virt.c so that
modules like acpi can use it. Hence, add a pointer field
in RiscVVirtState structure and initialize it with the
memorymap.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8df37cf3d6..9b85d5b747 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1451,6 +1451,8 @@ static void virt_machine_init(MachineState *machine)
             ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
+    s->memmap = virt_memmap;
+
     /* register system main memory (actual RAM) */
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
         machine->ram);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 62efebaa32..379501edcc 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -59,6 +59,7 @@ struct RISCVVirtState {
     char *oem_id;
     char *oem_table_id;
     OnOffAuto acpi;
+    const MemMapEntry *memmap;
 };
 
 enum {
-- 
2.34.1


