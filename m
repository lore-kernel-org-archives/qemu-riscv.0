Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5764AD6E2CD
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 07:48:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDfQK-0002SM-JN; Wed, 20 Nov 2024 02:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQI-0002RR-Hu
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:50 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tDfQG-0006Qh-Da
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 02:46:50 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-20c7ee8fe6bso17379775ad.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Nov 2024 23:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732088807; x=1732693607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5NXDXiAf6nuE9+jlkJ/8ZDxukjz+9DMfhSzOI8Deco=;
 b=CbeIiy+kWl7/AF+OYHSlsBT4INnoTeSBBQGjMLFrYIoJO2OiL6QEGFX15cxCypydSY
 sGqOGMBez2NVitUEY7kSVCrhLPsnhWH45zETtj0eJ7sDxFPPXAwwPQ5f+h2uonvarDEu
 m92KD/KhYIe3bbrFAER8XPb/m4TaNwHcOlwaexhCSL8ibxKH7FAab7vE7byEP4S80y5u
 hnlrg0chpr1cUB5u0xzdrksrrON6Fopcts5y+FhxGlu621H0LZoYg21PW/s4giHSpkvR
 LnZBylkgRVisO6TsJTuApMbPiTmcab6+r4sXvrswnlldX/FPrAQEyF6P3Jocff/WJZmP
 LXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732088807; x=1732693607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5NXDXiAf6nuE9+jlkJ/8ZDxukjz+9DMfhSzOI8Deco=;
 b=m9wUfIexHV0D3SBcxfT3DOAMDJ5f73xU7jnkleGSUNjWeSGGqZpVc3jtQMjgknUwMr
 6lai8qAnxOVjrK4VQRPjIC/sA8ehetmSx73/0kIFIEZe5m0vnK6K3DA/5VhLz23AN+FH
 bV8A5eFG/9Xq51MbAkhSmrp7/NJ+RdImnesKRnhCZIXcvBPNR18PDNuoFI4+Yo0v421a
 dDuEiGl3DGMP9FKFHBeGCnebz2nkH4Opnc3RNJ5Y+fTu95bvd3EDp48k5i6TeAI7GBpD
 3l+11d/ZP3gxH5dYXDCn3CbdBhasJLQDLpLQ6z554cAwGJ+0ZdwWw/t7e+2vqUsFn4Jf
 6ZHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqpU43uXolBmQOaeu27iNJf6zelq0Urgz8YtZI8RoS+4/suBVPHqC+3kaO22OLO0KTnfIjNRHk7vHU@nongnu.org
X-Gm-Message-State: AOJu0YwB9Beq6najJKf0H2mF025OGZtz/W41veBR2ScSvNADSorzqehq
 vhsWHBpWvonWpuZGnD4U0A6kBcTzSrOq0bYWrV6SEz43P1bKB1kcuHMFqZeucIw=
X-Gm-Gg: ASbGncvS4hJqpgo5WPK5nm6IQnDJ3J85by17xdw8kIxf5YrjK9BXKyTlx5eviQWPIqK
 vggiW6jynZop8jQotgfEOGuBnwju4arvGZkB1zcu3VUk/takdf+LHJcbGoZ0PapZEGEzuXpKQTX
 QVxRKda6zv732LR9AyZ8EzOfqa7ZtqORfLArc1EoAdiw3/vjOxiF2ChucUBF24DGVbilpHEElnZ
 lCS1lRuHgKWkQBhplY4plFNTnVUHOjI5dtNII2UHssmEypdItYWuKRgoJ2rQhH1bFUgFMRQKU5u
 4Hp4mS0hOSSTZUrGldCD1jqwi2k/3bQrVf1sBoetpA==
