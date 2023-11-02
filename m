Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7254C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:46:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRe-0006uX-R1; Thu, 02 Nov 2023 18:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRD-0006Th-OE
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:28 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRA-0003Ls-Vy
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:18 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a8ada42c2aso17441377b3.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965116; x=1699569916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hjCbAZZDcAypWK0NgF4XTIt8ndW4NoReaVniXWy+MTQ=;
 b=BGeuFRJtljj0oe4ZvP8aDdCJFhV6LW5zog4CfCdTVpHP27I243DJfzl/pZ9+XpiVNA
 k1ZsrN/NOd91I4gtLrwAwofzliOdOBkJ/9j92Zz2jsp+35iHWUAwFbt20IRuBtCFA9jp
 MuGFtFj49DUFY0v25ezbIUja4MdLXcDAVRc6cpS5mS/y10ABOxVKwOwTbVFD4qRwpNW/
 y7iCWU8EtpsEpEmTLdFMn9O5rymLCvFM/3mCoYxWjqAa4Le3ohFT7PdAuHd/GMu+eX+p
 MbZ9zGGr5g39rlL0lq7+AetW49LzCJS0JwPSfoA21NCQNxSIBUx24+lp4XTM7uxJ4CyC
 UvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965116; x=1699569916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjCbAZZDcAypWK0NgF4XTIt8ndW4NoReaVniXWy+MTQ=;
 b=q6XV9VVuq4yAbPvl7gcR8NgOpPP4sQ3sjIde1DILhcQGC4eO8Y/7GKC2X423pjKt5d
 fbBqgo3Twm+blSShhRPd4+9+4slMnvHK0tvGqa1XZvHSSjqaDvRpcJUZWy32I8EAdAbB
 TJboH2zeERQG3SjT80ea8MfqGDj1ogqrrFx+/2HFcM7bNBQlwWDUuSSryNyxxq3sIQN9
 5NFSr5GWf1ginH+M6oDcjc85NoEN20nLh2QXVyqwleU1HRpxptO+M+mTB6n+AhnhduWh
 v0SBPuI75TIx3l+EWuybKhzGdP/qSdak6eN1ZR7idu7awRWsF7T6YQhCb5ps9U8cZC9n
 Ds2A==
X-Gm-Message-State: AOJu0YwMb57L7aPkIKAQLcECcY6yhU2EVdThrlQFU9uddrXpDN7muxcc
 w2p1hAADdEA8uqy7s9PMgOKk+xmYJEOeAPqCR8Y=
X-Google-Smtp-Source: AGHT+IEUWkAPS2FN5ohqs79UVLl0BQ5xgyAY1tGH7vfYEq8jVz0dWJX5N/lydkwol51tDY2paIToEw==
X-Received: by 2002:a0d:cb95:0:b0:5a1:d63f:5371 with SMTP id
 n143-20020a0dcb95000000b005a1d63f5371mr1260391ywd.20.1698965116162; 
 Thu, 02 Nov 2023 15:45:16 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 10/19] target/riscv/tcg: add user flag for profile support
Date: Thu,  2 Nov 2023 19:44:36 -0300
Message-ID: <20231102224445.527355-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
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
 target/riscv/tcg/tcg-cpu.c | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b0f69c6437..b52910850f 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -871,6 +871,71 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
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
+            /*
+             * Note: the 'priv_spec' command line option, if present,
+             * will take precedence over this priv_ver bump.
+             */
+            cpu_validate_multi_ext_priv_ver(&cpu->env, ext_offset);
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
@@ -1002,6 +1067,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
 
+    riscv_cpu_add_profiles(obj);
+
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
         qdev_property_add_static(DEVICE(obj), prop);
     }
-- 
2.41.0


