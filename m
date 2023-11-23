Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AAAC61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:52:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6EoF-000050-8M; Thu, 23 Nov 2023 13:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6EoC-0008Nw-TJ
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:52:16 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Eo9-0000D7-Js
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:52:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5c1a75a4b6cso737302a12.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700765532; x=1701370332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bA9SrnLTVc37f7jGZJNj8vJFWvRNsa04ovjAxVnaKYE=;
 b=BDSpf9YfsaBurnx1pZOzsaLuBREIiIiROyiPhPfHlS0AHNGHvmG+khZvUMSJFN+Ni5
 tnsMHjyDPUJilhemNVxB1WxluD9EjU+NhD3rANNe2JQFARpJUEI+dNH4hyRXzE5fDM9N
 tb4Svwz6Lnr6nmZ3nwpfRdlrJfmaoBdYgOurGYbG4/hgV3EHjFV65vIEMqBpC5HoeVFC
 5nQY9+gkYRHz2gfokCGHsIWSKG92tmXpYx4l1fQFI6xBJFI+c15Aeo/uFqYL1JbUVE7G
 YzZK168yy79YU3dGh1PvWASkXC5E/wJ/mGGjEwhi/8wF1TyBzOY1pYNIbiNTP8pvUfGW
 VRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700765532; x=1701370332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bA9SrnLTVc37f7jGZJNj8vJFWvRNsa04ovjAxVnaKYE=;
 b=dVCwgVX6dAA46pniJYtARSiXXJgbbHxvmFpHI8Iwev1p+nGaMpNwqBvtCpMPFmPcfc
 MV/p/mz/auPVlZY221sGfU3ytvgcThI4NYEZgFqoM05+6FXElaUV0BXFpc5m3cTCj8T7
 ryMmDaDAJL7EejibhOpJlLKpkzfHnKAosYfRwtxYgpEujN2nzOejcWYNZVjcxTSVeh1u
 V0XVgJMQ57iegGvf4EJUqUlNoque+Mky55iwKifU4gAo+INozMqzHec/QgghmsJ1z6uF
 byzkipfPXuQRZ96iUfq6rA3XcIV76wygQmRLeu9quFLTmJ/Gu0VhBbJyhoOFspMNF+bi
 5HVQ==
X-Gm-Message-State: AOJu0YzjBbOTm7JZCW12lrzxB1AosUFI39hVZa3Rlyg3n3zYFHF8Dd6G
 RbeHIiaEO7uSL+l58CcAzbiaWA==
X-Google-Smtp-Source: AGHT+IETaMvUzgCJt+fNUrO0E/B+pZp1AoK1muFpU+gsh9Y4CB7vvRKSXRXr29N1kj6Xq90ZR09+0w==
X-Received: by 2002:a05:6a20:549a:b0:187:2e65:9cc9 with SMTP id
 i26-20020a056a20549a00b001872e659cc9mr317939pzk.56.1700765532122; 
 Thu, 23 Nov 2023 10:52:12 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090282c400b001bb1f0605b2sm1662638plz.214.2023.11.23.10.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:52:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v11 14/18] target/riscv/tcg: add hash table insert
 helpers
Date: Thu, 23 Nov 2023 15:51:18 -0300
Message-ID: <20231123185122.1100436-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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
index 092742c2b7..c248944f24 100644
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
@@ -822,9 +834,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    g_hash_table_insert(misa_ext_user_opts,
-                        GUINT_TO_POINTER(misa_bit),
-                        (gpointer)value);
+    cpu_misa_ext_add_user_opt(misa_bit, value);
 
     prev_val = env->misa_ext & misa_bit;
 
@@ -961,9 +971,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
             continue;
         }
 
-        g_hash_table_insert(misa_ext_user_opts,
-                            GUINT_TO_POINTER(bit),
-                            (gpointer)value);
+        cpu_misa_ext_add_user_opt(bit, profile->enabled);
         riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
     }
 
@@ -978,9 +986,7 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
             cpu_validate_multi_ext_priv_ver(&cpu->env, ext_offset);
         }
 
-        g_hash_table_insert(multi_ext_user_opts,
-                            GUINT_TO_POINTER(ext_offset),
-                            (gpointer)profile->enabled);
+        cpu_cfg_ext_add_user_opt(ext_offset, profile->enabled);
         isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
     }
 }
@@ -1043,9 +1049,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                     multi_ext_cfg->name, lower);
     }
 
-    g_hash_table_insert(multi_ext_user_opts,
-                        GUINT_TO_POINTER(multi_ext_cfg->offset),
-                        (gpointer)value);
+    cpu_cfg_ext_add_user_opt(multi_ext_cfg->offset, value);
 
     prev_val = isa_ext_is_enabled(cpu, multi_ext_cfg->offset);
 
-- 
2.41.0


