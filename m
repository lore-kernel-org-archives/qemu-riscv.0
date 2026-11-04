Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C397A608AA2C
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=byCqgnMg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtD-0002sU-8S; Wed, 04 Nov 2026 14:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsy-0002cr-Ij
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:05 -0500
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsw-0002T1-Nq
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:04 -0500
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-36dbde64409so517083eec.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821381; x=1794426181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VcipHD82YYpdBKcuGqRax5Q8+YhSB7kojogC1bDxThs=;
 b=byCqgnMgShdm9Uja7mOtUTUhXQ6UNqg+jn6Y2phJp7IIT11922cVhznHE5DmB1KfgV
 kXOklf3UmecVn9IXOyfbbJVuaHOVTuYHQGBPi1pH6JRcrlMIU1hbtP6TCeYhshsg5ccK
 TA+Wy5zgRWM/TyMwP/JwLlydxfkPkW4WIEUs1e2t+hwX4+DpHpHYIMniIFPBNT25eGoi
 VTXM7vXyJhZEMzji4EfkQ9cJYtctbJ0WZnt36gJpC2EBpIAkpws22Yrc27qp6d7GR5tD
 vWUSpw0KshLbvICCwWsiiJ1nGdQRCUrD0S8+1fh1grXlUZqfGMly+bB++4eSClal0ijC
 2gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821381; x=1794426181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VcipHD82YYpdBKcuGqRax5Q8+YhSB7kojogC1bDxThs=;
 b=RRBffXnFQ4kXez2gyylkxcLQtCpAOioB4CMxdUO6PZltU9um5iEI7UR6zWmmRmWve3
 Dam6wOgMHTsrFSxsD30+FZ9cDs4TYESMGxtNY2EnRHvsY0KygKccBPBCcRVH4nhwX5t3
 fKyRF7KG/EJvqATBnbHAyz70OEAMa3dWciJ+iWOxaziwS6Hyd0Uz30tw5ehlMgcOmUwI
 Yf3+rgSeVwAdToiPGSZ+J6B0jEhl7FVwIKQ4uh2blMjLuN7C6LhxO8xhfSm/89LdmTQh
 7tDkSWQZFbPfIVmmKOQzuZ0V6X6Fp5DM+2fe0OdsUQwCOAwqDT/u+RW24rgul3LQhxqT
 VmvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6x+QpH7oKQEDNWopf/EkxufnFLVgW5B0cpeEJN10Wl3240HYSDi9Cn/8El7ibPmoUyeGg+2eNZN75@nongnu.org
X-Gm-Message-State: APuU4Z8wyBUGizKiySL5666P1Z/vFTjFs6pnx1oyKmPDSye5NjIWjjlk
 W8Fvdrg1MwdXADBr3Pkdmwp512PQSevvqW7vDiufglNatoieiOifvI9giZNxlRmlnv0=
X-Gm-Gg: AYBFou3nQ7qedsM8TUVF1yFr0AtXxhWoSUzYaUjE9scOYVsLwL5BZqK424f4fBumTm0
 AW70a4u9cYBHuSKex0oK34Z8pXi9QtAcAe1JKhSD2NrJfcKj/hV0DoYaXMX0RHHA/SMvovFLvxD
 Djr0JZ4DIHySw2AOCUe28qP3vf4lBP8AIvqRO4uhGaMZQHIPJEZS3n4H+bKRL448HNlA8+ETORD
 pvSFr3cHG3pF1Yy9EgQ+fBDEtilGXHLYUoe4OWvmxioV5qXVYrs46rZW5BjOeyI3fSx5+g4TB73
 SD1RpxDWFvoVS9ylT75IykT1gaG8YHMQrBdVTQBZgANhwDZfAmXaV1Dxlagd07Wmi1MrdonxyUB
 9IQp0MWzNJKrM4djjNbIS303oWrcFY328pTam0/SbJg6+pAAX9hspSwmgnu0TXugehiyQ9dzLuu
 pcne8BPZg3wy1J0E1VjHI6ZsXem92lvWJTmt6t4mxIDenLtMz9VrRMRIx2rApDqHrJPk3EL4d3G
 p6yAfWxJUuYwXaHEEfkl18OPTitCM6w7HQXgeyICEblWkP0wdYiiSK4axwu4T1YEzVxjMxYWCN1
 kdlQVoBAKu+YQAfyR3xn5rdX8sUzU6gsSk9kFiw1lWula8L2kLyKpbVyWuR5yAvaalZsFGeE72I
 omfONmvnaxyTToCFJ3mJ8n9xe8KKyAIDOY0/VoklUOssP1qvTXw==
X-Received: by 2002:a05:7300:5626:b0:36d:3c0f:cc85 with SMTP id
 5a478bee46e88-36d3c0fd4ddmr2282716eec.5.1793821381204; 
 Wed, 04 Nov 2026 11:43:01 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:00 -0800 (PST)
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
Subject: [RFC PATCH 15/38] target/riscv: Add cfg property for Zvfqwdota8f
 extension
Date: Thu,  5 Nov 2026 03:41:30 +0800
Message-ID: <20261104194155.679241-16-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x1330.google.com
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

Add CPU configuration property of Zvfqwdota8f extension which depends on
the Zve32f extension per the specification.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c                | 2 ++
 target/riscv/cpu_cfg_fields.h.inc | 1 +
 target/riscv/tcg/tcg-cpu.c        | 5 +++++
 target/riscv/tcg/vector_helper.c  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2d905a99d68..4f2e7a8faa9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,6 +236,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfbfwma, PRIV_VERSION_1_12_0, ext_zvfbfwma),
     ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
     ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfqwdota8f, PRIV_VERSION_1_13_0,
+                                    ext_zvfqwdota8f),
     ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvfwdota16bf, PRIV_VERSION_1_13_0,
                                     ext_zvfwdota16bf),
     ISA_EXT_DATA_ENTRY(zvkb, PRIV_VERSION_1_12_0, ext_zvkb),
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 30c404863c8..b18abdd8b9b 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -106,6 +106,7 @@ BOOL_FIELD(ext_zvfbfmin)
 BOOL_FIELD(ext_zvfbfwma)
 BOOL_FIELD(ext_zvfh)
 BOOL_FIELD(ext_zvfhmin)
+BOOL_FIELD(ext_zvfqwdota8f)
 BOOL_FIELD(ext_zvfwdota16bf)
 BOOL_FIELD(ext_zvqwdota16i)
 BOOL_FIELD(ext_zvqwdota8i)
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 91e009072e6..72ce0b4fbd0 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -706,6 +706,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfqwdota8f && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfqwdota8f extension depends on Zve32f extension");
+        return;
+    }
+
     if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
         error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
         return;
diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 5947427b6b4..a4c52ed296a 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -40,6 +40,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
     target_ulong reserved = 0;
 
     if (riscv_cpu_cfg(env)->ext_zvfbfa ||
+        riscv_cpu_cfg(env)->ext_zvfqwdota8f ||
         riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
         riscv_cpu_cfg(env)->ext_zvqwdota16i ||
         riscv_cpu_cfg(env)->ext_zvqwdota8i) {
@@ -92,6 +93,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
     switch (vsew) {
     case MO_8:
         ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
+                        cpu->cfg.ext_zvfqwdota8f ||
                         cpu->cfg.ext_zvqwdota8i);
         break;
     case MO_16:
-- 
2.56.0


