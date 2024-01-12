Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF32C4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 21:39:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOPEy-0004Kc-1H; Fri, 12 Jan 2024 16:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEs-000460-CE
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:55 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOPEn-0001mD-KE
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 16:38:52 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3e84fded7so41903275ad.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 13:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705095528; x=1705700328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4bw7Zp+zQmSgEkEK6TQdHIV+yc1YaPy2qRjc8df2Gg4=;
 b=c2hLvDBbASuTLE/WRN7Xvhd2I+ITNUfCfN/flBVdt6cTexSfIRGS52pTY1Y3ZnXtAN
 /rEmxh+yMh7LED4KjlGiNnmjil3iUoSMkU6fbuN5+tnR/jUKY6m1JqqiCG849UQ3wVzv
 YWOVsMkDff3K4TlhgebILMbwe5juYDGljNz/lWjGBB+D0HzcyzKsh1Gse0NxiTWzRGOQ
 RB5D5sUoSPhsfnDcnQO/UELroX/5RzcHDa4vkweoYPkp7AIv5BQWmLdUmRhb1OdjYmk1
 dzhUcvVCf/se6bohMd6MAr75w+jBaGIzsKm7tfOueMBqVdhKIQbii5Yqp7veK6CkOYdd
 QPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705095528; x=1705700328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4bw7Zp+zQmSgEkEK6TQdHIV+yc1YaPy2qRjc8df2Gg4=;
 b=nNh4LA1WEnwI2JZovh1bDv9q9gwWejjhNP+wD6sHExTr048wvXZxjq7h7QPSQrLvgl
 r6lgpT5ia05udmBGxhaDt7MiZ14oTnJ8ubOZ5tOTLd/uL/VOUwpoAlBApR0ZMAFiayX/
 Q5qAGoYdutk31obx01GKK7tQe9wKAopvrQoh8q3X98g0b3rxP9GICffQ0N5sXwvQ70Tr
 JQSPud0TWPSKqMJEVIVeSdDTNmoPVWHF7B5EpMyahQXV04PlQctV9wrPjVpDzQ2L2aOi
 CN/n5vRU0Mybh/a/s8Ia9uCW2A2WjwSewAANd1eGI+RFRSbRVUUS1AR2GV4hsREM5fPl
 CRQg==
X-Gm-Message-State: AOJu0YzH64AaykjhQJfALbgihQWJaZGAEQ1aigpDqwHACnwwAY94YfpK
 +Pr8RhAsSwgz03uJlxqSLI3R7q4B+PJXYj+YNYBHNr03wzMeHg==
X-Google-Smtp-Source: AGHT+IG3XoDKvK8qQz2jeDh6RSfi2i+ck36xcDk6Y7xc4pMkz4cbKaBsBwIe9/2zMKNFSXCkStOzGg==
X-Received: by 2002:a17:903:2692:b0:1d5:769f:389c with SMTP id
 jf18-20020a170903269200b001d5769f389cmr1334774plb.56.1705095528028; 
 Fri, 12 Jan 2024 13:38:48 -0800 (PST)
Received: from grind.. ([152.234.123.64]) by smtp.gmail.com with ESMTPSA id
 lf8-20020a170902fb4800b001d5b2967d00sm364727plb.290.2024.01.12.13.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:38:47 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 09/13] target/riscv/cpu.h: use 'vlenb' in vext_get_vlmax()
Date: Fri, 12 Jan 2024 18:38:08 -0300
Message-ID: <20240112213812.173521-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112213812.173521-1-dbarboza@ventanamicro.com>
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11df226a00..628ef67d5f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -692,7 +692,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
     uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
     int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
-    return cpu->cfg.vlen >> (sew + 3 - lmul);
+    /* vlen = vlenb << 3 */
+    return (cpu->cfg.vlenb << 3) >> (sew + 3 - lmul);
 }
 
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
-- 
2.43.0


