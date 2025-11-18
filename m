Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40E9CED603
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 11:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLJRC-0005JL-IM; Tue, 18 Nov 2025 05:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vLJRB-0005Fd-5U
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 05:59:53 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vLJR9-0000BG-ME
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 05:59:52 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so3567231b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763463590; x=1764068390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9Gr7L5oeBq63sdEzD0yI7lWtqief3TcLbZ7sPE4Otw=;
 b=EVlSM+DYjSnWMzmhWUgflImTqSNTI1yut/xDsp+EXL7Q1SxAQxmpeBNmcA/eHeONgd
 8+S/uoWE+CEM41Hunc/06VHABtnIk6jascoqvhe606QmXYRzShrUKwHi4mIfjx7yctjt
 FVzx2sFoU729TjSSxSEW0TB5XtPCMvdXGsJHSBSvsYxMBw8LeyIxsGymYuXN1q53O1K6
 eu6JTHa3eIbY6TCqjjh9Lw9XpTYszANrbOyCEp4H861nBfAtqmQbYEXfC2KxIAnF7zAs
 4TCsjx+eIoY/1o/mHeKNjs0nCS75hiL+m1+nr+ZG/YPiVzCl9E6gN0opo5pRPCp20tvW
 R2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463590; x=1764068390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c9Gr7L5oeBq63sdEzD0yI7lWtqief3TcLbZ7sPE4Otw=;
 b=lrIR1OjU/PUzBoqRaOt3rDC6kxNVXnGktzBFeE5LqtN/P/1m49WG9fhqQXwT0t25TJ
 UItyowIjaaCE7avO7jsXI6Abls1JRWVsglZ1p/RUA39QaEQcH/hUUwOaV4WipL+LGsoU
 PsqEkBJG6yfdPvRZlsBw+KXmN32AM58CK9krbXYo/t6SydjNxlELfKXMb2Hn+c4EWrvy
 TRymJoPbBT6/s3UDhkK2PsGSUQzlJYU5UU/6VhpVPL+OFQ1lwvAUei4kUJjJG/cUEcwv
 RYzaEhQUoFn8YoqqXLZVrKp5Ja6ufkQlsQU6xmGS/aK14fNxS50Hn9BAhNzZ/UO4EMjH
 uwiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMAqG4lSFiPfgmqrABZEcGZSnYvQQnEHsdvIClJjFaDCiUzI0hEf5HdH/2Cysknpc5UsWrci4fjG5i@nongnu.org
X-Gm-Message-State: AOJu0Yx5P6BaJ5U1G9AjbsMZrFpzMVBy3QcVr/jrZ0CLET+TvoPLk1x/
 NredcUISTOZTpo7N2SC+ivll1Oqv4AsxUuzqttiYBO/93SwkzbX1pj1ItngSjvzAXMA=
X-Gm-Gg: ASbGncuBc2GW4d9YMD1nbhckgWvpP8kxU4Tl00+0nvTVSD61/Lero995+mlAaNko3FY
 nOa3cNf+Gl+lNEjsga9LihRLJbhvsqGleNEox3XFFDdPyzLNXMG3PzIkmHHSQn4yCp8Wzb9PiCO
 FR4A+VTQa3LPK5EnkqwZ6iS77T0aL3MsatL6Nu6lagmaj5/f17W8V4BllBGhPftVu2DJeZ39CZ1
 7GOwwaWJz+OMIr8Rzr+d05skx2SxoFhhLcLV+G8ZuoOqNl9OHWUBws4O5yQaUS2l0T3o7+Nkj+M
 HgODaxeAJ6eYc0P1sA1at9TlShtKlupyskK7Uqz1EcEo/GiR3Kwbo5OW+C2buJyvMVMJzqLk9rl
 JuxwAunRrziWsoFGShUTLir5kP/LO5zeF30ts0ICtmz/uOkDQxpNwTdtBSxl6uhzi5Nrn9RmMj5
 Sr8A3kMdL/X0fBLFWf/HhXGKGWYLDBiqS8reMIWuzfza2HVqNo
X-Google-Smtp-Source: AGHT+IEHFoQgddtd7tByF9qHOpNzZTVPQDJJro4H3PEe3qvDwYnPLuRxqAAFAECjo6gcovMpLfd2kA==
X-Received: by 2002:a05:7022:f513:b0:11b:a514:b63e with SMTP id
 a92af1059eb24-11ba514bb4fmr2633008c88.14.1763463590162; 
 Tue, 18 Nov 2025 02:59:50 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a49db4a36asm43989903eec.5.2025.11.18.02.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 02:59:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 3/3] target/riscv: Rename riscv_pm_get_virt_pmm() to
 riscv_pm_get_vm_ldst_pmm()
Date: Tue, 18 Nov 2025 18:59:36 +0800
Message-ID: <20251118105936.2839054-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118105936.2839054-1-frank.chang@sifive.com>
References: <20251118105936.2839054-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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

Rename riscv_pm_get_virt_pmm() to riscv_pm_get_vm_ldst_pmm() to better
reflect its actual usage. This function is used when checking the PMM
configuration for virtual-machine load/store instructions (HLV.* and HSV.*).

No functional change intended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/internals.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8899bf7667a..abc87e64648 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -846,7 +846,7 @@ bool riscv_cpu_is_32bit(RISCVCPU *cpu);
 
 bool riscv_cpu_virt_mem_enabled(CPURISCVState *env);
 RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env);
-RISCVPmPmm riscv_pm_get_virt_pmm(CPURISCVState *env);
+RISCVPmPmm riscv_pm_get_vm_ldst_pmm(CPURISCVState *env);
 uint32_t riscv_pm_get_pmlen(RISCVPmPmm pmm);
 
 RISCVException riscv_csrr(CPURISCVState *env, int csrno,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 112093012b0..40b1e8da471 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -190,7 +190,7 @@ RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
 #endif
 }
 
-RISCVPmPmm riscv_pm_get_virt_pmm(CPURISCVState *env)
+RISCVPmPmm riscv_pm_get_vm_ldst_pmm(CPURISCVState *env)
 {
 #ifndef CONFIG_USER_ONLY
     int priv_mode = cpu_address_mode(env);
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 9b3f01144d2..b17b661e2a8 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -190,7 +190,7 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
 
     /* get pmm field depending on whether addr is */
     if (is_virt_addr) {
-        pmm = riscv_pm_get_virt_pmm(env);
+        pmm = riscv_pm_get_vm_ldst_pmm(env);
     } else {
         pmm = riscv_pm_get_pmm(env);
     }
-- 
2.43.0


