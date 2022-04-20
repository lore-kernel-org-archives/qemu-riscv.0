Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh5Oq-00021L-9B
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 04:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Oo-0001y9-Oz
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:18 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Om-0001LB-Oe
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:18 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso1292182pjk.5
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 01:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hF/eTRqaa2dArCqu22Z7iU7QrnXrlyUh6v8yjLNMbHw=;
 b=C/VLI9aY6Bequ5q8Ejvw4BBx5AgJOC0Ru0nwpznfwm7r5rTHUxPCoXUVjGxWPnqW6U
 ZNp3JQe4Mypb6FaBVR/lllsSc8bdqRP0FqRlDtCDAQs91o9VVrxs5o+QiRhfBw8p9n5R
 FUqFTlH5qzmJZwekvX2dThQ9NmIKBJi0x2cQxYCgv5ter3lzpnD+g6CE8GqJxX7WbEZw
 7K52UkvjwNQZ9JBBo8ldGdnWpu0veWBipvCpEZyzTbHBLvc6gUOm55/dOCkjkCSXSLr+
 ZlrRklNAmwDvOIZX8GvkV8Vd7VZvJGwqLZi2ZHEWdN1OrVMND0wzrqv8WpcUCULceZDH
 ftKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hF/eTRqaa2dArCqu22Z7iU7QrnXrlyUh6v8yjLNMbHw=;
 b=Ys5smxjq8gOnGdr9Ijr7uwfQGzLt6ykXDjyEl0+CnARoTQPwvSCiBvWKXFYIMidItI
 Fnu+loloNJW29k0Oc/wuNTAt09eD8IkAoMMOnx6tQUJXjmzMwjr6q66cAliYz6i9Us2X
 uhd3hf3JO6+hR7291oYmV6KbSAcNFRIKvr1r3oS0a0cKVubLnlpjDo+Ow+4XOHzYJyGu
 p7ybqfA5pRHf4kTtyyrVU4U/ALzvFhHvWZd2rtAg169vDoK1wjgE8YbN/GrchsO8nLzD
 jSxhaBKfXB3mhafYROZsdmj+IbMOoO6Boq2eBFY7Qv6Ea4M9H1KtMxqqi6Cnud6xqXIj
 z3JQ==
X-Gm-Message-State: AOAM533mzn9702RK/pYlxyQN0npA+UzHDWJQS9ZaZdiDzTAzpA4uHvJK
 UrY18aLbN5j4u0+8izWSE+wT2Q==
X-Google-Smtp-Source: ABdhPJysiPVvJvmU1HTG/Mn7V/wwLDTtK1wcfEvTu5sRFI8ZlXktHL2IzR3CaQqxy6sSdU2HOZx8Qg==
X-Received: by 2002:a17:902:8496:b0:158:a8e0:516b with SMTP id
 c22-20020a170902849600b00158a8e0516bmr19650517plo.4.1650442155369; 
 Wed, 20 Apr 2022 01:09:15 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 2/4] hw/intc: Support 32/64-bit mtimecmp and mtime accesses
 in RISC-V ACLINT
Date: Wed, 20 Apr 2022 16:08:58 +0800
Message-Id: <20220420080901.14655-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420080901.14655-1-frank.chang@sifive.com>
References: <20220420080901.14655-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 08:09:19 -0000

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that:

* In RV32, memory-mapped writes to mtimecmp modify only one 32-bit part
  of the register.
* For RV64, naturally aligned 64-bit memory accesses to the mtime and
  mtimecmp registers are additionally supported and are atomic.

It's possible to perform both 32/64-bit read/write accesses to both
mtimecmp and mtime registers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aclint.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 37e9ace801..ff082090fe 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -126,9 +126,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
-            /* timecmp_lo */
+            /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
             uint64_t timecmp = env->timecmp;
-            return timecmp & 0xFFFFFFFF;
+            return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp = env->timecmp;
@@ -139,8 +139,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
             return 0;
         }
     } else if (addr == mtimer->time_base) {
-        /* time_lo */
-        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+        /* time_lo for RV32/RV64 or timecmp for RV64 */
+        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
+        return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
     } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
         return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
@@ -167,18 +168,29 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
-            /* timecmp_lo */
-            uint64_t timecmp_hi = env->timecmp >> 32;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                mtimer->timebase_freq);
-            return;
+            if (size == 4) {
+                /* timecmp_lo for RV32/RV64 */
+                uint64_t timecmp_hi = env->timecmp >> 32;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                /* timecmp for RV64 */
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                                                  value, mtimer->timebase_freq);
+            }
         } else if ((addr & 0x7) == 4) {
-            /* timecmp_hi */
-            uint64_t timecmp_lo = env->timecmp;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                value << 32 | (timecmp_lo & 0xFFFFFFFF),
-                mtimer->timebase_freq);
+            if (size == 4) {
+                /* timecmp_hi for RV32/RV64 */
+                uint64_t timecmp_lo = env->timecmp;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "aclint-mtimer: invalid timecmp_hi write: %08x",
+                              (uint32_t)addr);
+            }
         } else {
             qemu_log_mask(LOG_UNIMP,
                           "aclint-mtimer: invalid timecmp write: %08x",
-- 
2.35.1


