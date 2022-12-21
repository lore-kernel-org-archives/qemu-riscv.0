Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p83ks-0008UQ-UL
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 13:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kr-0008Ol-F4
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:49 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kq-0007uI-0L
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 13:23:49 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1322d768ba7so20146954fac.5
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCo1YHm2H4SIqdKOmUrpwX43J8/JiKOmCLBYdwukgIg=;
 b=nbkickxKkDusAdflOl6IennIzQIF7amH+Q6DmXbOKlxtWUPkm9lLnqIi768miY7Jws
 KgCPVoPQc1dDY/3VXl7iAirx8fxbJz9HM2Ytk4ogmQBTyh6H4d/HUN7RRvKYVNJt/C9t
 ouwgUVrzy3D8qZ3f2EK2/EejIqw7CTLfntiKxmbyTD78OBUYibPX8nIL0Nx6zNg3+kcf
 BTyFGdXVvsTgMGh0XfWyH4MnOrv7sdr7r0WUa5ChMlP6Lm0QJcZ9KDI7BcqNE4d4ch3k
 ukDNXzf3JpkWu4/3Z52uPORvLh0ck2CI2Gz62tiUHJGVVZFP2gmGHkFZ+VY/xs3hVjyQ
 /yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCo1YHm2H4SIqdKOmUrpwX43J8/JiKOmCLBYdwukgIg=;
 b=DD7V+WPjEFdI1n/q6F9iio1CpbcAmk7Ndv91Okx2A2irQ/U2DZuvRGmGPNHUIc02FP
 kxQKJVv+Rq2EtbRISmLu8Tc1INdE1etqygdYfIOosmh0oT0BVKm5FIT1UtWWez6PQlbI
 L8Xz5sHwu1LEa2x/TBXs0MkGV8EW0sfhzxXLqIL5ibVN4VUNr8bXcs7OajR0DGSqRT3A
 QLNCVzILVVAEygr+HUNI+sH+3L8+PJJlC9kGP6NnlzVbRQ8ebSrinbEm8uBQnl/L8+Yp
 9JlxYqI5x+qHKiSI0mXjB6B/W8zyEuOVhyMBZU7invbdbjAQYPqDjdVDXzP2dEOepdUI
 xFEQ==
X-Gm-Message-State: AFqh2kqZ5paSeip6YD8IfUkLl18XPiTIaDySAbFmNYx7bJKFwxyzgvws
 +OwxWjfrY7hCw7OjHWn9O3GC7A==
X-Google-Smtp-Source: AMrXdXvly/jXyJg7Apg5CkvGcD+/AS4YohlTaEqJ0VUFRSAsLI4/ST09RHfVsE6bNMMj5S4ZbyFv4Q==
X-Received: by 2002:a05:6871:4501:b0:144:fc01:370 with SMTP id
 nj1-20020a056871450100b00144fc010370mr1237461oab.0.1671647026806; 
 Wed, 21 Dec 2022 10:23:46 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 14/15] hw/riscv/virt.c: simplify create_fdt()
Date: Wed, 21 Dec 2022 15:22:59 -0300
Message-Id: <20221221182300.307900-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
X-List-Received-Date: Wed, 21 Dec 2022 18:23:49 -0000

'mem_size' and 'cmdline' aren't being used and the MachineState pointer
is being retrieved via a MACHINE() macro.

Remove 'mem_size' and 'cmdline' and add MachineState as a parameter.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 11c903a212..b13299cee8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -998,10 +998,9 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(nodename);
 }
 
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+static void create_fdt(MachineState *mc, RISCVVirtState *s,
+                       const MemMapEntry *memmap, bool is_32_bit)
 {
-    MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
     uint8_t rng_seed[32];
@@ -1498,8 +1497,7 @@ static void virt_machine_init(MachineState *machine)
     virt_flash_map(s, system_memory);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+    create_fdt(machine, s, memmap, riscv_is_32bit(&s->soc[0]));
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
-- 
2.38.1


