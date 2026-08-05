Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C16C55ABA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:45:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wreiz-0008N4-UG; Wed, 05 Aug 2026 12:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreiz-0008Mj-Gg
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:44:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wreiy-0001zH-0A
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 12:44:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cf27856f9cso15502325ad.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1785948250; x=1786553050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O5v+4E6AH085JvEW/ulDh5E/YMq66y/1MyNCyiZh4NQ=;
 b=POR6AWWvxl56i1Wu1+mk5hAciPskQeM1wh64qxmI0C4IGnHzmrgkSQAcxY31j5Jmzv
 kKgSTF83nZ6faebrOxF4FxkyCCxgYOwVOVg3btA5lvY6Var2enNIKzUK5r89UcGADq++
 a4xJ0wFDvbMDKQgZyN7htgeCtwB3L40PzaWXzE7ML38+8X7mo45uzlODGoaOy+LY6uWO
 3a8WxbcjEQ/xw6h2uI2gZRuUxms9v3H16qwipscL7i95OH6DQnNGHWxH0t16/CAAAjIN
 esTgZ999kWUvtWC9xAIZTD5FcWWH5pbR1ygXYO4BkmZazKLHkj6MTxrIUBoDddd5QGM3
 yT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785948250; x=1786553050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O5v+4E6AH085JvEW/ulDh5E/YMq66y/1MyNCyiZh4NQ=;
 b=SLSFEnkVlvz93yr5qQKvZkkoZIQiGO/flqhFpaz9UZCiNKu3g0UJt8MyAE8aZXxoSN
 gZ9W/dV4PuHV+5mKXhJ0ZZ1pII8BZnIdznLstMK4P0MrYsqAYeZHbK1Okm3Ye1a5V40j
 V81gTwWQmk81Y6eaj/ASiTuo3qrAHyrg9+YtCYeH4qE5oD9d5tP54EOrpAniOFoxrRlN
 HOwZfgGu6VFLmw2uHCtHTL+yix9d/a7T1f1K1YDYzlEwyrwLmVDhRRq473bLGor1LU7Z
 xdZxGHLVk1ZuOQM+cN7XdJzzlK51Dyr0QnAV5rob+YFzjkjVxZ0DLtFg5AYao9vlMAA2
 Hwvw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ror9RIU8GkbiN9SUfXSQw+2j/IXziUebmQgMynp1i7JHAirf4CC20kgquCoF8sj+slfgzrc9RHRJPAT@nongnu.org
X-Gm-Message-State: AOJu0Yyk0wXf1iyNzZF8q85iWlHMr+S/YVsEMSqNOW5DzybAEJuw+/wB
 04tFv4AbG4edWW1YPuhLK/eXBkN5uoXSx1bEIRry6JNNDTnAc8OrRlh0lUHrqL0iO2FHsfN4cGJ
 Urhg3GD0yZw==
X-Gm-Gg: AR+sD13Cg0jbCz+9YuSSVx3Ay4iQWZecuH/27+bIfZUlmQjmEUfHGOiEtNxZgYG1LsM
 QGBQabCwPMWteqUvBRG+CeIxmYOmKTwvp3YsNdANEYqJjob/Jsmgo1fGx2jjnCblCOfXlnDf8vq
 O7UoqlFK+jZEWNivUKqHLjg1qiEfKv8O2xlQQm8ctuV1jLGTSKg8G4QiYCOIm8nqo4P+eVTgysd
 BjutP9vaxGLIfRmYSud8bPUUWmJAkRptj1tIf1g6gMR5AfTlMFxM2iGD2ODrkOnqcWs2fYIpzMC
 y7ql2Y3/keH+FIVwPtEEpypSX83nT02bEtPSTOoJQDE/Y28ZVHCInoe1hbuHTnS1BlIKwDjANnm
 hMHR38Taek73SeuIm8CR1JBP2lUMKSGSnZl9HN9PI7/LTHSbWNVf6csqgNmQNwW8VL6BFoQQpYQ
 qkX5WzKEFJfr9UBtS5t9nJxl4CM8dQ95ZeABXO7+xIHnLKymwet2IdpMDaP4fgUBai1sCAXAzL0
 yQOEsI/pUy4GM4=
X-Received: by 2002:a17:902:f60c:b0:2cc:6329:b7ba with SMTP id
 d9443c01a7336-2d0ca7835a7mr98497315ad.16.1785948250541; 
 Wed, 05 Aug 2026 09:44:10 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3158644a195sm16719065eec.13.2026.08.05.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 09:44:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 7/8] target/riscv: Expose Zicclsm as a CPU property and
 update RVA22U64 profile
Date: Thu,  6 Aug 2026 00:43:44 +0800
Message-ID: <20260805164345.698208-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805164345.698208-1-frank.chang@sifive.com>
References: <20260805164345.698208-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Update Zicclsm ISA string and expose it as a CPU property to allow user
to turn on/off Zicclsm extension.

In addition, Zicclsm extension is mandatory for the RVA22U64 profile.
Previously, Zicclsm was enabled automatically when has_priv_1_11 was true.
Now that Zicclsm has been converted to an explicit CPU option, it must be
explicitly added to the RVA22U64 profile's extension list to ensure the
profile remains compliant with the specification.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7ee89f6fc4b..19b93f9c979 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -164,7 +164,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
-    ISA_INTERNAL_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, ext_zicclsm),
     ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
     ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
@@ -2237,6 +2237,7 @@ static RISCVCPUProfile RVA22U64 = {
         CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
         CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
         CPU_CFG_OFFSET(ext_zicbop), CPU_CFG_OFFSET(ext_zicboz),
+        CPU_CFG_OFFSET(ext_zicclsm),
 
         /* mandatory named features for this profile */
         CPU_CFG_OFFSET(ext_zic64b),
-- 
2.43.0


