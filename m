Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79067C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:58:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL6R0-0005Ef-Rn; Wed, 03 Jan 2024 13:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qw-0005As-11; Wed, 03 Jan 2024 13:57:43 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qu-00044B-GG; Wed, 03 Jan 2024 13:57:41 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a28b2e1a13fso59453366b.3; 
 Wed, 03 Jan 2024 10:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704308259; x=1704913059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9kSUAed4zEz3MVCNwiB85u7BQBDF6R1AhpsEYcRoFw=;
 b=EmVaXl7WjpOazzjyqjNtjg6fs/HDRfYW1juLytjQy4RCaMgSTov443kw34/zgSZ+/b
 irXWVgilyf1hAB8Qc7D52uQ+N/laBV9VLtFdLhjpDVos2j8TWF4nhzDsvwkKaXRnAd28
 psVCTVBQEZ5ZELyyD8xsQTKRfzn0m2gCq1VNf8dkBPRcD6JT/YuKsGIbadjl56bYP7cQ
 CVdfWpqc7V4q+GqWMzhNwB+ZZfDtgqHH6OKUtY5gylmqLgAolTbqCyXWbrNFKVLD/7SU
 67RCbwDxVN+MRKW7xLSLpeqM9x8aWAyyZmh6a5muvp2PLcyMmGtvtPPwzNlz9FwZ1mP3
 E2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704308259; x=1704913059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9kSUAed4zEz3MVCNwiB85u7BQBDF6R1AhpsEYcRoFw=;
 b=ZqbiEiWe7q/BJFJ1/F1xB4QelKLRXVI2s3rxrXDAN2vAWkH9egvYw+umGQvqZEPZr0
 BRTAErzVwDDMwSAg7ODmv6I7rvHZmSsCVzkBoGq6W9vsvZQrs+WLmxxRQhyH/ulB49+e
 yZiYN98NK+Sl+us9yD1Akt748Azt6dJtuDTiFRA+9T1LREDnQPMMhq2lcapnW+dUQMSD
 Dyhq6HR1QEOaBVVT9cJHXr6iANE9B8DdSLcoijXAKz2+x5fbrx4ESxTwwd7OwlIQctBS
 fidpbZpY7odlmmFI55Ypb6+E+ss+XiwYis5E5vsfFaiTsvGSHfSIuQOPcKBal2MZaVFR
 xI5A==
X-Gm-Message-State: AOJu0Yy8zz0lXc2g+QN2TgHS/AsKm6mLFSFHzI3R04jeGHg1qMKriMV8
 PWex9SFnIwuh3+0W5Gahimk=
X-Google-Smtp-Source: AGHT+IEDgal93t0gWBxV+mVsmbEYfr+jmj8CDYURtlbped2aEOZZavfnbvPGu7P9hnbPpN92WpWqwA==
X-Received: by 2002:a17:907:7289:b0:a23:56f4:205d with SMTP id
 dt9-20020a170907728900b00a2356f4205dmr10901609ejc.73.1704308258773; 
 Wed, 03 Jan 2024 10:57:38 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm3897915ejc.105.2024.01.03.10.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:57:37 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
Date: Wed,  3 Jan 2024 18:57:16 +0000
Message-Id: <20240103185716.1790546-7-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103185716.1790546-1-me@deliversmonkey.space>
References: <20240103185716.1790546-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62c.google.com
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
index 1e6571ce99..13389ddc55 100644
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
@@ -1337,6 +1340,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
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


