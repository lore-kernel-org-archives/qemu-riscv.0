Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D239C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:51:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzhmb-0002R6-JL; Thu, 18 May 2023 13:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pzhma-0002Pb-NM
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 13:51:20 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pzhmZ-0001hk-56
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 13:51:20 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-19638b3a304so1458047fac.1
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684432278; x=1687024278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oi2BPBqhwTqWZsbomFMY6RSHe6ZN6RTyyS7h+sX9gec=;
 b=a3qzDFyM5W0en9rjuLL8rxgkwe/d/SbD7IP9CjHAtqR+Clx+gMHdtryva863DcBW6c
 ICjwlWKfOJkamstHDgsuyiV5COMPGBdCji1Jq6hwo9bmE80TqWu7DgjzFmNBJv/9sFpA
 LCi/VABDfLqLWkBADx7eG3ND3p8egwkWB4bURNh0GFNs9lcPavgdtle/7Oef5uLw7+kV
 i4FXHi7OlFrgeiNrXcSaMwD4p38Dk6awnVKoc7vvhjORItY5vNcprZ2AX3dzKAXdlQOA
 CpuQTOmTlApwrP67kPzIALgP9bWazp9AmHvNnMFjT3btQgby7IQuYVM2kyqu61+M+UUj
 R9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684432278; x=1687024278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oi2BPBqhwTqWZsbomFMY6RSHe6ZN6RTyyS7h+sX9gec=;
 b=JdT3wTvNg/iWgiLyzL8WhSrB1AKlTRg2gaMUQWjsfKuZNRyXicssJssapAKuhG+i7Y
 4Ym7JE9w7N3BU8LJhcpnWVHbKw490EcpcvuqZ1a1zN3tLUOH12gQYZlKcfMII4hdMhW0
 t4gy7yOjPpv8riFHAdxuY3sMM0RJs6C5aMWAbG5H3++smS7QtaHm/wted81EBAr5eh48
 R6raKoWBJWOWl+S92HH96gjIEyVbnNCCNbJrYRAD3cGSDAcRvnadD6QMSu0xRtINKrJV
 HDF+ThoAyQntWT8G0XfpyIfKSBdiYD/amP8K71vZx/9UPLDhsmLfS3hYzp8XnnCWWWEi
 NLfg==
X-Gm-Message-State: AC+VfDwKqSxPcQZD5xg4lKalpb6iFciJbdG/6kimrO4ImajwlFofIwum
 SxbIt4Z9tyBcijRdPEjDOM1pyQ==
X-Google-Smtp-Source: ACHHUZ5VKSnZKXh0cN0v+4e/MdZ8yumLieFJ27GcD9M9m2/bpttIk7lsrxO4s7bSNYUL20IHVfUrEw==
X-Received: by 2002:a05:6870:9514:b0:183:fab4:efb1 with SMTP id
 u20-20020a056870951400b00183fab4efb1mr1260184oal.13.1684432277860; 
 Thu, 18 May 2023 10:51:17 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a05683014cd00b006ab22bb324asm890832otq.10.2023.05.18.10.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 10:51:17 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 2/3] target/riscv: Reuse tb->flags.FS
Date: Thu, 18 May 2023 23:20:57 +0530
Message-Id: <20230518175058.2772506-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518175058.2772506-1-mchitale@ventanamicro.com>
References: <20230518175058.2772506-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x34.google.com
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

When misa.F is 0 tb->flags.FS field is unused and can be used to save
the current state of smstateen0.FCSR check which is needed by the
floating point translation routines.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu_helper.c               | 6 ++++++
 target/riscv/insn_trans/trans_rvf.c.inc | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b68dcfe7b6..695c189f96 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -119,6 +119,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
     }
 
+    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
+    if (!riscv_has_ext(env, RVF)) {
+        fs = (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) == RISCV_EXCP_NONE)
+             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
+    }
+
     if (cpu->cfg.debug && !icount_enabled()) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index b2de4fcf3f..509a6acffe 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -19,9 +19,10 @@
  */
 
 #define REQUIRE_FPU do {\
-    if (ctx->mstatus_fs == EXT_STATUS_DISABLED) \
-        if (!ctx->cfg_ptr->ext_zfinx) \
-            return false; \
+    if (ctx->mstatus_fs == EXT_STATUS_DISABLED) {                           \
+        ctx->virt_inst_excp = ctx->virt_enabled && ctx->cfg_ptr->ext_zfinx; \
+        return false;                                                       \
+    }                                                                       \
 } while (0)
 
 #define REQUIRE_ZFINX_OR_F(ctx) do {\
-- 
2.34.1


