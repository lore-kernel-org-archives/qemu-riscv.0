Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349BFE81DFA
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmV-00066P-PP; Fri, 06 Oct 2023 09:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmU-00064i-KD
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmS-0003Fm-0K
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c877f27e8fso16803895ad.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598530; x=1697203330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEKxFBV3S1LkNsoZYztGI8sqhw9WeeKCrlL2/nre/QY=;
 b=DsfSk1yQfNyR6JrVRv6isqNo3bVzkUJSbrMng3xdj44yA+MWnpEXGlVyxZ5zRlV6ch
 3tIcB70vZ0HDK6CKM761upDvJFOzmrC0ww2LBrCyYTNCxO01v9LoVB8nqhixJwqw88UH
 KQVymTkXrbqJzeAjFI/K7ukGkNv8boToGz/jI+/t0YpXk9+Tr6pfl9D5REBBxwLwrATA
 P447P5PKdOx6CQKcwNPQjkwSrBoNnKZqtlfi24lxBaPnUhK/e8hkM0+w3SL6VuBke7Tx
 tVebhS2tmuMsCZG9F502ye6fuhDJDEP+kye2ygaIMqRHr4FPhSB/9YgVXFYVaXmf2qYH
 qJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598530; x=1697203330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEKxFBV3S1LkNsoZYztGI8sqhw9WeeKCrlL2/nre/QY=;
 b=tXVmovNLFs3ujGxW2KUToMA/l1sZ1pchLJdKDpoFg/rh9qnidr2wHmJZyvnbrZXw+I
 ierp5ucMSU08CnrD6jVWmAqKSRWJKE4bHLEh6oV6xz2A4gPmY6QJZjU6/9o2NjA75Q00
 pSqQIcrHAKNx5Dodpgu6xjDqkqVE0FgUm76V+wMRyiyU7PGdWgcxEpGQ2eucNhRfu5W/
 hJoyrGsM0eBW2+824TpEMwtuIJlanKmFldylRfe174pyrrfMnWjBF80ZnTtyf6O35LHA
 7rviR97Yle83YcrNOUHS1g9SV5qGZG7Y8rTh+kmtZTJHFLZqyIFkJE6KbYRbpvMCgPp7
 6wxg==
X-Gm-Message-State: AOJu0Yyns2sIyMtlmjxMO0Xd/oARKJ6m45/ViGolHPkXxAHQX5kf7Xfy
 pyBpFLXxaW1XmCnTQKQFwLmLfQ==
X-Google-Smtp-Source: AGHT+IE6UaiuR1mO4+CJRpKhir9aZgcIAdKA27V92jRfB9Iprt05UlBfkOQ1Dr8kmDiQ19pKfggnzA==
X-Received: by 2002:a17:903:41c1:b0:1c3:c687:478c with SMTP id
 u1-20020a17090341c100b001c3c687478cmr9934905ple.8.1696598530069; 
 Fri, 06 Oct 2023 06:22:10 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:22:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 10/10] target/riscv/tcg: add hash table insert helpers
Date: Fri,  6 Oct 2023 10:21:34 -0300
Message-ID: <20231006132134.1135297-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

Latest patches added several g_hash_table_insert() patterns. Add two
helpers, one for each user hash, to make the code cleaner.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index d7540274f4..d4ad1c09b3 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -42,12 +42,24 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
                                  GUINT_TO_POINTER(ext_offset));
 }
 
+static void cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
+{
+    g_hash_table_insert(multi_ext_user_opts, GUINT_TO_POINTER(ext_offset),
+                        (gpointer)value);
+}
+
 static bool cpu_misa_ext_is_user_set(uint32_t misa_bit)
 {
     return g_hash_table_contains(misa_ext_user_opts,
                                  GUINT_TO_POINTER(misa_bit));
 }
 
+static void cpu_misa_ext_add_user_opt(uint32_t bit, bool value)
+{
+    g_hash_table_insert(misa_ext_user_opts, GUINT_TO_POINTER(bit),
+                        (gpointer)value);
+}
+
 static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
                                      bool enabled)
 {
@@ -296,9 +308,7 @@ static void riscv_cpu_commit_profile(RISCVCPU *cpu, RISCVCPUProfile *profile)
             continue;
         }
 
-        g_hash_table_insert(misa_ext_user_opts,
-                            GUINT_TO_POINTER(bit),
-                            (gpointer)profile->enabled);
+        cpu_misa_ext_add_user_opt(bit, profile->enabled);
 
         riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
     }
@@ -314,9 +324,8 @@ static void riscv_cpu_commit_profile(RISCVCPU *cpu, RISCVCPUProfile *profile)
             continue;
         }
 
-        g_hash_table_insert(multi_ext_user_opts,
-                            GUINT_TO_POINTER(ext_offset),
-                            (gpointer)profile->enabled);
+        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
+
         isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
     }
 }
@@ -724,9 +733,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    g_hash_table_insert(misa_ext_user_opts,
-                        GUINT_TO_POINTER(misa_bit),
-                        (gpointer)value);
+    cpu_misa_ext_add_user_opt(misa_bit, value);
 
     prev_val = env->misa_ext & misa_bit;
 
@@ -867,9 +874,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    g_hash_table_insert(multi_ext_user_opts,
-                        GUINT_TO_POINTER(multi_ext_cfg->offset),
-                        (gpointer)value);
+    cpu_cfg_ext_add_user_opt(multi_ext_cfg->offset, value);
 
     prev_val = isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
 
-- 
2.41.0


