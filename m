Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7307C25B6E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:46:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvnZL-0000zV-2F; Wed, 25 Oct 2023 19:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnYz-0000tE-QD
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:27 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnYx-0002HQ-P9
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:25 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ca82f015e4so2166875ad.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698277522; x=1698882322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=twCg9Hi/Uneisj1rGhDSwdKJP+W0YTw82SGzEBE1Q5o=;
 b=JUUt18vljw7MbYno6V7t5JOskzp8FX4qqRot6GVpwnD8xZXE776ZDiTmUY6k62hkAj
 gk+bSYUJQkjpdgz01RgK8HX///Q26FwVS83SomaczYmBRcLbTTPgBPSabEPRCz39gC+s
 32JwFk0MAwdpnZpf5tMTFtkvLG4EJp3f5eQwwY1m4A43rYFaZz+X6DEvL8UL36dv86lA
 qMt8wMNT12rOd/lNu8jlIA/KOAPI8K59HCfYE3fb0KO9j4err4rpSmUPjnAW9A2SmI2r
 fpX5t3Cr5zEU5uH9P3814jBeHPEypBc4vaZeNcARB9iszRbaaLxqPS11QxAdQbbM657i
 qpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277522; x=1698882322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twCg9Hi/Uneisj1rGhDSwdKJP+W0YTw82SGzEBE1Q5o=;
 b=g5ftv2PEpRjPJ0r3dtq3x+9b0bB4t2U1wdsSYqGDATlWiw1UcOz8e8nikb1EIeRPNB
 WKYzYnUIdHG27QIG1rnNvgcNbHHODKkgQI676j+NacTVip6/Hl5XB4Tz5HgYkV7ZaTkl
 17GDR0rutRq1LX5r7Tn5Vxhb/g/4+lkNQ5pzd8Fbf+rz2n1m0yVrwNCK1NTvV8kQjJPG
 Jt2B8UhRkj2jxwoCqsv+4I6b+HpGMbz3sDbFY9Uf1EXEXSC4+qli+rd4bFHwoX82/WfI
 w/LzWVjIbjlgrY3mdzP0xcWQ5X5p9J0zG4dhLzLpljGmG94d3ILX6AwUwCBYfAJ3x170
 BLaA==
X-Gm-Message-State: AOJu0YwNAcronwumM4j3OTRxNUQFiUHQJ/IuVNWE3yKF43l9aRw10P0D
 GK+5wQZFOz+CtSYTb7vSOzSrFBapSiX2F2baP/I=
X-Google-Smtp-Source: AGHT+IHmSOJaglzUed+GRmm2uvWsmRAiyfO7J3GWQloS5FdEdL3sLNPQRWin+x6ul8zyHZJJhmUuUw==
X-Received: by 2002:a17:902:ec8e:b0:1ca:82f0:131a with SMTP id
 x14-20020a170902ec8e00b001ca82f0131amr19116439plg.19.1698277522386; 
 Wed, 25 Oct 2023 16:45:22 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001c736746d33sm9738654plg.217.2023.10.25.16.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 16:45:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 04/10] target/riscv/tcg: add user flag for profile support
Date: Wed, 25 Oct 2023 20:44:53 -0300
Message-ID: <20231025234459.581697-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025234459.581697-1-dbarboza@ventanamicro.com>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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
will still be exposed but users won't be able to change them. The idea
is that vendor CPUs in the future can enable profiles internally in
their cpu_init() functions, showing to the external world that the CPU
supports a certain profile. But users won't be able to enable/disable
it;

- Setting a profile to 'true' means 'enable all mandatory extensions of
this profile, setting it to 'false' means disabling all its mandatory
extensions. Regular left-to-right option order will determine the
resulting CPU configuration, i.e. the following QEMU command line:

-cpu rv64,zicbom=false,zifencei=false,rva22u64=true

Enables all rva22u64 mandatory extensions, including 'zicbom' and
'zifencei', while this other command line:

-cpu rv64,rva22u64=true,zicbom=false,zifencei=false

Enables all mandatory rva22u64 extensions, and then disable both zicbom
and zifencei.

For now we'll handle multi-letter extensions only. MISA extensions need
additional steps that we'll take care later.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index ac5f65a757..c1eddf17fd 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -794,6 +794,57 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
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
+    if (object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) == NULL) {
+        error_setg(errp, "Profile %s only available for generic CPUs",
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
@@ -918,6 +969,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
 
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
 
+    riscv_cpu_add_profiles(obj);
+
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
         qdev_property_add_static(DEVICE(obj), prop);
     }
-- 
2.41.0


