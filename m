Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2519AC5B549
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 07:26:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uNRSa-0005FO-5n; Fri, 06 Jun 2025 03:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uNRSY-0005EQ-9z
 for qemu-riscv@nongnu.org; Fri, 06 Jun 2025 03:25:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uNRSV-0007ad-RB
 for qemu-riscv@nongnu.org; Fri, 06 Jun 2025 03:25:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-312028c644bso1419019a91.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Jun 2025 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1749194746; x=1749799546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kDUjEB/vJ2yVoqziIu+W6v0UJ+QZBHaAB90ytl7UYQo=;
 b=kJDwD6MD3Bc/rpzEJdMjY4aKGW8A9XBtHQq9fTrjBo1R/pEN78moo8+SA6ZWQ9L/v6
 Zd96CdnlXRkq9YvcUPmUWUn9Cql7L0XsxxboAm9dDvsISC5DCgHVuDew00bdfz+uPSIy
 9tKttYc4krs9HllbGc2yLmCMhkj0GfSOXC/i03itZm/TH4Cy/l3tEYbGcheI5pgObb8N
 qjGghS3hhnHK0oq7MBm6TUXYYqBuK8rsoPOopdbV9wLEFVivbeb/sy5x7tE+MmNCviXj
 WZ+O5hC3u0/QfiIFnrgDzN2Ih6Ot6AGhDv6uQCUTb116k1bCQlnbKI/NHVVSgdI/11Ku
 n8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749194746; x=1749799546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kDUjEB/vJ2yVoqziIu+W6v0UJ+QZBHaAB90ytl7UYQo=;
 b=bYG/qEKQi8DS4pS3rVKggm6Wpkh5Cuc5lKqAM02GPcAGxceO1RhMlrtI+NeO2Q4777
 44zZfMSc8wdukajNzTqldpQpEHZ+6wvv67I1M7L+KciMqjbXmw1DxJht5SUPjiSJD5zg
 UjFtPzX+keQrvteKuCuBWUK8BvwVaIPVBA91OqFNg+Smj4XJsFnbTOQ4vY9FKqmoJ686
 n7YxI2MrQfjVFbU2lQOCxoFxYdCcolBghAT9QL+8QV1b+3hLNK2VanKQ1S/TYsAZWZi0
 WFawTG6b6spRjMiPKvZiYn/tFJXa/bQ+amTtBcSeAtFMzlv15npdg1Cc8yPuodAJSMML
 7jpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbY6AfedIJSKSET0KIQmfRTI3aJd8TrNWhH5iUQLTBb7s03T+F1SGhRDRU2e8b5CpCH+U/DORX1cpZ@nongnu.org
X-Gm-Message-State: AOJu0Yznzp0cKkHC57UF1SAAqSUtMFbemrkNZAkBun0CGS0hJ5Qy/pZ5
 om9XuG7LnjXRO1v5be24MYp1dtYtW2Qua7hysLgClnNeS9rnc/cQ84Y/kTcd9Rp+O74=
X-Gm-Gg: ASbGnctgPocBdavrT7QW4E392APerz2RN2TpCcOXoFaMRcDYcErgh/lNRUFoyCfyOUT
 dL/uBlx6pLk7nWEebx3VyBNHP7Hi4qiBl0Y7PwbQx7g+PllmXCGG9P/FtBrknXTNScEMoE6/fwT
 pg+nA52TrQn/8o/WLbIWmg4TnbEc684WuCyAy1cvT2oehlga5d53QllOckd64X6fd6NllyrtuSU
 5SjoWrsMjXgWSLeDhWYaKiXQ1U5tAm626bqdznL2eUrH7RgGlr2J7MS6dMf+6YtTjrbgnOxVFSd
 LnTnfuvS/ZE3ERH6U78DHYtV6k5JTkprX5EksNdtz8+sSz2pxw/6KHpyqLJ1W6lo5gDs14b+W3F
 J4rk3UN/JAg4eWso=
