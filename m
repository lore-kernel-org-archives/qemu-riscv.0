Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CBBC46CD3
	for <qemu-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 04:50:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rHGPv-0002hS-9j; Sat, 23 Dec 2023 23:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPr-0002fo-MW; Sat, 23 Dec 2023 23:48:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPq-0000ie-8d; Sat, 23 Dec 2023 23:48:43 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d22d3e751so23680815e9.1; 
 Sat, 23 Dec 2023 20:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703393320; x=1703998120; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9kSUAed4zEz3MVCNwiB85u7BQBDF6R1AhpsEYcRoFw=;
 b=lD7W0IfwOGI9+ZPESsnXmzESZiU1qeO5wE9A6kIIUSrKWGybOU1a6Q5fhZsoTK1beI
 TLiWa74/MXYkincGOi/MIfcXgokwLVpuWTjrcGr+tE2QKNvN9nb6a3D6Kb6FkxqVWVVK
 hvmaYSxsl6TvtG8UvAVdgrknfUrNLA2zE4kI3VCAkbgDFK5M5kMi/5Y3Wfu82eoQkP83
 mw5dtV73Frge6npsJDnj7kBaybYcxXEmpURsWhgPfWNCXOMkZ8ea6bKSzDH1KatYuvre
 p91f1t7gUIwYASE2sJ5IJFoE9UBerYHMPaGahGD+1K36Gcp2PNTCbAEl7pZZ0NpQRvTT
 PrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703393320; x=1703998120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9kSUAed4zEz3MVCNwiB85u7BQBDF6R1AhpsEYcRoFw=;
 b=ciYE/AS3Hk0HPN9OEZcWZn9qEYK0+HxkrUWgOgrtPoqFAzha4ZUmLbIJlPevPjRAWt
 X2/Slf377wUBIlongdG58UPT7Bvqts1slRTM/f8P7AvL7fAWcptKGeUVlNmceBgwiAYX
 x6SaFvdHMLGVKZAL8GviLib96OLEkY115yDWRN8+EVFU0sQVZ/VErZxqvISbsRrcPlyv
 XVe+qUNXPf89HEeFXD608bY3V1f8Z1lcdvzr70/C4fbbMRXQ4GqOpasC1tHqY9uVMtLt
 sM9DAtcIX73lKpuErgQc3clEt3w5qi3gg4g8XJ19zpRtPr5ysM+NZxOTKwQbG2TNMGNU
 M+Bg==
X-Gm-Message-State: AOJu0Yzyi3XOpgH2yQZZCdyob4vCkR3Cr5OWHN/dmZ6NpvNMyvDicMTu
 CeRASE/UY/a5S6cDyMJEvQk=
X-Google-Smtp-Source: AGHT+IEDnteUyk+C8zrLYma0LRIBoQIxYPwiLz+tY0dnb81ZJKRed7ipHQdFYEQWBaMStqf+MOGE3Q==
X-Received: by 2002:a05:600c:3d12:b0:40d:3dad:f905 with SMTP id
 bh18-20020a05600c3d1200b0040d3dadf905mr2841590wmb.1.1703393320121; 
 Sat, 23 Dec 2023 20:48:40 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0033668ac65ddsm7639513wrv.25.2023.12.23.20.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 20:48:39 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v2 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
Date: Sun, 24 Dec 2023 04:48:12 +0000
Message-Id: <20231224044812.2072140-7-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224044812.2072140-1-me@deliversmonkey.space>
References: <20231224044812.2072140-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wm1-x332.google.com
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


