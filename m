Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88047CE8374
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 16:53:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1svJe4-0004aw-8b; Mon, 30 Sep 2024 12:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1svJdz-0004Ih-Ct
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2024 12:53:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1svJdw-0007iR-P8
 for qemu-riscv@nongnu.org; Mon, 30 Sep 2024 12:53:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37cd831ab06so1588759f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 30 Sep 2024 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727715182; x=1728319982;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f94PuGbY3o4nfnvd44/JCW0gaP0F8DVpfbjuvceZQ8U=;
 b=JkH5oGH9DJva8Fivoql3C99H2fXH8SKhexXjymblxqLbm/iS8MyBHv9nEkknAdQrxw
 rhoojI4lGGo69VxFtct++1GszzO9Z5X0oBha6gpcS4blXKAl1Yp13wQ0XF1LfbsPGy7z
 pEWxP/LU3iUkqGvohGWfGL7TSjTWL8G+0wYj2WA+7TaCXCPLewzsfhXPJT0lPWzBH8WC
 gx3EvZbWbldI7FlQxbcusYdds0I+t+nMFLbh3ldXKokkWdzu0glsnuK4Vg+aDzxRhj/t
 OpVp7LuKhVt+tCfe9TCmcH7VUEe0eynTyC/TuUqOPni09XjKxGFbeT7LFvWYSE2GjS8D
 ZdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727715182; x=1728319982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f94PuGbY3o4nfnvd44/JCW0gaP0F8DVpfbjuvceZQ8U=;
 b=aASgChWNAIf0b57lBq8AMzeWlNdYmUJen+qXCbzfuNH8ZHa+XEMrfcuFywu6ZwfSQ8
 J0emK/W2zUHODgvFSUEaOzxyxPoVD0DKo863QvLc0Gb+6fHe3h9Rucpz1Lntngj3d4HA
 rph2+3PSGGzCokkrAmq6Dwurkpr3ijn5QD6wFCC7QtD20kzWkwJPYGCvEU2RaUhYHhO1
 uZAzsQ1bj621VEOX3XkHCYaUPXooQ3LyCPupySG9Qo/tOcBmjAp5lKWip/7xuNRjO4Hp
 3qjAnoXSBqSpHfWwMPJ6vwv0gLjgdaXlfp0d5FfnCBlVICqukoURjWLded+xsdatGFs1
 BStw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqSkedm5HCs25/+ma39SsVhOquKwWj4NzmJl6D+AfxAkH3AxN1sIx79EDo3h7GuejLhf5NMVm9rcCw@nongnu.org
X-Gm-Message-State: AOJu0Yw5yL9saCq7TyNomUxZQBzocEZWHO+Fgj2/2D5drXzEw6gxxV0B
 7ZFsg/9olDjNDeLz1WKWrc++suook6Hi08IwtGfwQc6MI+3rJROtrxWEl0P2r4Y=
X-Google-Smtp-Source: AGHT+IHsu7sT9MgFfB5pjqN9V2Mf5/k+CIAC2noYd3q64RZWb2Z+b8uDRgFzzxBQqdfb0WCiXsxTWA==
X-Received: by 2002:adf:edc9:0:b0:37c:c5d6:b2d2 with SMTP id
 ffacd0b85a97d-37cd59df35amr7965088f8f.0.1727715181929; 
 Mon, 30 Sep 2024 09:53:01 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e665asm9400515f8f.64.2024.09.30.09.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 09:53:01 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Rob Bradford <rbradford@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] target/riscv: Set vtype.vill on CPU reset
Date: Mon, 30 Sep 2024 17:52:57 +0100
Message-ID: <20240930165258.72258-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x431.google.com
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

The RISC-V unprivileged specification "31.3.11. State of Vector
Extension at Reset" has a note that recommends vtype.vill be set on
reset as part of ensuring that the vector extension have a consistent
state at reset.

This change now makes QEMU consistent with Spike which sets vtype.vill
on reset.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4bda754b01..af602e3caf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -997,6 +997,7 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
+    env->vill = true;
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.debug) {
-- 
2.46.0


