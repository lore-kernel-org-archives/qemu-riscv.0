Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FACCAC5A5
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 07:50:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1KFO-0000up-3a; Wed, 24 Sep 2025 03:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v1KFA-0000rX-9r
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 03:48:52 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v1KF4-0007da-Fw
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 03:48:51 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso5405823b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1758700124; x=1759304924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eb55lICRRwyizrb+ynSF6MmTdD+9/2j2YC45GQfIco0=;
 b=huT9JV1QfeZhIWjl6bqyT8tBWy4bHFacDBuh6mEHZrUQxlC56Th2J0QR2wztsuC3HK
 jm/SaDU4sumzH8HNV2ECk0GRK2kghhkw9+Dy3EAwXBRL2XXRInobP1yFfhOFs+c8k9MW
 kwRDvUgPdDZn0Gc5Dd2EKebVy+B83yBweGIErJ/7LmbMqx6UJrNNfQTlf93UU9FdC2t/
 o9cYRvnnVU/jY/k+McwSaRq22NbsKYOQid5VDrtjuDZmjpYQKdnNAdKEUcwp3tqc3sZv
 OG0ZxYff3wUeSvNSV5qkYGI6jjssz4Dg861VYt+ojLkTtHDuJbUga8UF5tmFndkAidBo
 XEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758700124; x=1759304924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eb55lICRRwyizrb+ynSF6MmTdD+9/2j2YC45GQfIco0=;
 b=pv4Jg2r3vHUhaic7vxpacF0cQ4Sw33IjmL4Dso7Aoj7QypM99ll8njzez80zvMh0es
 CjHS+GgTGBGLO1Uf8McVXrS1cSm74HEJvF6iwe/dmtIJL+FVGRPEFeXwhHvaFJPSYWOg
 Xmbt/mNmwSCVJkRnEZREceWTfPnL0LeELPuULaf10K7iw4TqretgV4WTSDN8bS3SnGQ8
 jTSUVYaDQQf2OPqvXianfERd5s+ocUIJ1jW7wz+vIBm4+onNecn3zPwZZOZMsW/nEHds
 BJCKytOBO22sOywhQVCNzD6UO76k5aW40OBVyxV+6gkJtxGccE853f27aHlNFTHAwwmN
 utFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrX64RVR1XtLMYWKg5EhPnnPRvdOtPhYzBVNSaG5ComEFiZO9v/opGjRP3JHd8ccW6i6YXFdB9kwnf@nongnu.org
X-Gm-Message-State: AOJu0Yx7WqGXAFgkQawoApS03EWtHsPxjq4zeXECvbZpj+g2pMTjrWEi
 8p9N9evwnMLmRzBGaKKg9/yHEnJhlwdecFg1GVLUosg/z4o1l859sE6FbwrzvIY/g9w=
X-Gm-Gg: ASbGncvXtxUp5PB3Vp+im1eBTnPTQQrIAWgAPhDnVnWryddj8PPsHghkJmW8XXrY0f/
 Hv0ybpeeQJcXM9p7/pUzGmC/RWEjdYeyNoDhoSZHBHrBZ33wVGav2XXcSXN8dOPcNT6/ahUm9G1
 EIzI3zqTa0l/lCBYrTAz/DeGHPDjcASXgNatUZwwtxVzOycDBOXnHuVAUz8iiwBpsF9aWCPZfqQ
 ZGokFSQk30rIGtue7lrnIeGuoFGGUvUde5oJYcDZ0OfRXcKfK9qvMD1AWTxxmqgyvR6QaWnpkH/
 lxPS63kvddGX3PA6dUxj7qSKtVg5Mp8VsPTY1zr23pqAmT8rN4UOhOpRrSOxZpvqekO1oRbbS1O
 twAqzLm2Y8mU2FhmJVnvLuvQToB1zFbq9ic1A12Oq3vx+
X-Google-Smtp-Source: AGHT+IGnzKxU10AMbfLST1qfylj0DTrLsvoSmcBWAaqYshPA2yR88f2r00biVnO8c4F2wOrEmYATtA==
X-Received: by 2002:a05:6a20:3d24:b0:262:c083:bb41 with SMTP id
 adf61e73a8af0-2cfde03e8b8mr6921745637.3.1758700124330; 
 Wed, 24 Sep 2025 00:48:44 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b5541f0374csm8778502a12.49.2025.09.24.00.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 00:48:43 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v1 2/3] target/riscv: Fix SSP CSR error handling in VU/VS mode
Date: Wed, 24 Sep 2025 15:48:17 +0800
Message-ID: <20250924074818.230010-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924074818.230010-1-jim.shu@sifive.com>
References: <20250924074818.230010-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

In VU/VS mode, accessing $ssp CSR will trigger the virtual instruction
exception instead of illegal instruction exception if SSE is disabled
via xenvcfg CSRs.

This is from RISC-V CFI v1.0 spec ch2.2.4. Shadow Stack Pointer

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/csr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8842e07a73..0299a214ef 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -204,6 +204,8 @@ static RISCVException cfi_ss(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
         if (env->debugger) {
             return RISCV_EXCP_NONE;
+        } else if (env->virt_enabled) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
 #endif
         return RISCV_EXCP_ILLEGAL_INST;
-- 
2.43.0


