Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA83DC4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:03:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOI75-0003yR-Pu; Fri, 12 Jan 2024 09:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI73-0003wE-Oa
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:21 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI71-0005op-2Y
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:21 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d54b763d15so32976765ad.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705068136; x=1705672936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEILIInaRE1Jo+ikjAVm+GwK5HxHOMFfTD8MoghY3lI=;
 b=QkAsrISwjdKV0EDKrSeTgHaBC0xOTj/6RvRhY2wDfwpF+M3d7D5r7rGReUuW3Iflls
 G/Oh8fhpi26fqmSy6l/DfMTqeiGP/NxAD3xv4fBtTnLr/2wCV3VoIv5AL9/mxrK4mVIJ
 iMhsIHNGKiT9+48mmMbqG3LvvujoWLuqxTTaBcpOUFuf0Lhij1wGiXXMAf6j6fGQ9cbm
 zmsdDDAc3ZZRLaIC+4V/mKkDgJk3Mj1bMUPHD/B8Nw2E4Yvpz7VJhj/VDJByZ6tVUlWl
 5o4xdxtuCwIdB/pWfMPhHVul9DMj8PT0HNk5bMFvw5VQvoax2kpziOolrPDG3WPTtgAL
 eKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068136; x=1705672936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEILIInaRE1Jo+ikjAVm+GwK5HxHOMFfTD8MoghY3lI=;
 b=Ac+H0HM3AIj/ak6ONBqRHU/eY6OZgznxpYrAat4n6gQl9YG4dbj65/YPjPhhTUFqEd
 XseqpHk3jnB6Z0JUpCsBHb7zEAM63ptyvtIb48/xVmnxAd3aT23Gk+LKzqFzbjdfBJaU
 0KDof3h0nr5hASKaOkJvVYDi6NZF5WWlhNfoAnyc5Sy7nfiGYyc3tblACaap3AD70CV5
 ToH3REnD56rxFYMmImo/YCMmyQNqp/0SAHjP5BCEgDeGkvwdgx0E1P7tGUCHnhjF9W3b
 IxuIuBOCuB0+eLJrzR9xi1MgTzAfan7fB3zqPMvNnYWJmYju7R4+2Udan6nCBtI+BIIZ
 62XA==
X-Gm-Message-State: AOJu0YzGVOFHVaOgMHEQyq6ouFybo5kwgejwdM4x/Qg46TA6LIS6has1
 G2KYMGOh20WtGk6OYpN7ue8m3pwjoiV7Gw==
X-Google-Smtp-Source: AGHT+IFy3Nj5ljz9PHmk0Avt0h39x2tiQ27jyGWoPSUvYIUO6VzjBYLTaN7u3EbE79lpNyS3Uo9J/w==
X-Received: by 2002:a17:902:d64e:b0:1d5:a0a6:c40c with SMTP id
 y14-20020a170902d64e00b001d5a0a6c40cmr745355plh.6.1705068136505; 
 Fri, 12 Jan 2024 06:02:16 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001cf6453b237sm3116927plo.236.2024.01.12.06.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:02:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH v5 2/8] target/riscv: move 'cbom_blocksize' to
 riscv_cpu_properties[]
Date: Fri, 12 Jan 2024 11:01:55 -0300
Message-ID: <20240112140201.127083-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112140201.127083-1-dbarboza@ventanamicro.com>
References: <20240112140201.127083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

After adding a KVM finalize() implementation, turn cbom_blocksize into a
class property. Follow the same design we used with 'vlen' and 'elen'.

The duplicated 'cbom_blocksize' KVM property can be removed from
kvm_riscv_add_cpu_user_properties().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++++++++++++-
 target/riscv/kvm/kvm-cpu.c |  4 ----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d64fce5a73..0391f16e28 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1321,6 +1321,7 @@ static void riscv_cpu_init(Object *obj)
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
     cpu->cfg.vlen = 128;
     cpu->cfg.elen = 64;
+    cpu->cfg.cbom_blocksize = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
@@ -1872,8 +1873,42 @@ static const PropertyInfo prop_elen = {
     .set = prop_elen_set,
 };
 
+static void prop_cbom_blksize_set(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value != cpu->cfg.cbom_blocksize && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.cbom_blocksize);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.cbom_blocksize = value;
+}
+
+static void prop_cbom_blksize_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.cbom_blocksize;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_cbom_blksize = {
+    .name = "cbom_blocksize",
+    .get = prop_cbom_blksize_get,
+    .set = prop_cbom_blksize_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
@@ -1962,6 +1997,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "vlen", .info = &prop_vlen},
     {.name = "elen", .info = &prop_elen},
 
+    {.name = "cbom_blocksize", .info = &prop_cbom_blksize},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index dc0466df69..094bc5f47c 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -493,10 +493,6 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                             NULL, multi_cfg);
     }
 
-    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
-                        NULL, kvm_cpu_set_cbomz_blksize,
-                        NULL, &kvm_cbom_blocksize);
-
     object_property_add(cpu_obj, "cboz_blocksize", "uint16",
                         NULL, kvm_cpu_set_cbomz_blksize,
                         NULL, &kvm_cboz_blocksize);
-- 
2.43.0


