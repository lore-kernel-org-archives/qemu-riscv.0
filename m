Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07FCC369B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 10:57:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u5MtD-0000PA-6U; Thu, 17 Apr 2025 06:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Mt9-0000M9-Ra
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:54:36 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u5Mt6-0003ho-4Q
 for qemu-riscv@nongnu.org; Thu, 17 Apr 2025 06:54:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so486377b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Apr 2025 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744887270; x=1745492070; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=r8MkLirfRd+1eYBUne8MUcSIMDu4+B+icN4ZLFGI96k=;
 b=c4WQwhUkfKkBKJnl7u/qpGOh0oHCvCeJ1A+V7499vqJHEQ5nKifWT7WLvrEOrybB7/
 TDqntR8TXtFosRFYQZ4XGkOVjevPKMbY1CuFwTKdrArtPWEFHIKcC6mj1sH9uC540dpx
 COyRCh6QehHQvaFz3cJD7nvZrcfTdVm3mXl8ShwAiedTDVD9sdZakGb4Z8h0EfY2Gmb7
 O6CdWxmeXbDU08lw1i51s4bGcO0iENgLX0YnfAG5yiNGUsHLg6R8l3XoWGBDiZmlzKJz
 9vv9+6ncu5fpAShrNjh160HqQ9XwujQocAKXnhkgGWBAt2jQpZ5WR5uD1u0JYRdEUqEz
 wwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744887270; x=1745492070;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8MkLirfRd+1eYBUne8MUcSIMDu4+B+icN4ZLFGI96k=;
 b=Eodfh47k3A+3LUgMqY279StN0QjRII3EN56KOsIBaXZZTzCwM1xPaHC7Zla03v4UQ/
 O6URbxSh4Z87knIi3/Isger7ODbxY/XfNpN9BiSKEQWHvX4EJOZlkZ2s5J6LHzh1HQj1
 XIkTdYAYOEV8YXf6cwCyk3l4D62WvFdIvkoUT1Cx3CETt2sbFbnYfuomWzy/gYxWSIX/
 lU1amJHU5DmgPhXSoHqJvT/Vj7G1YUXRSUuK50ylEIt+3kasDzJe1stwUfXm72TtWTc0
 gNaMtGUwnGd5O4R7orXF/47Z+hAlNinqbwudLZeK7R+2lcXtdL5BqVTkjZ1DZjq6FVQS
 u+Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDc0uJnTWVa6eEsjx4UjKiwHzPoxMx3mAbFf/YgSKLzob2CHyBRnR3WdvMS0i2SC+8RDE5rw4PBCqf@nongnu.org
X-Gm-Message-State: AOJu0YyaPupOf9wLD844E3EAf3ZvnM5FZMMr0eaweB4J2MK51vnn+aum
 teLdNxh/KAgyjctrmRJCTf8rQbi84Z771IJXolCbGscQqdhFVljX99XjOQO47ZE=
X-Gm-Gg: ASbGncuHFvda0C8RFwt0Tj27VP6YegTHmBD8hCpDwVd+0e27OUzHtSeLNm+lc3Zs3Ir
 KYFMaOo0MWnPPJaOFsxqUMHCRoxxFEDOCy1N/p6HEWk0HWeGHakzNoteeN2WDK6wG6HX1A3hKft
 bVJs5cUGj1PVekVrmWSkHJfBhy1uL8ap2TfgoAWHudWwtnLkHRgR7/8p81tu7p4Cz+igpzDHTtw
 p2lL3ZMx9l+O1m+/yygGNNTLZGGLGqQ50rGUuzcZyHDPDxNA9lTz5r8HjXlnWJJT7br3y011lE8
 pM08aNgm+MFYqThVdCIC9ykZYqYDfZV9adzlEHVQ8BKSy1YWGgp4hAbGXoxfx0g=
X-Google-Smtp-Source: AGHT+IElia6RPXyh3KzKaXLcl6TnKXDgngxoI7YijmJNyiQlaxFIOp7ANOpA1cM15IoLDVGO9WH/AA==
X-Received: by 2002:a05:6a20:d709:b0:1f5:59e5:8ad2 with SMTP id
 adf61e73a8af0-203b3ee9a1dmr8408810637.24.1744887270404; 
 Thu, 17 Apr 2025 03:54:30 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ddaasm12366251b3a.138.2025.04.17.03.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 03:54:30 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 16/18] hw/misc: riscv_wgchecker: Implement correct
 block-access behavior
