Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16162EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAF5-0005HD-RZ; Wed, 05 Jul 2023 17:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAF3-0005BS-PL
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:53 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAF2-0001o1-2g
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:53 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6b74e2d8c98so3189a34.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 14:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688593249; x=1691185249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtERhF/xfYQMjn+bEX8PIQ4lMIfhPOCNLObYIRjwmfo=;
 b=cENLwSmRS3VpDtMkgB40IrG+x6KQ/q3kZD4MbYX61fklecky3Se5D9d/aL45rFKhRz
 kTNQAn6luWRoJLQS7EqxPFwgA2+QTMo5RUlAZptOBTzMe8eOlSlC2+ySO/e0beOi02y9
 YTMtA15uRpG4jOIp/kBCpHAdkKOGBdoLtNwcJ4HT1ontGZT203D9H0TmsmfWsQWCDe6P
 7jTVVDjVdh0YqUqKvGJptcQwFO7XBlH0Pe7QZ0Itq5PVUy3XacNUIg3h19MGir2c5PWS
 Fxg6E0U5hwzTg15sQ4OLgGz5K+wlhy4Pp7qPI2rYHrDIQZ5SgThLZzRF7hL23ddVYWvI
 YLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688593249; x=1691185249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtERhF/xfYQMjn+bEX8PIQ4lMIfhPOCNLObYIRjwmfo=;
 b=W3vcPZFhSU54/OAgtAU+g6+Lc97rcu/g3e8cGaDSyeRpD/m0e86c8R7mKt8OfeeDdx
 UfZQfxk2Rkp3HafDK80jAagZqXFGGz9nku3fXtFW4e7/DGJXHRAnwg+N153YCzOhceRz
 E5tpEw/+4i/mQiO19Lt/yU/Oyx+beO7T8gZ8W4l9s4XJSTmp9bzT80Ew1F4xo9K+t4eb
 Zwf89WW+YBEgEjfA6ngW63R21+WUyca+kivsRtJr6+cP21bxblw2HUThX2cHy0AhN6ch
 F/mMWst7B+3irlyAmEXenoinbObfX74wRC/ZSOFuZEMixdZ8DfYAlvmZ3R1PeIdk6bpN
 Xgfg==
X-Gm-Message-State: ABy/qLZ3W1Vbf0S3gZGpsZMkOxnOwPn+H26B4pH0ctC/agYDP6TjB3Dx
 4P1zPoc4snCLH13tkVE8wJ1UsQ==
X-Google-Smtp-Source: APBJJlEZlCh26AcMZPatpRbkO+mx9aEHPmcMYquUFK3uudc2pv8FDwYF1o8MR0nh5R6HEkUfES4Thw==
X-Received: by 2002:a05:6870:3453:b0:1a2:8f84:31ec with SMTP id
 i19-20020a056870345300b001a28f8431ecmr244187oah.31.1688593249624; 
 Wed, 05 Jul 2023 14:40:49 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4add01000000b0056665a16536sm70764oou.30.2023.07.05.14.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 14:40:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 15/20] target/riscv/cpu.c: add satp_mode properties earlier
Date: Wed,  5 Jul 2023 18:39:50 -0300
Message-ID: <20230705213955.429895-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705213955.429895-1-dbarboza@ventanamicro.com>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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


