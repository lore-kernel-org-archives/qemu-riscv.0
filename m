Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C488C25B77
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 08:02:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s79ZH-00038X-Bo; Wed, 15 May 2024 04:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79ZE-0002hF-2J
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 04:00:52 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79ZB-0006XM-SO
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 04:00:51 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-61bbb208ea5so4814228a12.0
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715760048; x=1716364848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QBqdliMEnz302NXVukyGkGL9Vj4A6ULArkG/4ozIHhk=;
 b=hiX6WjQs+qy/E+plsxLJF3oLBZVgTXMl2EtCclh4z31RebZaYHoNsPt3w77UMBAPzI
 2p/lbPJJhusGKICDOGd1idufAZwZJrvE5vksUApdjPjcrzHpc40ojyXqU9Tk4kIKykXR
 ShFojMP0y9Dhp8tvQZDGbsgK/+G0xijBoOlPwIenmcK+81jOr68X+RuOoIqfM3aXVS20
 cfrYJUgFJp6MhMZVUgIF4sDN2a3g6DL4ra+idd7x7o+RiNbcl8ATo/CpJTN8h2oDyhLz
 F9LsR3fIeYxVe7VeDj5K5xNLDhl5fvnyfFmyxNzOfsxWQGrPMAI5bzFe25Wb0PponewF
 XrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715760048; x=1716364848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QBqdliMEnz302NXVukyGkGL9Vj4A6ULArkG/4ozIHhk=;
 b=kBscWaV8xtJwz3M8VcR9XpFmHT+LsgBcsUDVn4TJtrERHCDAFoh6gcuGDRXUoPeNYB
 RhAEz/8/D+qaFRMW09hgpv37OLhKi8sAAZXFdQjc2EMndDJk1UJrOqICTMwQuwoVviz9
 feKs6ov4GPaCQNXsgJS+pP9iCAYdft2coo6rHvb6wBq0nIrVV9fi+apAPtm46nB4kLHv
 zj86QWxpG4KHZqKRqGkUdTR5LJPYqA269OC5YlAiJZQsk/lJW3HSBwX7ME6UsWilN/wG
 DtxYuSNmnJPI66fYsuzHSqLxipQHeLomAC3uTgGAaYG5rn0F/n0C8MLMG7tyRb/WZbh9
 sjzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsrR+obrbQSe04f4ykqC/ogBAZBlqPFdRfHAIXsQIb8+3LuoPCR97qQI8egOzwAHEUmrQNSiRox5LcROB+6wFUBYUCgbk=
X-Gm-Message-State: AOJu0Yy/SxLl4ayfK6mFk29fHd7X4d6R9wFYoIRQy/SaanJ/XWLD2XSj
 +L4MIpO8iP/rtwrGi0O3FN27+AhEFgsIjyzPHj5oxHhyOnVaAQlwi+YSCB2c/dQ=
X-Google-Smtp-Source: AGHT+IF0ZVMrPHTHmsmfiZo0bK58t5IXJIUZ/nNUSrps4Pcnm4rZU2iZhbq8D8pzuia1e9uCqsD/Wg==
X-Received: by 2002:a17:90b:1c0d:b0:2b5:46b3:2e8a with SMTP id
 98e67ed59e1d1-2b6ccd76db3mr11925158a91.39.1715760048295; 
 Wed, 15 May 2024 01:00:48 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d1642sm111418795ad.31.2024.05.15.01.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 01:00:47 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RESEND PATCH v2 3/5] target/riscv: Add 'P1P13' bit in SMSTATEEN0
Date: Wed, 15 May 2024 16:06:00 +0800
Message-Id: <20240515080605.2675399-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515080605.2675399-1-fea.wang@sifive.com>
References: <20240515080605.2675399-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52a.google.com
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

Based on privilege 1.13 spec, there should be a bit56 for 'P1P13' in
SMSTATEEN0 that controls access to the hedeleg.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by:  Weiwei Li <liwei1518@gmail.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 74318a925c..28bd3fb0b4 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -315,6 +315,7 @@
 #define SMSTATEEN0_CS       (1ULL << 0)
 #define SMSTATEEN0_FCSR     (1ULL << 1)
 #define SMSTATEEN0_JVT      (1ULL << 2)
+#define SMSTATEEN0_P1P13    (1ULL << 56)
 #define SMSTATEEN0_HSCONTXT (1ULL << 57)
 #define SMSTATEEN0_IMSIC    (1ULL << 58)
 #define SMSTATEEN0_AIA      (1ULL << 59)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6b460ee0e8..bdbc8de0e2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2248,6 +2248,10 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    if (env->priv_ver >= PRIV_VERSION_1_13_0) {
+        wr_mask |= SMSTATEEN0_P1P13;
+    }
+
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2283,6 +2287,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    if (env->priv_ver >= PRIV_VERSION_1_13_0) {
+        wr_mask |= SMSTATEEN0_P1P13;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
-- 
2.34.1


