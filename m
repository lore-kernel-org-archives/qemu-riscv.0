Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71F7CA0FF6
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA6O-0007n5-TP; Fri, 01 Sep 2023 15:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6N-0007mk-CG
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:46:43 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6L-0002vZ-1n
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:46:43 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5738cb00eebso1422728eaf.2
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597600; x=1694202400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQilM6mPMPBt/et0RgnK1omGUy9pg15ijboQ1qTt70s=;
 b=TLs128JIepnH2tICxi/SNomxHGHfJf2zUwQLT1HrEODgnrsjWH6We0LP2rlz+Yn6EZ
 JiSwD+OTjctx1hyHx6sbsGdgO3YkAWCee/lJHzvPwFGYAWoDwPHFjFaZWwpvRF0xfrB3
 jnTzyYuHc8zSgdwI1iLq2nLBJXROBtbickt7Q2WHmKBg33GpUA6VgsDMRMfBMgXhchu6
 Fz9BrrxL9k05AfqcvKic6kL3FOHiLNuS8NKDAPbZck9VxQbbCTfuy7/v+LamsRv7Ekx8
 W1ydvLkOmhsPlDKjfBfpP09pYytTsKmrB033WHPGlNLJSGcsUFsUVIpc/H8auBl0P43h
 FVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597600; x=1694202400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQilM6mPMPBt/et0RgnK1omGUy9pg15ijboQ1qTt70s=;
 b=gLyp7xGUY84g73Ts7gDfi8qfwVgyDijEYsVuYAQWMKQThTQRU6pRvguH0mFYo2kmk/
 T9SkZAYpbE1HqPsm6JFv5jo9RHGD+Fkmyp7DuFG+DVm6YyVgHkjGJ5GUuNKKwXQU2e3l
 YTzgHk4uDL/ru+C/FpAIpp7kNu2+vpvCAZMdrjHBQZnGxG5E2DaSgHHr43V715h8dD7w
 R0/WlzTgW/XhKaoHuSW5iFegRPJh7Mh95x2clzh3BV+ROtaq6ZsxjtXqMiQzTcmy5Hu7
 /BWuTRjlvwo5mZrc0s64lBEhHqH8qbDwXNjlWE5CbspGuPrnI9mZ2JcQ+FDD8fwq6gVG
 4eOA==
X-Gm-Message-State: AOJu0YynF6nP2xQvPYGuSuZ5rfU/TpLf28MMEV7ZvHavLFy8OIIedh9s
 Bul26GvljmWRUgGvR1t2fGL3hA==
X-Google-Smtp-Source: AGHT+IGwtjlRaYqxWuHsAttj4A84skLVst04AHEaIsW/ineDakiWgSxp/hf6PGwSwlPrqefS3mus8g==
X-Received: by 2002:a4a:92d5:0:b0:571:281a:ef7 with SMTP id
 j21-20020a4a92d5000000b00571281a0ef7mr3450585ooh.7.1693597599961; 
 Fri, 01 Sep 2023 12:46:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:46:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 02/20] target/riscv/cpu.c: skip 'bool' check when filtering
 KVM props
Date: Fri,  1 Sep 2023 16:46:08 -0300
Message-ID: <20230901194627.1214811-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
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

After the introduction of riscv_cpu_options[] all properties in
riscv_cpu_extensions[] are booleans. This check is now obsolete.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fdbd8eb0b8..db640e7460 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1976,17 +1976,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
              * Set the default to disabled for every extension
              * unknown to KVM and error out if the user attempts
              * to enable any of them.
-             *
-             * We're giving a pass for non-bool properties since they're
-             * not related to the availability of extensions and can be
-             * safely ignored as is.
              */
-            if (prop->info == &qdev_prop_bool) {
-                object_property_add(obj, prop->name, "bool",
-                                    NULL, cpu_set_cfg_unavailable,
-                                    NULL, (void *)prop->name);
-                continue;
-            }
+            object_property_add(obj, prop->name, "bool",
+                                NULL, cpu_set_cfg_unavailable,
+                                NULL, (void *)prop->name);
+            continue;
         }
 #endif
         qdev_property_add_static(dev, prop);
-- 
2.41.0


