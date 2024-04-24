Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4957FC07E8E
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 09:48:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzZDj-000847-FX; Wed, 24 Apr 2024 05:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rzZDi-00083M-EH
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 05:47:18 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rzZDg-0006Ja-RU
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 05:47:18 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1e4bf0b3e06so62439425ad.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2024 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713952035; x=1714556835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVBbFgwhs4vkIs/l2c0xyQFfBRuV3ZIfacWshc9YUlc=;
 b=kDpjwkSrWo87MJvBELJDsfFKPzVdp1kjqGPpZsnJGZK3k3buWBsmAxbtcaDERU/vgh
 Np4LsgASJuJYD/UQFEAfCNIyTidCaw2pIoigqAXREum19+f1MWROL3Rhkmva/meTqKXg
 8Z01ZrbfAg5P1s2JJPKX0LF7mlRtbPZiJiD8OB8B6Qtx5LAbB0BOlK5LZtDM0b59zHmM
 AgvjaSavXMp1Ha5NVj39O+6Qq6Xvg4WeKQAcRDI6+3JexeZL1NIhK1MuXAWbMcsahCfG
 1XWTsQS29dMpG060ZJnEVK5ussiLlK/GuBXuAVRt+pI5j18BjuU42NJBhzMWZOoMj3Ht
 fjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713952035; x=1714556835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVBbFgwhs4vkIs/l2c0xyQFfBRuV3ZIfacWshc9YUlc=;
 b=WHc6GhTLjlwloMDjvis0qZOp+5wH/eZGa/LId20CgDMli9KdN6kJC1Lp9LzDyh0UME
 4wbpcqoLw53fzG/Hog1KnhH0ueDEq7IRaEK6Z06I0fg9k7LBMbI6p1jKzHtIpKtutHFW
 sxCzkjwZx4g+1/4vGHG64dx4IXEMvTT1eBTw89fQ5x0HSp/tD3qrqBnAROXrwafbUCQa
 f1qJOl0zl6Ff0ZeI359oi+fDpWE190rq0jN4MEpV6M0t9nvJqRmPw0ixQvk/UkLzxnIP
 mZlzXT3OkzG439lxFsOFJsfnan6ZEFzw0F4Zt6WDYDLeuR9hRYadeq2MSIdH6M1RVjAo
 b5Zw==
X-Gm-Message-State: AOJu0YxhbMofjsBnIpkS802Zq80Au4eK/11MqrUduAL7qs5kkHD5rUPx
 PqeETjCGT3p2+c89N78LbEezfx30hgxidd3NpvQ18V+tQdFVIc2t1z2frzgM4sM=
X-Google-Smtp-Source: AGHT+IGksjfH2PSsjZu3hL+vKxpz3NOjkrzikzVM0bJVgA/p652BaE4aJkS/4wK1s7QW8znQ4+wrEA==
X-Received: by 2002:a17:902:ea08:b0:1e3:d8ae:df34 with SMTP id
 s8-20020a170902ea0800b001e3d8aedf34mr2394352plg.11.1713952035345; 
 Wed, 24 Apr 2024 02:47:15 -0700 (PDT)
Received: from grind.. ([191.255.35.121]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1709027c9800b001e0d62e077esm11513389pll.247.2024.04.24.02.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 02:47:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 thuth@redhat.com, alex.bennee@linaro.org, philmd@linaro.org,
 mjt@tls.msk.ru, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv/kvm: remove sneaky strerrorname_np() instance
Date: Wed, 24 Apr 2024 06:46:59 -0300
Message-ID: <20240424094700.453356-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424094700.453356-1-dbarboza@ventanamicro.com>
References: <20240424094700.453356-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62a.google.com
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

Commit d424db2354 excluded some strerrorname_np() instances because they
break musl libc builds. Another instance happened to slip by via commit
d4ff3da8f4.

Remove it before it causes trouble again.

Fixes: d4ff3da8f4 (target/riscv/kvm: initialize 'vlenb' via get-reg-list)
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 6a6c6cae80..ee69ea9785 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1054,8 +1054,8 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
 
         ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
         if (ret != 0) {
-            error_report("Unable to read vlenb register, error code: %s",
-                         strerrorname_np(errno));
+            error_report("Unable to read vlenb register, error code: %d",
+                         errno);
             exit(EXIT_FAILURE);
         }
 
-- 
2.44.0


