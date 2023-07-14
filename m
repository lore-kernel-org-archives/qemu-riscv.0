Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12601C04FDF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:44:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKMpC-0004TR-Jp; Fri, 14 Jul 2023 13:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpB-0004Sk-5Q
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:25 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMp8-0003GF-Ik
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:24 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1b3f281c4e1so1744988fac.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689356601; x=1691948601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eO6QCqXAX2bHTG5n/7KkuRyCvVAfVcemu/QukjvFflQ=;
 b=YM+/cQcvuL7n2ESne+XOcbut2jIJ1KbPj4TTjsOQFticxLP+EroQcT6PVlp3YM0wGf
 7T4eMdIZyd0vsYvIYZnZ3qzvksr84rSNZf3sri4i+4wEIT9Ta9zNNnvpflkhKUHkTaQK
 XE5uzxOXP3Do1D7Mq+79cm+DPFxfNFGwR+e44nbowsn4CvPBGxHgql+qjP4ZsllGTLkl
 PQv3hCJRnSqoEizfPegua+JtD0lH6Ms5pYoAM/wCxYR5pUGXIIdxnPvEzK9INPqxc8bD
 K2eSRvqEgv5weHBP1Vtw4h0tv4FnNfdFBoR2LkRHpl+kLBRVLgVVyiEPbkyhkuAf2X0r
 9cTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356601; x=1691948601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eO6QCqXAX2bHTG5n/7KkuRyCvVAfVcemu/QukjvFflQ=;
 b=jiJRcZp3SeIK07cWX9uqUQ/16SIR1ToxL6ph88fssjlHZGU7paIDE0Bmv0BurYQwxz
 +hT2TzsJFYwsZsVbzzMqZrToxEApjhVZ1sV4Ydgfg5SdfgACbYdF5Xt+GsqgPD0AqN3I
 uDGWEqO4BtAjNALISZEk302BRV5WciA9sIFf5vDE+8vC+BjyAUv175jS8VVD3tTqYs5W
 ZKy3nVIsSpVb1ct52z17UZc37+UW0rR9JOeXfeCiZrwOXHFD7dKYecAx0+G/DFqT3nk2
 F5hzRyN7oXb5RfJ/ebQ7C3TwGHYpAwYY2eIlPBAooQFgi4rjmWX8UghiIPy9euemHFZy
 tf2A==
X-Gm-Message-State: ABy/qLYO6TaeA8VFsVg7MgvMLLCFSdJQSBTLgwY+Fp8n0K4B8nWSZtUB
 7jAVAh6wrS90z0+hDSk9vMHRsrjlclQz76ZXlCI=
X-Google-Smtp-Source: APBJJlENNVpZ9bUVkRMKD0LuOf0dcdQ0gJc+ZDZTyo/lYXqy9ZMsPHB+Cp9+ZVdYFEyvROn8lgtx3g==
X-Received: by 2002:a05:6870:c115:b0:1b3:e896:9bfa with SMTP id
 f21-20020a056870c11500b001b3e8969bfamr6731376oad.25.1689356601115; 
 Fri, 14 Jul 2023 10:43:21 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a056870771200b001b05c4b3b3dsm4240968oab.31.2023.07.14.10.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:43:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v3 1/8] target/riscv/cpu.c: split CPU options from
 riscv_cpu_extensions[]
Date: Fri, 14 Jul 2023 14:43:04 -0300
Message-ID: <20230714174311.672359-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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

We'll add a new CPU type that will enable a considerable amount of
extensions. To make it easier for us we'll do a few cleanups in our
existing riscv_cpu_extensions[] array.

Start by splitting all CPU non-boolean options from it. Create a new
riscv_cpu_options[] array for them. Add all these properties in
riscv_cpu_add_user_properties() as it is already being done today.

No functional changes made.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9339c0241d..3b49a696ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1751,7 +1751,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -1767,11 +1766,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
 
-    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
-
     DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
@@ -1802,9 +1796,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
     DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
-    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
-    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
@@ -1848,6 +1840,18 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static Property riscv_cpu_options[] = {
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+
+    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+
+    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
+
+    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
+    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
+};
 
 #ifndef CONFIG_USER_ONLY
 static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
@@ -1916,6 +1920,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
 #endif
         qdev_property_add_static(dev, prop);
     }
+
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
+        qdev_property_add_static(dev, &riscv_cpu_options[i]);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


