Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D83C021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:18:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwKB-0001yY-OR; Mon, 17 Feb 2025 03:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwK1-0001wr-PN
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:17:45 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwK0-0000yf-5i
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:17:45 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-471f88518c8so345231cf.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780262; x=1740385062; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ca383jZ9H/7hPjftb6ykvA59uZ+joaH9NqOxjYmz17w=;
 b=cRsdwfV92GcpVfTO2Ku6H/GdvNq65gurcQjHZSGT08Gn+oZFyf4mB0Q1MGMKBF4snp
 fFsm9C+gFTwNBfS+JVbbFge3uV+zwEc5RioE6xnmJHMJvZtuBJwfddg4nTXPfQptzACW
 NLyVWFuEg+yi4hhDjL2GmecrNN6HcsVy+9Up/vg3KYvvN6LnJLjPV7e7PrTnv+jPUeTF
 WwYFCGlsmOwJV11lOLBEdMq473OP0V02UyEN0Y/nnt1BYPb3u/NgB/FQG3XD5ORaYJD3
 qorpHQW9rjq/f7lm6lmmwH+wJ5vn3p8XsZRzMnCVTcKXmRCwoMdjRO+2iICiGlmkXqGF
 2W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780262; x=1740385062;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ca383jZ9H/7hPjftb6ykvA59uZ+joaH9NqOxjYmz17w=;
 b=A2YCkFoJ7UW3k11pIBkWyPzO3iiCygOqUyvQhD8MUQbWzep8Gm4Lqprdh4lri8f3AV
 SYflsHNJz/x9EFmsy+HhQ2nVHfA6tgjpx3CyDTYZMFM3fzX7hrXVdlgDyYLN91LPCqo/
 MyIWo1UlWDt+BZkiag3vTYTJ8zYZEceVLVlbA9BjHcF2mZK+JoSR0qd6RJwpQDZTZPw3
 fxpS5BmOtDJr0R7ZkKFognNIkSfGiaTNPbSWBUzO05W8YBwFSZSxDcuOT/fdp6t0Sz4b
 0yulVl3XBTzLZ50MNdiYBzByEr24COojUrxmizIm68/zKqNrxbS6DZAmcEBWOG1x08M+
 ONqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULovDPnU2nlLGYt5PZJr/UGrqCT0oqzJhPB3gJNVlXyQkZHOVxP7YgAUjOyM8c3rL2wNMtkQcrLTL/@nongnu.org
X-Gm-Message-State: AOJu0YxS0RrTX6rB5Ghxk2izKq66HLSN8x/e1GggLIXJluXY2bPWqc5r
 463t6keYU/OsSAr4Lj4SNmWg14m3/7mTsFH+LiabROmuU47sQTEWiDer/EmsnRY=
X-Gm-Gg: ASbGnctEHbWHYfsjQf1fiIgldW+ff1Id5/C3IcZdzfpv+Ah8B07JvWaqGfIYHGRSJ0K
 fKURhJczIH8bsH3aeG+Ge0cldc9IMvIh498PohUPFlk6Ak1t9um3s0Y33I6xcyosK5L1zj37eZd
 w79doeCCRJHpiQ8K2Pqv/ctVeOQx1BEtGTZ6F5/BtHQkpNe1TpS/d/ifMH9BOpb2lO5yf6ZTVod
 HMUDthm/c8qeDisFTl4cJYC5cUNUAeeJ2nlqHFES3nDZIzXURlC+t+HYloueYUX/0TFrY8wLqgA
 oX8ORLbqb0q4W/C+lGv25FGRgZnzSR3OlWYseL4iZJa/sw==
X-Google-Smtp-Source: AGHT+IFon/KRqEXx9zUKG3ffSrWw3wcDga3m5+1eOtEvhAiSiK++jGGkL5Vf1Wqvpags1k8e8hZXmg==
X-Received: by 2002:a05:6214:20a6:b0:6e4:3c52:d684 with SMTP id
 6a1803df08f44-6e66cce6bb7mr146057156d6.19.1739780262693; 
 Mon, 17 Feb 2025 00:17:42 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d9f38absm49673346d6.88.2025.02.17.00.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:17:42 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 0/8] riscv: AIA: kernel-irqchip=off support
Date: Mon, 17 Feb 2025 16:17:20 +0800
Message-Id: <20250217081730.9000-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-qt1-x82a.google.com
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

This series introduces the user-space AIA MSI emulation when using KVM
acceleration.

After this series, RISC-V QEMU virt machine with KVM acceleration has
3 parameters to control the type of irqchip and its emulation method:
- Machine prop "aia" controls the type of irqchip
  - none: use PLIC and emulated in user-space
  - aplic: use AIA wired and emulated in user-space
  - aplic-imsic: use AIA MSI, emulation mode is determined by
    "kernel-irqchip" and "riscv-imsic"
- Accel prop "kernel-irqchip", effective with AIA MSI
  - on: in-kernel APLIC and in-kernel IMSIC
  - off: user-space APLIC and user-space IMSIC
  - split: user-space APLIC and in-kernel IMSIC
- Accel prop "kernel-irqchip", effective with in-kernel IMSIC
  - emul: use MRIF as in-kernel IMSIC
  - hw: use hardware guest IMSIC file as in-kernel IMSIC
  - auto: use the hardware guest IMSICs whenever available otherwise
    fallback to MRIF

Yong-Xuan Wang (8):
  target/riscv/kvm: rewrite get/set for KVM_REG_RISCV_CSR
  target/riscv/kvm: add KVM_REG_RISCV_CSR_AIA
  target/riscv/kvm: add KVM_REG_RISCV_CSR_SMSTATEEN
  target/riscv: add helper to get CSR name
  target/riscv/kvm: rewrite kvm_riscv_handle_csr
  target/riscv/kvm: add CSR_SIREG and CSR_STOPEI emulation
  target/riscv/kvm: rename riscv-aia to riscv-imsic
  docs: update the description about RISC-V AIA

 docs/specs/riscv-aia.rst   |  24 +++-
 docs/system/riscv/virt.rst |  10 +-
 target/riscv/cpu.h         |   8 +-
 target/riscv/csr.c         |  30 ++--
 target/riscv/kvm/kvm-cpu.c | 287 +++++++++++++++++++++++++++++--------
 5 files changed, 266 insertions(+), 93 deletions(-)

-- 
2.17.1


