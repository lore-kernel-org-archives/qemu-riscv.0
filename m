Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC7606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zieud0ic
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTZCB-0000ha-EK; Wed, 18 Nov 2026 01:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1xTZC7-0000fo-IS
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 01:30:59 -0500
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1xTZC5-0001mz-Mz
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 01:30:59 -0500
Received: by mail-pj2-x06.google.com with SMTP id
 98e67ed59e1d1-3ad211ad92bso96620a91.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 22:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794983456; x=1795588256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DAPZiVlTSv4Q1SPNkDONYwtg41LmM9CGQx8AOJx5Xpg=;
 b=Zieud0ic4lyGpl4mg3sYTQEeBNDHrHUDW8KgWM46aX3PXmK9Zf+8yyHR/QrSOvm88g
 B/nChFmSytY6A530qqOe5yX5dhYYAl2JtJlLZMbzogV4i9tNn5tfgpvjxBK8b33Um9T/
 5MqEhprYIKiq5/hgdqvn1mrvfMERFL/WbYRFYp3SeKMuMwDK04z+OJQ5mpJV28vyl7dO
 pMJ0/nLF0fPgSQ6PV5ShQukUiHh6FpfHi68nvpERsTBeL6aeZZrh5d71FAH09Y2BYS/l
 7+TAT70bkISh/9CQIyTw5w6GzFqn6OwJ+SAd7YhbEHifRbL8W09GxA6Foiq9ASgMF+rb
 uEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794983456; x=1795588256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DAPZiVlTSv4Q1SPNkDONYwtg41LmM9CGQx8AOJx5Xpg=;
 b=PwauicPE/3+QqKgps7OV/dTSqi5HWGtG+pRHgpArHxS7AVipCqW4Ciy8hHr4Q9pcgE
 QRPEAUwK2wh3D0ch/NWN/7mdhqGZ1XZkI7gvi+hre2+ucik2o9mLG6thQVGVQz9BPlP8
 KLy7JqRmP2fqwN9aGPaUj1svJxP91mCgGr91M1nNsNv9H+0SDN68t/ofIvXlu7neiFZ/
 qbOswQYemFVFnDzBfGTA51PAB8WF81nBMWY+FanP+fhITIzMtWmB5M2wpiOO+tflaNgn
 QmN8m572EJGOdufpIxWTJRu/1Fk02FmGNvUyelyhcbuDNZXWHQ6CdKFRI5BXwzDVsckh
 XXHg==
X-Forwarded-Encrypted: i=1;
 AL+hErE8Yj/sD7r/HzgQTFkRwr0RQhsmVt2Io6iXAhTsIuGb/JnoTuFN8aH/6CRMfG45VXtz8FsugOizeDWu@nongnu.org
X-Gm-Message-State: APuU4Z+rQxQtzCfH4ZJYgZT5K+upEb6XJBmhTYZITOY/VALtkHGiUuVV
 rDNBWlMmr2/PadCT1PVS9a8+qWCAv46GfOkPkQyqRuY6OHulYp4B+NAG
X-Gm-Gg: AZFdTZdheDmM6B+r5FEVVMQ7xO/cchQDL+qZqkteCiTHDmx4GLhQafTxkSx99fKpVzr
 2rQ8ZWytf091/iD+hU/SU8dvtM7+hAyqTXVXIoKAANAu5tPvewQrAkBxSzcDJvvQfnZ9YVSIZP/
 piPKgiw7HH1cpvUBMobg5VQzSeKcEVtu0BI2W23nM1bjQ9qj9sTsl+RT28S+J3fbFoziCa1h1Sc
 3sE5ZRNrft2N7q4dOh/x9MChK2YE9M5UoMJX+T5DgF74pnvAprwN+PsMP3z0mU+gmTGB7LpERbx
 HS65Ljt9nfFmh1q9heybz5rElgCAel+s3mvpDjUvxLErOoRh2vUzciTUm2xfl48uUTjkNmhBgK3
 OYwZnpnv/Vsu8Ad5m9RHaFN4phIyW09WttYoi1zFGP83Uwii2Yxdxiu5YWv7va2T8uxe7QUgKDS
 HsxyBEbXxFGkBhmjJn3ujLWiI1Wev/scF1Umhm2LLjMpAHMFOtj7/wEGbXBtkoQksKa7/TWTCNX
 BIFp4syLrQdtHCNnulnZbMTHVewgSK+TI/95d45vOHyijW6UXZx4woosdfls1+AN6P5hz7F3Ad/
 90kXGVeq9uPWNgpmll7OMfNqgzq4VX7VowBu3a6HNmOA86h0W3CFCNXD9g==
X-Received: by 2002:a17:90b:4410:b0:3ac:1c76:61c3 with SMTP id
 98e67ed59e1d1-3b3d07a8476mr1752305a91.27.1794983455282; 
 Tue, 17 Nov 2026 22:30:55 -0800 (PST)
Received: from Dell-WorkStation.localdomain ([149.118.62.92])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b3d56ab352sm826852a91.2.2026.11.17.22.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 22:30:54 -0800 (PST)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Reject shadow-stack accesses in Bare mode
Date: Wed, 18 Nov 2026 14:30:27 +0800
Message-ID: <20261118063027.33313-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::6;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-pj2-x06.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Zicfiss requires shadow-stack memory accesses to raise a store/AMO
access fault when the effective privilege is below M and satp.MODE
(or vsatp.MODE when virtualized) is Bare.

get_physical_address() currently returns an identity mapping with full
permissions for Bare before applying any shadow-stack checks. A
shadow-stack instruction can therefore access ordinary memory instead
of taking the required exception.

Reject shadow-stack accesses in the first-stage Bare path using
TRANSLATE_PMP_FAIL, so the existing exception handling reports an
access fault. SSPOPCHK's existing unwind metadata promotes its load
fault to the required store/AMO fault.

Apply the same restriction to the MMU-disabled identity-mapping path,
while preserving the M-mode fast path.

Restrict the check to the first stage so a valid VS-stage shadow-stack
mapping can still be used with G-stage Bare, subject to the usual
PMP/PMA checks.

Fixes: 669b4867495c ("target/riscv: mmu changes for zicfiss shadow stack protection")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4432
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/tcg/cpu_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..8f6f980ecf 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1131,6 +1131,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
+        if (mode != PRV_M && first_stage && is_sstack_idx) {
+            return TRANSLATE_PMP_FAIL;
+        }
         *physical = addr;
         *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
@@ -1181,6 +1184,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     case VM_1_10_SV57:
       levels = 5; ptidxbits = 9; ptesize = 8; break;
     case VM_1_10_MBARE:
+        if (first_stage && is_sstack_idx) {
+            return TRANSLATE_PMP_FAIL;
+        }
         *physical = addr;
         *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
-- 
2.43.0


