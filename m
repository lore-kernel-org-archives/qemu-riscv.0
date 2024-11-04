Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A8BD1BDD3
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 17:36:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t80zt-0001RS-Lu; Mon, 04 Nov 2024 12:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1t80zl-0000iY-1Z
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 12:36:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1t80zd-0001Gy-2h
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 12:36:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so40080075e9.0
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 09:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730741753; x=1731346553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GqDaH8FBkkxPNg8DatpDcuWIhwo3YQN0q5KUjv6axVU=;
 b=MXjNH5H0E9r1qMRyj42epJ4E95+nDXNT/H4flHOVCnb9lgY+Rd9KgNaNL31U8zB1J+
 klQ30awFab2NwtaYreWgezB/86wj0ll0ciRmcXK9y/djqdYnxh/yOz/Ya+7n7ufOBNNP
 ZNo7ZrPaRQAZCjKks9KpO/M0lgcLg5hIPhx4hAXB5tkcH9MkPVS6KswWPnRTIclclowy
 5TwWlNsqrYn5dfybigTeTiU9MeNUgegvbNDqSVD9A+1oISRPgXH77SNj4+S7QnODpCL2
 jxY4yhGgcn0HjpbiyuemU/UAPK0DAxunmQIN602HmZQr9cqJ5HYA1OJYRn0ZuMIVqJFu
 ToQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730741753; x=1731346553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GqDaH8FBkkxPNg8DatpDcuWIhwo3YQN0q5KUjv6axVU=;
 b=tO2p2RtjC3PH6QKRivjEJ0K3p9z50R51EMChiadyR0OXH4r/zp5g7oulLvTYpyoJsJ
 opUdPrLNy0DtFroS1JCuuSDY+0o44DqN2R47dye1VqrslMq9aIaAEzAGvbdcFz3uHZRD
 o0w2La808T2ei8TYRqARS3OFMu19ohf6kLmEOoe4s3YRtfRfHLHM6NfbmQ++iMPTk1Xe
 QVIfOvb7UfyJOgOBfH/OvkDuvDEfjr8/4SvdzYSfkTgyxhikoGF+npidSgF4glmb37aG
 CxSzwosyR7FTFdQmmIYmj6zbYwPAOaq4Jtm7y4jq/HgjsN2ceeGwqj2HM23q8Ni3Mk4E
 yfYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCW55hMmqSblraiyqzUHQtPkuMOy9M7hzfAT1iqezbbOID6NtA+hHdyTgfz9rSong5KvwIOvFmGmpZ@nongnu.org
X-Gm-Message-State: AOJu0YyR3v7MJjJ3jdyGW+yQrx6V4Fs2H+/Uru/LCS8Tgj7Ct6w8trTv
 +0w+NdLNh8GsuVp1OmuoE4edfWNcKgNDfvRCvLwkegklhi9gXJEKQO7BUc4ne4oIdUkk/gvVZNL
 I
X-Google-Smtp-Source: AGHT+IGNLjSfJDjKIVaaU3cbLo0NlN/k40pHJZkz97N2i+RohIklIxKhAuyH+Jsmw28gcknfrepc5w==
X-Received: by 2002:a05:600c:3b14:b0:42c:de34:34c1 with SMTP id
 5b1f17b1804b1-4327b6f9590mr141796465e9.2.1730741753590; 
 Mon, 04 Nov 2024 09:35:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd917fa7sm187499735e9.18.2024.11.04.09.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 09:35:53 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/riscv/kvm: Fix leak of reg list
Date: Mon,  4 Nov 2024 18:35:52 +0100
Message-ID: <20241104173551.125069-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32f.google.com
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

Free the temporary register list.

Fixes: 608bdebb6075 ("target/riscv/kvm: support KVM_GET_REG_LIST")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index cbda4596da73..effd8fed815d 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1170,6 +1170,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
     }
 
     kvm_riscv_check_sbi_dbcn_support(cpu, kvmcpu, reglist);
+
+    g_free(reglist);
 }
 
 static void riscv_init_kvm_registers(Object *cpu_obj)
-- 
2.47.0


