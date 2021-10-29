Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNo4-0001mS-D6
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNo2-0001iJ-Py
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:10 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNo1-0006ni-21
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so10058251pji.5
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNKLb1QcQ6ASiCSf4LOijmdkFNA5PCo15wSKt6nPlVw=;
 b=ePH/bzwJTviuYdMcOKBR5ChZRfSdC8PMZrwUna6xU8T+JakC9CRn9/4cp2byJbVfnh
 MB8k8z4k0iKJ39Y2GGxPo1I4Mt58GTQ6cm7GhaieFyIbWes81r0T3dqpFCDgpq3jFQ80
 8D99yvkB8tNcnarr9hprNFJB9IDe6zmlUXtXsQeCiUZjca7TZtc06xR6Y1+shpsU+IUi
 QWFbDQUWnM37HLsm/+7FpHfIbjM+7EthHMItCsZSLqju1FV9tfk/tRADPecLQP5W982Y
 v/9u5UO6FQ1i4BvmrIQM0DaaTb65lPTNnMgntz+m2KyEO59jx3yGNYnf1S4yReIAMrku
 Nc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNKLb1QcQ6ASiCSf4LOijmdkFNA5PCo15wSKt6nPlVw=;
 b=L9ArkuK3EdRikM7AjAEtk/q2xZT9LJSrLlnFyk7vHSssyvFLarUa7YTIc1tZWHwHfH
 hMamgjJiOX3kSJV7413VZwb8gozJ6+jYfh4HJ3vCsJBqrNzFKNcmxlGCQa1HcsCfUz7a
 7flnXkl5I3EQeVcZbbt5PQsYPB2nS1uyyznpccJ2XKivdKJE2Kx2xDDYH5lSvGKmUby9
 Ty/mNU68jsXwl236fUqVXjk1t/pHOCwe2QcxeRvDc6SeFDfs6U/Y/902x+Y7YmBzLSpS
 4R4eRC1XgzK8AHPHrAGHpSsCf5oxCa1+TwP8klSXt8ZxoU1g6mMnldr7uGxV/x27dsC+
 lDXA==
X-Gm-Message-State: AOAM532cho9zqBCVBF8F+mnP8HCQ5J8gUhePRh0uSvJBl2gvAzEwdZFH
 Q0QazqVo7fUG2Paji4DiP6ys/g==
X-Google-Smtp-Source: ABdhPJyfrBuSKF6C35HzkJXh0LDEnf4gxl/7mUsVhaiMt4gllUv25x053wmf6VoORzW1s9LDJJ3eBA==
X-Received: by 2002:a17:902:a5c2:b0:140:14bb:8efd with SMTP id
 t2-20020a170902a5c200b0014014bb8efdmr8805881plq.31.1635498247414; 
 Fri, 29 Oct 2021 02:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 71/76] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 29 Oct 2021 16:59:16 +0800
Message-Id: <20211029085922.255197-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 09:04:11 -0000

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 952768f8ded..d7c6bc9af26 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -78,7 +78,7 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -671,7 +671,7 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
-- 
2.25.1


