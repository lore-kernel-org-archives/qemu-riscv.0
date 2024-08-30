Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ECBCA0EFD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 16:51:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sk4nd-0001xJ-UE; Fri, 30 Aug 2024 12:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sk4nc-0001r8-Bw
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 12:48:36 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sk4nX-00073i-WE
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 12:48:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7163489149eso1318125a12.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Aug 2024 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725036510; x=1725641310;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cUqXMdRltulPpZ8kSqOomp97N4/g9EkAE49D3ogDzs=;
 b=nWUtMPq5VVekcTrjNuYvzLTl41s3/BqT1B3vplzRsbHWhcQRPQ5lhrDLJbFZhEdDjV
 KzsFGV7g+WAcsso5KQ/N9wUfk4oMWGaDpvbM2FNl0Jj762djjoLDGutLkmj8mZHt7NYI
 bEqcIX9BegOslooXY/Nx2G1qdJKd79nV4iUM+7VNKLeslYSGh2V9tsltf8ggiZgcjm8k
 a3RWF+vzeTnJdwQERd/uqqOOhpeId8syKGN3EJfpfLedS0QyZe9eMu364knHSkGZ2pPq
 zRni4Wq+BGTrFggnODhBm/3xRiUCC6qWip5s+1lDia4Pyy/6GJk/TLV697fq7FDPQClw
 zE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725036510; x=1725641310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cUqXMdRltulPpZ8kSqOomp97N4/g9EkAE49D3ogDzs=;
 b=LrXwLzgdzmK85WNg7LpnQcq9MNc0vOoYNGT2jzKfLqgS7XQWGEj4hFDx8twoYf1yo5
 zIaMAkb/jEF5AYLVCJHatjFHW43QPK52pGJEzQDaNXQ5iltY/TOw8eUZ0TKAHGno908U
 dR1P1bkH9NsbphxfveDbyclZ0agVoGHphuscm28SG23KEwBs706MRu003MyXkETaDoqd
 4E4SwkBWhR8nmt9kUv9oX3Mxoo+kxD4JkgcsXvggrHLiucOvoZrE1vMfxPkYVqE6ey4p
 vh+6y0bchPzil9enoQOwB4oMowtKjx+0y8qKl1DKTZAWU7Elfn0N0n9AJTB1K+dgeQBS
 727A==
X-Gm-Message-State: AOJu0YwMT7FRP4+7iJsKB4gok2EKPeZICCqLeHjg3+4b3CXDkA2B6Pb1
 5td3rui/VOooRwcmg/ZDvdBnFtQ9pNN7EB6n2T5K+Qw0PDYgZzwH12dNfmV3tadXp1PsiRzJtrI
 6
X-Google-Smtp-Source: AGHT+IEDxAnnPI2PqHwm3Zzxm2wpet+qWcZO9YRIuQ7jGTBR8ETingawDXitVBLgVugXXN1Jrrg4Kg==
X-Received: by 2002:a17:90a:6fa2:b0:2d3:bfc3:3ef3 with SMTP id
 98e67ed59e1d1-2d88d6af3dcmr355262a91.12.1725036510211; 
 Fri, 30 Aug 2024 09:48:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445e813dsm6591257a91.17.2024.08.30.09.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 09:48:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v13 20/20] target/riscv: Expose zicfiss extension as a cpu
 property
Date: Fri, 30 Aug 2024 09:47:56 -0700
Message-ID: <20240830164756.1154517-21-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240830164756.1154517-1-debug@rivosinc.com>
References: <20240830164756.1154517-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c5ebcefeb5..2592465e24 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1485,6 +1485,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
+    MULTI_EXT_CFG_BOOL("zicfiss", ext_zicfiss, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.44.0


