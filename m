Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4106ACA0FF3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:50:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA6l-0007uM-Gh; Fri, 01 Sep 2023 15:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6j-0007to-Sr
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:05 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA6h-00036v-PD
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:05 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5712b68dbc0so1442022eaf.1
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597623; x=1694202423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y97HdxxmubvS3cqidCb6OPgwtQdSFtj5M29PXNDNmfI=;
 b=PmFXSEDnY9knbd16ej5Tbd7j6QfEf2zIPpQrSBsjYm0t7w1h/vdDoAMJvx6nNM5HX+
 Pt/Qag9xhvNTlHzHnsVdew7gC3IxOYjaFbmpJZs5FK29+J1gXrqQdCNSR4N638nX0Qjg
 U1u+/hvYLjQffQMMFHiGuvAH6zszR1nztuGqoS3bn5qkfItwsFcu/bcSAgxWZEk5t2Qk
 17CU0gqHC8/BJ6KB1oPWaQHpWc+0t+30mnT/auTUngjcKoDOJIoZQVcrBzhFmpkEbSnu
 raO7ZzZ9RuwL6HmGVwifD01omCI0g/3st5MY9ICdaBGNzHgB7oRGPK8XxdFBKYR/QsWn
 gmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597623; x=1694202423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y97HdxxmubvS3cqidCb6OPgwtQdSFtj5M29PXNDNmfI=;
 b=BDAi9jfFiP/Lx5+7pz/adFp8Xz5YIcGLOGuLh+9cwzrP6OD75zWU2u07zqWss1N2oP
 k1KnfVuArrrcUNgJNgrYxwSGpPJjCfZJOd8q96+KxxO2JeJBGprRPpt0Opxn8WArGUWR
 HeQ+iWjhqcHL3/fl54bBIzGOlVPABUtycLPo1bzfHQX148Rz+Fgtgbhp0v3rYGrxWX/t
 YrwztYJaYThcrr2cVzdkui23mki12hMXmcIzbf3wEybDrYXuRUgCxkVWq5RRc3XjUFYE
 I3iiSRkApnrxOAcRkXa/dWVDpbhAOm2gGRgQRqy9rPeYzpuc780qpIvZEqs2VS4q+RY2
 U4zA==
X-Gm-Message-State: AOJu0YwNUTf5RY3k9vJ63uICPLpDq6vhVilM3mHDBvZ5p9OqDmKVfv09
 P+EoFoYQd6y8AUTK4DVnpklm5w==
X-Google-Smtp-Source: AGHT+IEwWIi1fmESz6XeCJq3RMjCEMKQ9NOxy+o6S8yCv468DMoFDy5F/JxJMvUIgGM9rAvoITJ8Lw==
X-Received: by 2002:a4a:2545:0:b0:571:aceb:26c8 with SMTP id
 v5-20020a4a2545000000b00571aceb26c8mr3516315ooe.3.1693597622852; 
 Fri, 01 Sep 2023 12:47:02 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:47:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 09/20] target/riscv/cpu.c: limit cfg->vext_spec log message
Date: Fri,  1 Sep 2023 16:46:15 -0300
Message-ID: <20230901194627.1214811-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc35.google.com
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

Inside riscv_cpu_validate_v() we're always throwing a log message if the
user didn't set a vector version via 'vext_spec'.

We're going to include one case with the 'max' CPU where env->vext_ver
will be set in the cpu_init(). But that alone will not stop the "vector
version is not specified" message from appearing. The usefulness of this
log message is debatable for the generic CPUs, but for a 'max' CPU type,
where we are supposed to deliver a CPU model with all features possible,
it's strange to force users to set 'vext_spec' to get rid of this
message.

Change riscv_cpu_validate_v() to not throw this log message if
env->vext_ver is already set.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8cd19a9b9c..3ba92c806b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -959,8 +959,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
-    int vext_version = VEXT_VERSION_1_00_0;
-
     if (!is_power_of_2(cfg->vlen)) {
         error_setg(errp, "Vector extension VLEN must be power of 2");
         return;
@@ -983,17 +981,18 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     }
     if (cfg->vext_spec) {
         if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
-            vext_version = VEXT_VERSION_1_00_0;
+            env->vext_ver = VEXT_VERSION_1_00_0;
         } else {
             error_setg(errp, "Unsupported vector spec version '%s'",
                        cfg->vext_spec);
             return;
         }
-    } else {
+    } else if (env->vext_ver == 0) {
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
+
+        env->vext_ver = VEXT_VERSION_1_00_0;
     }
-    env->vext_ver = vext_version;
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
-- 
2.41.0


