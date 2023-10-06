Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECD1E81DF4
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 13:23:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qokmL-0005yP-3B; Fri, 06 Oct 2023 09:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm5-0005t0-Va
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:51 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qokm4-00037s-Eu
 for qemu-riscv@nongnu.org; Fri, 06 Oct 2023 09:21:49 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso16021215ad.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Oct 2023 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696598507; x=1697203307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbnzSkOzkT7RwUBPFn5o2jf/o1bS6Xd4GXhN/0XZO6w=;
 b=Iq2pItOkxqUbcxImtrNNsXaT82Mz98lTvvcTiJd9alC91Ry2AvccoDNtfkKSix+w6E
 kEbND5Mdpyc+4+yuJhhw+OQwnDI9Mr4UyuIgrhnWUOkJ3tE4be/YFvKvi5kbLlkuO1hC
 GOw3yIhBPPXboy2/VmxN04BPJtDd5syjKC3CQ20nDWSnN1fjAZ4/m7OqKsukRBNVH56U
 HX+qLIB9HVrUFX6jfV1Lkma+khjsce5DlfnIsO8lfe8l3rsdlsftufjL7eIrkc1bZQP4
 Vx6Ilp5vzGrG0qK2vw/80yFfBaiA89BKHJHLRlX10nEFX3HrK/8MyhSclPivDEkbT+vp
 o6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598507; x=1697203307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JbnzSkOzkT7RwUBPFn5o2jf/o1bS6Xd4GXhN/0XZO6w=;
 b=HPOI1DJXxTjf0KznVZuXQL0KBg+BTmukvsv4mzE3EFqdJPkwoIPFZuXBUqH6sJYFhw
 A+M8M4gjn6khQ4lxTdewIat8XskE0IGEtC25/gLd6K1P3hPGpUbFZPJXaPU7KBDjhjnZ
 GgF2n6McIdbAJQoFdziFY1qVh7p9rYxhVEs1nCrVMie9YB/FXtSqT4rl3Atv5sd0PfI3
 dHV9600nWGsk3/KZXSwF0o8Fy58k1gRsy/I+0HDEUzn7CsPinVhojAbJjbiwNfzIYjLs
 NbznlYwFb2GXclyXyEl3eEPd7DFR4S1DTQAs8KeZ3yygHWctngmTAaRcUzwM70wqNwmn
 xapA==
X-Gm-Message-State: AOJu0YyyFRXeEEVtIsWRD0aCvGcc+5BjEMRJgoZju+TuES/D5k8HW4W2
 W6H9kOpEbu1U4BW7p/e4YSSvbA==
X-Google-Smtp-Source: AGHT+IEuWQUsU+YzhNksQebgak8RSI7NuLrQlNJSb/2TFUNbasH9gUN5hpXa+jQIVH6Oq/FifQ9yJg==
X-Received: by 2002:a17:903:184:b0:1c8:8f61:967b with SMTP id
 z4-20020a170903018400b001c88f61967bmr1482760plg.3.1696598507097; 
 Fri, 06 Oct 2023 06:21:47 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170902c1cc00b001c60a548331sm3796669plc.304.2023.10.06.06.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:21:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 02/10] target/riscv/cpu.c: add zihpm extension flag
Date: Fri,  6 Oct 2023 10:21:26 -0300
Message-ID: <20231006132134.1135297-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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

zihpm is the Hardware Performance Counters extension described in
chapter 12 of the unprivileged spec. It describes support for 29
unprivileged performance counters, hpmcounter3-hpmcounter21.

As with zicntr, QEMU already implements zihpm before it was even an
extension. zihpm is also part of the RVA22 profile, so add it to QEMU
to complement the future future profile implementation.

Default it to 'true' since it was always present in the code. Change the
realize() time validation to disable it in case 'icsr' isn't present and
if there's no hardware counters (cpu->cfg.pmu_num is zero).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 4 +++-
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8783a415b1..b3befccf89 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -84,6 +84,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_ihpm),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
@@ -1267,10 +1268,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
 
     /*
-     * Always default true - we'll disable it during
+     * Always default true - we'll disable them during
      * realize() if needed.
      */
     MULTI_EXT_CFG_BOOL("zicntr", ext_icntr, true),
+    MULTI_EXT_CFG_BOOL("zihpm", ext_ihpm, true),
 
     MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
     MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 671b8c7cb8..cf228546da 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -66,6 +66,7 @@ struct RISCVCPUConfig {
     bool ext_icsr;
     bool ext_icbom;
     bool ext_icboz;
+    bool ext_ihpm;
     bool ext_zicond;
     bool ext_zihintntl;
     bool ext_zihintpause;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index df187bc143..731192bafc 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -546,6 +546,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_icntr = false;
     }
 
+    if (cpu->cfg.ext_ihpm && (!cpu->cfg.ext_icsr || cpu->cfg.pmu_num == 0)) {
+        cpu->cfg.ext_ihpm = false;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.41.0


