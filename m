Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C3EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 07:04:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJ7Q0-0008Uy-6v; Tue, 11 Jul 2023 03:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ7Py-0008Uj-Tl
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 03:04:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ7Px-0002xG-Dr
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 03:04:14 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2640a8ceefdso3911947a91.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689059052; x=1691651052;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K1JAZVR+gGNhkdosrtc0SmyfpPXPE5kNM3tUmy+gKuk=;
 b=AVhMNx6lbLgRR1VbINb4Ja6Of4R+3MJMxllKcBnOee9v+lzzER/gtG35Knrr7lzBwm
 e+yYVNTEFzslJKzKNMWy1pBLlGKiBQ5ktNxoesW7PK7au0Y296opPzxsOg6DqEut6ezT
 qzxu2DKXjipv22jGHJGG8N/dCX6KlfA37A+/Fqjk8p5jSCsEuct/u+aTOp4fxR/20gqt
 Tu1hvpDl5h2VGsAQ/AgQ1BkqVypzwF/ItQibXTJW7fPbU8/GWMqGiTa7ImtHUlrewJfL
 szMDMVz8VhVwfB2NAUKqjXKCjGl2hztFvoP9LC6gu/m1NPBIkkYVvhM22LipbSDvHyda
 qm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689059052; x=1691651052;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K1JAZVR+gGNhkdosrtc0SmyfpPXPE5kNM3tUmy+gKuk=;
 b=ajwNVCy9+GvOvtlipmXR+IduFmAUBoklFd8/K5wSfPFgS/SHa7jMpWTrCNmI1Yd5aF
 LckvElL9b/MKGv35jXnkbVqCAGkIRDFLoBAcf8xOE55dtCOjQxMaUzZFaZn1DYMOUaA7
 zlT+ZZoMeH76aoUPa6EdNNswVTlIePTbLsmWcUQSlXmg9boqhGgqnliB/NBvBnexghAp
 WmPPMxBsV7UVfi1VMR9QJcswTU2vi7sd2XsZ1RYdk5BonKhTSTtb0tBOtrvcz4gM6tFQ
 CWFzJaPcvt+XBwkUzPpWaAjm5iPZvSUbncwAJ4Hs7F3N2PJDm4jN12WA+EjEZ3vmHV9t
 tzfw==
X-Gm-Message-State: ABy/qLbddkUhczHtCedsE1uy7vzaYg7Uf/BgHo4p4EfOOuZfUmxKaeOW
 JJc1jhx3luXa7DOrv45m74zIUQ==
X-Google-Smtp-Source: APBJJlFzBhJGxOU5/jiBdUZ9zwaXDa82Qc/U4OZwxPIwAy6i//JQya0PoOzoraapW7ivUqtATCUcGA==
X-Received: by 2002:a17:90b:ec5:b0:263:f896:2165 with SMTP id
 gz5-20020a17090b0ec500b00263f8962165mr14869879pjb.46.1689059051786; 
 Tue, 11 Jul 2023 00:04:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170902d35500b001b9dab0397bsm1078724plk.29.2023.07.11.00.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 00:04:11 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>
Subject: [PATCH v3 1/1] target/riscv: Add Zihintntl extension ISA string to DTS
Date: Tue, 11 Jul 2023 07:03:57 +0000
Message-Id: <20230711070402.5846-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230711070402.5846-1-jason.chien@sifive.com>
References: <20230711070402.5846-1-jason.chien@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x102c.google.com
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

These instructions are encoded with used opcode, e.g. ADD x0, x0, x2, which
QEMU already supports, and QEMU does not emulate cache. Therefore these
instructions can be considered as a no-op, and we only need to add a new
property for the Zihintntl extension.

Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9339c0241d..b7e99cccd9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -87,6 +87,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
@@ -1755,6 +1756,7 @@ static Property riscv_cpu_extensions[] = {
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


