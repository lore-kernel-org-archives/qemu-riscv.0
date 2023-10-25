Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF952C25B6B
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:47:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvnZR-000189-VJ; Wed, 25 Oct 2023 19:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnZH-0000zD-WE
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:47 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qvnZF-0002Kb-Je
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:45:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c9d3a21f7aso2010715ad.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698277540; x=1698882340; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N66mwe55qIwqiyZlpStxI0DDZnJyiqHeIii+NKoAya4=;
 b=cK/b4PSLZUq83S7vtTEsPDxxF2masnsHYPp3lFOfyVDCEe6Fy7LnwXwP7yzcIdsGo0
 sI1pB8kAAqkZHt4/4Q4lkiuJxwfWZeEjmMD//9b9foUIoSvtGRJE+8M7/O8gY0peJxb9
 DLqtdeyEp0d1sufRjZQJz6nHDJAHPEXCbKxDhcY/pDoOKaE4QWUmQWmPI+FCOq3/TCpf
 gR6JYgLxhDVelrOTH4BOfUfHahjxoB/Zk2Cdef8X+zZgcs0FUTyQJ6YTvYygm56H4FCQ
 Qp474iM54fukgM1xnuC3eXik8aJ4c04GG0x70Y8llBRSZZtrdtVRMNwG98GzrwGAYdsj
 M/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277540; x=1698882340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N66mwe55qIwqiyZlpStxI0DDZnJyiqHeIii+NKoAya4=;
 b=VmOjgLHoFPbxqBIq5ERGeBhurpwc+IKoxSL2lNu2tC/VnQxrzJkyRCse3GkCf7mElo
 wVw7PhsS7V1NO5G8qfHvY293SnwRkQUgNyhd0svosadCk1W8a1ceXbXlM1JxXfav8ABf
 sf7UFFHOlMGWxoaAsSo/sARB/ZGp3tU7B4Ylr4bq2d89Ni6mM2nOXppQqwRH1Sd1sEeB
 r5etqDLhKdsea0kl+jfpo0Psz71LCU7py+WQ00VYG6AwOw6g+fameKKbTSQHExuB9w38
 0dm9VRChhFEbfxpNcU6ypX/tvcdNhW7ujcreedxwz4tl5Ut6a7QLena1hABiAb7bKvi0
 emNg==
X-Gm-Message-State: AOJu0YxIHgKBUlna20JrNuoe4HnWk/3payPGxQ4w862qCOj0ob9FFTsn
 NVYupKeH7i09LWjKaxrHWpMJew==
X-Google-Smtp-Source: AGHT+IHDwfHwMq5HfxnwFpBpVDap1BUY3VuXH9Ojj056ztPsiE7ywAa75yKw26XEbagEBCzRJ7TgIQ==
X-Received: by 2002:a17:902:c411:b0:1cb:e412:c3fd with SMTP id
 k17-20020a170902c41100b001cbe412c3fdmr8475460plk.63.1698277540213; 
 Wed, 25 Oct 2023 16:45:40 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001c736746d33sm9738654plg.217.2023.10.25.16.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 16:45:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 10/10] target/riscv/tcg: warn if profile exts are disabled
Date: Wed, 25 Oct 2023 20:44:59 -0300
Message-ID: <20231025234459.581697-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025234459.581697-1-dbarboza@ventanamicro.com>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8d24cb2e82..ac21cd5ad4 100644
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
@@ -644,11 +660,52 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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


