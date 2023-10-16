Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEE1CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsLbt-0002gc-8h; Mon, 16 Oct 2023 07:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbp-0002de-1C
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbb-0005b7-EZ
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:04 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso44401965e9.3
 for <qemu-riscv@nongnu.org>; Mon, 16 Oct 2023 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697455063; x=1698059863;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XGMvvJZUGfMnQ/1RecN9n7QRTY4rets8V/xDm2EU20=;
 b=AU8EidPETbWUhvO7T5gb33hDSaiSelnAYT+eZk2pBp7FcKEaVTY5+lTssMID2WedQQ
 tSltes8wT9nH6A6/fS0a56cSDFYGkyrd8+5GUfsWO1/BqsI5lYsz929EOliDwMh/q0B8
 FHSETChHyEWkxMk/q3qSweCCNCNoSGAm4J0q3CkqKXkzlBYSNEIR3sgKvd+cR4Hk4iU2
 LttNpcjTSnn2WLDb7zlTb2OJPvTmp9GkCygmlg2WW9PipRCL5RQ2iYS5ggsvwoPdgaKN
 WrRI6vE2cgP8qfqe7R3bvDPmld462jvru10YD9DdXY3JxK99G3VXPyWkwWHqR9H8VwCF
 RMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697455063; x=1698059863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XGMvvJZUGfMnQ/1RecN9n7QRTY4rets8V/xDm2EU20=;
 b=lpFgmpXFZTkSbHUmeKxhhsHb5nBLDPP2mwmj5dwyR+/gm4b6hZctWjv0AXkogSreXb
 6iBtOkERy14I1/Q9tXJ+LeohZNACGS3fom7YH9C1amMi00v29C+QZCC+b15H1ukTvr0v
 HSk3J/8RlagFRunGr/ldAbuKyvNUVc3yqaz5/3LNrZSwIOCx9YKcwXgusd+dn1YuAKPv
 la+RY+Su6GMaKPIqVaZacliFyxRTpTVOZ0qScP8oIaCLIr58FsvtAjBm+4hmU0I2OCS5
 RRpAVxEoyTXeSkigogjgrcoINlBYQQNPwwq4z3zW50wvJqjaJ5Gy50fKZg8EUC2SdFpF
 vIRw==
X-Gm-Message-State: AOJu0YzjFoi+j3i7bdYRVcU4H9Pt75zGO0uPT03D4TPFCr32+VU7EtiH
 Hxxl44vik1foKj9+kRKeC+FAsVV4ToYUZxiU33w=
X-Google-Smtp-Source: AGHT+IFQ2xP9mg6JJS2xUiKIqHOwwbYL8cijrH2V6O3hwT+E23v/6IUUZqEBnbp3w9PyKpI2sjzN7g==
X-Received: by 2002:adf:e19d:0:b0:32c:ea14:89e5 with SMTP id
 az29-20020adfe19d000000b0032cea1489e5mr19215318wrb.39.1697455062837; 
 Mon, 16 Oct 2023 04:17:42 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0032daf848f68sm3114299wrx.59.2023.10.16.04.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 04:17:42 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v5 2/6] target/riscv: Check for async flag in case of
 RISCV_EXCP_SEMIHOST.
Date: Mon, 16 Oct 2023 12:17:32 +0100
Message-Id: <20231016111736.28721-3-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016111736.28721-1-rkanwal@rivosinc.com>
References: <20231016111736.28721-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x333.google.com
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

RISCV_EXCP_SEMIHOST is set to 0x10, which can be a local interrupt id
as well. This change moves RISCV_EXCP_SEMIHOST to switch case so that
async flag check is performed before invoking semihosting logic.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8c28241c18..aaeb1d0d5c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1605,15 +1605,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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


