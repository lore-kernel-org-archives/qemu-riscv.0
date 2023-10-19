Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B359BCDB465
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 06:57:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtMy9-0008Hr-UN; Thu, 19 Oct 2023 02:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qtMy8-0008DT-Mn
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 02:57:20 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qtMy7-0003LV-7c
 for qemu-riscv@nongnu.org; Thu, 19 Oct 2023 02:57:20 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-49ab0641e77so3334195e0c.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 23:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697698638; x=1698303438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=13SABzWd+/6ya1JIbLuZWuCeDNwTBBsFb2keX55uldQ=;
 b=CvyQppM1JAv+Ta/Myw8jtEzh72UDXOUwkKQ34zNMH6rCiu5GBQ+pIcsibIDiZMDeS4
 DAIucRAKUAu6OI0wjS4zakLzYp1jfa84jJQ9kqDSMLL5SiDDB0ILyC9ht8mZSlK33hzO
 pIXglLgppR/YExqAevk771kjQ6OpsfGA20nX477Wd4wJUEfHR1gMgcpmdBQm8ykgtWEn
 1Hw+0JICVswAF1Xb1RgausQ5JFvW8qPOJXUaKEbtsW0l8jjZMduLjIoiSMKnbF5nFZKn
 qaYw0GCY7d4c9WAxYxjyxwUcTZRaixYXS4Jzl7Rdghm4LcyeUQHG3iHRZXmIeJ4uYYBx
 LH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697698638; x=1698303438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13SABzWd+/6ya1JIbLuZWuCeDNwTBBsFb2keX55uldQ=;
 b=wNV/AFr56kWLp3JTwOmQbpgGJ0OOQrC/yWJ8Ss8dkFp0wGqa1ha1pJDmOQ0H560YRI
 m8ZRDtoc5guVo0aKdtc+VaG9Q9AHgiJWZtBbZPgHkc/54pSN0E3sfo4S8oumH8BAsBmi
 fjLpz7f1w2Pt//FD2F6sSKiuLoluc4iPiX0ZE96X59zNaKZAKE9JfOL7fE20FOOKzMA8
 yrGeQXIB0k5Tr54N5NicHoPAdrzG6PhaIrEV15nYpbIY5MoXt9xu/M5QcskjnMrS9mzL
 gsXzhTHUQ0MjAtp6e8ZI7fmXfqKy7nmvEbK9eg33knrmdrZs58cjpP20f+xlb6BghCr0
 5HsQ==
X-Gm-Message-State: AOJu0Yw0CQnAEd+VyWcfZ+KhoMAJkRNCYk9VdIXtvzz+3FZjQtRLbi5T
 svj4n+ZBaurLUS5Rjh42ZtjlD2TxleUnuTfUg1v5WQ==
X-Google-Smtp-Source: AGHT+IGN06vSvTRUwEydkt3ddKCi+fAWRmpVop7IZIuTCspZADtwuJS/LKoYyVMvf0hMVxU2xsf+Tg==
X-Received: by 2002:a05:6122:2222:b0:496:3906:33e3 with SMTP id
 bb34-20020a056122222200b00496390633e3mr1107747vkb.15.1697698636336; 
 Wed, 18 Oct 2023 23:57:16 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:5302:9b99:4f57:4dc3:993d:4317])
 by smtp.googlemail.com with ESMTPSA id
 k15-20020aa7998f000000b00690bd3c0723sm4507288pfh.99.2023.10.18.23.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 23:57:16 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3] target/riscv: pmp: Ignore writes when RW=01
Date: Thu, 19 Oct 2023 12:27:05 +0530
Message-Id: <20231019065705.1431868-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=mchitale@ventanamicro.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As per the Priv spec: "The R, W, and X fields form a collective WARL
field for which the combinations with R=0 and W=1 are reserved."
However currently such writes are not ignored as ought to be. The
combinations with RW=01 are allowed only when the Smepmp extension
is enabled and mseccfg.MML is set.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in v3:
====
- Rebase on latest riscv-to-apply.next
- Add reviewed-by

Changes in v2:
====
- Default RW to 00 in case of an illegal value

 target/riscv/pmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 4dfaa28fce2..162e88a90a6 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -123,6 +123,11 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
         if (locked) {
             qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
         } else if (env->pmp_state.pmp[pmp_index].cfg_reg != val) {
+            /* If !mseccfg.MML then ignore writes with encoding RW=01 */
+            if ((val & PMP_WRITE) && !(val & PMP_READ) &&
+                !MSECCFG_MML_ISSET(env)) {
+                val &= ~(PMP_WRITE | PMP_READ);
+            }
             env->pmp_state.pmp[pmp_index].cfg_reg = val;
             pmp_update_rule_addr(env, pmp_index);
             return true;
-- 
2.34.1


