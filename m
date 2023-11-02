Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D59C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:46:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRd-0006qc-EK; Thu, 02 Nov 2023 18:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRN-0006Uk-La
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:34 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRL-0003Rs-JE
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:29 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5afbdbf3a19so17853907b3.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965126; x=1699569926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hh8K8kfptl15Yy23R4V5JcSuazCTpKP+KpFDsC90ckM=;
 b=LACZvZykeJaRcKH4RB3sRrnUOF+7EdMeeZB8M0LYp0rHkY1UGbxPXg34JKwkhIeOeq
 +7eOJEvkPSvdx7B2h+svJPReAFsFOhlBEF2qdr0ox0+ncbsEs+cLf4nq9O+WmYv+NdSn
 Gx1wggrk9nDNajda6WML6Ggjhhd3oV6dOuPD57i2iVWP9kE+vKBVLu4KeIH89I4/dSxp
 U9KIoFiFIR4LkqNHnsME+PN2fx7YG9JzTtRQ2GW1HsEozjAuoOsv1slK6v5oFLrbjQ5h
 wTwRLvQmR5Kgx1No5dm464AstOPo0Aq3uc2qpbfN6GwXUAy7GRvo7m0K0FBpio22vgTG
 5bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965126; x=1699569926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hh8K8kfptl15Yy23R4V5JcSuazCTpKP+KpFDsC90ckM=;
 b=WQFNNrzZaPJNLJQM8VNfWfcMVp5O4R+oNQZXTfjxoBDlz6DbfFiyqKamVglK4cChnm
 WK0/GsGG+tmHeOcYqJAB+4Gm/YHRyRCRX1Ja378PuL7kKqsYcZ8mq8GvhIntgqXj+1jT
 jLRJOwfyMXUek32flDF8TyY6rApHq0l5jQKcwrhIl2sk092+A60X3f9dh5+jeTCtbKJR
 dMeYHD701CyCNUT+mJOVzJgvRGtffSnguBF4z2nlmzpT78w3mvXMf3jZokFHVZ/QPMAC
 SW4pc9JRXzAlBOx2KbLfWE7zXvtw9qtohTuZBDSAjvLHWGFIhtEoLOFfmiDrslQlTebg
 ZuOg==
X-Gm-Message-State: AOJu0YyNlfS29vUjNuEI77NL5DVmdTw47o/Ibc8/R0bTs6pqC7XwxSo7
 f4jEdR7+NMuaoSh4kUuh8jwhUQ==
X-Google-Smtp-Source: AGHT+IFdGavupD37hP4FYyXD6xrhVEbnvkvxXWD/lB5ZM09qy/E3hbGzwtHWg9ykNyWQYT3tBGhFrw==
X-Received: by 2002:a81:7b85:0:b0:59f:687c:fb36 with SMTP id
 w127-20020a817b85000000b0059f687cfb36mr1271510ywc.45.1698965126521; 
 Thu, 02 Nov 2023 15:45:26 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 14/19] target/riscv/tcg: add hash table insert helpers
Date: Thu,  2 Nov 2023 19:44:40 -0300
Message-ID: <20231102224445.527355-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1134.google.com
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
index f5a71b38f6..fd9d4e9845 100644
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
@@ -790,9 +802,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    g_hash_table_insert(misa_ext_user_opts,
-                        GUINT_TO_POINTER(misa_bit),
-                        (gpointer)value);
+    cpu_misa_ext_add_user_opt(misa_bit, value);
 
     prev_val = env->misa_ext & misa_bit;
 
@@ -929,9 +939,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
             continue;
         }
 
-        g_hash_table_insert(misa_ext_user_opts,
-                            GUINT_TO_POINTER(bit),
-                            (gpointer)value);
+        cpu_misa_ext_add_user_opt(bit, profile->enabled);
         riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
     }
 
@@ -946,9 +954,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
             cpu_validate_multi_ext_priv_ver(&cpu->env, ext_offset);
         }
 
-        g_hash_table_insert(multi_ext_user_opts,
-                            GUINT_TO_POINTER(ext_offset),
-                            (gpointer)profile->enabled);
+        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
         isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
     }
 }
@@ -1011,9 +1017,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                     multi_ext_cfg->name, lower);
     }
 
-    g_hash_table_insert(multi_ext_user_opts,
-                        GUINT_TO_POINTER(multi_ext_cfg->offset),
-                        (gpointer)value);
+    cpu_cfg_ext_add_user_opt(multi_ext_cfg->offset, value);
 
     prev_val = isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
 
-- 
2.41.0


