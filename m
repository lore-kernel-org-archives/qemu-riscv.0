Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584DAEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 05:48:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJ6Dr-0003Bv-Qf; Tue, 11 Jul 2023 01:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ6Dl-0003BP-Ri
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 01:47:34 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ6Di-0007nC-Gt
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 01:47:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-557790487feso3828129a12.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689054448; x=1691646448;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/77eFVto5A887RQXZN2BqRW+JvaFiGxADJ7e3quoS8=;
 b=Egc6FhvDTT/qNcs/rH40bo+jpQHO7hcvs+EUxTyDNXHSGsFeaoo2dZUn7IMUuESxvA
 nfLAp6/9Y4HW5BJQ+okVGwRkQwwD014RdCWuiqPBYZmrzOd5IX0lAhd7H6Q4mH5ZHbi4
 tH1JHSmcguzW+yxVP5OJLDyqOd6golAUZbmvNXC/NdjaLQAvX2ZrRDgGISOxbZ1lokxK
 7DzSXMN/fpb80J+dE3f1Po7SouVH3dBvckXHLKRGZh9W+Q4s6XSj3GYWKT1jS1t7Hqnt
 1Mz+wfQzHwtq+wqMFlVKhIZSUfZ1cZsNu+lxEeW85FXSYm9zdNuM089OfmbKsAJKM7oB
 NerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689054448; x=1691646448;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/77eFVto5A887RQXZN2BqRW+JvaFiGxADJ7e3quoS8=;
 b=fOds0ACW180HGupE+hKm8/yOfOHO5OdoRh8c574xfEG+oqzFCi59BNRkL3R+kZv5jF
 9LRTZS4w531V8E6UdzSYQtcUgNf3SaXy+JD3LOA3wqAxXoOQ0rX8C0kTS0OWIYJ4INLQ
 ma3b17MQLQwL1wPdRN9brpBNBKdMGlABIbiG4N/UrUtdEmnmeuqCBDBH0sUtwBSx9pub
 sBfPTT72zs4Ite8BqF5qQClGhcQJpp6bQ/tWNdXsXMPPPjvsL+awax+pOI1LWNw8wr/4
 siGwSERtoYYTVrWef/llxp54DJKblLkYoDgnqx6IYNK7O8ocncuFqbQnw/j4cwTutcbp
 Mv2Q==
X-Gm-Message-State: ABy/qLZDgRtvbv/OgBM2dMz8xzknF4UIrZ7xLSDB31Xz93QaRwRN4VmE
 XgPPZn/x4gVPOpvD6pzSq2ap+Q==
X-Google-Smtp-Source: APBJJlE5jodRFgaSe7A1LHCNalNiMTmdzvHXlgPiKmq1uwreVeNZRBJ/zu4eVuo1T43Ax2VwgPd7ZA==
X-Received: by 2002:a05:6a21:32a2:b0:130:d234:c914 with SMTP id
 yt34-20020a056a2132a200b00130d234c914mr14134883pzb.26.1689054448348; 
 Mon, 10 Jul 2023 22:47:28 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a62bd02000000b00679a4b56e41sm784346pff.43.2023.07.10.22.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 22:47:27 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2] target/riscv: Add Zihintntl extension ISA string to DTS
Date: Tue, 11 Jul 2023 05:47:20 +0000
Message-Id: <20230711054722.15721-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=jason.chien@sifive.com; helo=mail-pg1-x52c.google.com
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


