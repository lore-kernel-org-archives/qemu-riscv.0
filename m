Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5781EEB569
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 08:50:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sofVf-00026E-0d; Thu, 12 Sep 2024 04:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1sofVR-0001bl-UA
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 04:48:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1sofVO-0000KK-VU
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 04:48:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cae102702so5474835e9.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726130924; x=1726735724;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ij9UQ3ueFFesPCuwkY7Z0yakwufuTyK9/Ck/bkvrpOQ=;
 b=1fo1GihGUPb38z94sfDvd8GfQnuxpmR1UUZlPrmG6OYtHtMIdyQ8qxPteBVlLM3i48
 HkA8Y2R9fI2z+4qsda3wnbVBN1/l5b8Xef72iIEKoBlp9z9JlCmxiCItGhTQUqIAd9+1
 mV+tcp8kPOPT7Gv4B7iHcCBtCI/O09VaAYLiS4R7wWt1qF4NEM1dqTOHTFIREoJFy0np
 FmHTkmG9QbFkwNfa3rGuzVT1Sx3UE2FsjOOkSuKR1bsahgp68HQkqJLTK9RAk8vE3zpS
 9mqhNDeRSnxP4Mo+dRS4qB+qXE6SlSwZs5puwp6kMzBD+OXiLbGwcuSZq601cvRdIU0j
 LN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726130924; x=1726735724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ij9UQ3ueFFesPCuwkY7Z0yakwufuTyK9/Ck/bkvrpOQ=;
 b=Z93lg4pZFi43Nz77pm/IqeD03o/ulBsQ8F0OxxYsdKedghROcxQJiBx8SxXmmQMzB5
 rhW4kpb2bWDVpBqwY2IejsZ7+bQFV8HHrxgJLRcdHJHgScBzAurD8Rx/jD6O8LlAGxKH
 J0KaKUvHCTSlcoYUZhwSr3eLx+8TESJYORQxWHn4TohnjgE30tUYsW3azEeuQXKGITYA
 fU+dUZwoReCi4Xl0yWil9fQcarWTRlzyVyN2KWNf0Ji37zWyzVL2tFMMAIHScLbH1WjJ
 SJ+/pOc57lCyP6AodxncFBsb4knIojpH3WGowLVjz3idq8PdxgLEMU6c6EJ5JgxRHQmh
 vh7g==
X-Gm-Message-State: AOJu0YzlBXrx8PJ7vpvDcTi3JmcfxRpQgYPe22XuKyCr6PhZpx+7OKCo
 uQ1kqLd8zzV3D32MmVjVFDd7pQHLz40shS5Fwqc+b39gYUXdQhbEZajj4K1VcdSy1tjLrO1U2H6
 aTzs=
X-Google-Smtp-Source: AGHT+IGdkbi8fsTe4KKZ+e+XMK6RPQ7XQDobuWyGnRI8uyhu+4PSzz3TOv3heyJrF8LKuaa5+24FUA==
X-Received: by 2002:a05:600c:468a:b0:428:1b0d:8657 with SMTP id
 5b1f17b1804b1-42cdfac9565mr6359765e9.22.1726130924000; 
 Thu, 12 Sep 2024 01:48:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb33a92sm165637475e9.20.2024.09.12.01.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 01:48:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 05/10] target/riscv: Add Ssdbltrp ISA extension enable switch
Date: Thu, 12 Sep 2024 10:48:24 +0200
Message-ID: <20240912084832.2906991-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240912084832.2906991-1-cleger@rivosinc.com>
References: <20240912084832.2906991-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add the switch to enable the Ssdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 206736182a..75433a4359 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -190,6 +190,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_12_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1518,6 +1519,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
+    MULTI_EXT_CFG_BOOL("ssdbltrp", ext_ssdbltrp, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
-- 
2.45.2


