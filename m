Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C3EEB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 13:26:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMTe3-0006Dz-HC; Thu, 20 Jul 2023 09:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMTe0-0006AQ-Cf
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 09:24:36 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMTdy-0003b3-Vf
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 09:24:36 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5634808e16eso555061eaf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Jul 2023 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689859474; x=1690464274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Xzqzvlq/fczPOvED6oSPV8obPxnbl+y0QN9GyZTXPQ=;
 b=TWI8+hdxJOFa1hmJgUiBL0uxFrnsq0JcEZnjhUxUSL3nhHxmoE7fqjDcp6Wcrv7fAz
 7d5m2JSaHbyAU4km4HaTlMdHQvtDHDQh/6iwxgzv/ZCGSKYe2/X2EhxmDQoHpnNVkR4w
 nJIWojE8nHPgdx5EauRQDshwsl/W9d+qKnDIKMBB7B8X4yiKbvP8QsM51ptil1IUQhIp
 8FJ0XUpeGpPizvPdNQIZxSkM6wU/Pc3ZF5gCnZqEn+cNeuU4XhP2JrADlTkVlzYvnkvA
 mkM99hBSfh8MxWiZEPOgVGo8TWZFLvcYZJCyfLAQisSjyKQheZ0ldafG9MwzZeYoLHsU
 sm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689859474; x=1690464274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Xzqzvlq/fczPOvED6oSPV8obPxnbl+y0QN9GyZTXPQ=;
 b=JstmRR4kIyeSvqzuV+EksIDE8zYFdiH6lq/ZRCTqHa7+RvmAIssMdrKWYHr5GIjN5A
 Nn2nql5oDZoxsUqnCAUqbXv9eM6dGc8N/zu6JqMKpv0fibsVCrrqj5O7pKU9UjQD3oBO
 RhALD9AifpuoOIPHC1gsb9mNN2Avhd/oPhR9cNZWVfArKQvfgzkm4yan565iDIeUEk6D
 wUdYLRbdFWoL/4T6mePa2tExlTvv/GR+UXtg1FrfsPYgl9BFm1249RWYVQmUFK6Ukg7z
 VNM61kUXfR3jdpSU1ky/aSDxJBNpIS//hSttzqQedITJCe1XvZeuwZ3UQy8rhXwRo6A0
 4Z9g==
X-Gm-Message-State: ABy/qLa1/33AGH9cRbMtfzJCgucsEXDbpAYpUR1qwO0sir5b8PR1QxO4
 ffEvVRj6ZxYZrGFAxlwYaEl2c6VZx5GZWwzSR0Iimw==
X-Google-Smtp-Source: APBJJlEo3Z4Us2V7ZmA7oC9+4bsMzz0x2pxJUEi2jTy/noTKM0D7Xy7IIWRKjZtOeeeyasca5kRfNw==
X-Received: by 2002:a4a:5802:0:b0:566:ebc2:cb5b with SMTP id
 f2-20020a4a5802000000b00566ebc2cb5bmr2506983oob.0.1689859473870; 
 Thu, 20 Jul 2023 06:24:33 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 p186-20020a4a48c3000000b0054f85f67f31sm421361ooa.46.2023.07.20.06.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 06:24:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv/cpu.c: add zmmul isa string
Date: Thu, 20 Jul 2023 10:24:23 -0300
Message-ID: <20230720132424.371132-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720132424.371132-1-dbarboza@ventanamicro.com>
References: <20230720132424.371132-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

zmmul was promoted from experimental to ratified in commit 6d00ffad4e95.
Add a riscv,isa string for it.

Fixes: 6d00ffad4e95 ("target/riscv: move zmmul out of the experimental properties")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9339c0241d..d64ac07558 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -88,6 +88,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
     ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
-- 
2.41.0


