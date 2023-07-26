Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28621C0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 07:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOZ8z-0000VK-Rw; Wed, 26 Jul 2023 03:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qOZ8y-0000UY-CK
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 03:41:12 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qOZ8w-0000RV-3Y
 for qemu-riscv@nongnu.org; Wed, 26 Jul 2023 03:41:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-666e916b880so3810845b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Jul 2023 00:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1690357268; x=1690962068;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4MqX/feLzp+2HvebB53AzArXNcPF6tcsM37ccg0JoqU=;
 b=QxGdWVhsqtIZRlopB5nd2Bd+5spq2DRv6PiycjPPV0HKwbj38QgrP4r+dOnVG4sAWv
 gOUdFmT8//2kqTHo2/GqzuWP6yAeFFEBjkLJoWTx5h3RbR9jHogpZusOLJUkMEhQFVlQ
 7al5b0FBtrStHjeAkPw5SYV+kHuQr7oZhSyba7Sq02TF1n5bHyv2rNoe/N3xyXEeuO3V
 AmTjI4iJIObkGwd30llqcvQHS/1vU4P+hTUxqoutdhY4LMi6j5mTnnTU3pXQi9idAoEO
 Iqju+p+pmfbaMA9VVdlvK62p+Hee7sQtgy22gNIzpyYxFLOdChVE5um4HqrRxCY06Qxu
 QGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690357268; x=1690962068;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MqX/feLzp+2HvebB53AzArXNcPF6tcsM37ccg0JoqU=;
 b=e39jlHeFfFM9kTYU3WZXdN2ZbAXwS90A3KyO84qrQSrlU3k1G4FQUHqfABUwJ/A0z7
 nyaHFFZrB3ql4EVpreZ0DqaKMlAxf0i7N5vDSS0aRepmrtTOyZwpOw1tZDukDzbPPZZD
 5yBv5V6YGq65fmqspPiKNEVLcAB5+UH30JM5e4zPvTCF/1ufvN8gmooNjFR2rlDsHCBt
 /J6QahApRgc6abvLTxCBmvjV+fVhcXgv0MA2im3J9MN+0WVFA3bC8Z46MI4p+rAcnN0X
 lxNogJC81M4VcO9rn/LugPKGQxsuIfK1dFS/ST44WXs59tMUMAzMYCLBxpeLFdZKeQzg
 4kDw==
X-Gm-Message-State: ABy/qLYLjbHBdQ8XlqbYDqNLxw6NA1P1qkmDdkxzlAUllCOeltvCwIG7
 v7p5J2huQknuQVIhc1LmW8mXBA==
X-Google-Smtp-Source: APBJJlFr3iO4n7IAvAGj3jEis+BUQU1k7U1SlNXM0i7T0Cqs6ny5QXt48PWEePGl+ngVH02vqTkygg==
X-Received: by 2002:a05:6a00:198d:b0:657:f26e:b01a with SMTP id
 d13-20020a056a00198d00b00657f26eb01amr1256137pfl.26.1690357268336; 
 Wed, 26 Jul 2023 00:41:08 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa78752000000b00686c40ccaf2sm756523pfo.9.2023.07.26.00.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:41:07 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RESEND PATCH v3 1/1] target/riscv: Add Zihintntl extension ISA
 string to DTS
Date: Wed, 26 Jul 2023 07:40:46 +0000
Message-Id: <20230726074049.19505-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230726074049.19505-1-jason.chien@sifive.com>
References: <20230726074049.19505-1-jason.chien@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x42a.google.com
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

RVA23 Profiles states:
The RVA23 profiles are intended to be used for 64-bit application
processors that will run rich OS stacks from standard binary OS
distributions and with a substantial number of third-party binary user
applications that will be supported over a considerable length of time
in the field.

The chapter 4 of the unprivileged spec introduces the Zihintntl extension
and Zihintntl is a mandatory extension presented in RVA23 Profiles, whose
purpose is to enable application and operating system portability across
different implementations. Thus the DTS should contain the Zihintntl ISA
string in order to pass to software.

The unprivileged spec states:
Like any HINTs, these instructions may be freely ignored. Hence, although
they are described in terms of cache-based memory hierarchies, they do not
mandate the provision of caches.

These instructions are encoded with non-used opcode, e.g. ADD x0, x0, x2,
which QEMU already supports, and QEMU does not emulate cache. Therefore
these instructions can be considered as a no-op, and we only need to add
a new property for the Zihintntl extension.

Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 921c19e6cd..a49e934b41 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -87,6 +87,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
@@ -1763,6 +1764,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 2bd9510ba3..518686eaa3 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -66,6 +66,7 @@ struct RISCVCPUConfig {
     bool ext_icbom;
     bool ext_icboz;
     bool ext_zicond;
+    bool ext_zihintntl;
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
-- 
2.17.1


