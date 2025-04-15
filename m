Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D655C369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 04:33:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4Xyg-0005wr-Hl; Tue, 15 Apr 2025 00:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4Xyf-0005w6-6h
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:53 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4Xyd-0007S9-K3
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:52 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2c2504fa876so1416764fac.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Apr 2025 21:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1744691570; x=1745296370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0M7g5xUZjhVocjovNa4Na6jt1UhUcE7AezPXbMWnbXw=;
 b=Wya37nqvVRkKC4rxJJ9tq7odmGcnklGCdNb0nrC9ivq7eMMeLyyTvpfYUhXOOfG3ts
 EYCk4uXfaXFbeJpiJEfLsk32vlD3WE1P3DPpUROH0x88UAjG2XefJQaL2Hk6wczoJJLX
 IMT1ca4KZtKAvjSPR9hK3qbAepaBsQXD5DR6GOe/NV76upFaQlyG8ItcovCOyexIyRBf
 emQ7z2SGH2/R76YW7tGDSv+VSnaUcAV61sPb6Rlwb3O/0Iv0JLaEOI5IvZOtvSYgZ8eR
 g2Ii64OwIszw8gGZNcATxRqeB4HBY6QUA/Hdh3uvI4C7X+SSpghfJtZz4VNTKjxFuA8J
 c77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744691570; x=1745296370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0M7g5xUZjhVocjovNa4Na6jt1UhUcE7AezPXbMWnbXw=;
 b=Nb5p95lfYx4PfUeEG3e4cls4U5W4zX5/lBXfXr9gLNKagDQ7X6j8SEmTq40CqXOfe8
 re38N8gUMvT92gLaHThzvqC6ISdbBEIKNPFd42iECDtXEDBxzxjJv4REutF7j7lxHzhd
 823xEoCYQOxSuVQnSuuIp7a8dHTqh6/fnwKDn2Go+I5A+C19K7Gr4OkgEI/yZ7Cl4Hnp
 mArOxwyU3n/dMa7PRuHSo2+p7AJJfANCTADg5n7+VoCGyJr4774o5Le0MGdQQY6Owf1F
 3ZVoqqgP0jK9vCv+tb3Z0/vBkXPFZgTRVFph04CmHLNEfWtSJjzeB5BoLLwTlq4SVzVZ
 Ifqw==
X-Gm-Message-State: AOJu0YythglQYtYuMiJwmHMZLD5YcHEA3b86wK1h0H8CpvnYS5NB4O8K
 A6VBcKdO7gyoLUFaOrWFZYF/VxASqvNeR7gF18GigsHhX7bmgI6pYzFWy2mS9ok6v3JXymJNsh2
 29CA=
X-Gm-Gg: ASbGncv2CPzoEF1/zCySrxZ+n08aWfzmEX3Bj5Bxjazf2+YKTwGlPtaH0MQV8OtZSFw
 pijW7Hy0R0AxBBeR4fyVy/M1eCDsIBwb1z63oAvi5Sa6USYYx2pcC0h0yGmgsCYwyqubzerbvaq
 eTaJIyyOnavqDOt3BDw6eEvsGJhjCeQqWRiS6rZlAYohZ/QPA2Ft6GwP8CSkTSCxPX6MbRvPT3Q
 4DuSsVOf+WTJtTFsvj+OSKdEbCHpUrGGr6rDIxvJg29fMD/7CR62JhT1WZOB2aIKS+DeIP5vGrS
 piMGlL7Iol9FjHHaxp/JzFpgJwq0fFCGZJcODJzy30pDJPr0TgG7KGwMR13VE3P0RjnXdtRAq+E
 =
X-Google-Smtp-Source: AGHT+IHzqybjE93NbxsgC2OgbGbNkcB8YQBBO8NqbyUTtlATsnjle5XfAVghmSLsavz1e9oZIPazig==
X-Received: by 2002:a05:6870:ae93:b0:2b8:ec17:66e9 with SMTP id
 586e51a60fabf-2d0d5c859efmr9007973fac.11.1744691569954; 
 Mon, 14 Apr 2025 21:32:49 -0700 (PDT)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d096d4af59sm2728816fac.46.2025.04.14.21.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 21:32:48 -0700 (PDT)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.or
Cc: max.chou@sifive.com, dbarboza@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, Anton Blanchard <antonb@tenstorrent.com>
Subject: [PATCH 3/3] target/riscv: vadc and vsbc are vm=0 instructions
Date: Tue, 15 Apr 2025 04:32:07 +0000
Message-Id: <20250415043207.3512209-4-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043207.3512209-1-antonb@tenstorrent.com>
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x29.google.com
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

We were marking vadc and vsbc as vm=1 instructions, which meant
vext_check_input_eew wouldn't detect mask vs source register
overlaps.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cd23b1f3a9..5442203eca 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -451,14 +451,14 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
-vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_1
-vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_1
-vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_1
+vadc_vvm        010000 0 ..... ..... 000 ..... 1010111 @r_vm_0
+vadc_vxm        010000 0 ..... ..... 100 ..... 1010111 @r_vm_0
+vadc_vim        010000 0 ..... ..... 011 ..... 1010111 @r_vm_0
 vmadc_vvm       010001 . ..... ..... 000 ..... 1010111 @r_vm
 vmadc_vxm       010001 . ..... ..... 100 ..... 1010111 @r_vm
 vmadc_vim       010001 . ..... ..... 011 ..... 1010111 @r_vm
-vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_1
-vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_1
+vsbc_vvm        010010 0 ..... ..... 000 ..... 1010111 @r_vm_0
+vsbc_vxm        010010 0 ..... ..... 100 ..... 1010111 @r_vm_0
 vmsbc_vvm       010011 . ..... ..... 000 ..... 1010111 @r_vm
 vmsbc_vxm       010011 . ..... ..... 100 ..... 1010111 @r_vm
 vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
-- 
2.34.1


