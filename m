Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8519C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 19:29:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1Wfq-0001Oa-0o; Mon, 29 Apr 2024 15:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1s1Wfk-0001Mx-5l
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 15:28:20 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1s1Wff-0007dK-0l
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 15:28:19 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5aa1bf6cb40so3477699eaf.1
 for <qemu-riscv@nongnu.org>; Mon, 29 Apr 2024 12:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714418891; x=1715023691;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bScCJjfgJNg2TLkGQk/MhVa25I0Chcy3m3vUR3If4T8=;
 b=OIMMZfLGo1X+2Ld1yeLmgmQ+vSW6DOxun9h4Rl1X/N/WSRijyLSIFXX7aUQCe32ohN
 qdwZgUOvPO/l/VUOqMNRs3dPqKwXrCU5rEQtf9A8ZBC6aE5VXEE/quv37Ssy0Iw2Ujru
 HmRQSUSR+FvWPc/v6Dv5G8dnUBaSzmYaEBYGji4QZjXbYONjELEGK6Jyo5JbgHjJyS9o
 i5947DZKdDvVEhbmolEmynmIOLgk+pNLF422MP4tb9sbWjZm2md+pTaZwULXF5wI55Qt
 trCNDXE670sBCBVAx9hzhWOxPZTBwt6OkHl3F+ZfAOF6YBBHapFm5g5yWBOiFp4xM98m
 JNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714418891; x=1715023691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bScCJjfgJNg2TLkGQk/MhVa25I0Chcy3m3vUR3If4T8=;
 b=s/igYg9CE37XNjSCEHyxyM9YS8XxS+bAK0CktxnsQzZaTLmbPyafoOwAM33oinB80S
 4STacWH6CR9qVxuuI9Oj/BmmemjaRB7RAXXlYcFdNhV0aNRE85ix9jIn33HLCp18BGyH
 YdasDh2jWmoukfmyQjToZVW8jXrlKl3pGqFBR0/FdIcvABDBgaKGo5buWd/YYEG5njV3
 3VRis1Kb7goFY+WtNAm6kDlRTn/3MfsNiKQHV57uFibzuKfyMU3NWAfH1J4InXAWdKFD
 tYU3rnqGpzP+tEPVNDAlLPvDbZuQBqyzlZF0TrfWT54cHaK7xqaNMks/raTs2pFqCWKM
 RH5A==
X-Gm-Message-State: AOJu0YxIJzi+vVW+Wa1ZRvaUwfa/5iKMDM0k9i2RaftWFP5Cx7VSMAMV
 yntc/W67h8puBk4HKkJkCCjpEQywTYLHn7Z67CRel0EN9XmrxNHN9tYl01NmUfYN3qg8U8/man0
 W
X-Google-Smtp-Source: AGHT+IG7rH0d+G6x7Ex0y/0ob66PpHkXDEgyjSgd8UrJO7F0d1kVuCE/nZWqZAzbbbOlfQeNR/+Jkg==
X-Received: by 2002:a05:6358:3913:b0:18b:9051:3cc with SMTP id
 y19-20020a056358391300b0018b905103ccmr11583644rwd.17.1714418891354; 
 Mon, 29 Apr 2024 12:28:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a63e44d000000b005d8b89bbf20sm19293887pgk.63.2024.04.29.12.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:28:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 29 Apr 2024 12:28:05 -0700
Subject: [PATCH 2/3] target/riscv: Enforce WARL behavior for
 scounteren/hcounteren
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-countinhibit_fix-v1-2-802ec1e99133@rivosinc.com>
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
In-Reply-To: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.13-dev-f0463
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

scounteren/hcountern are also WARL registers similar to mcountern.
Only set the bits for the available counters during the write to
preserve the WARL behavior.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 68ca31aff47d..a01911541d67 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2843,7 +2843,11 @@ static RISCVException read_scounteren(CPURISCVState *env, int csrno,
 static RISCVException write_scounteren(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
-    env->scounteren = val;
+    RISCVCPU *cpu = env_archcpu(env);
+
+    /* WARL register - disable unavailable counters */
+    env->scounteren = val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUNTEREN_TM |
+                             COUNTEREN_IR);
     return RISCV_EXCP_NONE;
 }
 
@@ -3475,7 +3479,11 @@ static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
 static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
-    env->hcounteren = val;
+    RISCVCPU *cpu = env_archcpu(env);
+
+    /* WARL register - disable unavailable counters */
+    env->hcounteren = val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUNTEREN_TM |
+                             COUNTEREN_IR);
     return RISCV_EXCP_NONE;
 }
 

-- 
2.34.1


