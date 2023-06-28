Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7758AEB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 21:32:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEclq-0003r9-8n; Wed, 28 Jun 2023 17:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEcln-0003MI-3Y
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:32:11 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEcll-0008L8-81
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:32:10 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5634d8d1db0so7348eaf.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687987928; x=1690579928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJpe/d+Kp6PPTQ1rHKfSNqK4oQE/Sc6e2QfJAXEOnqw=;
 b=OKUtMqC9hHSWgyWYE+CfT6+ATJm6+x1BPe49oMek84h9kAYkFaLTZ0N5QtyzC7uQr3
 2c+OAnHzusx8JmlsUbtZIdW11xA5Yjz9+xcTNlmSe2Kdz3xLqN8BMhDjtcryM3M9urAF
 6zUOwTPrgkKQ/pP/WJlFIzZbghpuhH77dBzQfKrp5knVm9lXxNT7j0wLNQqKWGP65q6H
 OxHKb04RCkKd8KYlVeCah4r49WKIBsd/p/Vgo58IS5R/OGToGmNW5gM6U/Zun75Izj6F
 tQ0ntoR8EseS1LR2/dEyGM2QIcNgrjd1h+yWorHz7czg95ZiOTTpyrG+zLxOvvvOngTO
 0icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987928; x=1690579928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJpe/d+Kp6PPTQ1rHKfSNqK4oQE/Sc6e2QfJAXEOnqw=;
 b=EyXTEnnYFK9bKbU7oHc87Gtov6v1Cz6R0H1B4R6FjfBLDSAoSsc67O1nseBx9smVnm
 6OFqofOaSTsI2E3RzKcUaNAPpucpVe+Q63Bdf++tODfJR9RAIfg6NgFQcJKbPCJhUeya
 Pa5vOH5akJYQPpy3NzDA2itVzWBEqZC0UUQxdIN12MPa97BiRt02CMOOMBtgn6v5smU3
 5PGhLzxFbOzpeLMTDuWidGT92q8Zs5KigYmdHjA6zPjdS2LfPU6f2p/htUXPU+mL1/Ht
 zwKY8I0gTpJhbzHu3MWkEEz2oZkGtCjLTXjzTVZFQzjrHJCD4DVkSwEv5hP+g9lSjGfo
 HmGg==
X-Gm-Message-State: AC+VfDwV+M+gBRhnlxzFuSItH03yPJKSIEpKTOfvocYGOT5+R0yy6Z2s
 c2iTQoeylGJZ/WrVc8ZktEWNz+6xrpXyOyOCOeU=
X-Google-Smtp-Source: ACHHUZ75RsGslN2ZigKtajU53jTvuhgDvozOxrzfqsd+JI02w/tE7RU8NAKBEZopUNzdW6qntSJR2A==
X-Received: by 2002:a4a:d548:0:b0:565:bf28:ee72 with SMTP id
 q8-20020a4ad548000000b00565bf28ee72mr25319oos.0.1687987928015; 
 Wed, 28 Jun 2023 14:32:08 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a4a4511000000b0056084a91c74sm832892ooa.24.2023.06.28.14.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:32:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 15/20] target/riscv/cpu.c: add satp_mode properties earlier
Date: Wed, 28 Jun 2023 18:30:28 -0300
Message-ID: <20230628213033.170315-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628213033.170315-1-dbarboza@ventanamicro.com>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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

riscv_cpu_add_user_properties() ended up with an excess of "#ifndef
CONFIG_USER_ONLY" blocks after changes that added KVM properties
handling.

KVM specific properties are required to be created earlier than their
TCG counterparts, but the remaining props can be created at any order.
Move riscv_add_satp_mode_properties() to the start of the function,
inside the !CONFIG_USER_ONLY block already present there, to remove the
last ifndef block.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5428402cfa..b4a6fd8bab 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1743,6 +1743,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
+    riscv_add_satp_mode_properties(obj);
+
     if (kvm_enabled()) {
         kvm_riscv_init_user_properties(obj);
     }
@@ -1761,10 +1763,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
 #endif
         qdev_property_add_static(dev, prop);
     }
-
-#ifndef CONFIG_USER_ONLY
-    riscv_add_satp_mode_properties(obj);
-#endif
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


