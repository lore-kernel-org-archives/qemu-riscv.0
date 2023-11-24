Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754ACC61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:26:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cjJ-00027R-7P; Fri, 24 Nov 2023 15:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cjH-00026m-Jw
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:47 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cjG-0005Nb-2b
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:47 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cf59c07faeso17399715ad.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857484; x=1701462284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmianI1JgQMdz0IgEKTk7UjMG4HIUynTyTAk4C8O4NY=;
 b=lFJJGTkpzqKUgd/DePJqt8tZgxxfE9EDqFs24DqqX10zMvbl/1qZvsqouEzgPABLzW
 7LRNrMiZEBUMugTLst6w/WlKq32AooOgIxUH35l56KX0SdpjfwqmfMKlZQLf8MU912p/
 culmk2POxP3Bdn63cabDS3oC0NBkIkPa2p2hPOYDeYuvKPxzzpRlLrOQxi5e241E+aH/
 Xr2OO2TUk4MI9ousOq+0aegvxeVlrkyCrWx37Outu4VKZrFG4cWy5NmGix8qo6cHWR0C
 3SdX+2BLfdM1cDB/VW89K5915BpLwENkTvFVON1SQcfqE3pTy1UvBfFEk5zg5Rnp+Iat
 1zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857484; x=1701462284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmianI1JgQMdz0IgEKTk7UjMG4HIUynTyTAk4C8O4NY=;
 b=fLwH0Y2sYYQDz7ENgSKzhowXFYbFnEuWwvjpFZ0b/2cICtBmvFhs5mVlc1atdDTSnO
 Q3G+lYsK52FMzjp1wfCsL54JuwFm9gGCaZQ19RZGg83ue2BLvKqOGrJDfplzdJLNaydS
 /VEW7rX0EugoPRt6GhYEWL3C6OG2x8rCELa6oy0mDvJQI4UBhjI8FpmdFisKtWS6zvii
 TcLPB/JuZM94Mb+RTWhgmnCipa4fV3Lry1NBCOue62VNhK+UVkutReTJib5LSLYLiSo6
 76kKLtNATO8bDfU5d7zUOHJAcMPUr87OF/LcW370ljg18f/esxxgHtBkPs5hztNFtwIl
 kaNg==
X-Gm-Message-State: AOJu0YxHxBKhMJmJecEKn1M/FPOkIFTyK9XuHIAhsv5BlPgYBdkxdYvQ
 cAxLi/heDpIPeC/N1s55O5Ookg==
X-Google-Smtp-Source: AGHT+IFBWXLgbRosSamzLPqY9E8OZkdDdxtrDNxrDJekcUq0muGF2pqVSyGwWHCu208cV0Ko+3MVfA==
X-Received: by 2002:a17:903:2345:b0:1cf:b357:c8f4 with SMTP id
 c5-20020a170903234500b001cfb357c8f4mr100691plh.55.1700857484763; 
 Fri, 24 Nov 2023 12:24:44 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:44 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 14/18] target/riscv/tcg: add hash table insert
 helpers
Date: Fri, 24 Nov 2023 17:23:49 -0300
Message-ID: <20231124202353.1187814-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
References: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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

Previous patches added several g_hash_table_insert() patterns. Add two
helpers, one for each user hash, to make the code cleaner.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f2e0ce0f3d..01d2cc9f94 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -42,6 +42,18 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
                                  GUINT_TO_POINTER(ext_offset));
 }
 
+static void cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
+{
+    g_hash_table_insert(multi_ext_user_opts, GUINT_TO_POINTER(ext_offset),
+                        (gpointer)value);
+}
+
+static void cpu_misa_ext_add_user_opt(uint32_t bit, bool value)
+{
+    g_hash_table_insert(misa_ext_user_opts, GUINT_TO_POINTER(bit),
+                        (gpointer)value);
+}
+
 static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
                                      bool enabled)
 {
@@ -817,9 +829,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    g_hash_table_insert(misa_ext_user_opts,
-                        GUINT_TO_POINTER(misa_bit),
-                        (gpointer)value);
+    cpu_misa_ext_add_user_opt(misa_bit, value);
 
     prev_val = env->misa_ext & misa_bit;
 
@@ -956,9 +966,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
             continue;
         }
 
-        g_hash_table_insert(misa_ext_user_opts,
-                            GUINT_TO_POINTER(bit),
-                            (gpointer)value);
+        cpu_misa_ext_add_user_opt(bit, profile->enabled);
         riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
     }
 
@@ -973,9 +981,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
             cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
         }
 
-        g_hash_table_insert(multi_ext_user_opts,
-                            GUINT_TO_POINTER(ext_offset),
-                            (gpointer)profile->enabled);
+        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
         isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
     }
 }
@@ -1038,9 +1044,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                     multi_ext_cfg->name, lower);
     }
 
-    g_hash_table_insert(multi_ext_user_opts,
-                        GUINT_TO_POINTER(multi_ext_cfg->offset),
-                        (gpointer)value);
+    cpu_cfg_ext_add_user_opt(multi_ext_cfg->offset, value);
 
     prev_val = isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
 
-- 
2.41.0


