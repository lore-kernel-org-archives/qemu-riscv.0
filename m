Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa0o-00068I-4S
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0n-000682-JZ
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:57 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0m-0005Sh-1N
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:57 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nh19-20020a17090b365300b00233ceae8407so4830987pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5ZHbzn8UznmI/HA0ZrfnP4iDQsCNTxYGyI26FNASvs=;
 b=BSo33pDSSADN9+f5he6nwOJZPK1c5IhwrUeKYv7eOcEoJe0GDmkS2z07qRvPZ89plv
 iZ6+hLWfCr58I073C4ph9wiAeUBD0EZTQ9FvOye/dYPTre+X79OuGIk5oumBS8ttFs3I
 6bWwEA3PMrDwij6VBOG81IsytfBaLvO1uHrBIcFRulQ0sVpLXxC3gzambf1aDEm7rjlK
 zJMLCtjbV4CV60j0QxtIHyRxveVorx2Q1SPEXrqXXc5NXXWw6r4BK0vshUXYC20Mxbn+
 k75F/nIPQmrQnojmr1RFnRoaRlWyUOBl5PoNZ47pSJaTfaBWociGpxVGzbvao+Dc0Mk8
 l6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5ZHbzn8UznmI/HA0ZrfnP4iDQsCNTxYGyI26FNASvs=;
 b=BQwZO3DfP1WkeyedtV4iJkzB5BHNQ2DVrWSk3B7xVoNo+I5ubVWxXdiyX+MSt9r0wG
 QiIru7drpYOxXZa5MquhUU+0SAAm/uJYfn+E6NSU197tzmkhei75PG7B1D2ljF837wyj
 Q8xPkXUqe90qas4J8JNET/uDw3hXa5yE5p2w+xPKbO/g6QqofLjd2ditMqO2LYAWgihD
 yMLIfaUWF667hjQvpdBWNQ11IV40olfplx8ftGB82atX8SbO0Vv8gkrvO326exvt1Zz/
 UTs/2jPQ1b8YTjoYECl74oKJJlOAgAk11FAAIcCZ1FpfXLAmEFBOiAlQP39na3mPg12i
 Prtg==
X-Gm-Message-State: AO0yUKXmetDDrI3KgYlUGFgMBCqDZbykCehnHof1+50ZpsMfEJXcvir9
 VBPw1oR7JTN8CLH7Gg/3wIQb6A==
X-Google-Smtp-Source: AK7set9H5LwsLISspf9wX4l555IjcfE7kx0OLQg9coYrZQsEZCH5qLfTopJuK9oNmvsYol0sVFXzbg==
X-Received: by 2002:a05:6a20:a026:b0:c3:3ea7:e318 with SMTP id
 p38-20020a056a20a02600b000c33ea7e318mr20379538pzj.42.1676299254786; 
 Mon, 13 Feb 2023 06:40:54 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:54 -0800 (PST)
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
Subject: [PATCH V2 03/10] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Mon, 13 Feb 2023 20:10:31 +0530
Message-Id: <20230213144038.2547584-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:40:57 -0000

memmap needs to be exported outside of virt.c so that
modules like acpi can use it. Hence, add a pointer field
in RiscVVirtState structure and initialize it with the
memorymap.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 58d3765b6d..5017ba62ec 100644
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


