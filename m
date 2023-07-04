Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4D6EB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 08:41:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGbb7-0001Ni-Q6; Tue, 04 Jul 2023 04:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qGbb7-0001NO-2u
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 04:41:21 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qGbb5-00005I-CM
 for qemu-riscv@nongnu.org; Tue, 04 Jul 2023 04:41:20 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-55bc29a909dso197425a12.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Jul 2023 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688460077; x=1691052077;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AzQwHilUs2+h3+nromIKPNidcbjRoSUxGEzJrfFiXVs=;
 b=nvdvkLUPu846NvnSzc+PJTp/iGaWY26e9RylmM2pk7nva+bx3C0CM9SeSN3dKbnaHR
 3/CMqXfajDDgirhjr+tv8KD9HJCfYKrhpdVf0fumRMTD3gMmxrtOQsuQfkAGBPRb4E9s
 pvToVH5GL/xuOMHbycKfAemifFLxWPPuBIm80JNn9WA90wjLITJglISduV/MNGa51peN
 h+YQLPYPHP4ka5uqz4+m1KJ6usOzAUZkslR6mO1aaujpb0LWmHvfz3NItQToBwDGzmY3
 aFQgpEMZh2gk7XrVOgSR3ArKlK9EtdzYC0bdsylquA0IyHyiERJBhAUs4IrpO0CbWyFu
 /T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688460077; x=1691052077;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AzQwHilUs2+h3+nromIKPNidcbjRoSUxGEzJrfFiXVs=;
 b=JeEQ3ejvvoHA/GLGjpZcnzKHEbTtWXwdqH5WQI970QuewzWxK78Dsfi5/gGuhKWW11
 Pz85XruB+yIVHsJ1jQ20aKwbWJC+Qn00LVBLf9jtzEize96G2OXit/dCnd0GPSOaVWhL
 p7DfiqsoQM56hvb84IvT4UMqU15+Bx6Y7m+KzOJpBWXtiCnJGEQY7p2tR8G+GbWTBGi4
 I0kn9TBKcHtH7eL+pbWjcjyaICmCdQxfLTDTnGpdfUbp8CVNF7/VoLbQhzUlLH+mK2VC
 4L0ygdjpLfqqb1UA37oN8aXI/0RzwGnh8aNDFF0thmkOGilTUjq04V4XLeJBiLIC6qrA
 jFug==
X-Gm-Message-State: AC+VfDzAcUu3RRSvBig8Ir+zHR9lYQ3NcnrZW9LN3MdRjgnAwqCxxxT1
 c7AhHdTJG4ouvkKG22WtHWyGww==
X-Google-Smtp-Source: ACHHUZ59u0NA2vfQbDTqTWiGhs2RRDG1P0Npmnmqs1+xE1URZGAdm5RlX3YFj1KJQw/nE7C3HpRf2g==
X-Received: by 2002:a05:6a20:3212:b0:12c:763b:f098 with SMTP id
 hl18-20020a056a20321200b0012c763bf098mr8898296pzc.11.1688460077504; 
 Tue, 04 Jul 2023 01:41:17 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ab8100b001b80b428d4bsm13870188plr.67.2023.07.04.01.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 01:41:16 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] target/riscv: Add Zihintntl extension ISA string to DTS
Date: Tue,  4 Jul 2023 08:40:10 +0000
Message-Id: <20230704084013.21749-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=jason.chien@sifive.com; helo=mail-pg1-x52a.google.com
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

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 881bddf393..6fd21466a4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -81,6 +81,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
@@ -1598,6 +1599,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c4a627d335..c7da2facef 100644
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


