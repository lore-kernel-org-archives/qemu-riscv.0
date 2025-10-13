Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C5CCD183
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 14:59:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8K1P-0000ue-On; Mon, 13 Oct 2025 10:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jelly.zhao.42@gmail.com>)
 id 1v8Ifx-0004Br-Aa
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 09:33:21 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jelly.zhao.42@gmail.com>)
 id 1v8Ifv-0005ux-EE
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 09:33:21 -0400
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-781251eec51so3505031b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760362395; x=1760967195; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+rmIkcesCZbV65wMzxLVesuiJwsScxdnuGmjreKaQZU=;
 b=gr4uFRfe74/lz+Ui4ev+DBOfEXpu5IOItzAo/i8cWetkxOyl6b39N6pMn6q2g6in+G
 7n7fqCguSAjORrLdvloxIYNnZkSJDfkLnl3RZrAfNTg0ciXqDlKjqVFtg05pEeRUBBL2
 6V8ZONW4SBX34f6r1SgNeoyDusj6TVrTJhDvcG5Zx5veFzkKbGbwIz9CYFeq/cJvdgqK
 JarVsTXCFFoKpqCdSVEXgGyry3sxd8W9C/mNIgXMLgVZPmJxINiLAcbjpNBoDJFI5QnV
 305VUwqzODv7q1L60NkUeZZa7EDPeRlriZutjyTRsC30PpgZeL+t3r/pwGP5AujdVI9/
 q/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760362395; x=1760967195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+rmIkcesCZbV65wMzxLVesuiJwsScxdnuGmjreKaQZU=;
 b=GXeT8iXMkdPpY90cyG4Rf1ngAr9ruW/Sl2zWMpQ27XTG6W0v8eIozy7Tc8m14skg4l
 mcvucc/ZcnEYlwWNdqx5ephglPI14VtJv4apULkY8WlNH16IU34nOemUQxjYZ7jPj5eC
 +RU8g4mFe/BNYKkz20TOpu9BmA4t7rOX/ZewFasz+0gyEjrkEyDstNg816zXhvosCqen
 97HuySnhLkRDPosOsnO4oRZS1S1VM+XHJ9iXPCk7EkCU1P/s1yIPka+9cwXaaHn5JpN5
 Cd+BCL0g77eSnQxLiQTp6QDoplBzscZtEsyqVrfFf67oXIppcHtcbVCob9EoUEcy7UbC
 T24g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiecEF7q1DOxOaZQ6TgLVpl7/+FgPHlOfdB15rEYhp+cWjG41Lk/s/6EhvCiHz1Sb6FIqcuPppnsJP@nongnu.org
X-Gm-Message-State: AOJu0YwASpTLL293nMBC1MzMqM2FoMcNkU6GwZOKyFiHOy0F5WHA2/1x
 WdIMcm6tBwR1hjmuWxxmZp7eEeExgxuLHvHaE/cluP0Qb0GG0qKvhSrZ
X-Gm-Gg: ASbGncvJWi6b/Be83XST8kiRn8rP6wkS47tX+lSLLa1Km1/hk3HMDETioU4vN8h3XCD
 Ugjc8vVcBPNs96qf3k1BZX7cp/3p8xJ6XSOFPerzLIWOdVzFKVRM9JRLnJjMHmGftrVPguSKAPL
 p/iuabJ+3CGmoxVyfz1wJnV82OIaIAS26XzG2KYeOJG/bLeg2L34DW6Ac6dsb1zKrOHVFwN9/04
 ghu2lnjJrK4nd4glvZgOliprvsULMQw0J/J8Mt77fcBDqvK9svHgko/UVTQbQo3C5AcS5EMj8NL
 oNo7ACbYaDY7ybidtHc27ypHj+rhVaR/GkO1cvigntNWRWmo51By5G6AiXpYFOsuL5Ocd8Bz5s+
 gGmUR1L0YNi9PUx8d4KzdNpFrSXb3Hix5tH6aaWIhEl7n5B9PVFpzVjk2at6yDP7STCxidQ==
X-Google-Smtp-Source: AGHT+IHM9ymlKRaFbub/4VZwVCvD8gcVK1uX2DZj1TUWcekU7FP3zjXZ6YlypHUfoDtjMPxr565qFQ==
X-Received: by 2002:a05:6a20:3ca7:b0:32b:6e08:e545 with SMTP id
 adf61e73a8af0-32da839f237mr30704588637.36.1760362394832; 
 Mon, 13 Oct 2025 06:33:14 -0700 (PDT)
Received: from localhost.localdomain ([103.116.72.131])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df233cfsm9300532a12.28.2025.10.13.06.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 06:33:14 -0700 (PDT)
From: Zejun Zhao <jelly.zhao.42@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Zejun Zhao <jelly.zhao.42@gmail.com>
Subject: [PATCH] hw/riscv: Correct mmu-type property of sifive_u harts in
 device tree
Date: Mon, 13 Oct 2025 21:32:42 +0800
Message-ID: <20251013133242.1945681-1-jelly.zhao.42@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=jelly.zhao.42@gmail.com; helo=mail-pf1-x442.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Oct 2025 10:59:34 -0400
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

Correct mmu-type property of sifive_u harts from Sv48 to Sv39 in 64-bit
mode since it's the only supported SATP mode.

Signed-off-by: Zejun Zhao <jelly.zhao.42@gmail.com>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d69f942cfb..3e1ed209ca 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -176,7 +176,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             if (is_32_bit) {
                 qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
             } else {
-                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv39");
             }
             riscv_isa_write_fdt(&s->soc.u_cpus.harts[cpu - 1], fdt, nodename);
         } else {
-- 
2.43.0


