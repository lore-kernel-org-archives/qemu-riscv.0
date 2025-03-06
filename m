Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C49C28B23
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 06:47:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tq50H-0000ko-Fz; Thu, 06 Mar 2025 01:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1tq50G-0000jy-BW
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 01:46:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1tq50E-0006hz-29
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 01:46:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-223a7065ff8so5912415ad.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Mar 2025 22:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741243600; x=1741848400;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Be/GHZSOLbcX266/6hC+i01oZ+3WzvyKnxve3aa29ec=;
 b=0nJcGlwtnO/IQCFgUa1c+sHD1GE+BiHgyRwnKs4NDfflU5k7HwhmN+/oY7f4sqdUP1
 OO+6vAJZH4oojF3mZwzo71Iut36uTTaxFqbLrFswLJpFF2oDzbEBSjjxYFY0+JF8gvaM
 kPIb0iBS4W57k18iBBCsZ7ZkE5IMIaZ5/wwX7DLhF0A/vpdvHd31qUelh3PilfDW61Xv
 CAXOQTPJq09hJ4RsRocPWsR/a18GHoBQa65wYLP27MU7+O/FeEBa+FU9Nka8F3LuLFsa
 BsHBmSN6r8Nw3ySCg3AgjMLlfBA4Pzkg7rqe6cVKqP9ucV58l4p/nm/83ux+30X4vdEW
 o1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243600; x=1741848400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Be/GHZSOLbcX266/6hC+i01oZ+3WzvyKnxve3aa29ec=;
 b=jtvWLExXaWvaTSwbbvgb/tIpQENyGQcjFKKqux9qAGVBQ0lXCwoy2RcJKCuO+iCxkx
 VQRKBAEI/ccEMx6b3EZogulyZvEQLx4HyjEe0WeaasOsHNCw6+IeSm7ZaSlJLlzKXwcM
 6gKGou/ftqBwa4v5UjC025mYoAZNmdkhPy8e167ankduqVQDpK/gvilPw+yKhDkN+PaV
 Nby6lj6wqFRDoVI5AMBSOTUMbS8vaYGpKf0gcVSpk0xs1uuIjBWXqEuTcsTSY2gda1DH
 QbMmDMk0kq9mh/5GM4rek/B8KkHq/lAowfLGKLeyyW1LYatmtypkek8ngpeJYsa4RMRT
 lcJA==
X-Gm-Message-State: AOJu0YyFcP9GVNP+I5CJ5Ht+Pty1U8NssWtZ1k/+Sqb803EIt4qPuKKW
 nDnCwsdVXEkCg9+QI55yNPUeWDOh1eGkkyaHhwr4gZTeCMEXSpzqO5SI4re4kT1QKjsIOJ1s26h
 0
X-Gm-Gg: ASbGncswrBjB5aPBOuFCP3O4r0eeMcKH/bh6bqo3Jyt/m+nDIwuEYXQ9ZPUiXGWoSxa
 zWF75a3vxRfXJEGTPVa/z85oFaq0dGPnVXg/MB+ZpIwOly7Q4KtYdnduGBio9AFo7SSuGmzlb8O
 nbZhKx7VGzLtRjJg0eYEJPII0FliFDx5m7rvRrpcRsd2wbSP/uNPSHH6ir4YWpGgHCcPN+/MZkB
 Yvz0exXQGBO58ANmFOT8gKfHMKsiOiM4m8K1x94r2glXt6lfBnMtuN8ECbCrBPakXp3sbBW32vH
 H+Mdh6piObJI54axeLU06n4y3r8mgcnRNC8y0bfNsitfE1L1DgCgIOw=
X-Google-Smtp-Source: AGHT+IG8dDeseyVbj2bax72SCNmsI2gXQCC4mc2IixV9ZlxknM5FQAaSSYaZYVT99TVEsPX3Jtoqqw==
X-Received: by 2002:a17:902:e750:b0:216:4064:53ad with SMTP id
 d9443c01a7336-223f1d45cfamr108163425ad.48.1741243600279; 
 Wed, 05 Mar 2025 22:46:40 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a80edfsm4828185ad.150.2025.03.05.22.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:46:39 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>,
 Adam Zabrocki <azabrocki@nvidia.com>
Subject: [PATCH v2 1/2] target/riscv: fix access permission checks for CSR_SSP
Date: Wed,  5 Mar 2025 22:46:35 -0800
Message-Id: <20250306064636.452396-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x633.google.com
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

Commit:8205bc1 ("target/riscv: introduce ssp and enabling controls for
zicfiss") introduced CSR_SSP but it mis-interpreted the spec on access
to CSR_SSP in M-mode. Gated to CSR_SSP is not gated via `xSSE`. But
rather rules clearly specified in section "22.2.1. Shadow Stack Pointer
(ssp) CSR access contr" in the priv spec.

Fixes: 8205bc127a83 ("target/riscv: introduce ssp and enabling controls
for zicfiss". Thanks to Adam Zabrocki for bringing this to attention.

Reported-by: Adam Zabrocki <azabrocki@nvidia.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index afb7544f07..75c661d2a1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -191,6 +191,11 @@ static RISCVException cfi_ss(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* If ext implemented, M-mode always have access to SSP CSR */
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
     /* if bcfi not active for current env, access to csr is illegal */
     if (!cpu_get_bcfien(env)) {
 #if !defined(CONFIG_USER_ONLY)
-- 
2.34.1