X-Google-Smtp-Source: AGHT+IH5U1yA7LBRaDgz+cAqaehdHqemDHFeAhN0s++3am2WTLK00CkTd/rfd3cgNmr78gmYTfP2jg==
X-Received: by 2002:a17:90a:d003:b0:312:e91c:e340 with SMTP id
 98e67ed59e1d1-31347697e99mr3769984a91.35.1749194746092; 
 Fri, 06 Jun 2025 00:25:46 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.181])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f17bddsm774703a91.9.2025.06.06.00.25.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Jun 2025 00:25:45 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v5 1/2] target/riscv: Extend PMP region up to 64
Date: Fri,  6 Jun 2025 15:25:24 +0800
Message-ID: <20250606072525.17313-2-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606072525.17313-1-jay.chang@sifive.com>
References: <20250606072525.17313-1-jay.chang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jay.chang@sifive.com; helo=mail-pj1-x1033.google.com
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

According to the RISC-V Privileged Specification (version >1.12),
RV32 supports 16 CSRs (pmpcfg0–pmpcfg15) to configure 64 PMP regions
(pmpaddr0–pmpaddr63).

Signed-off-by: Jay Chang <jay.chang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_bits.h |  60 +++++++++++++++++++
 target/riscv/csr.c      | 124 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 182 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a30317c617..e6b3e28386 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -372,6 +372,18 @@
 #define CSR_PMPCFG1         0x3a1
 #define CSR_PMPCFG2         0x3a2
 #define CSR_PMPCFG3         0x3a3
+#define CSR_PMPCFG4         0x3a4
+#define CSR_PMPCFG5         0x3a5
+#define CSR_PMPCFG6         0x3a6
+#define CSR_PMPCFG7         0x3a7
+#define CSR_PMPCFG8         0x3a8
+#define CSR_PMPCFG9         0x3a9
+#define CSR_PMPCFG10        0x3aa
+#define CSR_PMPCFG11        0x3ab
+#define CSR_PMPCFG12        0x3ac
+#define CSR_PMPCFG13        0x3ad
+#define CSR_PMPCFG14        0x3ae
+#define CSR_PMPCFG15        0x3af
 #define CSR_PMPADDR0        0x3b0
 #define CSR_PMPADDR1        0x3b1
 #define CSR_PMPADDR2        0x3b2
@@ -388,6 +400,54 @@
 #define CSR_PMPADDR13       0x3bd
 #define CSR_PMPADDR14       0x3be
 #define CSR_PMPADDR15       0x3bf
