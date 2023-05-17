Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93820C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:59:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzHf2-00012J-1n; Wed, 17 May 2023 09:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHev-0000zs-7l
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:43 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHet-0000Vp-8B
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:40 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-392116ae103so561422b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684331858; x=1686923858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMnHi4+vBadWo5A/+JSdVRCwH4evlrvC8EDyRoJWt8w=;
 b=U6eGMimFWubwOYLpY+g8ed4b3KBrpiARCBDOk1K9E9IIG5TXN9zMo0E8DFHgnU6HBh
 mzaeqrCUN0aQm2Qd/1314MhwYIViu3McaUDH2tjq6Nl3NLz6shRdbPLaSKcZfqwmPBOu
 LPNpTUhJxsAC8XM5ePUdQQlBT5uzKvf0EBYpWm3Q9eROl8NYtP8jD8XOpv9U9OxDEmNo
 NFjJsBAa1GQWQvb1rRyBEpDrioiqJ1RrGgbwbPJPULD5LnqVbVy+/WQEGCwT8FwIg70D
 1RJavR0R7nBdiWtxpyht9uwIXI318sSA5gaGsSaxeeRCNh5Nd1Ci7wUJmTJnYjQKXVnd
 8gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684331858; x=1686923858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMnHi4+vBadWo5A/+JSdVRCwH4evlrvC8EDyRoJWt8w=;
 b=FwNyB+MNePD2JQ5r4v3fTUvhKZJhDIGcDJ+djVppR3lUDwxdsdtPWwMn+E5dk6TmhH
 QkhW4oqaIEzX9xahQr6iSKyDaWvccwJeZqPPBWgDfPOWzuKHfhJRkYA/s5y89q9hbQMX
 tMv94DmE8jz5p80qX3DohU+rwD410tq3OE/B/llYxkJyB7wqXpsn/tlZgHkNTFwsCncV
 m9fvfzlymm1AVx1zjPj2FENsI/X6TrRaKA39p8dK0jldm+CfHHcFUp0kw44wbR6QAY8f
 8WaZHs+TUZQpFlcSoW3HfpBk9cutahzHFFldHuqx34N2C4EbWRGNMnpRZJdvQi6CIQFr
 OqOw==
X-Gm-Message-State: AC+VfDx6WU4eaFIovSJaIzzXdqy7tmON3OCczuRQ3o2MKgFBE0mmS7i9
 oKv3pz6Ln81VEhYzgEUCFiVBUw==
X-Google-Smtp-Source: ACHHUZ6djNEcGi3N30clc+0qAmQBbYGCMYzC7VPT0Pil6RAv3PjOX6urU7IXqrtzJ/2Pycv4J/V8Mw==
X-Received: by 2002:a54:4018:0:b0:389:4a00:51b5 with SMTP id
 x24-20020a544018000000b003894a0051b5mr15267418oie.8.1684331858335; 
 Wed, 17 May 2023 06:57:38 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a544815000000b00383d9700294sm9409562oij.40.2023.05.17.06.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:57:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 05/11] target/riscv: Mask the implicitly enabled extensions
 in isa_string based on priv version
Date: Wed, 17 May 2023 10:57:08 -0300
Message-Id: <20230517135714.211809-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517135714.211809-1-dbarboza@ventanamicro.com>
References: <20230517135714.211809-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
super extensions can simplify the extension related check. However, they
may have higher priv version than their super extensions. So we should mask
them in the isa_string based on priv version to make them invisible to user
if the specified priv version is lower than their minimal priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b1a6675d1e..88195945e5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1758,7 +1758,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.40.1


