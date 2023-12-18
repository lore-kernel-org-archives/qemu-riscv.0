Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0074C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 05:16:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF5zG-0007LK-JF; Mon, 18 Dec 2023 00:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rF5zD-0007IT-DL
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 00:16:15 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rF5zB-0003Oj-E4
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 00:16:15 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5c690c3d113so2224867a12.1
 for <qemu-riscv@nongnu.org>; Sun, 17 Dec 2023 21:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702876570; x=1703481370;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SzIUgJAyJY5dDdCff8SpfRi3ccAVPKM0UnEn1OD8uzo=;
 b=yV0SVFGsB0/L3R4aV82EF5umEHGzHuuhlF+f7EDxE2zzI7a7jfpGmSuLFkdtKGrpr4
 RogTvho6RUzuOaQGQ78tkii4mKufenoRcvV1MAFaFMP4WF9VkS/DpslHT8NXWhGR2Jhj
 UgohCt267tQtSCrn9bNyHXBhABPvFpZfL2s/IRvOBurhaEaMOn7PsIoeCfvKLp20eN9Z
 8VCn93z/lbdEd2MovtSSl2u0OM4f8pEVYTcwhkivaG0SyT73g0zsHEZIiBACRUn9yjRk
 l4Q34+CA2QjFMFi6mfy+MxH9Gmjp2FOth36xQcVCHjDOd+/y+gMWfkd/rEg7/fMgGgJ9
 IcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702876570; x=1703481370;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzIUgJAyJY5dDdCff8SpfRi3ccAVPKM0UnEn1OD8uzo=;
 b=N7VBr6LL6rCJPAz+RKUH0m7y7L8wo67x/RNFo+r3rjiTKEVIOVSVJyybYAFlKrMpFi
 Sf/z4pinQdyleMg6KYJEM8BuIpRywJZ2uvvgYdJjOgjfBfu6Kuy/rCmkxx+I95NwVuEk
 V8sqVAhULX92hLAqFZUcmehmaZeQ5Qwqq8NaqLhNpsQfsc4qg5fMmMW11RxXzOvH4+xU
 ndIu5BoOML7+80X9tbUzvbA2KecahXwNjt5a0RRH8L9hEBBII454KUmDTEF+rY4LhDWk
 VVwK79AK5Cg680/GDpo8QSFiXITdAtWEJq19+9eQ7ZgiFkeBR9TIRXwnCz3y+6uKC8Cj
 7aXw==
X-Gm-Message-State: AOJu0Ywm6I9cBUt1D5P0rq06aYZ8KFJB2eWR+NQu5vPGC1pbYYPvd2sv
 YNiX4pf6SYHHce5+myE7GPJMWw==
X-Google-Smtp-Source: AGHT+IFPNgx1+KMCrnIrNmV8Bt04zNivjl9jm4bfAwzepEaIFKkUA1581a5ywZIJC842//0SbCTVrA==
X-Received: by 2002:a05:6a20:12c9:b0:187:df72:48ef with SMTP id
 v9-20020a056a2012c900b00187df7248efmr19860609pzg.0.1702876570252; 
 Sun, 17 Dec 2023 21:16:10 -0800 (PST)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 q19-20020a056a0002b300b006ce91d27c72sm1082145pfs.175.2023.12.17.21.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Dec 2023 21:16:09 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 18 Dec 2023 14:15:48 +0900
Subject: [PATCH v8 2/4] target/riscv: Remove misa_mxl validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-riscv-v8-2-c9bf2b1582d7@daynix.com>
References: <20231218-riscv-v8-0-c9bf2b1582d7@daynix.com>
In-Reply-To: <20231218-riscv-v8-0-c9bf2b1582d7@daynix.com>
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
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x535.google.com
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