+#define CSR_PMPADDR16       0x3c0
+#define CSR_PMPADDR17       0x3c1
+#define CSR_PMPADDR18       0x3c2
+#define CSR_PMPADDR19       0x3c3
+#define CSR_PMPADDR20       0x3c4
+#define CSR_PMPADDR21       0x3c5
+#define CSR_PMPADDR22       0x3c6
+#define CSR_PMPADDR23       0x3c7
+#define CSR_PMPADDR24       0x3c8
+#define CSR_PMPADDR25       0x3c9
+#define CSR_PMPADDR26       0x3ca
+#define CSR_PMPADDR27       0x3cb
+#define CSR_PMPADDR28       0x3cc
+#define CSR_PMPADDR29       0x3cd
+#define CSR_PMPADDR30       0x3ce
+#define CSR_PMPADDR31       0x3cf
+#define CSR_PMPADDR32       0x3d0
+#define CSR_PMPADDR33       0x3d1
+#define CSR_PMPADDR34       0x3d2
+#define CSR_PMPADDR35       0x3d3
+#define CSR_PMPADDR36       0x3d4
+#define CSR_PMPADDR37       0x3d5
+#define CSR_PMPADDR38       0x3d6
+#define CSR_PMPADDR39       0x3d7
+#define CSR_PMPADDR40       0x3d8
+#define CSR_PMPADDR41       0x3d9
+#define CSR_PMPADDR42       0x3da
+#define CSR_PMPADDR43       0x3db
+#define CSR_PMPADDR44       0x3dc
+#define CSR_PMPADDR45       0x3dd
+#define CSR_PMPADDR46       0x3de
+#define CSR_PMPADDR47       0x3df
+#define CSR_PMPADDR48       0x3e0
+#define CSR_PMPADDR49       0x3e1
+#define CSR_PMPADDR50       0x3e2
+#define CSR_PMPADDR51       0x3e3
+#define CSR_PMPADDR52       0x3e4
+#define CSR_PMPADDR53       0x3e5
+#define CSR_PMPADDR54       0x3e6
+#define CSR_PMPADDR55       0x3e7
+#define CSR_PMPADDR56       0x3e8
+#define CSR_PMPADDR57       0x3e9
+#define CSR_PMPADDR58       0x3ea
+#define CSR_PMPADDR59       0x3eb
+#define CSR_PMPADDR60       0x3ec
+#define CSR_PMPADDR61       0x3ed
+#define CSR_PMPADDR62       0x3ee
+#define CSR_PMPADDR63       0x3ef
 
 /* RNMI */
 #define CSR_MNSCRATCH       0x740
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1151ebb6ad..d6cd441133 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -6164,6 +6164,30 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG3]    = { "pmpcfg3",   pmp, read_pmpcfg,  write_pmpcfg  },
+    [CSR_PMPCFG4]    = { "pmpcfg4",   pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG5]    = { "pmpcfg5",   pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG6]    = { "pmpcfg6",   pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG7]    = { "pmpcfg7",   pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG8]    = { "pmpcfg8",   pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG9]    = { "pmpcfg9",   pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG10]   = { "pmpcfg10",  pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG11]   = { "pmpcfg11",  pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG12]   = { "pmpcfg12",  pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG13]   = { "pmpcfg13",  pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG14]   = { "pmpcfg14",  pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPCFG15]   = { "pmpcfg15",  pmp, read_pmpcfg,  write_pmpcfg,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
     [CSR_PMPADDR0]   = { "pmpaddr0",  pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR1]   = { "pmpaddr1",  pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR2]   = { "pmpaddr2",  pmp, read_pmpaddr, write_pmpaddr },
@@ -6178,8 +6202,104 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR11]  = { "pmpaddr11", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR12]  = { "pmpaddr12", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR13]  = { "pmpaddr13", pmp, read_pmpaddr, write_pmpaddr },
-    [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
-    [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
+    [CSR_PMPADDR14]  = { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
+    [CSR_PMPADDR15]  = { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
+    [CSR_PMPADDR16]  = { "pmpaddr16", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR17]  = { "pmpaddr17", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR18]  = { "pmpaddr18", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR19]  = { "pmpaddr19", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR20]  = { "pmpaddr20", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR21]  = { "pmpaddr21", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR22]  = { "pmpaddr22", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR23]  = { "pmpaddr23", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR24]  = { "pmpaddr24", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR25]  = { "pmpaddr25", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR26]  = { "pmpaddr26", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR27]  = { "pmpaddr27", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR28]  = { "pmpaddr28", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR29]  = { "pmpaddr29", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR30]  = { "pmpaddr30", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR31]  = { "pmpaddr31", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR32]  = { "pmpaddr32", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR33]  = { "pmpaddr33", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR34]  = { "pmpaddr34", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR35]  = { "pmpaddr35", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR36]  = { "pmpaddr36", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR37]  = { "pmpaddr37", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR38]  = { "pmpaddr38", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR39]  = { "pmpaddr39", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR40]  = { "pmpaddr40", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR41]  = { "pmpaddr41", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR42]  = { "pmpaddr42", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR43]  = { "pmpaddr43", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR44]  = { "pmpaddr44", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR45]  = { "pmpaddr45", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR46]  = { "pmpaddr46", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR47]  = { "pmpaddr47", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR48]  = { "pmpaddr48", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR49]  = { "pmpaddr49", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR50]  = { "pmpaddr50", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR51]  = { "pmpaddr51", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR52]  = { "pmpaddr52", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR53]  = { "pmpaddr53", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR54]  = { "pmpaddr54", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR55]  = { "pmpaddr55", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR56]  = { "pmpaddr56", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR57]  = { "pmpaddr57", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR58]  = { "pmpaddr58", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR59]  = { "pmpaddr59", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR60]  = { "pmpaddr60", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR61]  = { "pmpaddr61", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR62]  = { "pmpaddr62", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
+    [CSR_PMPADDR63]  = { "pmpaddr63", pmp, read_pmpaddr, write_pmpaddr,
+                         .min_priv_ver = PRIV_VERSION_1_12_0           },
 
     /* Debug CSRs */
     [CSR_TSELECT]   =  { "tselect",  debug, read_tselect,  write_tselect  },
-- 
2.48.1


