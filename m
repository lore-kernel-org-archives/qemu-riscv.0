Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BADC44500
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1pe-0003aT-2K; Tue, 07 Jul 2026 05:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pc-0003a6-Qg
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pb-0002Hv-7g
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:11:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493b786d6c0so21045585e9.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415466; x=1784020266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gmonhamQuGTG+bCqFaxE830icf/nuXCN0b1b3D9IYLk=;
 b=eKRpmLVxn85t9jnHli3p7LGUxoR0bh4QRloWHy3lSlFtlRj+GFfrYY2U2flAQx1Z8A
 Qj+O+TjRMXjkEyBHluzM1Zfv5ybq3ex8CB7d3dp0NS9jG+ULfUkYqFLWOS+2n6d38i8M
 KanTjDMkJCz4srvtWoddsHBeJwY+eR0T7xlyLfbBwtH/ILnZXHf2hZEgpV3Y7Blgnwe6
 5wEWgjccQZdQh0Vb8t5Lm18l7KPUPSKtHOWaV3a01ucPSXHYlfy/WV50LF4MP4XtiE4i
 fU1eqoHGkcNltICR8iFvvofBCL1vg1DtIKVnRHhnqhTFt8vdJRrgaa553NcG48KMyFOW
 lQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415466; x=1784020266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gmonhamQuGTG+bCqFaxE830icf/nuXCN0b1b3D9IYLk=;
 b=AywRUtYIJKIywIapM2btfZoAwi1Dm9h9VCyZ3chKpakl+iNtfr+vJ7SxVzJokilrwo
 9lDjZNbt/OsQ/PGOcHuTpMs8W/uo1lgyasAHNNCYzwKQfKb6ddsAlP0zC5w1/m5ju6dp
 dSut8b5lk09CX/M5ySnq7fDLe61F7Hv8bcwCc7hhM9ZB0b2TJjVlwf7KmVrl5CDzGYVE
 jyZqlW401/NwI/w6053F9JXuyCCI6icY9o9AaSLOpFAKrvLSdUAg0mVNCXufbVWtAzOv
 xlgbvAvIJMlv9sLSZWCnFefNc8NoLMAt5w26wKUNNgDk3Y1/8gIw+NJvAOhOFYXQxCj8
 VNTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RporYWtJ7MS9Htu6qtrRmQ23odZM2PffG3E+sF90MlGMBFIhlaDnId/E9abzBjMvXKTiXFWlOoR9pEX@nongnu.org
X-Gm-Message-State: AOJu0Yw/wRasr2NfMWEw5iLJX8uIHFrH28DSYWmUCNu/4TlBV9KBgknR
 ue1uGjQ4ewedh2ky3LcZY5JoLNOBBX5Vc4xcK4iL533EquNVhO2MuT7WSMpDTdZOE6o=
X-Gm-Gg: AfdE7ckv2IEeoR5LJ2CE6FplO1KjUautxN8D1KkKJRxaGxHXJ689Nr4heuz0f/6z6B1
 uIo7nSIygIoEn5f9syEKK/DFydAebZV8dGtfc43cce3r0txfoi2pE4+uNm5xKFlJBlFV1kGnACf
 TjGa0t7WirGkzz6u8BvT6NCJktho7Skj+hCRH9TEmkqqmvXoFsg2JTScmVu3PhuMG+nkH+zwZo2
 66J5BG9OIXMsUNJDVLxZ8OScjzzgSXbuKthJX/m2wewXsLgcctwdbXBOkdawp0jmuVaRUfPvqpW
 YxNnzJuBFyqtdKMQlmNLUrAwsmuj6OJF8OXAA70tz3UX93YQwlfa80DWnvbWEjj1lNPM5wcxaEZ
 na9MtBKT8zd4SK8eAfYU+ZOv6Ss78SvWpAqFjHmlAcmdFrQWmQ62uJYZR2o7Co17vZQV+w1r4w7
 yd2EIdMHTsGAC7+Sz6BwwInOxkZLwtparPxixETUdDoZi54DXmoQ==
X-Received: by 2002:a05:600c:247:b0:490:9d1b:f086 with SMTP id
 5b1f17b1804b1-493df070084mr35254125e9.14.1783415465818; 
 Tue, 07 Jul 2026 02:11:05 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f32660sm41004665e9.2.2026.07.07.02.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:11:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/6] target/riscv: Enable Zicclsm for the compatible CPUs
Date: Tue,  7 Jul 2026 17:10:37 +0800
Message-ID: <20260707091039.2574638-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707091039.2574638-1-frank.chang@sifive.com>
References: <20260707091039.2574638-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=frank.chang@sifive.com; helo=mail-wm1-x32a.google.com
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
index bff3ed5de14..a3cccdfed3c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3021,6 +3021,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
@@ -3093,6 +3094,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
@@ -3179,6 +3181,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zbs = true,
         .cfg.ext_zkt = true,
         .cfg.ext_zbkc = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicsr = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zihintpause = true,
@@ -3222,6 +3225,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zicbom = true,
         .cfg.ext_zicbop = true,
         .cfg.ext_zicboz = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zicntr = true,
         .cfg.ext_zicond = true,
         .cfg.ext_zicsr = true,
@@ -3270,6 +3274,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 
         /* ISA extensions */
         .cfg.mmu = true,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zicsr = true,
         .cfg.pmp = true,
@@ -3329,6 +3334,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
      * The RISC-V Instruction Set Manual: Volume I
      * Unprivileged Architecture
      */
+    .cfg.ext_zicclsm = true,
     .cfg.ext_zicntr = true,
     .cfg.ext_zihpm = true,
     .cfg.ext_zihintntl = true,
@@ -3385,6 +3391,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
         .cfg.max_satp_mode = VM_1_10_SV48,
+        .cfg.ext_zicclsm = true,
         .cfg.ext_zifencei = true,
         .cfg.ext_zicsr = true,
         .cfg.mmu = true,
-- 
2.43.0


