Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24213C27C4F
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 23:59:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMcWP-0007qd-82; Wed, 26 Jun 2024 19:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sMcWK-0007nI-W7
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 19:57:49 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sMcWJ-0005Xq-9i
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 19:57:48 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-71884eda768so3646856a12.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2024 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719446266; x=1720051066;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WsjwmkKnlLSq/GJgOTR86moFb+I/3C1xyyIh/oZffps=;
 b=0bTmu71FcVJBlFbFXXdyFr0/PM4zlxzHKtP4k77ZG1s5m8DwoYha5KLM7gZ7BxxSwU
 zozmXPuzES7r2kofxKGO5NewToYKWjl5P/ZpzOBDGIMgki3o2TjQUyNbEw0HTyIQ741R
 y+F6/Ap6Lu/FteaW3g4bDGo5VGv9AGBK8q9CdiM6HCWB2QlCQHhcf3HKUJK3nz9XMjRB
 2V1F1XjDddsNYBI96i0A8JoHxiOl54bNjSrARkp31vXx3kd8d3yUKp2DOai2Kl5O4dYw
 E8JVQLRhenmVPy6QuW6bnxkMoXrALB9lnZU6pwUpdWY6RWgeB/RZGWw4kueKmEzXx+Li
 mwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719446266; x=1720051066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsjwmkKnlLSq/GJgOTR86moFb+I/3C1xyyIh/oZffps=;
 b=kOK1ftgxKyAFuafMwIwHm0Sn83Hy5MW8VcKEjmXlSrWBgsoZqpKpBacx6ldJZH0UN8
 DfUwPNJNnojU2sDkv2NKTcq2mG9nsELlnmJVCHfywn4qJ96NebwBqDyImgSYkM96Sh0M
 oHlZtYNShEyJx54r/YJiragpIW7jvgb3Y8+8rgFrdE+eVyU0m9BkyWTPX+JP5KTWvdRO
 v8C2ZnT8NS+B+81hwL72kEaxq8JX5d/M8UqnucL/skE2Lh/RSdO81xOArk3u60fJ5Vfp
 GIfHUM2XXrP7DCjADSl5aAEgkgAcl3NeUjZnAmst9bzi/V4vLGbbnDIgcs/8mMbKfNs6
 kbpQ==
X-Gm-Message-State: AOJu0YxxClG58eXJsNIV8B+VktQlJloSOzliREGTClIG1ntywgr1iY6Q
 MBIeX4PAUXP+/Hr7UYIIdmoECTWNXhEC2oNmrLfDPa/BLLsPE+jG5fzgfr1nQkk=
X-Google-Smtp-Source: AGHT+IHurjPf1NI+J9uvgCxuFXA100/cWQaaewfkhz9NvRYDi+IxTvWp98DwyzYg/nGGJv48GcY0yQ==
X-Received: by 2002:a05:6a20:7a97:b0:1bd:22b6:121d with SMTP id
 adf61e73a8af0-1bd22b61306mr5671931637.52.1719446265845; 
 Wed, 26 Jun 2024 16:57:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac998398sm630965ad.225.2024.06.26.16.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:57:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 16:57:28 -0700
Subject: [PATCH v7 08/11] target/riscv: Enforce WARL behavior for
 scounteren/hcounteren
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-smcntrpmf_v7-v7-8-bb0f10af7fa9@rivosinc.com>
References: <20240626-smcntrpmf_v7-v7-0-bb0f10af7fa9@rivosinc.com>
In-Reply-To: <20240626-smcntrpmf_v7-v7-0-bb0f10af7fa9@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, palmer@dabbelt.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

scounteren/hcountern are also WARL registers similar to mcountern.
Only set the bits for the available counters during the write to
preserve the WARL behavior.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e4adfa324efe..6c1a884eec82 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2994,7 +2994,11 @@ static RISCVException read_scounteren(CPURISCVState *env, int csrno,
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
 
@@ -3653,7 +3657,11 @@ static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
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


