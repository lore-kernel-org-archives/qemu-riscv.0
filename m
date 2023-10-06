Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED627E81DF4
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmP-000612-Kn; Fri, 06 Oct 2023 09:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmE-0005ve-Vm
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmC-0003BJ-VO
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c88b467ef8so10894485ad.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598515; x=1697203315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NJuHZOqU1ESRxMo2wNeFNr0U6gZOZRqM9wqvjboqRM=;
 b=UsXpwSPqIWxhteb24oGbRTqX3cD2y2rR58JxoxBRhOvG965/FSHtd/lnXBCsWctRwj
 JsZJibJ9ep9Nm7e7ieix1MgXvN/gLFXyqk9HUSbbQZlgpqoEpBCEWFHSyqSSiEzYpVFF
 nn7LRbuv6FS/4Fe5B2lxkvOXECsWpi3IIbw6U+P7M2xrI/o7qWznGyjDRrgTCyboXbB+
 1Ars6GdPd0A+FrH5ZTk/rY/D/pS8xbGooXuDa4ewyBLI23khGeuHyGqQrpE4nrWlneGI
 TZ8PjV1O+CdwgISBkA4QsXc5fuGi5pkVqD+ybiXVI5qxKLtai4VYv8rt7Igp56d84yPn
 PTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598515; x=1697203315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3NJuHZOqU1ESRxMo2wNeFNr0U6gZOZRqM9wqvjboqRM=;
 b=FHWa8rwUkOUAXzNNXHWyj3lUfxbv1oUOk3it5IQl3GKKs/R1q25vru2xLrSC6Js4EX
 N5/iDLPqjLjdKcUFPpb/9Hi94ouQ2EGzl+/Nk84j6BHGWYU5CbCW4oQh2wgcRe50ZmoB
 HY2Bmefi7loR3ao2VHbSt+0SYhWWsjGkkYNcx/riSE2oUt0kwGRqU8sPRzC6O+sy1q9y
 KKFWbIPakSSPo0UO9tYnS1BVrneYqiH/fv6/xyS+xPfXaLW9EJ66+LoomUa+dZDKetYZ
 GP0wRqyn9L1gUWI6qCimzQkWm6a+WVFgQf9BrL84rx7hz52qVlHP1tXKNrbwaRfYqxNM
 U07g==
X-Gm-Message-State: AOJu0YzG+YUDugOif3cADACO71ZQeZCq30doP6KsDZ7c2L3NKZWYkKmg
 +uKl22EiMi4vx/5/+v+m+uiIAg==
X-Google-Smtp-Source: AGHT+IGWmLWlXYZASmli0LYVKzV0l8agCyUsELJk0/PCba+Zxb4TtJGucMcJh+WV2ri+eGH5Sl4Rcw==
X-Received: by 2002:a17:902:d342:b0:1c5:b1cc:fe0e with SMTP id
 l2-20020a170902d34200b001c5b1ccfe0emr7513060plk.53.1696598515592; 
 Fri, 06 Oct 2023 06:21:55 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 05/10] target/riscv/tcg: add user flag for profile support
Date: Fri,  6 Oct 2023 10:21:29 -0300
Message-ID: <20231006132134.1135297-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

- the set() callback for the profile user property will set the
  'user_set' flag for each profile that users enable/disable in the
  command line;

- we'll not support user profile settings for vendor CPUs. The flags
  will still be exposed but users won't be able to change them. The idea
  is that vendor CPUs in the future can enable profiles internally in
  their cpu_init() functions, showing to the external world that the CPU
  supports a certain profile. But users won't be able to enable/disable
  it.

For now we'll just expose the user flags for all profiles. Next patch
will introduce the 'commit profile' logic.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 731192bafc..a8ea869e6e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -740,6 +740,50 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
     }
 }
 
+static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    RISCVCPUProfile *profile = opaque;
+    bool value;
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
+    for (int i = 0;; i++) {
+        const RISCVCPUProfile *profile = riscv_profiles[i];
+
+        if (!profile) {
+            break;
+        }
+
+        object_property_add(cpu_obj, profile->name, "bool",
+                            cpu_get_profile, cpu_set_profile,
+                            NULL, (void *)profile);
+    }
+}
+
 static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
@@ -834,6 +878,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
 
+    riscv_cpu_add_profiles(obj);
+
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
         qdev_property_add_static(DEVICE(obj), prop);
     }
-- 
2.41.0


