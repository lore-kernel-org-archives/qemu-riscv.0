Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3237E81DF9
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:22:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmT-00064b-0P; Fri, 06 Oct 2023 09:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmI-0005xu-TZ
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:04 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokmG-0003C3-Jn
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:22:02 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c3d8fb23d9so16119675ad.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598518; x=1697203318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OY+Z7p8EVlJtkdrqr2A47PoI19IqT3Z+EwZbD1sy2A=;
 b=b4N95K8NogURwGCoOcouRC5P/KQmYrhzg94Z0uhtUY0aWfkU05hREwoZNKFx4ObleW
 FucnboRAkNGqOOlBwEKrxPL2HVm487oAY4AwZUf7pqIABQsCT7y+riBFwWkX95QrIow+
 I0zhknRzlp9xWqEi5IDKuehamjHoRRxCakVHNhh/zsOBu5K9Uz3toxMR5jLPA6AI+LOd
 6ajRJ7uFdocMMtxFRw7aTRPp5JGfvw/IGoV3H5fSaAOOV+mMamqkw4DhuADM5Y++WgFp
 lR7jxj8hIGrgZdi1uy7lrg5NFVA3gOjhpqXpcbGdhc9I5l+GJN5v7ggOYf+pVd8Tjdu1
 yNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598518; x=1697203318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OY+Z7p8EVlJtkdrqr2A47PoI19IqT3Z+EwZbD1sy2A=;
 b=hruyzviHlhhlkXEJody9wyEnjU4kBE7fRVE9h757aZ4KbHLekXK/7CrjDA+aLj7gld
 iFb8J+3zTKbuo7HQv8doomB1cysW6ScrqH9lTyWxyBGnjq8gyZBeAUSUrOBDthD3KIhk
 UeQNZbpH0Ey/pPOaUnhbrFbECI87ibwbb5sAVkxNld8EzgUNO216Q6ozqqvUBK/aZDoR
 cpmyiy0y3Q3WnUbdcLa5e8+YX1jTtbaxVGVbX01w+e2SOkYJ2YTWl6qhnItWCqd/jwtM
 NhGY1qHdx8s8U+9V1BeGoi2aOYVTifJnD/uTUecb0dQ4qkZxwM7zhVa3SVPWDoqGpb88
 rb8w==
X-Gm-Message-State: AOJu0YzBHI2n6LSRQQfh7cfWXvEi9bkb5yfjdowToXA2ECVWTtBMq3DW
 0KDejZYMWzsQLwNIQSOEEI/0y6espSlbQFUtbXg=
X-Google-Smtp-Source: AGHT+IFmE41nzQcqBj8qDSxndjfxQ8EBAtOhf2+dLeZF70CE0rXYGqYdOUtPYueJzHVhiGVYPxIFLA==
X-Received: by 2002:a17:902:6b04:b0:1b7:e86f:7631 with SMTP id
 o4-20020a1709026b0400b001b7e86f7631mr7702793plk.19.1696598518406; 
 Fri, 06 Oct 2023 06:21:58 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 06/10] target/riscv/tcg: commit profiles during realize()
Date: Fri,  6 Oct 2023 10:21:30 -0300
Message-ID: <20231006132134.1135297-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

To 'commit' a profile means enabling/disabling all its mandatory
extensions after taking into account individual user choice w.r.t MISA
and multi-letter extensions. We'll handle multi-letter extennsions now -
MISA extensions needs additional steps that we'll take care later.

riscv_cpu_manage_profiles() will scroll through all profiles available
in QEMU and call riscv_cpu_commit_profile() for any profile that the
user set, either to 'true' or 'false'.

Setting a profile to 'true' means 'enable all mandatory extensions of
this profile'. Setting it to 'false' means disabling all its mandatory
extensions. Since we're doing it during realize() time we already have
all user choices for individual extensions sorted out, and they'll take
precedence. This will make us independent of left-to-right ordering in
the QEMU command line, i.e. the following QEMU command lines:

-cpu rv64,zicbom=false,rva22u64=true,Zifencei=false

-cpu rv64,zicbom=false,Zifencei=false,rva22u64=true

-cpu rv64,rva22u64=true,zicbom=false,Zifencei=false

They mean the same thing: "enable all mandatory extensions of the
rva22u64 profile while keeping zicbom and Zifencei disabled".

Enabling extensions in the profile is also considered an user choice, so
all extensions enabled will be added in the multi_ext_user_opts hash.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a8ea869e6e..8fb77e9e35 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -264,6 +264,41 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_commit_profile(RISCVCPU *cpu, RISCVCPUProfile *profile)
+{
+    int i;
+
+    for (i = 0;; i++) {
+        int ext_offset = profile->ext_offsets[i];
+
+        if (ext_offset == RISCV_PROFILE_EXT_LIST_END) {
+            break;
+        }
+
+        if (cpu_cfg_ext_is_user_set(ext_offset)) {
+            continue;
+        }
+
+        g_hash_table_insert(multi_ext_user_opts,
+                            GUINT_TO_POINTER(ext_offset),
+                            (gpointer)profile->enabled);
+        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
+    }
+}
+
+static void riscv_cpu_manage_profiles(RISCVCPU *cpu)
+{
+    for (int i = 0; riscv_profiles[i] != NULL; i++) {
+        RISCVCPUProfile *profile = riscv_profiles[i];
+
+        if (!profile->user_set) {
+            continue;
+        }
+
+        riscv_cpu_commit_profile(cpu, profile);
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -273,6 +308,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
+    riscv_cpu_manage_profiles(cpu);
+
     /* Do some ISA extension error checking */
     if (riscv_has_ext(env, RVG) &&
         !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
-- 
2.41.0


