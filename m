Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8901DC61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:26:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cj6-0001zE-5i; Fri, 24 Nov 2023 15:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cj5-0001z4-6X
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cj3-0005KY-Fn
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:34 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cf80a7be0aso18716175ad.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857472; x=1701462272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYwHV52XZMZYzchIT8VunO2MaVlax20/YRkqPAYLBJA=;
 b=R3qB78arpJ3xcDorvxO/pSRPpffTPEjP2+qP7WcVK1GrpJuFlKUz6MgEYWDxTjBfoC
 LGwcPWox6Ol3BiekUIi+i42VGnI5f78spICs3xEIvW5AxdwwI2Om1EjMqfI7m3BXIlQO
 Rzjo2N1PXxgAdO5EQMoZyFGhc5o/eSn+TZCPsfCNjKRSFIJOpa/2/ECKioczXH969PWP
 cVl9q2zjgCQV2rLDJSpAuiguWr6bDjaTw4OOOXBVvl4W/N8eeDe8MU+Byl+niIJHB6un
 OykWmDm6rAYBVshisOJ31F8O0M6nkwEiiWIwF0XIV9XdVHPEa7NsDpcD3VcwnD0Bs/Am
 PPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857472; x=1701462272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYwHV52XZMZYzchIT8VunO2MaVlax20/YRkqPAYLBJA=;
 b=mW45QoSuuq9gul8S6ybt7+jvXNsKNEfdb/EEArxOZYHV+ATvt/noAGMH434Xkoz7Pw
 mqA2IcmnuSC1fI16ofkogbE3Ej5uShPGFjHIVUB8n0XbvKoCJ6dfhMGpYLKcGHnExmQD
 1fZpOLlJBZDX+nrw0BjSJyZ9y+rVldTiaX4kN/J6sWz6huK9tt/InXn/18GWRCLK9iAQ
 KXSXSl1Y1AR/XAaKc/w1t8PoUdsmOWGZ0KO64dJSV5xYpL0cUf3nbWc5lsNfWUG0vfk/
 Jy0V0Ka/H4gBaf/xfF7YAAafx80MMoQiZDLrZWtFawFY3YGGZOqn6CSINlfjip7GDari
 /G2g==
X-Gm-Message-State: AOJu0YwgJviNwZSF2hQKEt73HXfJ01PZup+BquT+5zuDJO1sYhRolcPx
 blInEo30Q1j2vgTLOYIFLSIrWAS+sWRdYHShs4E=
X-Google-Smtp-Source: AGHT+IGHv/Eqr5jobkGjBYElvfBbxk9qe9eBtTHbiU8/MAshuiWE2pUUR4HAq7VFlYusWHGJEEz1FA==
X-Received: by 2002:a17:902:8488:b0:1cc:5e1b:98b5 with SMTP id
 c8-20020a170902848800b001cc5e1b98b5mr4000183plo.66.1700857472278; 
 Fri, 24 Nov 2023 12:24:32 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 10/18] target/riscv/tcg: add user flag for profile
 support
Date: Fri, 24 Nov 2023 17:23:45 -0300
Message-ID: <20231124202353.1187814-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
References: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
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

The TCG emulation implements all the extensions described in the
RVA22U64 profile, both mandatory and optional. The mandatory extensions
will be enabled via the profile flag. We'll leave the optional
extensions to be enabled by hand.

Given that this is the first profile we're implementing in TCG we'll
need some ground work first:

- all profiles declared in riscv_profiles[] will be exposed to users.
TCG is the main accelerator we're considering when adding profile
support in QEMU, so for now it's safe to assume that all profiles in
riscv_profiles[] will be relevant to TCG;

- we'll not support user profile settings for vendor CPUs. The flags
will still be exposed but users won't be able to change them;

- profile support, albeit available for all non-vendor CPUs, will be
based on top of the new 'rv64i' CPU. Setting a profile to 'true' means
enable all mandatory extensions of this profile, setting it to 'false'
will disable all mandatory profile extensions of the CPU, which will
obliterate preset defaults. This is not a problem for a bare CPU like
rv64i but it can allow for silly scenarios when using other CPUs. E.g.
an user can do "-cpu rv64,rva22u64=false" and have a bunch of default
rv64 extensions disabled. The recommended way of using profiles is the
rv64i CPU, but users are free to experiment.

For now we'll handle multi-letter extensions only. MISA extensions need
additional steps that we'll take care later. At this point we can boot a
Linux buildroot using rva22u64 using the following options:

-cpu rv64i,rva22u64=true,sv39=true,g=true,c=true,s=true

Note that being an usermode/application profile we still need to
explicitly set 's=true' to enable Supervisor mode to boot Linux.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 3319ba8e4e..83d4dd00cf 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -127,6 +127,19 @@ static bool cpu_cfg_offset_is_named_feat(uint32_t ext_offset)
     return false;
 }
 
+static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_offset)
+{
+    switch (feat_offset) {
+    case CPU_CFG_OFFSET(zic64b):
+        cpu->cfg.cbom_blocksize = 64;
+        cpu->cfg.cbop_blocksize = 64;
+        cpu->cfg.cboz_blocksize = 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
                                         uint32_t ext_offset)
 {
@@ -885,6 +898,71 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
     }
 }
 
+static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    RISCVCPUProfile *profile = opaque;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool value;
+    int i, ext_offset;
+
+    if (riscv_cpu_is_vendor(obj)) {
+        error_setg(errp, "Profile %s is not available for vendor CPUs",
+                   profile->name);
+        return;
+    }
+
+    if (cpu->env.misa_mxl != MXL_RV64) {
+        error_setg(errp, "Profile %s only available for 64 bit CPUs",
+                   profile->name);
+        return;
+    }
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    profile->user_set = true;
+    profile->enabled = value;
+
+    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
+        ext_offset = profile->ext_offsets[i];
+
+        if (profile->enabled) {
+            if (cpu_cfg_offset_is_named_feat(ext_offset)) {
+                riscv_cpu_enable_named_feat(cpu, ext_offset);
+            }
+
+            cpu_bump_multi_ext_priv_ver(&cpu->env, ext_offset);
+        }
+
+        g_hash_table_insert(multi_ext_user_opts,
+                            GUINT_TO_POINTER(ext_offset),
+                            (gpointer)profile->enabled);
+        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
+    }
+}
+
+static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    RISCVCPUProfile *profile = opaque;
+    bool value = profile->enabled;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void riscv_cpu_add_profiles(Object *cpu_obj)
+{
+    for (int i = 0; riscv_profiles[i] != NULL; i++) {
+        const RISCVCPUProfile *profile = riscv_profiles[i];
+
+        object_property_add(cpu_obj, profile->name, "bool",
+                            cpu_get_profile, cpu_set_profile,
+                            NULL, (void *)profile);
+    }
+}
+
 static bool cpu_ext_is_deprecated(const char *ext_name)
 {
     return isupper(ext_name[0]);
@@ -1012,6 +1090,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
 
+    riscv_cpu_add_profiles(obj);
+
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
         qdev_property_add_static(DEVICE(obj), prop);
     }
-- 
2.41.0


