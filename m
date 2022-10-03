Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofCrB-0003b1-2C
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 00:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr7-0003YP-Vx
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 00:15:03 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr5-0006Tm-MI
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 00:15:01 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 83so2189457pfw.10
 for <qemu-riscv@nongnu.org>; Sun, 02 Oct 2022 21:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=F+mjQgSIAnozHseNrNKmVtq1cIhjeBBYAbGF2zpCiHk=;
 b=casen/B75ua/AN1X/YMfDM+FAcr5wke3RSjmNvTO3zcVlcjuixOQFb/vSQ+q3yU/6L
 4/4SR8gFEnnci5HXxPUp1qs0I1iBhZvG0YU/BiCYQbXw9Ks5hUYkyMhR3oQ9jeA9zn9z
 5yO0r6WHzd38+IMMr6foYTL1O4tPwZt86AP/bA6Bqm29oBbMsOzk3BZMcboWFTzDBKME
 CUXFxjiT9SMg+qdE3h+y8ZRXCmQAJzjZMRuDT2ZsWb+JxMjhDkWOn2qjfbZw0yqjRYxH
 B7HA/qCKFmFGbIYIbOkbX55OIJGlewufIg30yD3iTVHit/0zlr/I7i6U/lkRvzl1RhZ2
 zDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=F+mjQgSIAnozHseNrNKmVtq1cIhjeBBYAbGF2zpCiHk=;
 b=5yvIGjm40RIFsC5YQbP5OJGOIUnBs7lwIkqNrm6bki3di71LNNdZaG8ME4wetZiEaX
 trKD6GbkiwF8LUk1F6Szh37reEm6euXKeq0Db77JfaYPae4l/8SXER6/wqxMyjq2bUqi
 qSTRGEcHPfoLOr1hWUWK+lJaLnfC7m7AsJYM+YtF4ujbcGKG/6sN6b/UDM/9kxuRdIX4
 UV2n1Q2146e6kgtrZnhtYTgVrhFm2+Y9IwLTHjV9y2/hp3QZdPUThzP0vC+kzBKjNKHu
 +/dm/YI2re0Cm4uhqyhc5CqwksKpkjq+0WNNs+xocZjYKax7P9r+k3uSYLYjVO8RsqZu
 EC0Q==
X-Gm-Message-State: ACrzQf3gsFWcpT3d2nQ5jv26mEd0y1Wy8BmTKdWpvu/2G9E7pnEb23C+
 mUcgvQA76y1Uw4b3PFU2OqYhMw==
X-Google-Smtp-Source: AMsMyM6igbQ0Se816vi8zq5Px9W2pNLp3EF0yiD9tCWpm/16qcmmUvr7272YseSfpbErnWy6qcXo5Q==
X-Received: by 2002:a05:6a00:24d2:b0:542:f6e3:e18d with SMTP id
 d18-20020a056a0024d200b00542f6e3e18dmr20397910pfv.36.1664770498221; 
 Sun, 02 Oct 2022 21:14:58 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b0017732e4003bsm6108596plg.141.2022.10.02.21.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 21:14:57 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
Date: Mon,  3 Oct 2022 04:14:40 +0000
Message-Id: <20221003041440.2320-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
References: <20221003041440.2320-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Mon, 03 Oct 2022 04:15:04 -0000

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
index f864efa761..c2dfacf028 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        if (value <= plic->num_priorities) {
+        if (((plic->num_priorities + 1) & plic->num_priorities) == 0) {
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
+            if (((plic->num_priorities + 1) & plic->num_priorities) == 0) {
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


