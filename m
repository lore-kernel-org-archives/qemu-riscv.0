Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3452CA0EC3
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:26:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3OA-0002o1-Gs; Tue, 12 Sep 2023 09:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Nj-0002ay-J6
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:24:48 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Nf-0003VI-9H
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:24:43 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5717f7b932aso3591120eaf.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525077; x=1695129877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQilM6mPMPBt/et0RgnK1omGUy9pg15ijboQ1qTt70s=;
 b=WHRI4pVngeMuGjkDwP7Kaf8yVKBF0RgysxrA2ezJj/g99s/5C2TkbjNYa7/sHyjnFL
 fZcS15WILshYGDA0+ZtCYy6KXuknEznQ1gcvuGRZcvOjS7ZcD54wRng6zFZ7w9gzObby
 Ed9hvvfdqN+RMar/84mSBMp4b/OGaz0dvFHGzu5N/e4KjAB9AGZTnroJg73kck4/UoAC
 QJWbKKk9m357EqZhWl19hTaqn7m1T4Sz3l0kpwUYQrkPzIhKF9ztHwlBjJSfl9VKtLLx
 HhGj8OBNDDkh4oLNeP34tRimC+j2G4H5qixGEOjk3z8vbiNyieDy9O3x3MsDv63CG6tg
 1SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525077; x=1695129877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQilM6mPMPBt/et0RgnK1omGUy9pg15ijboQ1qTt70s=;
 b=FhxJiT2y5CIgK9OOKxtkGMH/+y7BHTdijfEva+a0upEw8nd7uAUcsIbB2cybrcaqwO
 WaaVtTECfVRVy5irr/dbZBFlyQ8wFsleIUUYWBmrnWX93DowL2p09tKUh3WENsE6Oxfc
 E3e176RpsF3SSxARu4rjSSEXKG84VSwNTVXkVBTaZrnxgJ41ySkKYjYn9HBkDVLBo+kq
 ntO9K2N2t0hylZrTg/JIpPX/+Pvqx0f3+ogWSPKiKORmDu3tsdw/Ozuc6W0P5LP+wqD+
 BmpDwNnFf9M4nZlhJYKH/FvE46KQmsiALFFNg3dS4GuRpR3/ls6phTFNn5Ofr/PRIUAW
 mFcw==
X-Gm-Message-State: AOJu0YzJ7AmXUBBzGjsiIoSkvxI2wuUagOa0ScbIdvtwZhMolDXDtCR3
 t8NFhuEyGs/rq1oiYHDEo0DDkA==
X-Google-Smtp-Source: AGHT+IEhIRsjiBLGWqBkMGBIwsgZYVA2LFF+ugYIEGG/Pfex9f7/IBhZsIuzPts0KjCXVJa5IyiDow==
X-Received: by 2002:a4a:340b:0:b0:571:1fad:ebe0 with SMTP id
 b11-20020a4a340b000000b005711fadebe0mr12910403ooa.3.1694525077567; 
 Tue, 12 Sep 2023 06:24:37 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:24:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 02/20] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
Date: Tue, 12 Sep 2023 10:24:05 -0300
Message-ID: <20230912132423.268494-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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


