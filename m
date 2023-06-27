Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764EDEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 13:32:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE8nn-0008Kz-Iy; Tue, 27 Jun 2023 09:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qE3SR-0002pw-L3
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 03:49:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qE3SP-0006AS-Rk
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 03:49:51 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b7f68f1c9eso21224915ad.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687852188; x=1690444188;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9EpieEvbwRuonLUO4ZFLZ77OR4kXPqxojCQI1x4UU4=;
 b=aP9L6RdMnqgJU8Fw7Ig8f4ynFw8Kcn5UIgz8vI0/uMQHvlJP0CCWwRnRZkA08/4rhW
 xm1k3OnUhRpqpUMAmMBD3fHX5U7Cm4o7BXcaer2MVchV2fZTSDJ32tKYZeck+coUrdyA
 +KDz+S3qWRwe0RoN1J7chN7jRdqxdBO94pHZ5lSRU5ksMji4BX9rzwEiIH4VrdZ6KL4j
 CWgPe25NyTMhQSsp3eo3SOMVH80fR9+FXo8hgCW3GNtxgPqKJK4CXeFMOxf1m8qIVUN+
 /7P5qirEteYyUH6kRc3ZhJaevk0b9hl7wbWS5E6N/R5QcQ7kDpmwhShUlDoHfGiBP9M8
 k4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687852188; x=1690444188;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9EpieEvbwRuonLUO4ZFLZ77OR4kXPqxojCQI1x4UU4=;
 b=GIGaqE1kzyCa6S8NLa8VjFfeAyfsZ8kbMedXqt3+kBSdV7cPyzRhpgiV5XGWMR1hnG
 c54r2PQ2pyq/pvoq+5iraH8tk+tvZpkujh34TU297HaPTyn00v6I2o/b7b9Vu2Udyn12
 9yZDgj8WDzKbKBA1gxB6O7FoABX7n3YmaZBfQ/TYrU8Xoo4/zvsXFNmzUNOmtMlTnj4l
 nbZtaL4NfTiYtbjQYZhRltKRpF4SQqyF/ShmqSILcDoo0e3eTF3M9IfwR/IqnvEVNE8n
 0DIQvX2i6xnKioaK8myTLgG66csySDJzg/bEUz8u1lqI+SOPNZf2rNdnWHKMWXXSe6+S
 or6w==
X-Gm-Message-State: AC+VfDzec4kvSS+B8fr5WzAtJC9gtvtI4fTHWSh8pDg/uT8hzOoIoPO+
 d6MNW97gm509AsLP70nLgbzxcw==
X-Google-Smtp-Source: ACHHUZ7Bjc6I4sweo1EVoVgYZjkfWzbVAnfoGXNoaf7fatDXg2lsYjOPGdZlfDQHyB6VNCgmaf99jA==
X-Received: by 2002:a17:902:b497:b0:1b7:f73d:524 with SMTP id
 y23-20020a170902b49700b001b7f73d0524mr5935185plr.43.1687852187851; 
 Tue, 27 Jun 2023 00:49:47 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a170902a5c400b001b077301a58sm5360714plq.79.2023.06.27.00.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 00:49:47 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Set the correct exception for implict G-stage
 translation fail
Date: Tue, 27 Jun 2023 07:48:52 +0000
Message-Id: <20230627074915.7686-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:32:13 -0400
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

The privileged spec states:
For a memory access made to support VS-stage address translation (such as
to read/write a VS-level page table), permissions are checked as though
for a load or store, not for the original access type. However, any
exception is always reported for the original access type (instruction,
load, or store/AMO).

The current implementation converts the access type to LOAD if implicit
G-stage translation fails which results in only reporting "Load guest-page
fault". This commit removes the convertion of access type, so the reported
exception conforms to the spec.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/cpu_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a944f25694..ff2a1469dc 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1277,7 +1277,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         if (ret == TRANSLATE_G_STAGE_FAIL) {
             first_stage_error = false;
             two_stage_indirect_error = true;
-            access_type = MMU_DATA_LOAD;
         }
 
         qemu_log_mask(CPU_LOG_MMU,
-- 
2.17.1


