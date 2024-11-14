Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F97D65C61
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 09:16:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBVvy-0000Dj-5w; Thu, 14 Nov 2024 04:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tBVvK-0008KQ-FM
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 04:13:58 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tBVvG-0007hq-Ge
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 04:13:57 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53da3545908so358654e87.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 01:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731575631; x=1732180431;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5VCSEROfFnSITFRhmQ5Rm5Z+/eZKzb7VObh38bI74M=;
 b=3C6HlX6w7ygZCpKvl1Q+a+cusabPmMNdqkmR2VOngn0d3QW4oMQt3uht8J1ncVspoo
 h4oe0nwXSCfr3NC7Q0bhe8pE3/Kh1RiIDBLAR9VtW0KuOvOp6gjly/jNPE/sWukyn3Y8
 b7CGIsoQFWbT7TvKhfiDdIWGvEPsLT+DW8VBbIcdeprDCjxA+Xgkl6F6lkiJ5GoRY8NH
 /0vNwHN2EDt0NOaxM3iID30t3nsfnzFT7je9ox9ddUZI5Pm1SOYxn6UYvSLLcJP8AINR
 g867SwD6UGqK4ullj0qkDhU5VPv36j6o4JpSrJjj0nvOTSFBmnEfTZmMPgnE0EDf876U
 kZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731575631; x=1732180431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e5VCSEROfFnSITFRhmQ5Rm5Z+/eZKzb7VObh38bI74M=;
 b=OOOpFWqfygjqZa3UZEsz7tFHwbODJYS+m6j6GVEnW2HKfb+hsTPQdLpt/MuX6LeuPP
 JPifyCJ96zgvZMLeudIiyesx4h7hpvu6tRtS08Y3jxYOvsC1MZZaug9Fu67zX9bbkMkV
 E3CDd8puTI+4cdCyTGxrUT1e57WJ6kNTW9t3kHEzwdwCfM3Uiip7eVp7nEzI+By2+0qJ
 NSzlSc+wOwiZM5y7ppVmr/hklVyf5djjjX/z3tK6al6fSt1LQqeaFq1KMb507eE1Kx21
 yFd5T/rVWPFChpHcVJoD6kw0ugPVitzLo9+SMGXEJ9oBnSPlBt3BXj6s6Mp7KAlLtoJw
 5iDA==
X-Gm-Message-State: AOJu0YxRqhhCOym+veWUTviYt+QSM3Lal02BOaQmPgE+p22io3NFOiiJ
 /dL7EAhKzZUwRN9KJjSwueRECPyyELF7HdAxf126CbqQFpMfMt9w9GTuj7ZWOMJnPLdXNnaTNaI
 U
X-Google-Smtp-Source: AGHT+IF1OJfD8iGL+A6cQediE5Vks/yi+m1EhKBEvVOF7+doo9vYEKH0yxEhEaiQo1UrKP7M6X97Qg==
X-Received: by 2002:a05:6512:3e02:b0:539:8fcd:510 with SMTP id
 2adb3069b0e04-53da5c44f67mr632759e87.20.1731575631322; 
 Thu, 14 Nov 2024 01:13:51 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae313e3sm899050f8f.94.2024.11.14.01.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:13:50 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 7/9] target/riscv: Implement Smdbltrp sret,
 mret and mnret behavior
Date: Thu, 14 Nov 2024 10:13:28 +0100
Message-ID: <20241114091332.108811-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114091332.108811-1-cleger@rivosinc.com>
References: <20241114091332.108811-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=cleger@rivosinc.com; helo=mail-lf1-x12c.google.com
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

When the Ssdbltrp extension is enabled, SSTATUS.MDT field is cleared
when executing sret if executed in M-mode. When executing mret/mnret,
SSTATUS.MDT is cleared.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index dabc74de39..e5e10f7162 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -299,6 +299,9 @@ target_ulong helper_sret(CPURISCVState *env)
         }
         mstatus = set_field(mstatus, MSTATUS_SDT, 0);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp && env->priv >= PRV_M) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if (env->priv_ver >= PRIV_VERSION_1_12_0) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -375,6 +378,9 @@ target_ulong helper_mret(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
         mstatus = ssdbltrp_mxret(env, mstatus, prev_priv, prev_virt);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -412,6 +418,12 @@ target_ulong helper_mnret(CPURISCVState *env)
         env->mstatus = ssdbltrp_mxret(env, env->mstatus, prev_priv, prev_virt);
     }
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        if (prev_priv < PRV_M) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MDT, 0);
+        }
+    }
+
     if (riscv_has_ext(env, RVH) && prev_virt) {
         riscv_cpu_swap_hypervisor_regs(env);
     }
-- 
2.45.2


