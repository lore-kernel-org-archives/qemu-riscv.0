Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezR-0003vM-U8
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezQ-0003tV-AC
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:40 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezO-00057Q-NR
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:40 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so2243064pjh.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gq6R8bMKD8VginRzcmkhaOc5Trofmeu2n8wOI0BvFnc=;
 b=gsdiGhQat5spgo9v9tXmUzlTjp5tqAEhw6hPLwwL6B5fh87q6nyjxRxovWqleUyG2V
 T+Kqt/mvqcMIayoyUQol6nVD7HVoEh91qPjSu4K467WX6Mrqg/zA2DqAWP0mteKO1tUz
 8Ma2yREDGXI9exyXmuOYtMUvl8R2UrRINeGq9Rx5N0pf+mOEArmgH9pS4JZ10zC66AAQ
 nXWkiEbbjIgJNxcG/tPzMHCp8tRG6s7kWaHZeMnJkfygK2Wl3lyE0J16fColZZ+kW/T+
 BzlYz1v8SO9ZsHHpNnG/5qXY1y6sU/y1aSfL8U9utsiX5KS5eBl/VVoMFjQuMO2aMhu4
 7zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gq6R8bMKD8VginRzcmkhaOc5Trofmeu2n8wOI0BvFnc=;
 b=uvYHmz/wCcTlYijnvJHWP5sOwE2KX1CDBQ8WRGI3HJrYi0X8U8+agcwNGdjwA0DG3O
 gl9yZ37XB7iBUT6xFPwMG7wsK09CSmKqjOtDljpc0YlP6yxn2Ab26qsG1L6YMtvfhdPD
 LxZIDFAlSqssuPVX5mCskq25TtW2ObnrsCHYqClMAlWB4ht0eEZtxWidvYAHwpTkDdB/
 Hi03PBM/b38haBr+K/+xpChU9XkoTjvdarvcjvP3kVI/Z9Ic/dpcZKvvfjw26WxaDmTr
 7tUGpuaZSKKKi0dXiXpjtOuGxVIQqCKqTFNEvvOuW/i50RckLcctwTYZuWEtMrM0GmVc
 KZxw==
X-Gm-Message-State: AO0yUKXjGP8Z4T/7BZBvWr2rG8To5gjoKcc6Gjb7M6mQMggzC/u8nNVZ
 +nfj1q6yuHz5Degjk/wjT3DyqPVSwt0DbHA/
X-Google-Smtp-Source: AK7set8C3eHW+tX4WgxvhHlguNfTEBzz516Ts2DIjQ4is3lsKDzqpJi8Iaot/qZlUxJUh6TGA+lp1g==
X-Received: by 2002:a17:902:ea04:b0:19c:c8c8:b544 with SMTP id
 s4-20020a170902ea0400b0019cc8c8b544mr12430486plg.64.1677748356873; 
 Thu, 02 Mar 2023 01:12:36 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:36 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V5 3/8] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Thu,  2 Mar 2023 14:42:07 +0530
Message-Id: <20230302091212.999767-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 09:12:40 -0000

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


