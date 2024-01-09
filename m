Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D659FC47073
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 10:31:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN9Mx-00065k-Co; Tue, 09 Jan 2024 05:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mv-00064q-LU; Tue, 09 Jan 2024 05:30:01 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mu-00060b-13; Tue, 09 Jan 2024 05:30:01 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a28da6285c1so492059866b.0; 
 Tue, 09 Jan 2024 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704796198; x=1705400998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NcKqltazoAkqvzOJiiPmtT7bA6touqBltSEmtcyG6jU=;
 b=G6d+P4LUdZx/ahg1RsDh3zofnXMa/O2rBNSU/sftqY3KyaHlyM2XB/YRO4tvQdJMzK
 Mwt7d3G2NrzYynZHqpXDOgexH5RcHp3ewhsrmgoVBILRrrnPvqB+Tlovx7jt7BysmNlR
 lT3LRfM6WNc5kasbnDHXL2Mb84p/Unr8T6utXUXImBdftuFP3cXiMtImbItTYSILra+V
 1sAq1R3nqox0R/2iVdP1tMnBvH8bedznctEb1+AqyWL2ZDN+d2Mjb1A9m+NOewbF6RhN
 Lz7WghLGW+43IuNmf84EZlY64wBqmg5vTM4lGMDW3Z+9jh0GgPTLdQ1vSY1bcyBgNpRr
 YJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704796198; x=1705400998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NcKqltazoAkqvzOJiiPmtT7bA6touqBltSEmtcyG6jU=;
 b=wOKtX/3JSAg95bTmIs2cdNGfjEfojKoSrEME0GoUL2hTPQY0/3nH//m8gkXn9ztQnX
 ZBijRu/jDzCidlx4G+MjUlDiN0A5+7SyePTmSA04quXo/x7bh16iMo0slAwMsgExvwrY
 dcNXENTZLlzSXNr54czJwFHKz2hfWEHReTSbe6LzDduIpk7iHlUS6qkCu1Oks//qtnbW
 UyBterzTF7gHekdHfpNC5WbHLUdGan1qz2vp1ODm7eeNGWCCamwttQOAec8PYwabbrLD
 8Ancf6rO48s66qE2xQpZw7GcRZXA0UUHYNuOCsPUXGCPikOya90uN/uqbDn2OpA9t/R6
 W6OQ==
X-Gm-Message-State: AOJu0Yw5AmJxo/OXigr382PlETyfv34syAmc50seo6D2HpZBY3y2pIj8
 qbkqjy+vXg3atBEIb5+gO1U=
X-Google-Smtp-Source: AGHT+IHWtO91C3+U9OMDR/p/PbefDToETLtAgoumNWrGmS0uYTIzndf0C/jhBKZRaKXKBgPBm8l8Dg==
X-Received: by 2002:a17:907:1b20:b0:a2b:2de2:8dd4 with SMTP id
 mp32-20020a1709071b2000b00a2b2de28dd4mr733526ejc.15.1704796198399; 
 Tue, 09 Jan 2024 02:29:58 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 d24-20020a170906175800b00a26ac037ff3sm869643eje.132.2024.01.09.02.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:29:57 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v4 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
Date: Tue,  9 Jan 2024 10:29:30 +0000
Message-Id: <20240109102930.405323-7-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109102930.405323-1-me@deliversmonkey.space>
References: <20240109102930.405323-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d8de1f1890..44ebd80aba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnpm),
+    ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnpm),
+    ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmpm),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
@@ -1336,6 +1339,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
     MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
 
+    /* Zjpm v0.8 extensions */
+    MULTI_EXT_CFG_BOOL("ssnpm", ext_ssnpm, false),
+    MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
+    MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),
+
     MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
     MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
     MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
-- 
2.34.1


