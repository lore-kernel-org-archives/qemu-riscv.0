Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10123C25B10
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:54:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s5K8d-0001kx-3Y; Fri, 10 May 2024 02:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8b-0001jx-S7
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8a-0004rw-7C
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:49 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6f43ee95078so1672772b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 09 May 2024 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715324027; x=1715928827; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yu8hvEmMVZKvLb7jw48LlBWGJrT9gAdbX9dylAP6AFY=;
 b=PpDd9I0FIjzje4R7Tok1GspNqyQ+wb0PJjourFYAvb3NnTpbFQhQEu4UGk+5T1rHix
 H3nbOEaMuya6iq4ZI8mHibuV36+ofqNm3dgdIeH6+v1BrI+nxTPKsTKiWbtGu/uJEnDE
 r84y489ic1/Ouwi7IBBmIrH9/1Ua2gF7Ooas9xAXeiGGR453r1oJps//1d70JyBBH3YV
 IFwXUyhG4XZbP/idmqjtiRhsvJOWeiSFLjjLTtXZxOP2B+UVIg7Vj8GOlNDwgDd73cXx
 pvTKiJGwXW/QdUGBfo5Lkr8Ge/7UrigO9GQOJqA0N528omLP3BMInloyIun0GmQ+6+4k
 jZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715324027; x=1715928827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yu8hvEmMVZKvLb7jw48LlBWGJrT9gAdbX9dylAP6AFY=;
 b=Jd6x/92+OZEGlVZ5i+TMoUy2f6FFiJfnK19UOWHhgJy89DYuNJ35IRMxeuDK3v1GNt
 iUpIMzQE2sSJSzoQNojW/LdNARZ4J6TXoEp6d9Dbn+XGlh1RnwV8mZFIJPnC8BwHkKCm
 bg42x07KMZ26HVwEcwD+4PQeRyPRdVlNo0yf4IgFH8OXwgkIphzSPkFkW0tCgr6sNeh/
 aVMRN5tSKSt8gnAEoL2qbVgodV0gaOZmxoiOwa5PmRF4W+ojGzaEILGAUXrdAHrPTaCV
 n6qcRxLg2OyFUtqyR3EG89tCg7vC0oSbhiXfTzc1fV7xAAIzOcJ86GrGajd1Ut6Aiwzk
 zZhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+IeGArwdKtvJ7Fke+8TkZ8Y9kHVtvUuydu3iv9W80SUNPEL6GSqvtOhX1NJEZBtFCutHvl803RpJFloJIaK0KDxweRJc=
X-Gm-Message-State: AOJu0YxKBahJuqzrIiz1VpHjmlwg0tRwmeyV6gvWRxweN1mj0vtGzLRk
 hANIT31rpwrcZXqGl+d5pD6sLcsiPQqQ/n4RIAD7Bmefq2wpdS5901VP/4FRKUw=
X-Google-Smtp-Source: AGHT+IHksYpxv8qPTXANxmC+6wogUEdNVPXf5rqfL896HpeuiV+WqRaXvrDW1t3r7R+MUvEcUE0m7A==
X-Received: by 2002:a05:6a20:96d2:b0:1af:d810:9d0e with SMTP id
 adf61e73a8af0-1afde1c57dfmr1838159637.49.1715324026803; 
 Thu, 09 May 2024 23:53:46 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf31a7asm25579175ad.140.2024.05.09.23.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 23:53:46 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 5/5] target/riscv: Reserve exception codes for sw-check and
 hw-err
Date: Fri, 10 May 2024 14:58:55 +0800
Message-Id: <20240510065856.2436870-6-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065856.2436870-1-fea.wang@sifive.com>
References: <20240510065856.2436870-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x42f.google.com
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

Based on the priv-1.13.0, add the exception codes for Software-check and
Hardware-error.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f888025c59..f037f727d9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -673,6 +673,8 @@ typedef enum RISCVException {
     RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
     RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
     RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SW_CHECK = 0x12, /* since: priv-1.13.0 */
+    RISCV_EXCP_HW_ERR = 0x13, /* since: priv-1.13.0 */
     RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
     RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
     RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
-- 
2.34.1


