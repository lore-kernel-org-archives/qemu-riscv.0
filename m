Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D1C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:06:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGN-0002EW-8K; Fri, 05 Jan 2024 18:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGM-0002EA-09
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:02 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGK-0002G7-BX
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:01 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6da202aa138so82164b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495959; x=1705100759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQ5k7rJf7aq8uIJRuaRsr2G0njl/+Z50S/aeFcfNhho=;
 b=NSNUXHjddBE8GPJFLYGS3pUElt7m7ZQPcoR73d85P9AT62WecFJAWnQ7UlmngGozI2
 zKUiUFur3uHEl85qlJ0hKPczX2aYWC17evUI9SG6L1QEbQuGGAyUOINCzJqBFfEW6ION
 hW9rrqFTBGhlB53Mklsl7t6MNaBnHH9tOU1NwaeOonniB4U0kfchY3kh1wHNuVcTCAUo
 rC+/wBdrtwoN2/Qbd3YusIDyuNUqFGHvRKYPAZTQsBMKKAb45jNN1NxlVq9LnMmRMhNH
 zS8skQfLVuPvjrFaAFkigMzpS25G3iCNAtjsGK2TS6Ssjkf5pelnET/owjVYuqrdUIAY
 woOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495959; x=1705100759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ5k7rJf7aq8uIJRuaRsr2G0njl/+Z50S/aeFcfNhho=;
 b=ITlth9d+5BUQuyT4w4TkK8L88rp4dCocD8AVIiVLVOAGFyn6GE1sR/+8ekPS69u7fp
 nuBcdO6t4saqKewgS9bZXi3s9YkpXIGnMefenW9MuEOcHLck1pQG/xKx50hJCmUBcxOb
 awvRFhgxxwUoCXW7UPblEPzGY5QjB9IXluqILZV0BzFJ98vyg3A7/i9kmpTqJ/AI1Qu9
 tW4DzG4w1MaW4SsRejolxxxPeiJGfZuMzEH79cdg04mSrHeYCSoBCoePA13iqhK6CUnA
 TAq87oSUYFxAd7AndZp7URWTM2Vv619hdd8CFJcsvBfBqCy92n6hvSkqaa6MmZFe2gvh
 40qg==
X-Gm-Message-State: AOJu0YwsOONzX/qqDWNWraKWGzfL5dKMdd+qa3qgnhdo+GsRG1q5spPs
 jVW2TsWB2zVdsC4mR3vB29m0n+OItZcEsQ==
X-Google-Smtp-Source: AGHT+IE/cXgVuBkPi8dOZqoZMJiO5G23nNE7Q/STW2y5QoykjqiSebWadbE+dUdfA7APKr2s6gVafA==
X-Received: by 2002:a05:6a00:9387:b0:6da:c7ce:ef53 with SMTP id
 ka7-20020a056a00938700b006dac7ceef53mr116630pfb.3.1704495959208; 
 Fri, 05 Jan 2024 15:05:59 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:05:58 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 02/17] target/riscv: make riscv_cpu_is_vendor() public
Date: Fri,  5 Jan 2024 20:05:31 -0300
Message-ID: <20240105230546.265053-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 5 +++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 -----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cce8165d69..025c6cb23c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -190,6 +190,11 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
     *ext_enabled = en;
 }
 
+bool riscv_cpu_is_vendor(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_VENDOR_CPU) != NULL;
+}
+
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1c5ab8bd0e..1ece80a604 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -773,6 +773,7 @@ enum riscv_pmu_event_idx {
 void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
 void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
+bool riscv_cpu_is_vendor(Object *cpu_obj);
 
 typedef struct RISCVCPUMultiExtConfig {
     const char *name;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 14133ff665..2c2ce51b19 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -917,11 +917,6 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
 }
 
-static bool riscv_cpu_is_vendor(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_VENDOR_CPU) != NULL;
-}
-
 /*
  * We'll get here via the following path:
  *
-- 
2.43.0


