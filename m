Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7900BE77166
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 23:17:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIc6g-0001OY-FM; Tue, 03 Dec 2024 18:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6d-0001M7-Pj
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:59 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tIc6c-0001LZ-1S
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 18:14:59 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7fbc65f6c72so5806570a12.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 15:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733267696; x=1733872496;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pG0aQnUQA7YEFMoz0E4tJtn6hJqy67liJfeq3q7vHeU=;
 b=Nzmj3DrlNIkCzdF5AoL2oVlt1XhtzaOoPhC8wUysmU2xPE9Tn61vz5yWKRNO1xSZVr
 ZI1z9I/dgIY3GhtTQiqxBR4mmledrB5ZI0lOG7UkVm/J5SC4Ewaz2za762vnY6QF0FSw
 wcGXxY2z981457oGCMl+cwDLc+3ZnhuQuS5rFviC9ZJFG6j6vwD46qljpDonxITtA6CN
 KJh2dU57v4pwF+VB6SV/aFlBRVF8sQo3HPDG/iWxajvxB+lHS2STK9ZbShm1bBrE/SZV
 QOkw9w2mtYgtQOSiy20l3P6wFsheysNuI3Ae70L7ps2lkbkj55ruD/W/AlyUIat2QQb3
 BZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733267696; x=1733872496;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pG0aQnUQA7YEFMoz0E4tJtn6hJqy67liJfeq3q7vHeU=;
 b=LWrcOQ6KGPlViUDCsPMQY8ylh5g/1UajywQBqdNftcuvHsZINddStHAxGKi6h9wdij
 P09QFXSORkhRO8Pv6vcDXtgpRaGxzBkoWiOEV6Iwf1kBBRYMuSrd+SQUIj5GE4rmOzz8
 MiOj/CF+EBWX7YPgMSdlBvukOzjrZY/cqnRgjaDLMHpiD5t8nExcFmZX2P5/SCzjIDxn
 7alfwPPoQTDo66I5lLqGVVpsxWEAWkCUk5vEZeKz5pIrBkufhE7zgT21ykBIOPYrhXEx
 CDVqxpoi+xpTnW0eu77u1I8fIuS2ojgmpDrvJsYO2o6r13Lyr+3SPEAUEMO2CvUMd4Sn
 qKDA==
X-Gm-Message-State: AOJu0YxAETw2FMqCF5r/poGCnjUYBDPa4orPoaXRpOphd3yGmPXBfVs0
 lcpK69ZVXwOh4+ipYI4pZbASSjd9oij3fIaonkJvOz0Fu5aubWdYd/wR9CWNxRQ=
X-Gm-Gg: ASbGncv0y4uUwrWbd1T5uLzfOcqLdU4I2jAxkOJnwuUInItzMd16OB3v6W2+LNu4eHA
 RHVARYjnVe65SHKAR9wQklX9YiRn53opie84EhftYJErVWwlQh3Z12rXVJD6oNx5r1Z4wVKSs6w
 Igrl8tRy2PmNodvcXPGdmv9FxnNPAhVn4LauC8I2Ut25Mlw768eN8JDWQ4667jOVLj41Vd/AyEo
 yAFW7PyA4HqV8WDuJ2+L77ZuXzO6zP2dHyQZ2RE6fu71c8E3fqm8DSwgQbeZdw=
X-Google-Smtp-Source: AGHT+IHooGOQbGWgbWmWYOflIkzZDuYu5vVnLDYDzFLGw/Lj56bLWHFPasBSFqPOJ8VMCuDQDTKG4Q==
X-Received: by 2002:a17:90b:3803:b0:2ee:edae:75e with SMTP id
 98e67ed59e1d1-2ef011eb672mr5312459a91.13.1733267696547; 
 Tue, 03 Dec 2024 15:14:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254180f78asm11032133b3a.133.2024.12.03.15.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:14:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 03 Dec 2024 15:14:48 -0800
Subject: [PATCH v4 10/11] target/riscv: Add implied rule for counter
 delegation extensions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-counter_delegation-v4-10-c12a89baed86@rivosinc.com>
References: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
In-Reply-To: <20241203-counter_delegation-v4-0-c12a89baed86@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x533.google.com
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

The counter delegation/configuration extensions depend on the following
extensions.

1. Smcdeleg - To enable counter delegation from M to S
2. S[m|s]csrind - To enable indirect access CSRs

Add an implied rule so that these extensions are enabled by default
if the sscfg extension is enabled.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 82edd28e2e1d..410ca2e3a666 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2642,6 +2642,16 @@ static RISCVCPUImpliedExtsRule ZVKSG_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule SSCFG_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_ssccfg),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_smcsrind), CPU_CFG_OFFSET(ext_sscsrind),
+        CPU_CFG_OFFSET(ext_smcdeleg),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, NULL
@@ -2659,7 +2669,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVE64X_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
     &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
     &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
-    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED,
+    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SSCFG_IMPLIED,
     NULL
 };
 

-- 
2.34.1


