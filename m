Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27B607525B
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Sx50C7aN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtT-0003dM-E1; Wed, 04 Nov 2026 14:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtR-0003ac-D1
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:33 -0500
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtP-0002Zd-7Z
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:32 -0500
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-36a18fc7a38so311646eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821410; x=1794426210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=75GpILFjdoTB2H5cou7sPd8Li4CuubbZC23Mtkf7VyU=;
 b=Sx50C7aNZK0RX3cqPqWem5TYCqb/x5ioahYIkAsyccGD6p076mybAqThhRyT/5iyJx
 Gayjwhnh1zZlYjtz0zn7kZQTdD/k7Iprel1sIkg7zWxsKIGc9Ippm5Geoh3xWbECr2qk
 4uNmYkiVkZb9Qt3i+X7VWZN6O8qHx3xCdLvTJB/kACJAnTumpMsMFwa4wLO9Nw2iKWBZ
 d0Tvyqbsp7ydtI41k/ZSaFJuDH48p5veaT2PhaZr6OHOrCrTrWZehD+7FldldXA8CIsW
 xWvytTOyut0w9+V1/JWI6673YssUG6cpK5BeL3omHGSfL/bZewkKtI/IKKocWH6Saa1P
 Rymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821410; x=1794426210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=75GpILFjdoTB2H5cou7sPd8Li4CuubbZC23Mtkf7VyU=;
 b=d1ES3SCYYHiM41FPfNT/Vc5o6KWwyOXTFhNHxzhX3qInejM+JgqqEanfhPuJEx45Dj
 nmOyZVko/0F1mvaekqkYbtEeE/gBmCtro9p4YcRDHLhUMYYnlt8kq+ajnLwg8gwzBQTB
 RVMzQKfwStW33HS4NHSyvWvigN375bkj7KPxA7JBgXLpGSQB340C/TqDvJdXFbQHyu1e
 Pu1QHux30+M9jwGDRya/HPkegqeyQHIEeJV8PIN88Njj6vD8IFQfu//Jg8bUN3bkmtKm
 Nopppc6I099rG3G/8fKJFXFt/rcuoKVEWkMbx04J0cQXZqAlTYDAbFwecni+26bVYZnI
 JaZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8nbSgsyFER6BIcQS+WcV6/8Ouq0+9by1vulisufwTqMRMFUJXcNDuLugzHnLHkQkcafKAhvJ2XfTQ@nongnu.org
X-Gm-Message-State: APuU4Z9Ek55QBIONnGseziS6Ntotq8ndcUyVbMJ+9+ILFgc1XrTOndkI
 O4dVkYbzaMDVu+1halAxIFTCVRpqzZ92YgMvE30K36ur6I8ed3JlD9u03QwnG2XgKB4=
X-Gm-Gg: AYBFou3Z7LkFqTUQ462wYD0ktA4xGEgjGlXUnoAjIuZwC6VAHJK1qflnRM9Rg5BXK3D
 foUgkmUBsgwY1ogINS2YLYrZsdmxTOpBMSMILPfbW1exct3yHIrE1ypFXYH02GRifzT8cTuSNRU
 T3wYV/3DbYx7nRyIG5q//TGV9rNC0IRbXWjWg2+DumYVgJ+hoW6BnOowzwgCL6yLaUEfVOOO5qg
 4J6G5TICSKdFxtCESNrXUzX+eXAHSOxWzy0skLB+7X/hxBBaIDRSEhJp89eEgHhDAEl9b+vDPwI
 ieKy1bVPfk8oQZXiWQu/0HN0tox7PFuysmpvvobydouOAShKKd5kxwXhD6VVIhCbr0kbdHRsUQ4
 1lJN9mmH5tzycAsNQhUq8w+kjGpXtWNcsWwt1tCtpLNT02ShRLk3PN5hG7j55Xxv4iDxykMZmKK
 wnMR0cFRJWidGmZQRjrI59a5bKxqbNYBBPdCPZqY35jz+x5rryjipd6hN1vT/TvWxXtgB9fyTMW
 CeqL6p2c9Ut4rf9ek8JkGcNTmYbtFG69gYXTKn9hliZQ8TqDTAymxE6JqcWn/uMa7BDCZoyNpQl
 Hz1ABOJ+/Tz4Cwk29LrzeCT+URcRNVrYW1HHv8dGrZjnbysipQQgUPMgcvpLdzQzpV3p5EkvfEI
 kZI1A8M8NcoqPTpH2bKLNo/XMYLAf
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id
 5a478bee46e88-36a423e52c8mr29867176eec.23.1793821404678; 
 Wed, 04 Nov 2026 11:43:24 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:24 -0800 (PST)
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
Subject: [RFC PATCH 23/38] target/riscv: Add cfg property for Zvqwbdota16i
 extension
Date: Thu,  5 Nov 2026 03:41:38 +0800
Message-ID: <20261104194155.679241-24-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132e.google.com
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

Add CPU configuration property of Zvqwbdota16i extension which depends on
the Zve64x extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 26d5ac69c75..99c82b898f0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -254,6 +254,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
     ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwbdota16i, PRIV_VERSION_1_13_0,
+                                    ext_zvqwbdota16i),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwbdota8i, PRIV_VERSION_1_13_0,
                                     ext_zvqwbdota8i),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota16i, PRIV_VERSION_1_13_0,
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 3d822432d48..83a3d8a7f9d 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -108,6 +108,7 @@ BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
 BOOL_FIELD(ext_zvfqwdota8f)
 BOOL_FIELD(ext_zvfwdota16bf)
+BOOL_FIELD(ext_zvqwbdota16i)
 BOOL_FIELD(ext_zvqwbdota8i)
 BOOL_FIELD(ext_zvqwdota16i)
 BOOL_FIELD(ext_zvqwdota8i)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 782e38b608e..8735cf94f35 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -716,6 +716,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvqwbdota16i && !cpu->cfg.ext_zve64x) {
+        error_setg(errp, "Zvqwbdota16i extension depends on Zve64x extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 9e872eccaeb..5ea073b6d76 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -42,6 +42,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
         riscv_cpu_cfg(env)->ext_zvfqwdota8f ||
         riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
+        riscv_cpu_cfg(env)->ext_zvqwbdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwbdota8i ||
         riscv_cpu_cfg(env)->ext_zvqwdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwdota8i) {
@@ -101,6 +102,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     case MO_16:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
                         cpu->cfg.ext_zvfwdota16bf ||
+                        cpu->cfg.ext_zvqwbdota16i ||
                         cpu->cfg.ext_zvqwdota16i);
         break;
     default:
-- 
2.56.0


