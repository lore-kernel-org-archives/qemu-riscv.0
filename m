Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C7BC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:41:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5EW-0002mr-B9; Wed, 03 Jan 2024 12:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EG-0002Kq-Q1
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:34 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5EF-0001WI-0P
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:32 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so2075828a12.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303630; x=1704908430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afT5wE04eaPASU0VvwKt04xd7mUQk2Pdh4so599y5Fs=;
 b=Lj5cMSGOaHW8UA3Px1FW8//5ckIUtPqLUd6NTSmfmVstbQH+QQwUW+kFHEdTZWz+j3
 VmZaglOQOiZHtKZEfIwti4luH7moX6+T6bU0lwL3fUGrJskHLqKnNi/mv1+ZkH59K+gN
 KUDOOcea4BItoM0GcPcpRAwOD91NeSwk000XHWeB9lldm91JPwPyrybphQEzFWfcxWcs
 PQdOLCg1E9qptizSwIReXZM0uErnLb8RyvD3FSj1W5Py1AjD+z/F/wN4B1+03t3lcfzj
 aCMjhA51xuQO7oIJXsZhiZl/U3DU2XfTs6indyg5cXyDPHcKHAgybeSKxXkhbUf8RPbh
 Gy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303630; x=1704908430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afT5wE04eaPASU0VvwKt04xd7mUQk2Pdh4so599y5Fs=;
 b=MiXA1CIe04ZDi/8ZIHgLgO0SHBUci7U+r4JssKUlSc2WCVHV26HZ5Jl43bNG5d7YYk
 gGSLuzJTzqVP++bi4IBY55dXoZ9aFAk7RMrB25ay+fNCyoxG9ZHsIdRshdpuwo7OlJwP
 KWFg7beCZJEN48iK17uW7xeKrqElEwJGcBsxTKoYLtiWyEuJL1rMSK4nxhuNdta4zCxd
 qObWiJcyJyL6ypd5gfG4ZFavHqK4olAPSoOuk8GkZbPPiXrP8v0fVHSudtHsYtSaIvyP
 P06mau92kD1ixCXPwAE0YQMFB+4AC34s6baSBavIh6A4AYkRnF79KXxVWvSa8HJZ1Dqi
 ZXVA==
X-Gm-Message-State: AOJu0YyAUXqtdxX/GN0PYnwTT+3Hby9v8o/JnPOgNptxZVlqx1Ju5+T8
 hT9wO2Hf1TehCdU8x8puuaYdTlu4Tk7SHg==
X-Google-Smtp-Source: AGHT+IFVQX8RXXeGoiis/hniof6sItZpeppfaAoHdamXjEmG3f1Pe37PA95+rX2a9+84VtmK0uo3kg==
X-Received: by 2002:a05:6a20:992:b0:196:9f89:29ba with SMTP id
 e18-20020a056a20099200b001969f8929bamr2778528pzb.45.1704303629736; 
 Wed, 03 Jan 2024 09:40:29 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:40:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 02/16] target/riscv: make riscv_cpu_is_generic() public
Date: Wed,  3 Jan 2024 14:39:59 -0300
Message-ID: <20240103174013.147279-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
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

We'll use this function in target/riscv/cpu.c to implement setters that
won't allow vendor CPU options to be changed.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 5 +++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 -----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 70bf10aa7c..65cfa6c740 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,11 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
     *ext_enabled = en;
 }
 
+bool riscv_cpu_is_generic(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
+}
+
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 40c96a32cc..bf69cb9a27 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -756,6 +756,7 @@ enum riscv_pmu_event_idx {
 void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
 void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
+bool riscv_cpu_is_generic(Object *cpu_obj);
 
 typedef struct RISCVCPUMultiExtConfig {
     const char *name;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a34..a09300e908 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -658,11 +658,6 @@ bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
     return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) == NULL;
 }
 
-static bool riscv_cpu_is_generic(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
-}
-
 /*
  * We'll get here via the following path:
  *
-- 
2.43.0


