Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF06070747
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=WO2BZJFu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtA-0002n4-55; Wed, 04 Nov 2026 14:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsn-0002Ml-3O
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:53 -0500
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsl-0002Pd-EI
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:52 -0500
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-3550c917fd3so1609047eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821370; x=1794426170; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SiPCF3xlwqQkTa55LvTY9LHo8r9GifIY+XV4J0fb6cE=;
 b=WO2BZJFuQTH6GZ2+NV+03TDoSpbiRCyIDggViTm5BXzuApRfAZEwyiZtJAoa6QTZ4d
 A6hKDZ6I9zAfLMV/ne7HB8YpMhAq6gWYpaDaASj3ukLPArWjcAevxZVFmoYUL0SuxP2g
 qMu78CsqXZXyNycWf4xs9DaDuzEBkqA44+OK08TzNGf+uWOn0oRr8h1RBUhaY3qq1S4G
 4T6aA+lfERytZm/oFv7PUjN6NSthSu3AslwHg0MXC2NFi8vSeUk/6W5DZ6rTnOut1+oj
 bOnXIfizP3IwZ1Je1OsJ6yHIFBoKJJNOUuCMPp689dy4/9zSz1jdbC96oLb0nT0jb74U
 0Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821370; x=1794426170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SiPCF3xlwqQkTa55LvTY9LHo8r9GifIY+XV4J0fb6cE=;
 b=YPVHFAqu9KD2cDhXD51Dx8h9SZwoSYiUpXC32Eee7w85j6hLDbYdEsSXGzs6a7kbDe
 MuM/UlItY1pZpASzSlWH5gqTpGI2hVskAsQVhYtxvfQKJ23OmO4lSron1fZa3Tmqyr84
 SnHrs7SBI7t+FuvqIoQaBsIA/bWwLETdWQ2kWy2WjwctwWSL+aJuHsHfHN1863ZSHEbr
 d5XWSrAwqBaKTzV4r8wkjI6q6rI7Ty3jy9q9SsLZnzZsj3cPNE9wmMWYbv180mrKvFTp
 L8UHIWJLYGHH76ek+ElRyfk76XX7Z/UUb3fQsOO4cqJnOspfWcp7ZUsGd5+dRPeN9Cx4
 N7Sw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOim6dyX2TJQkHLpcvIo1om1Xu4/aNzqer+ptPnOxgdDmeOCe0quC5KjsFnZ34B9otCLP5TXg/D0Gs@nongnu.org
X-Gm-Message-State: APuU4Z+ZhZJ0vZxtMQPXcsqdwfKoUMOiJwv4xyZwgv1cu+XReOLlQEWv
 ovVxqWHiTF+lnHv3n38fyldixECFrk0gTK4erCuvsnIVlLv7YZoZpc7FCUg6XTUjlnI=
X-Gm-Gg: AYBFou1rIXWmEPJfAUY/rQY2vaMTrwgoyI6FDPkizI2F47Ptrxm74W2YlOrikIEm0NL
 8nMixfVLsIIBAnecKWy/HcL3h3jciyTSTyJYyy/hM5YpmULkhyeGFgsBD/aNlWaaBzO5shvC6nl
 iITmuADSYIrN05PwOT7yEBVgT36riPhi3Foj4FwbgAQcTdbsTAzrnSUVTfD01q2OeWXxZAYLODD
 9SE5dlFl6OQ6qaxVr3pnHx723C2hobYM+6BHuQnD/kpI8zgnGD0jss9SWQOljuKOYoWSTGMDuYd
 r9PSLD/0JG4KGvalAR4tNe4giXBH+cGQ6z6K0Vs4PnjQr48LUvgXrPNWxU63DIJgUdWXL8SoLfj
 EiPDv0BfI1+h05JCXYfqzgv8daC4cZhMoH1O+8OVlByoqJJCNqVIfac2h3vNhe3hy+S/XvCPELk
 qMi4uoSNfNwNnDJJ5/YjG3fW1L8GUgsnsFvmyVMdaPMIni9WvEyFVbkpC7RvFGcdBvrIyhtdRsd
 ZSCNL/5AiZ2nfeyvbUd5irPQuNfKfuryF1VJeejcD9O6mQDnbmpeuQ5sgVEp5gPgs6shPfyot8/
 8yZrCxIltHfUCCdJcYYY4KXJwL9zTRCNPEm2PU749umYdB8l3Yy6omWEOuasmy2NBJ0b4lGc7sF
 gEoI4Vn0FhMYF2w4hDnPIDlCuOzlo7WDk+vz8XoD2v9z/wsoyJg==
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id
 5a478bee46e88-36a425e10f8mr39018735eec.36.1793821369884; 
 Wed, 04 Nov 2026 11:42:49 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:49 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 11/38] target/riscv: Add cfg property for Zvfwdota16bf
 extension
Date: Thu,  5 Nov 2026 03:41:26 +0800
Message-ID: <20261104194155.679241-12-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPU configuration property of Zvfwdota16bf extension which depends on
the Zve32f extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ae859128d30..d6e2b07c401 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,6 +236,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfwdota16bf, PRIV_VERSION_1_13_0,
+                                    ext_zvfwdota16bf),
     ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
     ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
     ISA_EXT_DATA_ENTRY(zvkn, PRIV_VERSION_1_12_0, ext_zvkn),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 8bac69a17f7..30c404863c8 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvfwdota16bf)
 BOOL_FIELD(ext_zvqwdota16i)
 BOOL_FIELD(ext_zvqwdota8i)
 BOOL_FIELD(ext_sdext)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 54749125acf..91e009072e6 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -701,6 +701,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfwdota16bf && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfwdota16bf extension depends on Zve32f extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 57a381098f6..41b526d25ef 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -40,6 +40,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     target_ulong reserved = 0;
 
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
+        riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
         riscv_cpu_cfg(env)->ext_zvqwdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwdota8i) {
         reserved = vtype & MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
@@ -95,6 +96,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         break;
     case MO_16:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
+                        cpu->cfg.ext_zvfwdota16bf ||
                         cpu->cfg.ext_zvqwdota16i);
         break;
     default:
-- 
2.56.0


