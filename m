Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452AC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi4R1-0001Cx-7l; Fri, 10 Jul 2026 02:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qh-00017m-MO
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:44 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qf-0001tm-9N
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cace91f112so4695065ad.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2026 23:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783663780; x=1784268580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QdAr9D/AKWbbgVhux8nSZTA92u/F5FOChbkl4ZDK1HI=;
 b=iKkl1krAs3LtTmiGf7eSqgygWbH6dpQmZxFwQD/TaI69T8X5lDeF3HBiGAI96u7wuf
 45zIUASKnu6MstwWMdqOsY8jrvl8xZgzHky19ELU4TE9QuuKbb5w56/xPczrkWIoIfaC
 oTJT2KpvbmcAqxo3EQ4DerHkVF8xLd7i+OjcFwpOL+PpbuiF/U/V+9/jfGcGhXNsB6EL
 ZfcFaZ1DlgauZPBIAHCdcsaJzYATzAsjhnx2SKrudZpNJJffoEyHm3jbHi3iFi8jmrk5
 MBTnwg9j8Thc8k4HtN5jJZpVpUfOaKyE9MMJ9KEv0tVG/T/QTCuIqpGvFzT/3bmDHXcO
 7TLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783663780; x=1784268580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QdAr9D/AKWbbgVhux8nSZTA92u/F5FOChbkl4ZDK1HI=;
 b=EtGnSpRHI6qssXJ8K3ext/roaIi6xLq0EQfaBro7oaHLW9jKav5glQpZEVq/DREYnp
 H4rSIGWrchrjKBsvEW104N9tUtCu7OWRB/BoYcn0cOoWgK1XeYBP8d1Ewuo9XhSQPVOS
 RqkTb2iVC9QvfFIZ+T7JbaVa1QFvh6zhNAABy7f7ry4QNbhwktlQY1nLJ1AigF4PRw/k
 8jppY9NQUe6jqXORQrclEKgGexzKg1E/ZK50Rb7j5OilcM5j+z8YReYcjtlxrvyT4om5
 Cb5OYwDon1hcxe7b9/iNK/PKiZVDdTJkuxYjdOcvXyrvTa6JuD5PNFCvmeoDKxtQOhXa
 Mw0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr6TH2m+HUo+E08GH7sPzvjokEOW9t+4yb6+Rbz/MuDG9dadGvDrDwiL6GcC4Vg2BGLnogrRjPRFoo1@nongnu.org
X-Gm-Message-State: AOJu0Yy7JbApSQB/p8z9+HSm6ZrLvO2chy4RNZ9fpiu1IratWsYUCOw+
 xksr0gusUg8WauIHUMgRDGIYvf2ELBA1awPkX56KrtVsyKTLFUBxU7QLG05vGNrJ6cb8RysWCaT
 c0+T5SpLgGQ==
X-Gm-Gg: AfdE7cn6KlNGSE/t6HN3pGNTJ452gr0YSb120NfURmDgkWJdy7nTiaLC7ccoidse/j+
 NiEnlQc5J6tLQLc6bqEH8PEQhiqx/FZLYot9lvL7xMLSRC5a1bJ+GZsY12wwD8vN1l3r96M/hav
 93PpQIKUI5WbePQr7+cygvLFNOCKIs05vGWvd6o2Cbl74F4OvPgONOL7x85Fm0vllJpwBFniWiL
 xZmGbOdMdtRZGUoPl2UriFxfU5eNl/A14hwRC9/zZYMB9lKPBNFEYPeD2KEO6aqnMsl/HL9kToK
 2yiYjg2RjkmWqbz67H76KQW9jYO42rSapqeXXVTuPD7slxU02PkqhxdSFHn/3SIwbD8kDpqbABm
 SU3oLO1ddsNvvTI40zoV+cbxjjN2H1lwrlpNSrRW1N/xz01nT2gTs9LkKKpY0/qQd/MRGfxI4no
 xakf5Yg2arDlIXMKH8Ki0eB7YoL4LuZzCeBO2spjo=
X-Received: by 2002:a17:903:1670:b0:2ca:52ce:6f74 with SMTP id
 d9443c01a7336-2ccea464790mr119302695ad.29.1783663779961; 
 Thu, 09 Jul 2026 23:09:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d59e33sm53344255ad.74.2026.07.09.23.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 23:09:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 4/7] target/riscv: Enable Zicclsm for the compatible CPUs
Date: Fri, 10 Jul 2026 14:09:11 +0800
Message-ID: <20260710060914.1227027-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060914.1227027-1-frank.chang@sifive.com>
References: <20260710060914.1227027-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Now that Zicclsm is supported, let's enable it for the following
compatible CPUs:

- Base 32 CPU (to be backward compatible)
- Base 64 CPU (to be backward compatible)
- XuanTie (T-Head) C908
- Tenstorrent Ascalon
- Ventana Veyron V1
- XiangShan Kunminghu
- MIPS P8700 (ISA doesn't include Zicclsm, but their datasheet claims that
  it has unaligned load/store support in hardware)

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a82e6563bf..7ee89f6fc4b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3268,6 +3268,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
@@ -3340,6 +3341,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
@@ -3426,6 +3428,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zbs = true,
         .cfg.ext_zkt = true,
         .cfg.ext_zbkc = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zihintpause = true,
@@ -3469,6 +3472,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicond = true,
         .cfg.ext_zicsr = true,
@@ -3518,6 +3522,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 
         /* ISA extensions */
         .cfg.mmu = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zicsr = true,
         .cfg.pmp = true,
@@ -3577,6 +3582,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
      * The RISC-V Instruction Set Manual: Volume I
      * Unprivileged Architecture
      */
+    .cfg.ext_zicclsm = true,
     .cfg.ext_zicntr = true,
     .cfg.ext_zihpm = true,
     .cfg.ext_zihintntl = true,
@@ -3633,6 +3639,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
         .cfg.max_satp_mode = VM_1_10_SV48,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zicsr = true,
         .cfg.mmu = true,
-- 
2.43.0


