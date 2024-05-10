Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2435FC25B10
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:54:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s5K8W-0001gk-7W; Fri, 10 May 2024 02:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8U-0001fu-2b
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:42 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s5K8S-0004pK-Ep
 for qemu-riscv@nongnu.org; Fri, 10 May 2024 02:53:41 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ec41d82b8bso15373255ad.2
 for <qemu-riscv@nongnu.org>; Thu, 09 May 2024 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715324019; x=1715928819; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myUSGxZ6KvD2m50MweZ9w07eN6Ng2ZhuGkrMddDWFfY=;
 b=YhzqElQQG35Qnc+odVyaNYcKY0j9zfsGFTYe1DMUsHRsyqjkUXZMi6eUAotdmMCrrF
 QLlcbYGIlEY660mPofqwYKGs2JGVRcwPpFyeUD840q8SgxtrabdD9cXpTphxaqnT6HYj
 aB3tmcTpujhsLLhpTvy+JAWswRGOg16M+Y9SO9YDYkrg/8Yu80AMX495Wx/nqUpsw1r4
 LZzPJDFhs9wAEQhB0sqnh9hKAvs2oELXLuYLxI1dJlpAaPBixRlPp9y5n98A1P3n51ad
 B+tErjxAJ8FYdm9qTa67a0MheM2773WvjXGuvpS5Q59A8X+eMUURH4WuPhYdQoiDnndS
 qHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715324019; x=1715928819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myUSGxZ6KvD2m50MweZ9w07eN6Ng2ZhuGkrMddDWFfY=;
 b=UQU6O/zO+lM/reRUHqioPOv/HLFprt6RIdvWX5NJg9P3EQR7TkGS1kRGgQLqtqK/oK
 iNSHinwvPJDGaQ6bxVHmD/imxgA/Plihe6Wql/93ujkY18LB+JTi02ziSv3jlsVxBziO
 tFd1qSWzdA5culwYQM9B9ZV2Ijo8daEG4Hzm3qrDEilYprjB74NutJ+nAZSry3aqmEmA
 tm30d/R4KaVbUxIy4We+In8gIKPqz4Tg+cmBmj8rDULj+IvIjBvW5ynu+WiuSWhw5Rxz
 DeVgsYT4AywWQGslLupExaiRjQ2zwSKSmXhxJE0RVGyoG3l7qBF48WW9Poz4ULz8dqAw
 yvug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcGWd8quAmkVA0xLK0eMVfnqcAsbcxgfFtFOcPoD7LZlKX9hil2QALs8i6D6fnVAPvhqRZUHMkJvklOBtTEAYwFRLnjW0=
X-Gm-Message-State: AOJu0YwrlTkCaMRUXvgeE5ep9WaJMLjtaOqa3Sfv6BSAZbRC1TBPaeuo
 2Pl54pMfN6a9/cJtysmP3zodtO2cEXQey2rP7jdaRSI/SAk596Bxh/4byah91h4=
X-Google-Smtp-Source: AGHT+IFGUFRFueFUDNZ9d5BFLoP8Hn1ZDnL5G0nYVH3EA/EArusX9dl1OazLYLdkHre6SLyO/nAP/g==
X-Received: by 2002:a17:903:8c3:b0:1e8:a63b:d427 with SMTP id
 d9443c01a7336-1ef43f522b1mr22968315ad.49.1715324019119; 
 Thu, 09 May 2024 23:53:39 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf31a7asm25579175ad.140.2024.05.09.23.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 23:53:38 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 3/5] target/riscv: Add 'P1P13' bit in SMSTATEEN0
Date: Fri, 10 May 2024 14:58:53 +0800
Message-Id: <20240510065856.2436870-4-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510065856.2436870-1-fea.wang@sifive.com>
References: <20240510065856.2436870-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x62d.google.com
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
---
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      | 10 ++++++++++
 2 files changed, 11 insertions(+)

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
index 6b460ee0e8..d844ce770e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2248,6 +2248,11 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
         wr_mask |= SMSTATEEN0_FCSR;
     }
 
+    RISCVCPU *cpu = env_archcpu(env);
+    if (cpu->env.priv_ver >= PRIV_VERSION_1_13_0) {
+        wr_mask |= SMSTATEEN0_P1P13;
+    }
+
     return write_mstateen(env, csrno, wr_mask, new_val);
 }
 
@@ -2283,6 +2288,11 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
 {
     uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
 
+    RISCVCPU *cpu = env_archcpu(env);
+    if (cpu->env.priv_ver >= PRIV_VERSION_1_13_0) {
+            wr_mask |= SMSTATEEN0_P1P13;
+    }
+
     return write_mstateenh(env, csrno, wr_mask, new_val);
 }
 
-- 
2.34.1


