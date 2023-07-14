Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA52EB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKMpE-0004Tq-Ka; Fri, 14 Jul 2023 13:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpC-0004TH-DQ
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:26 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpA-0003SL-TY
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:26 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so1704947fac.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689356604; x=1691948604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbIXk+TmeIYyzefMBhjUOpovsmWL5FT1431BO4OvqSc=;
 b=gOk/fbGPNkM2if4Ljt3s8km350nd+SIbi/aOTvLAcB8biKqpGebZ9u9jpTmRqbfNme
 hJHzdV+oTLYv1ax7woWRtkJ7d460N1Ef4gJoWN3YVWrKf3FIwH2iIT9VEqkb9Cis6B9I
 CY5n/q+lNX5rSrLAya2Wd/RIMNkeVX1xNSksi/l+/GcJDfkoY5oAg2O1LaqzCsY2rcLi
 dimc4dOsmmXgyBX5ikcOEq1BT7uQMaPL+InWaSiK23YzwvQKGgxiFXVWldrYRCPlFaKb
 J7xHRfaFMC9gbhtvcWUcPs7JzoEIDYwykPIq/axEAKOKAlUVLcAjs8iNGLNQ4m650CeX
 eaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356604; x=1691948604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbIXk+TmeIYyzefMBhjUOpovsmWL5FT1431BO4OvqSc=;
 b=Z3axOmOfcg+vL5fFTPYgiesBkXuMmqks+36lMCq/ZHsn7w/g5zHhwMP1GQnECoYeJ0
 Z4pmRbMNe4TjOSGKuY4FcAd29/3Q1JrM25CKOUn5UA4tg1Qm7Fw1yEHxjYfhbqm4g0gO
 4lfnLa1ov+Hh2fxxV36F2TLZ+q/O+XrwZQBKq4OYyu9f15ATJg/83QApNdRX2eBdkSfC
 r0dL7gk4/QNVTv87CEx6m73pRYmuPjg9ozcJIXxQUFrH2/jhrpUfih6fTqp8BevfCvbG
 msRSKdday8TQv5mdmwFz1DRFd58EYUMaVdWfLvw/2W7c3twUXvDeN+r2wWJZLP72P+Ee
 VgqQ==
X-Gm-Message-State: ABy/qLbu30rbFwc1u77O2AE6Y2hD88h+j3nXnHsuJxrL4GVUrIaM8Ecx
 ysLHNt0mW/0mfTzPEORUyTHPgA9tG03ALkwhPZE=
X-Google-Smtp-Source: APBJJlGYDRy32XQye9/IBlylgPhBrDNBE6IYZYpM+Mr3v2vAXrgjoac+XkqQ++pFlKATHaxPc/HbSA==
X-Received: by 2002:a05:6870:4727:b0:1b0:89e4:e260 with SMTP id
 b39-20020a056870472700b001b089e4e260mr6321359oaq.19.1689356603806; 
 Fri, 14 Jul 2023 10:43:23 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a056870771200b001b05c4b3b3dsm4240968oab.31.2023.07.14.10.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:43:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v3 2/8] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
Date: Fri, 14 Jul 2023 14:43:05 -0300
Message-ID: <20230714174311.672359-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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

After the introduction of riscv_cpu_options[] all properties in
riscv_cpu_extensions[] are booleans. This check is now obsolete.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3b49a696ed..b165ecfcba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1905,17 +1905,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
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


