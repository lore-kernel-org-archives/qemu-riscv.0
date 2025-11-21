Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9AACFA46E
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 05:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vMJK9-0006HG-W1; Fri, 21 Nov 2025 00:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJw-00067v-Jm
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:33 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJu-0006o9-A1
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-29555b384acso19792875ad.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 21:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763701467; x=1764306267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JY7v5PFUTvqG5xjU8tx4kJ2bLxHjuCr4rVrZ2t+pKeU=;
 b=iQDVq+ils4rLp0h6PE8du57BQA9Z7NdW4bbQyBNpXaDDD5bdmSUmhw5YVp8bFLawJY
 ZXC7Vg6UZ9EsvNWAwPjsW+oB2wschCdFM36S0KfiBVd3K4L+Kc+Z40f1RuK8r1n5WsTf
 MVVUyiAPMzKLZ06r4vX2QLwxob6fV3KDScl7SrNTocHJ8oeDAikK2uCATHSyObkzFEk4
 8NLDg7Xut+01X6lqxdjdfunvfV+K2Z9pnZkfjFoqT2OXeTRwZFTISEutqThQGxUxvRAr
 If82f1oSuF1YFUiIyF+PI/5kSmeFLLnrV2aNZMDjpNB15bFmKkVVnkXlkdVmr5CTQKD1
 YlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763701467; x=1764306267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JY7v5PFUTvqG5xjU8tx4kJ2bLxHjuCr4rVrZ2t+pKeU=;
 b=TxJutvj0O8Y5pNdpqXjn1IyhQQVE4kJ1o/e6fHyv2m995Tm4etA61XV0FK6pkojfyd
 yJEGQvCAQ5Jh8s+hefapXSM8/HdUpfvVGSKeW3Ko9AAWYubFnr9EwbdWwNS/ADfn+AA9
 UP2cm/045QYKEyskPM6cVqhFrPg2jio2CwBUw2qTL/Cl2lt2ewCO9tUiqBOvNWmQ+mhN
 i8B9fVXIK7qdnuKDt48pONqvkjO+D/94ASUD1PhHr6h5monBAxV9V5Cjt7DqQI8yoLuP
 KRNPfa6hQnbJEgqVcu+JmL8+DiTJc9oa/rXZ/xxWlmS6BrF/fYw9oprxQkhS+JN8fH6s
 12RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxtumDS22VmpuHwMd8MiG9nFVehSgoW3nY0klnPJl0FsJsX41oi5KJgNginicc/lXUJwdtC/WTf9u9@nongnu.org
X-Gm-Message-State: AOJu0Yz9Ybegz2Zi4gqHHH+QXYxf1W1KaFmcQqHNcd5rEBTp0Ec2pJ2w
 gTLJ/+nS+IPtCBl9MKhAE+SA5S7ZefR8Cbt8x0W1A+8glLrySsS49VrR+H5/Md6XQXQ=
X-Gm-Gg: ASbGncsYKQmTm7pObG4VVcnDomOowYqFlviWQfBMfDk9Dygg9bgcZZhuAcvLKihk9n8
 M0D1Ax53qK3BFaEY1sh9npK5kVyUfiMThsnoky8orWaTGp76HgA8b/4lNSy5I8SBdNtex0M2f/E
 UN+l5vUPLWyoCQ/Q4UDBOVmVez8NtsYkFxBf9IFEGA1gzZR4HfnhwWxyUzbZnhnh/Jxs3CRPzg8
 prwEsZFrIJSpdWISRJWQ3pfgezMghYMy23IVWn2jmHPmrFSnr/3JDHof5od6iqP2r2r2Zyhykxp
 k/T3XiVK34RkBGzxFMAxvOZ8x6+YecgBikQ72OAkOc1gW2GON1VaRCM6jy973G1Xioo+P8XTaNL
 T5ymzb7trPcD2qzK6atH9MRJAZJ+BfkZerPt+OelQSBw7y5aJonO+z4DOH63/lsbPiF3ygXhvEh
 yutTOsQuhUb917E4YbODFxzCGNZfVhLP9sAea7gA==
X-Google-Smtp-Source: AGHT+IGDQsx3GUn9fEEQjlCOT+4TGxmxEVZX+br837s4osQ4OwsxBH3JauGV/XGQuAw43so8gGJwCQ==
X-Received: by 2002:a17:902:ce88:b0:295:5132:1a99 with SMTP id
 d9443c01a7336-29b6c68be3emr15581185ad.44.1763701467333; 
 Thu, 20 Nov 2025 21:04:27 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b26fed2sm43384525ad.69.2025.11.20.21.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 21:04:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 4/6] target/riscv: Fix pointer masking for virtual-machine
 load/store insns
Date: Fri, 21 Nov 2025 13:04:11 +0800
Message-ID: <20251121050413.3718427-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121050413.3718427-1-frank.chang@sifive.com>
References: <20251121050413.3718427-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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

From: Frank Chang <frank.chang@sifive.com>

The effective privilege of explicit memory accesses made by
virtual-machine load/store instructions (HLV.* and HSV.*) is controlled
by hstatus.SPVP. mstatus.MPRV does not affect these virtual-machine
load/store instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_helper.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index acfc6c10607..bf747834dcc 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -261,16 +261,25 @@ RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
 RISCVPmPmm riscv_pm_get_virt_pmm(CPURISCVState *env)
 {
 #ifndef CONFIG_USER_ONLY
-    int priv_mode = cpu_address_mode(env);
+    int priv_mode;
 
-    if (priv_mode == PRV_U) {
-        return get_field(env->hstatus, HSTATUS_HUPMM);
-    } else {
-        if (get_field(env->hstatus, HSTATUS_SPVP)) {
-            return get_field(env->henvcfg, HENVCFG_PMM);
-        } else {
-            return get_field(env->senvcfg, SENVCFG_PMM);
-        }
+    if (get_field(env->mstatus, MSTATUS_MXR) ||
+        !riscv_cpu_cfg(env)->ext_ssnpm) {
+        return PMM_FIELD_DISABLED;
+    }
+
+    priv_mode = get_field(env->hstatus, HSTATUS_SPVP);
+
+    switch (priv_mode) {
+    case PRV_S:
+        /* Effective privilege mode: VS */
+        return get_field(env->henvcfg, HENVCFG_PMM);
+    case PRV_U:
+        /* Effective privilege mode: VU */
+        return (env->priv == PRV_U) ? get_field(env->hstatus, HSTATUS_HUPMM) :
+                                      get_field(env->senvcfg, SENVCFG_PMM);
+    default:
+        return PMM_FIELD_DISABLED;
     }
 #else
     return PMM_FIELD_DISABLED;
-- 
2.43.0


