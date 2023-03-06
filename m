Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIws-00071l-6Y
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwr-0006yr-9Z
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:49 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwn-0006oz-6l
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:48 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p20so12037352plw.13
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140284;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLQ2d4Q8lyM8hisZupM0/ijO56IIsMafYWr8dV9IEZc=;
 b=SCMIv8yrxOcgdbbdMlgfulCsT9iWvkz0XJ59JSgKHH70FEmnXDlyKVbTWNrbnYQ+xx
 qzXBrbmzDSvnvb2i2YSYoa+lilbruqjWFBeTCE6C4VP1BRvz8lazBh13O+Ko6e7xM8kG
 i8mMLNK7Mgzb23hxPSOxPoqsgVNgLXXCSjae0Y4x1L//mKR9Xi37mry+bx2umdN1CTTn
 xOqh8Edt+YTXd4PbuWfqlXPxtcSLw6ZhhpdWJD8gZsmR3MK5HWL/sXVCF7KGC/8SfkfU
 ST5QvoERCOrKAfb9KPwT+Dzdrrh1+CAx+L5gxM1bUn4rHuNuqE8tXjoLCplsrOMwXii4
 guPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140284;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLQ2d4Q8lyM8hisZupM0/ijO56IIsMafYWr8dV9IEZc=;
 b=7N/955NFb30XGmFfxav54TjWqMUynkQxef56xnIEnpiQkRvy3DmRDKA8WWjt0vL9y9
 ohN9b0ZK2knH+hyOLCmT+ddk9ZqF6cLnpLOqVSOx8hZcKQ1H3jqh6xq3yF46MLnP2IDv
 t5KIjDH1Gadm1mSH0v1dvVl3oC2zI9PfFTFWSFDAzyHtUoyG1DmArxbJQYKqXNsx81Q+
 4tP/Si2nDgtI3+HNUIPoTpua7kvm46wa407XefwxWhgv1ZpuHhnl7NGK1VlxVnEmaVwc
 6bOmBRfje9dBRBjxfmLRre9Iy2GSq5AwzoYDo8YofONGDX/9S7F9CwoOKL0L3RuuCFXV
 tJAg==
X-Gm-Message-State: AO0yUKXu2pv+e3MqekoDjk1XsLFDnh3IHwrkfJcxB2srVYj667wH8zLd
 vLDAnjnklfiACNhnIj3NbWXHoSHcnOZ/iAUwqsU=
X-Google-Smtp-Source: AK7set9YgpGYg8Y0wrNGnw3I8xqhrvhr/JQmv9HHCDJxy3MCb9KJqtgbjtqOzOCX4DnT8bpAgqprrQ==
X-Received: by 2002:a17:90b:1b4e:b0:233:ee67:8eb3 with SMTP id
 nv14-20020a17090b1b4e00b00233ee678eb3mr12883633pjb.24.1678140284122; 
 Mon, 06 Mar 2023 14:04:44 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 c3-20020a17090abf0300b002376d85844dsm6344251pjs.51.2023.03.06.14.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:43 -0800 (PST)
Subject: [PULL 17/22] hw/riscv/virt: Add memmap pointer to RiscVVirtState
Date: Mon,  6 Mar 2023 14:02:54 -0800
Message-Id: <20230306220259.7748-18-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:49 -0000

From: Sunil V L <sunilvl@ventanamicro.com>

memmap needs to be exported outside of virt.c so that
modules like acpi can use it. Hence, add a pointer field
in RiscVVirtState structure and initialize it with the
memorymap.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-4-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 90579a4c0e..aed303e1e6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1458,6 +1458,8 @@ static void virt_machine_init(MachineState *machine)
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
2.39.2