X-Google-Smtp-Source: AGHT+IGrhehldMEdxERdueUWf135SWsdhHLzmIloTJTFHxN/4dgqXAGOWkAwPb4nN0hLSIC/Dk9/7w==
X-Received: by 2002:a17:902:ec89:b0:20c:9326:559 with SMTP id
 d9443c01a7336-2126a3ec896mr19685075ad.29.1732088807088; 
 Tue, 19 Nov 2024 23:46:47 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0f51fe0sm86206255ad.233.2024.11.19.23.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 23:46:46 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v4 4/6] target/riscv: Check memory access to meet svukte rule
Date: Wed, 20 Nov 2024 15:48:52 +0800
Message-Id: <20241120074854.1767780-5-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120074854.1767780-1-fea.wang@sifive.com>
References: <20241120074854.1767780-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Follow the Svukte spec, do the memory access address checking

1. Include instruction fetches or explicit memory accesses
2. System run in effective privilege U or VU
3. Check senvcfg[UKTE] being set, or hstatus[HUKTE] being set if
instruction is HLV, HLVX, HSV and execute from U mode to VU mode
4. Depend on Sv39 and check virtual addresses bit[SXLEN-1]
5. Raises a page-fault exception corresponding to the original access
type.

Ref: https://github.com/riscv/riscv-isa-manual/pull/1564/files

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 55 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0a3ead69ea..edb106b8a0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -857,6 +857,55 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
     return TRANSLATE_SUCCESS;
 }
 
+/* Returns 'true' if a svukte address check is needed */
+static bool do_svukte_check(CPURISCVState *env, bool first_stage,
+                             int mode, bool virt)
+{
+    /* Svukte extension depends on Sv39. */
+    if (!(env_archcpu(env)->cfg.ext_svukte ||
+        !first_stage ||
+        VM_1_10_SV39 != get_field(env->satp, SATP64_MODE))) {
+        return false;
+    }
+
+    /*
+     * Check hstatus.HUKTE if the effective mode is switched to VU-mode by
+     * executing HLV/HLVX/HSV in U-mode.
+     * For other cases, check senvcfg.UKTE.
+     */
+    if (env->priv == PRV_U && !env->virt_enabled && virt) {
+        if (!get_field(env->hstatus, HSTATUS_HUKTE)) {
+            return false;
+        }
+    } else if (!get_field(env->senvcfg, SENVCFG_UKTE)) {
+        return false;
+    }
+
+    /*
+     * Svukte extension is qualified only in U or VU-mode.
+     *
+     * Effective mode can be switched to U or VU-mode by:
+     *   - M-mode + mstatus.MPRV=1 + mstatus.MPP=U-mode.
+     *   - Execute HLV/HLVX/HSV from HS-mode + hstatus.SPVP=0.
+     *   - U-mode.
+     *   - VU-mode.
+     *   - Execute HLV/HLVX/HSV from U-mode + hstatus.HU=1.
+     */
+    if (mode != PRV_U) {
+        return false;
+    }
+
+    return true;
+}
+
+static bool check_svukte_addr(CPURISCVState *env, vaddr addr)
+{
+    /* svukte extension excludes RV32 */
+    uint32_t sxlen = 32 * riscv_cpu_sxl(env);
+    uint64_t high_bit = addr & (1UL << (sxlen - 1));
+    return !high_bit;
+}
+
 /*
  * get_physical_address - get the physical address for this virtual address
  *
@@ -894,6 +943,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     MemTxResult res;
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     int mode = mmuidx_priv(mmu_idx);
+    bool virt = mmuidx_2stage(mmu_idx);
     bool use_background = false;
     hwaddr ppn;
     int napot_bits = 0;
@@ -901,6 +951,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     bool is_sstack_idx = ((mmu_idx & MMU_IDX_SS_WRITE) == MMU_IDX_SS_WRITE);
     bool sstack_page = false;
 
+    if (do_svukte_check(env, first_stage, mode, virt) &&
+        !check_svukte_addr(env, addr)) {
+        return TRANSLATE_FAIL;
+    }
+
     /*
      * Check if we should use the background registers for the two
      * stage translation. We don't need to check if we actually need
-- 
2.34.1


