Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE08D637A2
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 17:18:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBH0k-0000FF-6U; Wed, 13 Nov 2024 12:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0b-0000Cc-F9
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:26 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0a-0003mK-2F
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:25 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-720be27db74so836181b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 09:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731518302; x=1732123102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoLy9V+Tq0tnbCkjsd2u8voyf6dYjq7HZXIKxiU3iJw=;
 b=HD4zDiuORj/FkrBGSJWMWawRmJmLULCZqaVhUpwzozDVYToWjr3kHvi0MXsgxMhDMo
 ksaCw9Ey+5UdxIhSEMobnjeSpOaW8NvZpZtj6z9oDpVbMzRXhEL83UP99Tqs8kftqAX0
 uUkGDJlnBAWF8nQd9ZlXAEOMW8h8/+xRXfK+aBNZtSrdwkKPKgPj2kSQSOB3FCtEoOgR
 qU2WTOi6ROW4TtTjloTQeRj/axZwpkh4c7OVGHCf1Vh4sIxYAYxjLi0eAF61N1ZgatnE
 V624Q0WjXQ8XFpVzDPhJ5CFePfxwSoNS4xXhHMTNgy5Vj6tcO/VO22Q0d1SL9EMR1ty3
 Ps2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731518302; x=1732123102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoLy9V+Tq0tnbCkjsd2u8voyf6dYjq7HZXIKxiU3iJw=;
 b=ILecRWoUi4SpZ2bl9OWGdyGxlV2aKBgzdeoNL/oHAxqJabtMb7XoSxDy8CCuCgDzTM
 iT41ENs7cf9RsUyZ5i74yUNNofZBtCrngqTPqitskW9x9dS0i/Dzp5FxhSZi1bhIiHRV
 ijRevd1pTOWiGqNC/xPYb57/DQJWjRkLmzW1uE0Akb8kw7U1uK1fU6AIGNcKndqHu20i
 wms1SU2LjIuJX5TwOJnDYtP68n3syHJ+XkPFCssr3BxsFFwMigbqpEx5qlLyAe8n8m+g
 aCB/shsRk4tCKolQcQex3Wvg4URF5FijQdFOe6RUPYp21NlNMJlMXK+vBG+dV+pvPrpI
 GSig==
X-Gm-Message-State: AOJu0YxNw+5pfJMUUim9dARhAYPBBH+x+suve443xZ7mImQOzoh+tYbK
 UgochiGSzspGrKWwUhi5axVdp/gcYVJjS+FZD+W+5yyNYGvwby7gR+3KyplOZeg=
X-Google-Smtp-Source: AGHT+IHJ9NC6KYJGWIvBLOHzPYaeuYNzFbU7byjzc6s9fsnw2f3c2yFYQZUb7BuXfb5soFNoHN098A==
X-Received: by 2002:a05:6a00:3d0c:b0:71e:71ba:9056 with SMTP id
 d2e1a72fcca58-724667936c7mr149528b3a.10.1731518301880; 
 Wed, 13 Nov 2024 09:18:21 -0800 (PST)
Received: from grind.. ([187.101.65.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a9063sm13392889b3a.75.2024.11.13.09.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 09:18:21 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 6/9] target/riscv: add shvstvecd
Date: Wed, 13 Nov 2024 14:17:52 -0300
Message-ID: <20241113171755.978109-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113171755.978109-1-dbarboza@ventanamicro.com>
References: <20241113171755.978109-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
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

shvstvecd is defined in RVA22 as:

"vstvec.MODE must be capable of holding the value 0 (Direct).
When vstvec.MODE=Direct, vstvec.BASE must be capable of holding any
valid four-byte-aligned address."

This is always true for TCG so let's claim support for it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7b54c50794..ae5676976b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -186,6 +186,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shtvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shvstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(shvstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
-- 
2.47.0


