Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5A6C25B47
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:52:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qveHg-0001sx-FD; Wed, 25 Oct 2023 09:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qveHX-0001o1-FW
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 09:50:49 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qveHN-00033F-4Y
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 09:50:46 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cace3e142eso38093745ad.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698241836; x=1698846636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXXLbpl2gHbJPniEmo5uVLbyLHvu/WHrdmhzs+7a9EI=;
 b=IgnzOophgdh8yBUVrSEbNN+3Zic2yCqh8de9P4Q4EdN3B3vtzvHDxbD2q6UvjSYWtQ
 OC/nVrhQ3Z+AkhzXD0lnICv4PnqN7x3g7mhlvskQn+0cEBzwsdj7ouRy3b/rr3WDJS/L
 0QqB7JTzGyP3UzZeYoDrHoJ+M3OFQ+QqiGItrwOrxq8WdpW+LqujeWLnwVF2Yf2aylgN
 VvI28RPJ8ctIwbUIYJi43GJZdUyou/rotZdVlE/g1/zRwNcCtAYOplsCW/XVrj34tfCT
 EtDH4/fp18iCZB/0t6Zzf1Za7PnwxA+L+Fh87kJCA8mM6cU4mdM8USSggJ6ruhPLYy2T
 k9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698241836; x=1698846636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXXLbpl2gHbJPniEmo5uVLbyLHvu/WHrdmhzs+7a9EI=;
 b=kkfzVv50FJtltscQtejIEHuADfr83tdC308fAAr6+vu93dNJhzmgKSk88zV6gwxBU1
 xOtGGwXaNHRH1MJtpBWO+OZjOvfQeFpk/6TBfopLYObfAqZKxaKoNQI1kp/OZTB5SBHX
 86jlzQLBvZWQ62xNgu4EvztuEm+mopw1Vdt9mxgMVlPsDJVic3aLLUvitEd82x8eJAmr
 SbxVu8ueN6OJ78hAWeRDg17uLqnZzl513GMvDwJw5gyedMfokSb7Q0fm5hToHRMIhylF
 z6vSH0hk0EW7DcLf4lICiAFHiaOkV9dA2kJ/7iAQmIPqbGjVqoCEN8A6ndW+EWw5uLP6
 HlCQ==
X-Gm-Message-State: AOJu0Yz9zEHAzrER+fGrdCY7g4GfQiDD2Mo15okdbaaGwsGjFrrzlm6l
 TeQ0QwdKjVrxxL6sg3YgEjVzDvqe/EGFL0x++aU=
X-Google-Smtp-Source: AGHT+IFrMM9apq3eAxtjJ6vP1FsP/ThotWdE2+VzUdeQUTjSpFJnopX1pNv/JGkGqxh1Im92Grfn+A==
X-Received: by 2002:a17:902:bd97:b0:1c3:eb95:2d27 with SMTP id
 q23-20020a170902bd9700b001c3eb952d27mr12715358pls.48.1698241835833; 
 Wed, 25 Oct 2023 06:50:35 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 jw4-20020a170903278400b001ca485b8515sm9252548plb.91.2023.10.25.06.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 06:50:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 9/9] target/riscv/tcg: warn if profile exts are disabled
Date: Wed, 25 Oct 2023 10:50:01 -0300
Message-ID: <20231025135001.531224-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025135001.531224-1-dbarboza@ventanamicro.com>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Enabling a profile and then disabling some of its mandatory extensions
is a valid use. It can be useful for debugging and testing. But the
common expected use of enabling a profile is to enable all its mandatory
extensions.

Add an user warning when mandatory extensions from an enabled profile
are disabled in the command line, like we're already doing with RVG.

After this patch, this will throw warnings:

-cpu rv64,rva22u64=true,zihintpause=false,zicbom=false,zicboz=false

qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zihintpause
qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zicbom
qemu-system-riscv64: warning: Profile rva22u64 mandates disabled extension zicboz

Note that the following  will NOT throw warnings because the profile is
being enabled last, hence all its mandatory extensions will be enabled:

-cpu rv64,zihintpause=false,zicbom=false,zicboz=false,rva22u64=true

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 4e90c726e9..ff2ebef63b 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -147,6 +147,22 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static const char *cpu_cfg_ext_get_name(uint32_t ext_offset)
+{
+    const RISCVIsaExtData *edata;
+
+    for (edata = isa_edata_arr; edata && edata->name; edata++) {
+        if (edata->ext_enable_offset != ext_offset) {
+            continue;
+        }
+
+        return edata->name;
+    }
+
+    g_assert_not_reached();
+}
+
+
 static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
                                     bool value)
 {
@@ -619,11 +635,52 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
+static void riscv_cpu_validate_profile(RISCVCPU *cpu,
+                                       RISCVCPUProfile *profile)
+{
+    const char *warn_msg = "Profile %s mandates disabled extension %s";
+    int i;
+
+    for (i = 0; misa_bits[i] != 0; i++) {
+        uint32_t bit = misa_bits[i];
+
+        if (!(profile->misa_ext & bit)) {
+            continue;
+        }
+
+        if (!riscv_has_ext(&cpu->env, bit)) {
+            warn_report(warn_msg, profile->name, riscv_get_misa_ext_name(bit));
+        }
+    }
+
+    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
+        int ext_offset = profile->ext_offsets[i];
+
+        if (!isa_ext_is_enabled(cpu, ext_offset)) {
+            warn_report(warn_msg, profile->name,
+                        cpu_cfg_ext_get_name(ext_offset));
+        }
+    }
+}
+
+static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
+{
+    for (int i = 0; riscv_profiles[i] != NULL; i++) {
+        RISCVCPUProfile *profile = riscv_profiles[i];
+
+        if (profile->user_set && profile->enabled) {
+            riscv_cpu_validate_profile(cpu, profile);
+        }
+    }
+}
+
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
+    riscv_cpu_validate_profiles(cpu);
+
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.41.0


