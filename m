Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38F2E77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:23:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWAHU-0000RX-JK; Fri, 10 Jan 2025 03:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHF-0000Nx-FO
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:57 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHC-0008Lx-TO
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21661be2c2dso27535155ad.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 00:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736497313; x=1737102113;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WRfq1p2xMwLv+FpB5rIe9iQy0wFQqaVZ+1FOGRhVlXM=;
 b=DflmALIkFxsnsbDbEYdxbdnTJzhXaJn3lJCch+fEqqarooO+U0lvP0Ei6LE1WB/5gT
 +hITBsguEP+zvLI6nfwVrEjQpRmjgFuTX9j+LL5/Bm62br0lhwYrpxO4B2OFSSPCPBpM
 sKV3veYpu7weTLo3JKhbZeCRL2Yck3uJ9aMX5mN79/JHxLNOWYq1o0vlMX6uGWbZP+eK
 Cyqy+0n/dA4XycDKAuJ+c2YveCHNH6irkh5dlJu0jU3wgoYMh7+u+ra2tIkK7ByPAkEJ
 DBS8riqPJsX0qApESVx+/ByMVFaqHYmXqsIbFyCiOgUU4t8nQqWQVd8hu77rdUOh/8pA
 lEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736497313; x=1737102113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRfq1p2xMwLv+FpB5rIe9iQy0wFQqaVZ+1FOGRhVlXM=;
 b=SMoW5gzLclJYShHpKEhnjgN6zOPw/Wfw5Da4bQvPfXDlZaeOzdDi4sYZ++WHWDDBXi
 dcBYUYX/Zzpbva2GRR4QW8vbIj+bpWIggrS1Rg/CKmj1jUCPW78wj+CJmUlv6bZF1Umw
 oPfRr7ZM9x/9J1ZflHitwH1glFrHx2Bt+gmBo7or/w2IW45KBkblwBSZrU7JYwhlEMxb
 6cbPScrtR8nKjoaxGCcRIvo3m3Ir38/AMzsJYDfioheJcwHeWgfvmTgtqi/JrsW81od2
 mliqKgCPJEnxaCExBOdiwlnOv3MGxgcZ1QOEJJ+qten3bcAs5XWDWcuJRpvKeHHTRNe2
 UobA==
X-Gm-Message-State: AOJu0YyolepGj992dwycR10qOWW+LPhBcc7lAebuScSwtLBqinrCD7dc
 RAw3YCYgkGxYdj3K5gMqhyHj1kreTaaJJl5BzSoM5BnnxNzjE4jo6fZYzsvdUOc=
X-Gm-Gg: ASbGncvm/OJp+ejgzEiJSvgcdH5zUsGtIWrMVmUw3+zDrXAYBQM3sRaXnkRhdtMP/1x
 +7rcE4pgUwh9AucDVP+jvNejLhUXTJkDGblTVGZeFcYdW6p2k0eVBv5gm7yo0u8QDVLxWxYcb3c
 ky6PkDr/HhhkVBzQKZU5k+GV9WF/4mik8x9C/8OoA243Dfu8mGkQBC6GIhhk+vDc8r6cySz67WC
 rWTy2PgRuUoI4ahklP51taMxf+bwjy1xmkkDW/4Uu9XzyS75Zz697EEcrFNbXBjNiBKmw==
X-Google-Smtp-Source: AGHT+IFSlLCjkIEK5M7OzE2w2P3L4KxqZeGdA2ef+zWlru9nbnvkkvAn4V7zoteDEm7zmanuxLgtMA==
X-Received: by 2002:a17:903:2311:b0:215:a2e2:53ff with SMTP id
 d9443c01a7336-21a83f36e1dmr151955815ad.11.1736497313568; 
 Fri, 10 Jan 2025 00:21:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ee09sm9278715ad.200.2025.01.10.00.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 00:21:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 10 Jan 2025 00:21:34 -0800
Subject: [PATCH v5 06/11] target/riscv: Add counter delegation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-counter_delegation-v5-6-e83d797ae294@rivosinc.com>
References: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
In-Reply-To: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions for counter delegation, including the new
scountinhibit register and the mstateen.CD bit.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      | 1 +
 target/riscv/cpu_bits.h | 8 +++++++-
 target/riscv/machine.c  | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 08215efb096c..a936300103af 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -392,6 +392,7 @@ struct CPUArchState {
     uint32_t scounteren;
     uint32_t mcounteren;
 
+    uint32_t scountinhibit;
     uint32_t mcountinhibit;
 
     /* PMU cycle & instret privilege mode filtering */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6b1446fb7e99..73f7d37d80ee 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -210,6 +210,9 @@
 #define CSR_SSTATEEN2       0x10E
 #define CSR_SSTATEEN3       0x10F
 
+/* Supervisor Counter Delegation */
+#define CSR_SCOUNTINHIBIT   0x120
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -779,6 +782,7 @@ typedef enum RISCVException {
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
 #define MENVCFG_PMM                        (3ULL << 32)
+#define MENVCFG_CDE                        (1ULL << 60)
 #define MENVCFG_ADUE                       (1ULL << 61)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
@@ -826,7 +830,9 @@ typedef enum RISCVException {
 #define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
 #define ISELECT_MASK_AIA                   0x1ff
 
-/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+/* [M|S|VS]SELCT value for Indirect CSR Access Extension */
+#define ISELECT_CD_FIRST                   0x40
+#define ISELECT_CD_LAST                    0x5f
 #define ISELECT_MASK_SXCSRIND              0xfff
 
 /* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index d81621010dc7..d8445244ab25 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -423,6 +423,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINT32(env.scounteren, RISCVCPU),
         VMSTATE_UINT32(env.mcounteren, RISCVCPU),
+        VMSTATE_UINT32(env.scountinhibit, RISCVCPU),
         VMSTATE_UINT32(env.mcountinhibit, RISCVCPU),
         VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
                              vmstate_pmu_ctr_state, PMUCTRState),

-- 
2.34.1


