Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFBC5B549
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:44:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMs9l-0005e2-NF; Wed, 04 Jun 2025 13:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs9T-0005WE-5a
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:43:49 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs9R-0004B9-3R
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:43:46 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-745fe311741so261336b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749059023; x=1749663823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGdzMHaC98xoNo4pnLALcBmJMoP7ii68m6A0DOqBTrI=;
 b=Afvw9W1HybDqxc1m/ZvXUPQc8v4203y+dtL+G2KMtDDhCNGDoti6G7uAk58asjkgVY
 vojV62L6NvlTTbXJ6VDLg4CydCegDQJam4tyuRTXECOIUh+dGr28Qp5m4Of1MbCBVeOu
 Crb+GgNzdTIfil+WvGnnpyVSRzNKeMRtDuQe2l7PRSZa0iet4FSSLirQRj68DxhsUWHn
 30btKOtdJR81qpIjJqHh0gqNkaW+y1I8ZqJBMfEXkV+uI0jy7KYRfgcEAlKd5/bPrwRs
 6IMIn0IDMEQmuc4MkA6h3FdV+ZGEn1LEJEg2hPh7ZqN0uw3mx8YZujj40fZpqG+P9Vus
 FPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749059023; x=1749663823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGdzMHaC98xoNo4pnLALcBmJMoP7ii68m6A0DOqBTrI=;
 b=CCDypIzd1UNrGXP2Vl8sTlikn32uoRmi0s6TW+elwlddBqNFApMuuQHiv27SpXalOT
 R2ceT3SDMPmRB2CIa7/Bz5npLc5r078kxYkK+NWTbYPg66w/+PB4SiEDScwDxTdAiLkF
 Uy0cPwUXUZUGCR+oTaUvepuqceona78ZqgocmClTSH38ZZDBP6EbCJ1D/JHqJIJ4fjKc
 Qb1S0JpDUYR4V3lxOVkuqDBIgTIh5fUEWoDdwdf9PV6H2k4HikmD7KxRjDlZOp90LfqI
 IPHSbSFQiQux2/YclPstRrXupzPBnvx1/VUGa4amYyp4jh2tmSreb9lsTHBhPeK6bXFJ
 swXQ==
X-Gm-Message-State: AOJu0YwzMn5M83iu4O4NTDYhDHgJmMi7Op/nhori8c7Steih2tH+D4r2
 SG03Ex/qFYRobA62HfqZBbjj/a1x/smC0W+9E/kco5Zj5vVy8IHgc/61xVynQxT3pPo=
X-Gm-Gg: ASbGncuVE7XXrmfUDdb/UT2PNiwItng4KDl7hANOMZt2nKfidcwZOxypDmMC0nnQ+6i
 GbVN55V2mDVt53vkgEvDuFi75UZ+QOjjJNt65YbM/nbLNflhbuTUk6jSbRx3l89dBgFyRlMlbMD
 DOuMWoNi1hbA0ZoEVTzCPjCiORVhh3JMHBfGfWewBYMStWuM+Q8XW8HcR02YCs5+siOab0eT2UF
 PJZZvpC6W9bWuIQ0ZO5ZEFtdpwHmhNqknWM6jbFvT4RbfMccezTngW0VctHkk8lAQYv38H0izEY
 Ea9HzD6i9CWwsj9UV8EEH8HTKs0XfTz2dAKPI8Y27NBP+aiwUo1dTwnkjn2OpEqPQUa3JceL3xb
 Er1bR6OdrR9QXeCg=
X-Google-Smtp-Source: AGHT+IFfEU8EKrgbpk+RUEcqmlGFxpsm0YfTaKoMu8MBZU9SneeNTEvTgmX/gH+lRoekFGTiCV5NRw==
X-Received: by 2002:a05:6a00:b93:b0:73e:30dc:bb9b with SMTP id
 d2e1a72fcca58-7480b1e4e07mr5164684b3a.2.1749059022792; 
 Wed, 04 Jun 2025 10:43:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab109sm11418482b3a.40.2025.06.04.10.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:43:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v2 1/3] target/riscv/cpu.c: add 'sdtrig' in riscv,isa
Date: Wed,  4 Jun 2025 14:43:27 -0300
Message-ID: <20250604174329.1147549-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604174329.1147549-1-dbarboza@ventanamicro.com>
References: <20250604174329.1147549-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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

We have support for sdtrig for awhile but we are not advertising it. It
is enabled by default via the 'debug' flag. Use the same flag to also
advertise sdtrig.

Add an exception in disable_priv_spec_isa_exts() to avoid spamming
warnings for 'sdtrig' for vendor CPUs like sifive_u.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c                |   1 +
 target/riscv/tcg/tcg-cpu.c        |   9 +++++++++
 tests/data/acpi/riscv64/virt/RHCT | Bin 400 -> 406 bytes
 3 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ee3ee0e883..eeb44a2f1e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -189,6 +189,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, debug),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sha, PRIV_VERSION_1_12_0, ext_sha),
     ISA_EXT_DATA_ENTRY(shgatpa, PRIV_VERSION_1_12_0, has_priv_1_12),
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 81174de409..7fbfc26adf 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -451,6 +451,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
                 continue;
             }
 
+            /*
+             * cpu.debug = true is marked as 'sdtrig', priv spec 1.12.
+             * Skip this warning dince existing CPUs with older priv
+             * specd and debug = true will be impacted.
+             */
+            if (!strcmp(edata->name, "sdtrig")) {
+                continue;
+            }
+
             isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
 
             /*
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 13c8025b868051485be5ba62974a22971a07bc6a..156607dec45b0e63e5b3ebed62e81076dacd80d0 100644
GIT binary patch
delta 49
zcmbQhJdK$v$iq2g8Y2S(<Ex2W2COEGj0`#x?N_s=loVyAPkd23IgL??BZrZJp^TA%
F0RTq!4730M

delta 43
zcmbQnJb{@j$iq2g0wV(h<JXB?2CRCFj0~z1?N?9ySUowLQJEu+k%6Irk%0jK_Q(p3

-- 
2.49.0


