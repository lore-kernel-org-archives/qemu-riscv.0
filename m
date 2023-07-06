Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEACEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM4W-000692-Id; Thu, 06 Jul 2023 06:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4Q-0005nX-Di
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:42 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4O-0007BK-Qu
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:42 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1b441dd19eeso27274fac.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638719; x=1691230719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtERhF/xfYQMjn+bEX8PIQ4lMIfhPOCNLObYIRjwmfo=;
 b=Xvo9Z7sLLXjXiA3kW5RQam6YOAB0d5csEgcqRTXEF+yeNNspLbneLWFqb8wabwY79d
 BnalB3nJ4a6kS+niZTCUrbEy554DHNFgN+b9hNUGVHIQ6Yy5zW3KpMrJGsUxK7tIHD+V
 UKb46EXlS0NKv0GJL9zRjkD6G4vhSkm7g1rgaUeLXH+SA23vG0rXqbIiOP8HCuiZyfL8
 9zML0bGdT6akYL0NyX+Y4VA1k10gbG1+tZwwlAH6fXaKwEGoa2KU3+XGbRedPhcJLwiE
 sKUB0p2lXquLHnxRrGiiAwC2JZNNYdBCa0iux36MoXgiK8V88GBa1nQga9hfTjOKAMLz
 jTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638719; x=1691230719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtERhF/xfYQMjn+bEX8PIQ4lMIfhPOCNLObYIRjwmfo=;
 b=f4XqTZAdDRGpYxvMZIAYcZb+dllJ/scmy6I21NuwnnlPOwQuR7Qw0bOdUkmbOYY5Zu
 oBcLbAMAIJfr5DuJf6hOXyxZsXnWlhikOkN09boGmeBzjZ+v8oRTl4fjZCWskDLZFZVb
 fIMjdJ4YHQ/MdRd1oYpcwUjg1OqKFEOXoX5Ybkf4Z4hY6nLoq1rpMosrsh30olgbr3Af
 UV7+eQRR2RAVTcj8+pVik38Xs2t/X6RDlQ9W9EPa8TbzYNTileZ4lsP0HsJlVOGRGuHH
 2kxC1fJ/7sKTs12ffwgs9CgRzXqh8vB3VHSFUHFk9XGTteJdeamiHUBWVGSToD5iY2fG
 p/2w==
X-Gm-Message-State: ABy/qLbjdhPYB34e5pRN9qB9bKgUTBUGoO7x2RPzBPftRoOQunNsGVE/
 7hxloc+cnVi4yb2wZ0rfMxVZAg==
X-Google-Smtp-Source: APBJJlG2bme4Byg+0/yVDn7wiDlKyii+6s8ju1zO0zJqJg0KVZfe4Ipoci+ykRUv+aS21WwDRmk6yA==
X-Received: by 2002:a05:6870:e392:b0:1ad:34f5:559e with SMTP id
 x18-20020a056870e39200b001ad34f5559emr1909172oad.25.1688638719726; 
 Thu, 06 Jul 2023 03:18:39 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v9 15/20] target/riscv/cpu.c: add satp_mode properties earlier
Date: Thu,  6 Jul 2023 07:17:33 -0300
Message-ID: <20230706101738.460804-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 31e591a938..deb3c0f035 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1852,6 +1852,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
     DeviceState *dev = DEVICE(obj);
 
 #ifndef CONFIG_USER_ONLY
+    riscv_add_satp_mode_properties(obj);
+
     if (kvm_enabled()) {
         kvm_riscv_init_user_properties(obj);
     }
@@ -1870,10 +1872,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
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


