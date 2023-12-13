Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E253EC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 05:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDHf2-0003MK-On; Wed, 13 Dec 2023 00:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDHf1-0003Ll-Pr
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 00:19:55 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDHf0-0002YB-8I
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 00:19:55 -0500
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b7020f03c9so266257039f.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 21:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702444793; x=1703049593;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SzIUgJAyJY5dDdCff8SpfRi3ccAVPKM0UnEn1OD8uzo=;
 b=uhuMt665Zp9bGSTv00+lhPH+m8G9N9KnvsGzH7bQGsEa7VfCx4xAXu9OkoI8FltFCC
 m4QJJ8zv+Es8cK2lEgeALVCcBWu5FHnOxFHD8cuM6JnNQTGIVdWy2sKESLyjPedukQDV
 5t9JPsGBopm27+cJyYtpJfWliQL1hQo35/g1Ny6tX0rzNURLXWT/0gzI9smaHkPltbkV
 hmN7Z+96UdisEeJAMc/el23gwBGuZrM3PxLlaZ0wfxv6JQGnoRs2Pp+7te203Mq49tpW
 1+COAKpPc0TqgJioixcUvPWFL1mVAEhtcvJLhG7y8aB+7K4jaW8VJok0qyz7V1X21gAD
 TCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702444793; x=1703049593;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzIUgJAyJY5dDdCff8SpfRi3ccAVPKM0UnEn1OD8uzo=;
 b=HS5wXbjU1YaY7JlMll082BccBX/dqUCNnNMdSrABvYNK5+0Y7d/3WlopjZn0ZdNxGp
 6yY0CP/7ZvP/q6ZnmXb40ACGfhrET/WRHKjJhUafaCyDANrudLU9GfdJ0ecbpukNEkUJ
 kdDFb3gm9pq+yfRLHQjYT7fNVclHrivmNr6n77Yh6FecxoJ5w+d32rm1uO3LXCwIZzg6
 IBJcQhlZhGxTM6lqA5Pc0XrBD0kl1mmLORnR3YOdX16/q/k/z/9v+Fv+/9RzUNwKt1xC
 wZSMivJfFjt7NgOgUKwqEqBYWEm9Vk/hFdDqgv3pyQ4CLtUH+CcH+fFSPOVzujvRSkF5
 clNA==
X-Gm-Message-State: AOJu0YxnJ1748VcUPqFsNvHQFsw49NAFd7Iu94ToBN/PQraJQfAIDb6q
 LC0zZJd14VrF0izSbTl8IURQDQ==
X-Google-Smtp-Source: AGHT+IHNtD9Px03IFzgoK+mfwYgQJzd+LfMXTy/X7lb3MjioLSJ0hrsvHgwgpku/vIjLOHQoAUPsxw==
X-Received: by 2002:a92:c54e:0:b0:35f:69a7:15c0 with SMTP id
 a14-20020a92c54e000000b0035f69a715c0mr1603184ilj.28.1702444793226; 
 Tue, 12 Dec 2023 21:19:53 -0800 (PST)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 u9-20020a170902e80900b001cf8546335fsm9555880plg.5.2023.12.12.21.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 21:19:52 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 14:19:30 +0900
Subject: [PATCH v7 2/4] target/riscv: Remove misa_mxl validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-riscv-v7-2-a760156a337f@daynix.com>
References: <20231213-riscv-v7-0-a760156a337f@daynix.com>
In-Reply-To: <20231213-riscv-v7-0-a760156a337f@daynix.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is initialized with a simple assignment and there is little room for
error. In fact, the validation is even more complex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a345d..ee17f65afb60 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -148,7 +148,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
@@ -168,11 +168,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
     default:
         g_assert_not_reached();
     }
-
-    if (env->misa_mxl_max != env->misa_mxl) {
-        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
-        return;
-    }
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
@@ -673,7 +668,6 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
 static bool tcg_cpu_realize(CPUState *cs, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-    Error *local_err = NULL;
 
     if (!riscv_cpu_tcg_compatible(cpu)) {
         g_autofree char *name = riscv_cpu_get_name(cpu);
@@ -682,14 +676,11 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return false;
-    }
+    riscv_cpu_validate_misa_mxl(cpu);
 
 #ifndef CONFIG_USER_ONLY
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
 
     CPU(cs)->tcg_cflags |= CF_PCREL;
 

-- 
2.43.0


