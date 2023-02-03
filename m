Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNpAj-0000qp-Ib
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 01:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNpAY-0000gc-N7
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 01:03:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNpAX-0004jY-31
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 01:03:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso3065643wms.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 22:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l07L9j5mbC+S0Ouimd3iEDbL6jla8YQbRQof+qtKkPE=;
 b=PxUeGSYiSs01TNKRkQ/kba3SX9s7MVjtBAz8CS1goRcYK05P5WguKta1uBBGo3kzS8
 Rkg8+adNr/v/rpYrJ8xSO4lWpNpoYeREDNf6893yh8JIS6tFjxfzrTJAtEd4j5fzIokP
 vP3+xSncGhgAw5dTpQxJfHDm0zdlMQ2l2JdOZzYr1SOS9fGSCQb4te/Lhm0qgO3Rkpuw
 ifq8/1BG4rC4isLkntjzjzBWPvnbAiF9/NQc0gZvJdBLg/3mF7ZxfmmW9RPRmSoOFTNQ
 A6alNpDRh1YqJrFGVChRRZI0S9F8u41gzSl4HtKzCqvlFeSXKbvBnfquMDUA8nMl4Mnr
 AK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l07L9j5mbC+S0Ouimd3iEDbL6jla8YQbRQof+qtKkPE=;
 b=o4TzB5HvIUnVavbRVJ2+77kXHcb28s/2C4/v0JTbiFBMPfvnJSrElOfYUtc7Yw2wD4
 7xL+M4ilneuMpms20wErg6J850xvnwG0TQwuR9iTxCKwWIItSRYOeiM1hMu5gXwAuxKx
 5rV7/SL8GZfmA5gaYgaDfiPOzLeAj0jLM1x7cQdpwyRrk4iG0VjFhaew4fUBx69rjv+h
 QzfHqtCma1hXsXpNPjEhWhA6bBkDGIw6cGRpkzME69tE2z49ONSpyS0NLdW5ESoiq/lG
 nVP9oiipgeWFYmUx4k/0BD6o0QL2NLE15zYq1ymkVXc1cJ8xvWv44BWs1yhC0YvGVhlK
 1sQA==
X-Gm-Message-State: AO0yUKWo3ta96M27DlR9w0xAbYy42eoP3sd28a2XIOh5mF5IJCtrCgJl
 eUihbYjUVE6ELhRcbjtuTmINZg==
X-Google-Smtp-Source: AK7set9UMNuWKcygQpr4Fyh2lLIQ5KnU+N0GNK/WSZu7GebEuJIcpFjr6X6cHMrpxaVDkU8DcaB6zQ==
X-Received: by 2002:a05:600c:4f51:b0:3d1:f16d:5848 with SMTP id
 m17-20020a05600c4f5100b003d1f16d5848mr8399013wmq.26.1675404206606; 
 Thu, 02 Feb 2023 22:03:26 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 w14-20020a05600c474e00b003dfe57f6f61sm1159131wmo.33.2023.02.02.22.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 22:03:26 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 5/5] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Fri,  3 Feb 2023 06:58:12 +0100
Message-Id: <20230203055812.257458-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203055812.257458-1-alexghiti@rivosinc.com>
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Feb 2023 06:03:35 -0000

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..48d034a5f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    uint8_t satp_mode_max;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.37.2


