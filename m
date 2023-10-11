Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31364CD6E71
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:45:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqZWe-0003sL-BX; Wed, 11 Oct 2023 09:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqZWZ-0003qg-UT
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 09:45:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqZWN-0001VT-Ar
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 09:45:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32c9f2ce71aso1646101f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697031905; x=1697636705;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fb2+LvO1+deM50mzL+oyBsOTtdeQSiHaKqKpKzvLC4g=;
 b=Vd21BnWRdXAAXErB23TmzB5raArfdlqPAFaYOtim5JdBc4XL/7v+q2xpsGhaz2/15V
 W5ed91wgLDmmWRcvqTv4r0LYKE7oIMZh+D/vWry2uCOboZlqZRZ1+MnmyR3OpVNgrZFo
 JEe25kTRUsBhBalyQUWGDbwNDiIfQ4WnNvQ2KrkfjJo+i156D6Rl0PJgzlFStBubl8H+
 hQXwxFnYZS//e2lpk5Wx2d7EVIuPxwDB+Dvr3h0DOQjmCPbn9UPDZ0pMw4BdmozrpBPP
 EMbDnRVMv7PbO2ZieYUS+7X2VkaiqfQJnKExCgFRvIF600d8NYM5djP9Kpepz9go+eqT
 OzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697031905; x=1697636705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fb2+LvO1+deM50mzL+oyBsOTtdeQSiHaKqKpKzvLC4g=;
 b=GDu35lnrFprB8nfjjY2JTMe8cXKsvFc6fS2N780vWbhoBeqXWCwzuN8FpAIijMAX96
 eHh1A70TZsrbieS1fnjyMWRftEeOW2HC8GJ8kljsVo9HCuwJ+5FYq8p+yw3H6CLROcW5
 e8h0Y16faw/2RomWStcvGnpyGqv8uGk26Is/p1NDKzly+KtrGxdbCnhlw9eOmc/8Fkfc
 LCeWswpiHm8SrF+Kw0A75AaPrvuqml4wnoihUwtm9GiWl6Rpy+daqK8j6p3XbrNcevRa
 eYS6iIu8bj61T5iV9PJnGaA7084a/Uchn6tfNkq4nZNKaDDD/z1XAvFQCaiTWzy9F9Pm
 DSOA==
X-Gm-Message-State: AOJu0Yy1b1rjmGbEVgxtTh1nccsUofAT1b1oi1DS923s2wjc8dUR0evb
 sNfmMOWV3vZogUM7pP8qCtrERmcdpoeYg0aWrYvTzQ==
X-Google-Smtp-Source: AGHT+IH9R86mBtDtpLGy9m6BXuA2VmcEXRTR81RVQwhbXVy8e6zjuxLISPaUVW8g0AWZWCgvbmAyDw==
X-Received: by 2002:a5d:6a08:0:b0:320:896:5ea8 with SMTP id
 m8-20020a5d6a08000000b0032008965ea8mr17997566wru.19.1697031905347; 
 Wed, 11 Oct 2023 06:45:05 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm15583141wru.35.2023.10.11.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 06:45:04 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v3 2/6] target/riscv: Check for async flag in case of
 RISCV_EXCP_SEMIHOST.
Date: Wed, 11 Oct 2023 14:44:46 +0100
Message-Id: <20231011134450.117629-3-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011134450.117629-1-rkanwal@rivosinc.com>
References: <20231011134450.117629-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

RISCV_EXCP_SEMIHOST is set to 0x10, which can be a local interrupt id
as well. This change moves RISCV_EXCP_SEMIHOST to switch case so that
async flag check is performed before invoking semihosting logic.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3a02079290..8ffb31b607 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1606,15 +1606,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
-    if  (cause == RISCV_EXCP_SEMIHOST) {
-        do_common_semihosting(cs);
-        env->pc += 4;
-        return;
-    }
-
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
+        case RISCV_EXCP_SEMIHOST:
+            do_common_semihosting(cs);
+            env->pc += 4;
+            return;
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
-- 
2.34.1


