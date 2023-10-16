Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3949CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:18:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsLbs-0002fq-QB; Mon, 16 Oct 2023 07:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbl-0002bn-Mj
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qsLbb-0005bA-E5
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 07:18:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so1090265f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 16 Oct 2023 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697455062; x=1698059862;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtzE7my5CmntemfMbbeAb9YICyfQZm1oiOKZ3Hj4AGc=;
 b=p8dHivGO1RqxnIMHYrGdd/2d4TiimOGSI4vwQdEuyW//9rSl+NhG+WgXi2j0EEKpPv
 erq6sw+Kt9NGT3roXXhiWwME4cBQx/lOxgX8OybgW0bfkZDow6ydRazRgbkUkIsDSGOk
 ZOZNm/YtUIz2Y+tBgxMJV6mpworB2tLDxWshE1QQXCsZl9cccpP3CG2kG14kEncq9Yqc
 RL3KpdoQBpVXXgSs+G0x4l49TaU9Nlv70CnGi6olC0vKvURwmcO2AQyXKhIUugav7K2B
 fXB7G5CKKmz8mvc3zECMcDu+0KE2EjjX1VU2AWac3JUlxnI0IAqMMlbnOA+VuH1WvV0L
 lbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697455062; x=1698059862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtzE7my5CmntemfMbbeAb9YICyfQZm1oiOKZ3Hj4AGc=;
 b=uBvufnSHQXN6CrQyOqaA1Lhf7z3wdQgzGFxjVJjeqPnQEbmbuLMJ6GRJFSJrfrCfmX
 L9jUAHmg78b6BRJQzVIrY57O0KHugWzBGHq9hilsz77Qn3/URgaQHTLxb/OdpNu5iXbq
 njE1nDW9BKCRBY6Zvv8ayfLJu9lW8vwsEqisbJpAyrbZ8f5L7bOoRIDu4rbZvOd3TiXt
 CLPA/lCfB3fLhGVPYGM9+a2JMZWp4oq8PSV1lFvaFITgnpF/K7n6IzOZ/2cK4AFfNDn6
 8/TNNVFf+lyChE0eXvmmLeLeBFesyb1itsYbVJ5a8jXygLwXvCsLOtR3Yn7MsbxNq2TP
 1qPA==
X-Gm-Message-State: AOJu0YwRnAIp3YS69qmLV6Q5moj2SwyW4JdyeGl97/Xq4piYdS73BcRt
 ZjhkUCLtjX04vOqz4doWiWLqjOJXdTSin9OPBYU=
X-Google-Smtp-Source: AGHT+IHt7zBM7oq34Pt1GjqiaqFwpNreACl3dteb8CaiNPSQ8zXFjZXR0Nrv3tRDWkh7QnITBrajQA==
X-Received: by 2002:adf:f2ce:0:b0:32d:9fc9:d14a with SMTP id
 d14-20020adff2ce000000b0032d9fc9d14amr6477524wrp.12.1697455061845; 
 Mon, 16 Oct 2023 04:17:41 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0032daf848f68sm3114299wrx.59.2023.10.16.04.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 04:17:41 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v5 1/6] target/riscv: Without H-mode mask all HS mode
 inturrupts in mie.
Date: Mon, 16 Oct 2023 12:17:31 +0100
Message-Id: <20231016111736.28721-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016111736.28721-1-rkanwal@rivosinc.com>
References: <20231016111736.28721-1-rkanwal@rivosinc.com>
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

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 30cc21e979..4847b47a98 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1525,7 +1525,7 @@ static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
     env->mie = (env->mie & ~mask) | (new_val & mask);
 
     if (!riscv_has_ext(env, RVH)) {
-        env->mie &= ~((uint64_t)MIP_SGEIP);
+        env->mie &= ~((uint64_t)HS_MODE_INTERRUPTS);
     }
 
     return RISCV_EXCP_NONE;
-- 
2.34.1