Date: Thu, 17 Apr 2025 18:52:47 +0800
Message-Id: <20250417105249.18232-17-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250417105249.18232-1-jim.shu@sifive.com>
References: <20250417105249.18232-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The wgChecker is configurable for whether blocked accesses:
* should cause a bus error or just read return zero and write ignore
* should generate the interrupt or not

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/misc/riscv_wgchecker.c | 169 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 2 deletions(-)

diff --git a/hw/misc/riscv_wgchecker.c b/hw/misc/riscv_wgchecker.c
index 8839d898c9..5d2af7946f 100644
--- a/hw/misc/riscv_wgchecker.c
+++ b/hw/misc/riscv_wgchecker.c
@@ -100,6 +100,169 @@ REG32(SLOT_CFG,             0x010)
 #define P_READ                  (1 << 0)
 #define P_WRITE                 (1 << 1)
 
+static void decode_napot(hwaddr a, hwaddr *sa, hwaddr *ea)
+{
+    /*
+     * aaaa...aaa0   8-byte NAPOT range
+     * aaaa...aa01   16-byte NAPOT range
+     * aaaa...a011   32-byte NAPOT range
+     * ...
+     * aa01...1111   2^XLEN-byte NAPOT range
+     * a011...1111   2^(XLEN+1)-byte NAPOT range
+     * 0111...1111   2^(XLEN+2)-byte NAPOT range
+     * 1111...1111   Reserved
+     */
+
+    a = FROM_SLOT_ADDR(a) | 0x3;
+
+    if (sa) {
+        *sa = a & (a + 1);
+    }
+    if (ea) {
+        *ea = a | (a + 1);
+    }
+}
+
+typedef struct WgAccessResult WgAccessResult;
+struct WgAccessResult {
+    bool is_success;
+    bool has_bus_error;
+    bool has_interrupt;
+    uint8_t perm:2;
+};
+
+static WgAccessResult wgc_check_access(
+    RISCVWgCheckerState *s, hwaddr phys_addr, uint32_t wid, bool is_write)
+{
+    WgCheckerSlot *slot, *prev_slot;
+    uint32_t cfg_a, prev_cfg_a;
+    uint64_t start, end;
+    int slot_id, wgc_perm = 0;
+    WgAccessResult result = { 0 };
+
+    bool is_matching = false;
+    bool slot0_be, slot0_ip;
+    bool matched_slot_be = false, matched_slot_ip = false;
+
+    for (slot_id = 0; slot_id < s->slot_count; slot_id++) {
+        slot = &s->slots[slot_id + 1];
+        cfg_a = FIELD_EX32(slot->cfg, SLOT_CFG, A);
+
+        if (cfg_a == A_TOR) {
+            prev_slot = &s->slots[slot_id];
+
+            prev_cfg_a = FIELD_EX32(prev_slot->cfg, SLOT_CFG, A);
+            if (prev_cfg_a == A_NA4) {
+                start = FROM_SLOT_ADDR(prev_slot->addr) + 4;
+            } else if (prev_cfg_a == A_NAPOT) {
+                decode_napot(prev_slot->addr, NULL, &start);
+                start += 1;
+            } else { /* A_TOR or A_OFF */
+                start = FROM_SLOT_ADDR(prev_slot->addr);
+            }
+            end = FROM_SLOT_ADDR(slot->addr);
+        } else if (cfg_a == A_NA4) {
+            start = FROM_SLOT_ADDR(slot->addr);
+            end = start + 4;
+        } else if (cfg_a == A_NAPOT) {
+            decode_napot(slot->addr, &start, &end);
+            end += 1;
+        } else {
+            /* A_OFF: not in slot range. */
+            continue;
+        }
+
+        /* wgChecker slot range is between start to (end - 1). */
+        if ((start <= phys_addr) && (phys_addr < end)) {
+            /* Match the wgC slot */
+            int perm = ((slot->perm >> (wid * 2)) & 0x3);
+
+            /* If any matching rule permits access, the access is permitted. */
+            wgc_perm |= perm;
+
+            /*
+             * If any matching rule wants to report error (IRQ or Bus Error),
+             * the denied access should report error.
+             */
+            is_matching = true;
+            if (is_write) {
+                matched_slot_be |= FIELD_EX64(slot->cfg, SLOT_CFG, EW);
+                matched_slot_ip |= FIELD_EX64(slot->cfg, SLOT_CFG, IW);
+            } else {
+                matched_slot_be |= FIELD_EX64(slot->cfg, SLOT_CFG, ER);
+                matched_slot_ip |= FIELD_EX64(slot->cfg, SLOT_CFG, IR);
+            }
+        }
+    }
+
+    /* If no matching rule, error reporting depends on the slot0's config. */
+    if (is_write) {
+        slot0_be = FIELD_EX64(s->slots[0].cfg, SLOT_CFG, EW);
+        slot0_ip = FIELD_EX64(s->slots[0].cfg, SLOT_CFG, IW);
+    } else {
+        slot0_be = FIELD_EX64(s->slots[0].cfg, SLOT_CFG, ER);
+        slot0_ip = FIELD_EX64(s->slots[0].cfg, SLOT_CFG, IR);
+    }
+
+    result.is_success = is_write ? (wgc_perm & P_WRITE) : (wgc_perm & P_READ);
+    result.perm = wgc_perm;
+    if (!result.is_success) {
+        if (is_matching) {
+            result.has_bus_error = matched_slot_be;
+            result.has_interrupt = matched_slot_ip;
+        } else {
+            result.has_bus_error = slot0_be;
+            result.has_interrupt = slot0_ip;
+        }
+    }
+
+    return result;
+}
+
+static MemTxResult riscv_wgc_handle_blocked_access(
+    WgCheckerRegion *region, hwaddr addr, uint32_t wid, bool is_write)
+{
+    RISCVWgCheckerState *s = RISCV_WGCHECKER(region->wgchecker);
+    bool be, ip;
+    WgAccessResult result;
+    hwaddr phys_addr;
+
+    be = FIELD_EX64(s->errcause, ERRCAUSE, BE);
+    ip = FIELD_EX64(s->errcause, ERRCAUSE, IP);
+    phys_addr = addr + region->region_offset;
+
+    /*
+     * Check if this blocked access trigger IRQ (Bus Error) or not.
+     * It depends on wgChecker slot config (cfg.IR/IW/ER/EW bits).
+     */
+    result = wgc_check_access(s, phys_addr, wid, is_write);
+
+    if (!be && !ip) {
+        /*
+         * With either of the be or ip bits is set, further violations do not
+         * update the errcause or erraddr registers. Also, new interrupts
+         * cannot be generated until the be and ip fields are cleared.
+         */
+        if (result.has_interrupt || result.has_bus_error) {
+            s->errcause = FIELD_DP64(s->errcause, ERRCAUSE, WID, wid);
+            s->errcause = FIELD_DP64(s->errcause, ERRCAUSE, R, !is_write);
+            s->errcause = FIELD_DP64(s->errcause, ERRCAUSE, W, is_write);
+            s->erraddr = TO_SLOT_ADDR(phys_addr);
+        }
+
+        if (result.has_interrupt) {
+            s->errcause = FIELD_DP64(s->errcause, ERRCAUSE, IP, 1);
+            qemu_irq_raise(s->irq);
+        }
+
+        if (result.has_bus_error) {
+            s->errcause = FIELD_DP64(s->errcause, ERRCAUSE, BE, 1);
+        }
+    }
+
+    return result.has_bus_error ? MEMTX_ERROR : MEMTX_OK;
+}
+
 /*
  * Accesses only reach these read and write functions if the wgChecker
  * is blocking them; non-blocked accesses go directly to the downstream
@@ -109,23 +272,25 @@ static MemTxResult riscv_wgc_mem_blocked_read(void *opaque, hwaddr addr,
                                                uint64_t *pdata,
                                                unsigned size, MemTxAttrs attrs)
 {
+    WgCheckerRegion *region = opaque;
     uint32_t wid = mem_attrs_to_wid(attrs);
 
     trace_riscv_wgc_mem_blocked_read(addr, size, wid);
 
     *pdata = 0;
-    return MEMTX_OK;
+    return riscv_wgc_handle_blocked_access(region, addr, wid, false);
 }
 
 static MemTxResult riscv_wgc_mem_blocked_write(void *opaque, hwaddr addr,
                                                uint64_t value,
                                                unsigned size, MemTxAttrs attrs)
 {
+    WgCheckerRegion *region = opaque;
     uint32_t wid = mem_attrs_to_wid(attrs);
 
     trace_riscv_wgc_mem_blocked_write(addr, value, size, wid);
 
-    return MEMTX_OK;
+    return riscv_wgc_handle_blocked_access(region, addr, wid, true);
 }
 
 static const MemoryRegionOps riscv_wgc_mem_blocked_ops = {
-- 
2.17.1


