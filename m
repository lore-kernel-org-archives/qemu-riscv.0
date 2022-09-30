Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oeFCP-0006ZC-P2
	for mharc-qemu-riscv@gnu.org; Fri, 30 Sep 2022 08:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCO-0006VM-2i
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 08:33:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCM-0003OL-Am
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 08:32:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id d10so4118755pfh.6
 for <qemu-riscv@nongnu.org>; Fri, 30 Sep 2022 05:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=19tiDMrMrp6otC4IABn8GhcIywk+2/OdxCJVUTJlxdE=;
 b=EMay5euiQ0loR6hJgLVz/1GmAyJibNWCiP8wVpkeIoqvjMX7EN0uHgRQYQU9VT1cGf
 AyXnht3Uw/dwzDPxY5/1Ds4Cf0ox6L59jSvRSz+BMgKjOAT9DZXoA2KvTKnagpfUp84l
 1FlO4oDIK6Ui7WwAORKqUcqkl5q91+oImSCwuEbr9yG47RfVnaNI4TdtIyPcNL4ZRG3f
 LKURMDUuegWLKqr2bShN9rPTRYZidWm7c4AOCFkw14oBspLI10tEjwhwJSu2RUxczSo3
 hr6xKgqBNRATG6JNnMxCNOFF+A4mj5UXlBgHxANO8+hRu3JEXE9c7HDt7bR06Sp2cJzR
 KZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=19tiDMrMrp6otC4IABn8GhcIywk+2/OdxCJVUTJlxdE=;
 b=Cyfwe30CuYYlIp/WyAm9vci1R/cmbGWNY5XkQapftUe0m2IglBgsV0Q/m1E9Y0/wqY
 ZJgDT4NIHIzkqCNbxeYKEukqCxFivypjWm3+Dt6bDtAWcObxPrSHmgu/rl65G755eTae
 llDSsRi199Ihg8dyk+0hjiUE+2FNsCQO6N+Mf42S/NbIbFugvVCzuegy+LUTuvemYXhK
 OuvK1xHn8wYdJG5k8zXG5JVkIRaiTS5QuZzMsFroU3eJY0M+0kl/WErfQv4g1dpiCO3E
 ACzR+2myTLBFSwnrJ/UCT3by9r+cyzkSbzgxyXfcmLHCgcfV4drcxSuCtKpeTv5L5TON
 6Mqw==
X-Gm-Message-State: ACrzQf2XJmHNDY7getk9MlWVXT5MZ/LyfZ+zJHXQtHuPKp8psvIs1+j0
 WTFvGBhESqNzvhXYqXAxFOB0WQ==
X-Google-Smtp-Source: AMsMyM4BRq8ejC09Vhxd43OjSjlYK1kFL2deJcVLBG01g+VT9smHtvvID3sv8IspV1WbM3LMggyXCw==
X-Received: by 2002:a05:6a00:1253:b0:546:3d50:3284 with SMTP id
 u19-20020a056a00125300b005463d503284mr8684156pfi.72.1664541177409; 
 Fri, 30 Sep 2022 05:32:57 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a62d154000000b00537aa0fbb57sm1649880pfl.51.2022.09.30.05.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 05:32:57 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
Date: Fri, 30 Sep 2022 12:32:39 +0000
Message-Id: <20220930123239.15515-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930123239.15515-1-jim.shu@sifive.com>
References: <20220930123239.15515-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Fri, 30 Sep 2022 12:33:00 -0000

PLIC spec [1] requires interrupt source priority registers are WARL
field and the number of supported priority is power-of-2 to simplify SW
discovery.

Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
spec, whose number of supported priority is not power-of-2. Just change
each bit of interrupt priority register to WARL field when the number of
supported priority is power-of-2.

[1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interrupt-priorities

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f864efa761..218ccff8bd 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        if (value <= plic->num_priorities) {
+        if ((plic->num_priorities + 1) & (plic->num_priorities)) {
+            /*
+             * if "num_priorities + 1" is power-of-2, make each register bit of
+             * interrupt priority WARL (Write-Any-Read-Legal). Just filter
+             * out the access to unsupported priority bits.
+             */
+            plic->source_priority[irq] = value % (plic->num_priorities + 1);
+            sifive_plic_update(plic);
+        } else if (value <= plic->num_priorities) {
             plic->source_priority[irq] = value;
             sifive_plic_update(plic);
         }
@@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
         uint32_t contextid = (addr & (plic->context_stride - 1));
 
         if (contextid == 0) {
-            if (value <= plic->num_priorities) {
+            if ((plic->num_priorities + 1) & (plic->num_priorities)) {
+                /*
+                 * if "num_priorities + 1" is power-of-2, each register bit of
+                 * interrupt priority is WARL (Write-Any-Read-Legal). Just
+                 * filter out the access to unsupported priority bits.
+                 */
+                plic->target_priority[addrid] = value %
+                                                (plic->num_priorities + 1);
+                sifive_plic_update(plic);
+            } else if (value <= plic->num_priorities) {
                 plic->target_priority[addrid] = value;
                 sifive_plic_update(plic);
             }
-- 
2.17.1


