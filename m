Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD7sj-0000OE-3f
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 10:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7se-0000KK-HX; Fri, 19 Feb 2021 10:39:44 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sb-0008PO-0q; Fri, 19 Feb 2021 10:39:44 -0500
Received: by mail-ej1-x633.google.com with SMTP id u20so13474709ejb.7;
 Fri, 19 Feb 2021 07:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Osdk42GnHmUXWlOf+Jf1ywxYiD4+Y49aj/UgdhJyXDY=;
 b=Pcj5rYQy0HD3D0hHfuSazRQ5znm7DSrMH6VJrxRqtFc8brQuysvMx3nzoU0VEiMu0L
 G+QgKoPxmEPdl7fTQY0i6gP6mRNe3cvkefBp/sod6OZrxJkUyRPtIq4Y8Z2D3WnOMP9F
 SfIFkuRci0vsEWhtqVRSnae6mnNo9XIPOJPI3YDg8ymoSDVDZznsYSmc+Qv7ppYLIBzv
 j1W5SyU3jwZ23uZe1D/uhZfxnbAPCsjx/WYGJHs+xH8azKBFY394c1v7Q2L0jzGhADxo
 dQ8xIgPJu2I5rLrnj426jlDnLdpLa5wdIKa3U+VpzGtWVtYyEoaI/OXGqch6+oWV0EfO
 y48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Osdk42GnHmUXWlOf+Jf1ywxYiD4+Y49aj/UgdhJyXDY=;
 b=Hc5nIQdelNPjdfw1U0vYlvGEWdoNxeSxmZysLBXYlMDStBMXZ5a5IzHDAvPYfGcqlX
 HCyZ8EQEfyNOv7DqppbkF60+dI4IJ35drp6Er1zic3UxSm0Kqh15xvzqGKGmmZxsNOpt
 B3U2FXo1AM/OwkVthy811+xkfK2YJmjy3Ncfl1FWDOQ2RZPLQM+/xJvhsx3QoLMvd2pb
 dCH+a00VlTBmQ0kgqkAQ0JEr9OuWqSdzjuYhEPre3zrwnbkZe4rFIVdEKxLn691B77a7
 dV4QtAwUv/0gRO6dpSDWAnwdD0s6M+E4pj8NfgezTjxL6N9yGlUawY5Ytp9iJTkPc+h5
 N/pA==
X-Gm-Message-State: AOAM532ENelyTKxrbKTOeA6iau6coP0GsWbFf3nFfPqry5m4Xrq2u9dr
 D6vO9NlOEP7XWVu2gZD93Z4=
X-Google-Smtp-Source: ABdhPJxsslC0Yc5Wa6qR9mKc6sxOLj8h/CN8isO1ZyuxNMw9dZKLRptfeBT20jwlN5sPXVmjR5/Fkg==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr9326292ejb.132.1613749178267; 
 Fri, 19 Feb 2021 07:39:38 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t9sm4580314ejc.51.2021.02.19.07.39.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 07:39:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
Date: Fri, 19 Feb 2021 23:39:14 +0800
Message-Id: <1613749155-84250-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
References: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Fri, 19 Feb 2021 15:39:46 -0000

From: Bin Meng <bin.meng@windriver.com>

RV32 supports 34-bit physical address hence the maximum RAM size
should be limitted. Limit the RAM size to 10 GiB, which leaves
some room for PCIe high mmio space.

For 32-bit host, this is not needed as machine->ram_size cannot
represent a RAM size that big. Use a #if size test to only do
the size limitation for the 64-bit host.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Use a #if size test to only do the size limitation for the 64-bit host

 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1d05bb3..fc90bc8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -590,6 +590,16 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (riscv_is_32bit(&s->soc[0])) {
+#if HOST_LONG_BITS == 64
+        /* limit RAM size in a 32-bit system */
+        if (machine->ram_size > 10 * GiB) {
+            machine->ram_size = 10 * GiB;
+            error_report("Limitting RAM size to 10 GiB");
+        }
+#endif
+    }
+
     /* register system main memory (actual RAM) */
     memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
                            machine->ram_size, &error_fatal);
-- 
2.7.4


