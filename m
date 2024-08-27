Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BCEC54744
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 23:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sj5Tu-0005xq-J6; Tue, 27 Aug 2024 19:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5TQ-00041D-TT
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:19:42 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5TP-0000wo-DX
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:19:40 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1fc47abc040so53246235ad.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2024 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724800777; x=1725405577;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkHD6ktn6nmHSyL5ZN67NLJg9JbIK8JaSh/uuJiIwag=;
 b=rz55DhfN5CdsdChc6fmaVit8DtgMgNYuJxxomgpXqJ9LiPL1fmvpmnY2UEmildNc+t
 etlI0yEjbheBtDYpsyKmUjNN5bIY8IRwZKJDTfTUSGSp7HxE6p/SxQgsxjmQNcW+Tho8
 hnd3Zy6oPfLrh0jFGjHoSnN0WqrlublDEg7CHE8A3grcIhrFlLhnsco040KqjcENkwQ1
 OFOGxvvWm2OwYFuhkTmAXV+dHmDpEzpEviZjh/QP/Hy584MYaCy2ztoc1zggAJgI+Q0s
 VKc4Z1GldT2FCWHn5mxudJMDZHyRX9xhEhxd3eJFkrcyKUY/GTlCooJzDMxQ8rv5U8oV
 r1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724800777; x=1725405577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkHD6ktn6nmHSyL5ZN67NLJg9JbIK8JaSh/uuJiIwag=;
 b=CdQfqm3B/FdzsbQ97G3+ii3qXawSXjr/D9mBsptFApqlxHFiO4pp0cuU1SYAMPk/di
 TV8Q3g5pE+36PfGE+kmDxDM2R2lUZyjxn6tsyunLP+ZMD3y5czSugQVGgS4twzaWIxy0
 L1zKWrJ2FHfW99y0iCmb4kjb0y1R2rqH/5xEgbl+0kScNi5QPE7XurUU3+Y2sRlL1Yxs
 yB8uvxyRt8AZqDN+ay+vCqRsxLdWe+ZeRpVzaXu8njzRk6ZETT38kPcXkrdEHAoYo38q
 zpRPL9dFT+CPTQAkKFC6zX00a1VyqtaSuoDHPfRYxSVTBS0pRnUah7wqA0gRTNu5lBAV
 9qpw==
X-Gm-Message-State: AOJu0YzU4uPX4Ort0+HuKP9n52xc8VR+zW/y96+TAZ39Yr+Q2SLYXiWk
 LdLtSQRLFTPh0Sjd2iOt5NLyMAd7OuEqV3wv7y315p4JYCRdReGh2i4yMNVJCOuslihUdV98Nb5
 y
X-Google-Smtp-Source: AGHT+IHBSz27Qp5zxFrjlgeAl0s8oUyUBtGaWP0GS4xrjaawqTc79oQufHeAQVtnq+wIVJI1b5Yyyg==
X-Received: by 2002:a17:902:f54e:b0:1fa:fc24:afa5 with SMTP id
 d9443c01a7336-2039e4890cdmr159817575ad.27.1724800776540; 
 Tue, 27 Aug 2024 16:19:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0ee6179sm57785155ad.92.2024.08.27.16.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 16:19:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v10 21/21] target/riscv: Expose zicfiss extension as a cpu
 property
Date: Tue, 27 Aug 2024 16:19:05 -0700
Message-ID: <20240827231906.553327-22-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240827231906.553327-1-debug@rivosinc.com>
References: <20240827231906.553327-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62b.google.com
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
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d6cdd81fd8..66dc5af20c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1481,6 +1481,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
+    MULTI_EXT_CFG_BOOL("zicfiss", ext_zicfiss, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.44.0


