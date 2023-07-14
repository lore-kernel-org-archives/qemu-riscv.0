Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB6C001E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKMpK-0004Wx-VX; Fri, 14 Jul 2023 13:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpI-0004Uz-A8
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:32 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpG-0003mG-Ly
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:32 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b8b8de2c6bso1740277a34.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689356609; x=1691948609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5/8BkfjA+rsSfV0TARmY00mQE9i3hAzSahCuFc0hWvo=;
 b=UIzhNyr7nWsJ4g37zABSYhIbs4FkhlCRQ4M7TOW284XFJ+POvXA+ySdcMN7wyMvIya
 wVNz9rpLU/lpNbkTSidu/3z/PPirq+iYBk+nzXCYipjjdnNFXM+XNq4RA3/HPqcV3j5w
 ul4WstYJM23hJz3T0FcWJxKat+fR3bkiBDsLaEJmuJFm0bIxfCrAMRHWYaw0Z4PPs8VX
 /5WLHxJJJquO5Ojk4DmCej4TtPS1wisSeDTmLWTScpWJjoI07Fx2cG05kHaaySzOBZ4N
 DWcQzDLTaT4agrZi9F586w6Xx4b3h8iVpaGmQuWh7cvUPcKeO/YgJwZn8V22VlkoTkGa
 NJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356609; x=1691948609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5/8BkfjA+rsSfV0TARmY00mQE9i3hAzSahCuFc0hWvo=;
 b=AjUYDKlyEwgqPvXHYgfX5M3ckvNcyNj+Yoxr0YVD6qQpKMcHWahnyzoBw4P190/wkE
 YkW6ZenqYDe75NDpYdxgX3py/KdG2yBxnzzFG65HJtke/AsMrALCI4WArqbj90OGu8eM
 WFCS05FgPh+cZYeFa8zB4bWnLO05MYGk0dGQ7laPbOT2JIbtlT3Ec2oaeq+KvA9+yFKj
 eDz66iCP3jJwrv4HCBp1ROZyc8Znsw6wdKhGJj268918QJ/7iJ5niQ3xsuhz0JtEFivF
 bLaDRdDF3c2RZ7k3ozWLMEPtgcVAAXHgbtkXvKEUGXnwuZroMpqh9zIxvUtZwTL/sk/0
 KsIQ==
X-Gm-Message-State: ABy/qLaIrOZpR139M4NcAUY+w975cPqN/5tksaTpccnQa2xc/qLxp9WK
 4iCrzfjoKtL5CXJdTqcSVUp5J6Dp0gQF0Af6mcA=
X-Google-Smtp-Source: APBJJlEI0N9RVNRJuBIkXZMbEdD8YEq7WXhw+Z1cqXu9TR3RdcH6hxZMYZOYXka7AxB13a0DT8ZByQ==
X-Received: by 2002:a05:6871:68b:b0:1b7:71ee:c4ea with SMTP id
 l11-20020a056871068b00b001b771eec4eamr6921371oao.53.1689356609288; 
 Fri, 14 Jul 2023 10:43:29 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a056870771200b001b05c4b3b3dsm4240968oab.31.2023.07.14.10.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:43:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v3 4/8] target/riscv/cpu.c: split non-ratified exts
 from riscv_cpu_extensions[]
Date: Fri, 14 Jul 2023 14:43:07 -0300
Message-ID: <20230714174311.672359-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
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

Create a new riscv_cpu_experimental_exts[] to store the non-ratified
extensions properties. Once they are ratified we'll move them back to
riscv_cpu_extensions[].

Change riscv_cpu_add_user_properties to keep adding them to users.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d9c097f602..5689368f02 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1808,21 +1808,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
 
-    /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-
-    /* ePMP 0.9.3 */
-    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
-    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
-
-    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
-    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
-
-    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1841,6 +1826,23 @@ static Property riscv_cpu_vendor_exts[] = {
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 };
 
+/* These are experimental so mark with 'x-' */
+static Property riscv_cpu_experimental_exts[] = {
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
+
+    /* ePMP 0.9.3 */
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
+    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
+
+    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
+    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
+
+    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
+};
+
 static Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
 
@@ -1923,6 +1925,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
         qdev_property_add_static(dev, &riscv_cpu_vendor_exts[i]);
     }
+
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_experimental_exts); i++) {
+        qdev_property_add_static(dev, &riscv_cpu_experimental_exts[i]);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


