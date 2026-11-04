Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACAE6082BE4
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=gIshA6ta
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtc-0003y6-6x; Wed, 04 Nov 2026 14:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtZ-0003rD-N5
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:41 -0500
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtY-0002bC-12
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:41 -0500
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-3535a54bed9so1456628eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821418; x=1794426218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o3cOqkVJbjprTFzPVjz8JuJTViR6snGos3eEVTaynO0=;
 b=gIshA6taVAVq9AXus+9KBBZC9mUC+M0W9eJ3wTY8tbtHIAxyF5bO+5LZ9OpZsxA03j
 zo/6xDhr+t6rRk3CiinJxscKeI2TraBygCNnslg4aFdv8UToZstL3UgljRmydQm8iUTG
 QQsawXoTbcCfUY76fLyKoUpAHMstOUPAU3pGEwvIYTilCZPEnApKADZAy+LHpWrqcwyF
 kChieLVnqAm7mGXILhPf5ZxfQiuIiYqITJLPhputElTsAKvdW23354bk/ucgOxq+7yxT
 C4q2kMFgOphKdnQQWF4N0RpgQoQM5Dp/mr4q1+Zx1POjlB9vGfVDUV6KpSeAkgF9Tpiy
 MCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821418; x=1794426218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=o3cOqkVJbjprTFzPVjz8JuJTViR6snGos3eEVTaynO0=;
 b=Lc263XTASC9zjL7J8bQRUZoKRU8r/NwpBwy6ixRiq8RqFNul9SQcmQZD+24ULDktbG
 Brj6cvN1mtIXQUvqsqLiX5qAx2bmWKnxo/etTuPbcKoO/7vwpQ85oqOT1L0Mx9dRqXek
 h3k/ZhSzYxFZoX5kyMxjneMaeTPBSN8iQj7dOKE7FPPUZQqk56ihSCzptzjdVgzDyyKk
 UyCJNGEGudF3Jtzk+0nVCOjiAFmCxL70P/iC8zK6v+FQyalvY9aGZodKaGpO/jrWTQPg
 bUZXogmGQvSULrMqNP2rgEyq+w0zUxK78tiQgXHHxcAdJPOqaeY6R79YVa+eSbXGVsoI
 l0UQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2/KJBZniVP8e7MQEediOMXa8aNAKyzbDrE1Uq4DOSpDyk2d6PuFuZwHQ3uWEeZ42yasx7Owxp13mK@nongnu.org
X-Gm-Message-State: APuU4Z+ipHCVOcbjiJSpVVxXSbCSVFzn9N8iARRZK/onMqOevlEI1+8n
 0wmn9+KI8YS4ceiCTHUP0yib5EdyE9li5j1zeCJI6xbIPtH0w2VLeh3oyHP4xoNYgtY=
X-Gm-Gg: AYBFou1wfZwlKeetT+xcDkb3uljDyFEqXWlu7gzPo/vwIXWQd+BcwOLhSQ8GzcbqDpS
 egz9FBhS1UrREv1vF7yXWLeiVBa/U6A2XbCgzKuCPmlYD5koVu2dOGw0CPxrHDyRDcR6+IpjnrE
 qISkRNfjv8ZtJr+/Vjhq5FodGxSGccXyDoqHOJgAVY4/u31HTI1GPY6+4mYLlA/DHE8fWmsqbC/
 2289gBn4dn2Uava71hj9vVoFGWm0GOA2iAZe2NwWILOVbS1MDh4703YYQmYA90/ZfSd84IbufsR
 JZmDm1JH4SXtjP7m51f6Y+2HkViprVVyKIjFuHLk3DaVjYMrcx9jAhDshpEXjFX61Wv/p3MdNv6
 Fp+1K3Qby0Lq2c5hHqjMbQJB+x4XzyLF48Vioywud2Hk3Hx5bXi7YxgKY1IfaT2CmQHb5An/iEZ
 zKfU6uW/mUFzJakRJnfIhGDq5low1liL8fayiQbFIDj1fOiXWucGEBNiTHTZctF1n4u0xJUrUY9
 5c9JnfJISj4J1NXLTIdWYdfdVd+xsQKxtjLuxeSYsxIXHrN+/B/+aOk7RDziD6EHv82SdCQLaNf
 6QxF0d1t7xuPD64lQu0816EttxMuG5NW3orlNRyaL5pw7xQODHemnAdFLHqlKkTLCFbKTWkNcS2
 mVC511+pm1LEOLFb5tcvCTkeGItSByA==
X-Received: by 2002:a05:7300:fe41:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a42401999mr24582556eec.6.1793821418406; 
 Wed, 04 Nov 2026 11:43:38 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:38 -0800 (PST)
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
Subject: [RFC PATCH 26/38] target/riscv: Add cfg property for Zvfwbdota16bf
 extension
Date: Thu,  5 Nov 2026 03:41:41 +0800
Message-ID: <20261104194155.679241-27-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1333;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1333.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPU configuration property of Zvfwbdota16bf extension which depends on
the Zve32f extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 95bba330e06..c33885542f5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -238,6 +238,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfqwdota8f, PRIV_VERSION_1_13_0,
                                     ext_zvfqwdota8f),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfwbdota16bf, PRIV_VERSION_1_13_0,
+                                    ext_zvfwbdota16bf),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfwdota16bf, PRIV_VERSION_1_13_0,
                                     ext_zvfwdota16bf),
     ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 83a3d8a7f9d..80750db1ccd 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -107,6 +107,7 @@ BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
 BOOL_FIELD(ext_zvfqwdota8f)
+BOOL_FIELD(ext_zvfwbdota16bf)
 BOOL_FIELD(ext_zvfwdota16bf)
 BOOL_FIELD(ext_zvqwbdota16i)
 BOOL_FIELD(ext_zvqwbdota8i)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8735cf94f35..8684e4c709c 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -721,6 +721,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfwbdota16bf && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfwbdota16bf extension depends on Zve32f extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 683b14f28f3..873adf4d7a6 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -41,6 +41,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
 
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
         riscv_cpu_cfg(env)->ext_zvfqwdota8f ||
+        riscv_cpu_cfg(env)->ext_zvfwbdota16bf ||
         riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
         riscv_cpu_cfg(env)->ext_zvqwbdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwbdota8i ||
@@ -101,6 +102,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         break;
     case MO_16:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
+                        cpu->cfg.ext_zvfwbdota16bf ||
                         cpu->cfg.ext_zvfwdota16bf ||
                         cpu->cfg.ext_zvqwbdota16i ||
                         cpu->cfg.ext_zvqwdota16i);
-- 
2.56.0


