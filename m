Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C35C25B6B
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:46:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvnZN-00013u-TU; Wed, 25 Oct 2023 19:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnZ2-0000ui-Of
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnZ0-0002Ht-Uf
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:28 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1caa371dcd8so2271125ad.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698277525; x=1698882325; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+d/NJr7Lp8P9GIwbRNrTXnxAHvwrd1uro0GkYn/6g4=;
 b=dUMujSypOEHjv7hgV74RM/oWPfVELwrzl7RZ+aMf+dz8xSCiPnwqUIN82WB9uyrI2p
 GasMkrI7cPpkW4xL3AuPZZFt8WWaynyD1WBXchToTu1yI7pSbZCTDj7CDU1pKMKVafvA
 AmWbPpGFK/5k4VAcdMksQeXFe65MdgHaXgzGfM729g+HwJMMDSEdChp+nO/4OX5sPrDr
 UzsaYDWGSkYv8azH3pUjlac7RkXprlAURL5oe68hD1DxGDWKSBHJgBmp8lFMaNfFQQJv
 TvH/CDHSmPyd7bf4hifXoem3W6UozLkG0z4DiOofx1kNm5z2DT52mBM0JC+iIMUP8yHA
 EG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277525; x=1698882325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+d/NJr7Lp8P9GIwbRNrTXnxAHvwrd1uro0GkYn/6g4=;
 b=E3XKpudFME7faehDHnWf5QRmum66GvmE8K9rkNwU+o1hBsnnuapNG/iEgzJFQT9Ula
 u/wOxmFgFc4wNYODTe59MrkyDa4M2zCEJlW7mUObxHRpjL62yNAp7kKdG1FE7sfvZgFm
 74TVxr4Jy/gU2hPwyLFaL/ZAfxiHbthnNwpaKjbVRjIZqaiaqZF4Itgc+/MEuNNGUXBT
 6dcS3D+PjpMuC0riJWeE6CMLClGtTXFb6tGcanWsPXdoyYl/SYOzG/6HKJcdqz5aVyZr
 8UZUkpp6z/PPgUECcnYXwj/WK41upekLChDGEZwnC1n2toKpjHr6GbaSmR/rCbUPZKXF
 Py8Q==
X-Gm-Message-State: AOJu0YwThIqWFiomKYcrYCBMd2pZdDt1xyKjAGQADj05xGRRuqbeZ5ru
 ElFVF6ipTpRsVaxURhrfuoeb3g==
X-Google-Smtp-Source: AGHT+IGy1XyshTH23q31kruO8Z7gARSwtZgPgIz3WGUHf5N424Il28Dh4Pevs3HOdL9bN6wJn1yFaQ==
X-Received: by 2002:a17:903:1383:b0:1ca:4681:eb37 with SMTP id
 jx3-20020a170903138300b001ca4681eb37mr13120875plb.14.1698277525426; 
 Wed, 25 Oct 2023 16:45:25 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001c736746d33sm9738654plg.217.2023.10.25.16.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 16:45:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 05/10] target/riscv/tcg: add MISA user options hash
Date: Wed, 25 Oct 2023 20:44:54 -0300
Message-ID: <20231025234459.581697-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025234459.581697-1-dbarboza@ventanamicro.com>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

We already track user choice for multi-letter extensions because we
needed to honor user choice when enabling/disabling extensions during
realize(). We refrained from adding the same mechanism for MISA
extensions since we didn't need it.

Profile support requires tne need to check for user choice for MISA
extensions, so let's add the corresponding hash now. It works like the
existing multi-letter hash (multi_ext_user_opts) but tracking MISA bits
options in the cpu_set_misa_ext_cfg() callback.

Note that we can't re-use the same hash from multi-letter extensions
because that hash uses cpu->cfg offsets as keys, while for MISA
extensions we're using MISA bits as keys.

After adding the user hash in cpu_set_misa_ext_cfg(), setting default
values with object_property_set_bool() in add_misa_properties() will end
up marking the user choice hash with them. Set the default value
manually to avoid it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c1eddf17fd..9a0d85d6e6 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -34,6 +34,7 @@
 
 /* Hash that stores user set extensions */
 static GHashTable *multi_ext_user_opts;
+static GHashTable *misa_ext_user_opts;
 
 static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
 {
@@ -706,6 +707,10 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    g_hash_table_insert(misa_ext_user_opts,
+                        GUINT_TO_POINTER(misa_bit),
+                        (gpointer)value);
+
     prev_val = env->misa_ext & misa_bit;
 
     if (value == prev_val) {
@@ -769,6 +774,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
  */
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
+    CPURISCVState *env = &RISCV_CPU(cpu_obj)->env;
     bool use_def_vals = riscv_cpu_is_generic(cpu_obj);
     int i;
 
@@ -789,7 +795,13 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
                             NULL, (void *)misa_cfg);
         object_property_set_description(cpu_obj, name, desc);
         if (use_def_vals) {
-            object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL);
+            if (misa_cfg->enabled) {
+                env->misa_ext |= bit;
+                env->misa_ext_mask |= bit;
+            } else {
+                env->misa_ext &= ~bit;
+                env->misa_ext_mask &= ~bit;
+            }
         }
     }
 }
@@ -1021,6 +1033,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
 
+    misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
     multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
     riscv_cpu_add_user_properties(obj);
 
-- 
2.41.0


