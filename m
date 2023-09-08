Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB277EEB562
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:29:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegC8-0003Os-Gx; Fri, 08 Sep 2023 14:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC7-0003OS-28; Fri, 08 Sep 2023 14:27:03 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC4-0006o9-Q0; Fri, 08 Sep 2023 14:27:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52a250aa012so3185958a12.3; 
 Fri, 08 Sep 2023 11:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197618; x=1694802418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbNg+k7vLO2nylPhpv9bH2yg2TAvbONRAuZuLgIkNVM=;
 b=JrQyVAOrlMn7P2m08McjMzWYly2xvinJgKepd+VKY0Y7FLhf4mYaiu1SrHyD7Unoqi
 +ahjhEtE4FLY24HIGN9m/YwCu+NQJmM/5SYNIUrEc/31Q5gid8tk+avLWwT00NAIGGBY
 pT5gWv3hwhTjX4mb/HjQXMmdaynanZTqv0DvEewXjg5sYKusxZeiU9UQsReyk2vnTdX9
 PARuliuz/2rPaMNbfsZmgeLPQEyz+roiWnL1g8YSxF6cmLIc7a+Wo9SrGy3Rvi1vr6NX
 roS2Qzvp/7qUwrYASQBX/ccxow5A3E8KRBtMp0rU5ix1BmATn7TyiKwECALg5Kexdy2l
 j92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197618; x=1694802418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbNg+k7vLO2nylPhpv9bH2yg2TAvbONRAuZuLgIkNVM=;
 b=Gc2Vv53E9K7SQMF0uEKdRRgSziCgmMDL7gbobjTgY2TsofGhXuuK480IFVClFGXXws
 ywNqq12+2FaPq250mbeq17cziac/hTSTfy3JyeFFcmhvHv+yXD1wZBQpx3YfRzg7VK0l
 t0YUzjS8DXKcq1lJNCbQueRUU0SVOVXO2q2YhopXQltlFKtlh8sqMxe7EOR5wEnHQ4Hq
 s32obU9329C2mMpSD5Z9jIkAPmCqFERP9lqEhROKaElQUB6M9mee+nL/6o7E4wvH620l
 7L5FjZRFYGJEoM66vD8/wEEDoWImaIqzfkwezLuNH9UN8PIOTpHBOQMJ0wHzr64BcbOr
 ivzg==
X-Gm-Message-State: AOJu0Yy9SzQiWYFHg8D0xqIy2Er8UuHXYAqXcrvOoAGuqiE2hnlXMCVa
 ddDuHnK8QLsRJu4MeNgexsusLn1eTrgxLg==
X-Google-Smtp-Source: AGHT+IGgWyDyMtuTLRc3mWDs/S/omgVuUkfnNM6vRSC1C5pyx535keA60qwWZZdm6yNPj6k49osM1w==
X-Received: by 2002:a17:906:cc5a:b0:9a6:65f8:b328 with SMTP id
 mm26-20020a170906cc5a00b009a665f8b328mr2276246ejb.1.1694197618526; 
 Fri, 08 Sep 2023 11:26:58 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:57 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 8/8] target/riscv: enable updates for pointer masking
 variables and thus enable pointer masking extension
Date: Fri,  8 Sep 2023 18:26:40 +0000
Message-Id: <20230908182640.1102270-9-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu_helper.c | 1 +
 target/riscv/csr.c        | 4 ++++
 target/riscv/machine.c    | 1 +
 target/riscv/pmp.c        | 1 +
 5 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index af8f16b94f..928d4b5f5c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -891,6 +891,7 @@ static void riscv_cpu_reset_hold(Object *obj)
     }
 #endif
     env->xl = riscv_cpu_mxl(env);
+    riscv_cpu_update_mask(env);
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6e68b2fc27..6cc1df4fcb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -689,6 +689,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
 
     /*
      * Clear the load reservation - otherwise a reservation placed in one
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c7e59168d2..7fe0d83877 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1321,6 +1321,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         env->xl = cpu_recompute_xl(env);
     }
 
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
@@ -1948,6 +1949,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
 
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
@@ -2002,6 +2004,8 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
         mask |= SENVCFG_UPMEN;
     }
     env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+
+    riscv_cpu_update_mask(env);
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index d50ff5421f..e63a9fc95f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -258,6 +258,7 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->xl = cpu_recompute_xl(env);
+    riscv_cpu_update_mask(env);
     return 0;
 }
 
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 0db49173ef..5ca536bac0 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -586,6 +586,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
     }
 
     env->mseccfg = val;
+    riscv_cpu_update_mask(env);
 }
 
 /*
-- 
2.34.1


