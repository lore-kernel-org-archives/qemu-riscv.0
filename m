Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A086E6C5F7
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 03:39:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIJjw-0007vN-0G; Mon, 02 Dec 2024 22:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tIJjr-0007u6-Fv
 for qemu-riscv@nongnu.org; Mon, 02 Dec 2024 22:38:15 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tIJjq-0005Z7-0k
 for qemu-riscv@nongnu.org; Mon, 02 Dec 2024 22:38:15 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7242f559a9fso4925788b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Dec 2024 19:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1733197093; x=1733801893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hvzvoO5brrLYHxKu/Ou4AE457DWwgARUuUV3MJMIxX4=;
 b=QDAE1O0dDpKVq4cvf1mV/LzdDRHmk5PPueySCbKUdAW/GXbzDTsvutkPDDK3ZAf7AQ
 gqX10EZBapaPjM0bZL4rdqmzBXQQjzjbSTIr+7cr6BgtSLBTWG77K6kmZ6oVDRK55UWm
 jwpxYsRk5bSs7NOAfnXXEboWrIYeWsKqIYzuKjXP4s+Si1uwtxlXUzKRI4wNeJZbCS/P
 GrROSnbaJApi9mX0Vl8ywSARnFUqjFSDfYMd/IBC+7Zbf4UyiVEa0UMyXz6wCWSXF319
 9k175qvVs7/rO3PMOVoLz29q99iFkDviKV9hBxPnkueTEteIzE1wEVYwfUzfwz0mHEjJ
 e9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733197093; x=1733801893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvzvoO5brrLYHxKu/Ou4AE457DWwgARUuUV3MJMIxX4=;
 b=ZaXHathca7KUfsxLE5nCEU/6tkDatzSmpFkha3uoJuxaNFnnQr1iztwPYvRR+Sy+07
 EEM8pUCl2zrj7yruBaNaQzCvdXj1PSUQAdbP+RxegqvFyZg6uOFfXqUg+RFq4VQopjzp
 KFPTcDBK8LV9me1QwG+JzCvC6IJla97yJ1dVAIMJaI+ef48+FYE3NOtRAYei84Zx0Lmf
 FUYkPZQ4v80Mku64k5DoMEs5OCfo0bEuMlpzsOrJzIUzDSLpwZm8d3RTcMnZQP7Ai3a3
 r+oD1z5wnEboa0qi70mGn+Pw7OCfV9lI7k+2hGhwe2NSxZ7yiPPk1qWRYbtq01z87NnK
 yLnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO7cQFCyAvrbVjxJGMc6VTSbvDB4qSUdncK+5eKixg4fmiIkyAWlss5g916bFs2H0bNOvrWFqqE1vP@nongnu.org
X-Gm-Message-State: AOJu0YxXcbb/e7HoU4mqrO4AqjihwWi2ZOcHj/IXMKSzrH+hvwaL8tad
 ViKpzKS2GiGhKLnWS6d0PG24QTTaoW7CJw1x59HG5kwXC7SUZUgFN12/56IXvqw=
X-Gm-Gg: ASbGnctB1BT5YGACj8mAZ/ZDbObd+Wg8Cp+J6tWTfCS9DdBMB0L1I/eFP89GRPYGISY
 IMAWwNWKVNqM0xWvs80fqBkPzxRpm9ttJ6x6w37Vq6g3bnTQYT03+3fer8fwIREA1b5sj7K7GWG
 aGxLdXrNAZdaPH5EAO7rF4pD6XGyi2c3Cc6tW5Sgyt+PEvxF7MZQG6gto59OPGm4zXnXmUtpsT3
 GvgQGQOMVTaXJYdOjG7LUzxHs7X3A/fL1sMqSi2c+M47ntPRuokuh7I84biapnkYtDYhJV5MWe6
 hbv2qqkW
X-Google-Smtp-Source: AGHT+IHpaOS9cboDFSY5Y/16u7ve+D0uAJDEf2oA2rE5fUix4UWLXiR1xTrhPy+n4vqW8uvZsFl2+A==
X-Received: by 2002:a17:902:e841:b0:215:5310:abae with SMTP id
 d9443c01a7336-215bcfc3e31mr20175415ad.1.1733197092743; 
 Mon, 02 Dec 2024 19:38:12 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21566732e1fsm47111135ad.134.2024.12.02.19.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 19:38:12 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v5 3/6] target/riscv: Support hstatus[HUKTE] bit when svukte
 extension is enabled
Date: Tue,  3 Dec 2024 11:49:29 +0800
Message-Id: <20241203034932.25185-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203034932.25185-1-fea.wang@sifive.com>
References: <20241203034932.25185-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x429.google.com
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

Svukte extension add HUKTE bit, bit[24] in hstatus CSR. The written
value will be masked when the svukte extension is not enabled.

When hstatus[HUKTE] bit is set, HLV/HLVX/HSV work in the U-mode should
do svukte check.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4b9f899217..fe4e34c64a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -604,6 +604,7 @@ typedef enum {
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTW          0x00200000
 #define HSTATUS_VTSR         0x00400000
+#define HSTATUS_HUKTE        0x01000000
 #define HSTATUS_VSXL         0x300000000
 
 #define HSTATUS32_WPRI       0xFF8FF87E
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1936a6f32a..b6fa8ae53f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3540,6 +3540,9 @@ static RISCVException read_hstatus(CPURISCVState *env, int csrno,
 static RISCVException write_hstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
+    if (!env_archcpu(env)->cfg.ext_svukte) {
+        val = val & (~HSTATUS_HUKTE);
+    }
     env->hstatus = val;
     if (riscv_cpu_mxl(env) != MXL_RV32 && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP,
-- 
2.34.1


