Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631DEC36010
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 15:21:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1txp2c-0008C0-Ru; Thu, 27 Mar 2025 11:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1txp2X-0008BY-3g
 for qemu-riscv@nongnu.org; Thu, 27 Mar 2025 11:21:06 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1txp2S-0004X8-HC
 for qemu-riscv@nongnu.org; Thu, 27 Mar 2025 11:21:04 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2255003f4c6so24405825ad.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Mar 2025 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743088858; x=1743693658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S0kCnpr/mGe18lJcmEZTqhGYZopT1rxvkn0QUVLj49Q=;
 b=SSS0A0X+kPVmO3nfntthlaFkI6zN7RhNPZyWV1LuVg62iXkzjqknjj3Jyc06PUaXvO
 jIWlU6eyON5U6+DR5sNo85rEtfsMcNuAMcy1WxCY+bEHg2VcQhGdTzuDcmOE2mi3cffO
 3END1oWgYYxugZyJehO3dHGsfWYcpZRGF2xfITJF6hCCHH8ULpXWqn/hLza2hnvWSoxi
 OBS82aMGZd6FT795qZBAm0c0N7LxQsfKfBrfv5XIDALlwC1rdnF8rhwQ3qmjmWg8MD++
 rILOLRNrSCYrvh4CSFdAtjWfNrlfWPaOIsioSkN6+9NBGoGRFM0xHpbSfnkn1kgl6KI9
 7DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743088858; x=1743693658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0kCnpr/mGe18lJcmEZTqhGYZopT1rxvkn0QUVLj49Q=;
 b=AKGUot27jEsbk1qKv0gG/cGILCx8hfK3mZQcRgy4LaIGdv9b0v88+55jNOpgOxrvvt
 JyFtlHIMySMWLTnWTFdY66n8HsdbK5MrnsTyBZn8l4P/KwqzBBAMSDEWZn2Ldl13yUcO
 /3RdyZ1toTmFDeyrdzyJgy2aDRWiY4iGlg0z6aixxYnDLTG4gaXhMOLmIifFKP3/OYn7
 0vXzIID7sMQk8UxSxs7A5UheHibwNdF7lSC6GPz8ttlEHb2Smvx+ZJow1u8Mqg8Xk78v
 Fo4jjE3XlQ6/MprjV218rwiwnfcliX3eqq7/7UQdLC5QEb5TXpGw4g1oMnX2ukhb52Ep
 BNnw==
X-Gm-Message-State: AOJu0YzEI31RyB8TJevjixKmP8xZ6jmIYkn2+TfXs/yxhNy/7m7oelo/
 zTw6rvLDCemJlMH5RE+sLoNBuzb4jLOLQd8bXz8SZEiFB21DlFa+gtLfJTObD50=
X-Gm-Gg: ASbGnctPaCretXW0w43o865FKLoSbfeULkyNsPjy4Za4iXDPBPjYH7sW+F1MVao6iUg
 S/trp92/anFbNdEPSg7/eYvR0xmFw+Yz1+xwzMGHGujZS56tBQ1uhdZ/1A9SYmoCG6VMrNtV6xq
 1xaTo5oq++tEhHiVLMx0IarNBt7qCQKY1RNb+9Q/RemXRhbuMhtD1B8L2Qtg9FldBg8aCtRPZqW
 /plb6jEKJaUAEpDSTte1qxrwr0RXWVhA26wqJXQq4jiHHquvPYAlG/ChF7RW7Kx6O774qHrYIQo
 is+HtPsA6tdrVw/AwD7UvtTPraVS7mhsDaff0XrYwLlLEGcePFlijE8BVVnxWugV8T+waO8U65j
 PXN4TvZ3KZTgL58RK0mUA9jWAHaFrNu1yBw==
X-Google-Smtp-Source: AGHT+IG2jzs1uEc1f70ShHngpDgNIk7fupEgz337SBCZi6Ldqf+9sCdyxuA4XhOvgZUvKzSDmkkQdg==
X-Received: by 2002:a17:902:ecd0:b0:224:24d3:60f4 with SMTP id
 d9443c01a7336-228048521e8mr64150245ad.15.1743088858205; 
 Thu, 27 Mar 2025 08:20:58 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-189.dial-up.telesp.net.br. [201.69.66.189])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eee210csm872995ad.70.2025.03.27.08.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 08:20:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrea Bolognani <abologna@redhat.com>
Subject: [PATCH for-10.0] Revert "target/riscv/kvm: add missing KVM CSRs"
Date: Thu, 27 Mar 2025 12:20:52 -0300
Message-ID: <20250327152052.707657-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

This commit breaks KVM boot on older kernels, like reported in [1], due
to senvcfg not being available in them.

There's also another problem related to scounteren. Using a recent
enough guest buildroot, 'ping' will be build with rdtime support. In
this case, doing a ping in a KVM guest while exposing scounteren will
result in an error. The root cause relates to how KVM handles
scounteren, but QEMU can work around it by initializing scounteren with
the host value during init().

Fixing these issues in a non-rushed-bandaid manner results in an amount
of design changes that I don't feel comfortable pushing during code
freeze, so for 10.0 we'll remove the CSRs and re-introduce them in 10.1
with the adequate support.

This reverts commit 4db19d5b21e058e6eb3474b6be470d1184afaa9e.

[1] https://lore.kernel.org/qemu-riscv/CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com/

Reported-by: Andrea Bolognani <abologna@redhat.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 4ffeeaa1c9..0f4997a918 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -624,8 +624,6 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
     env->stval = 0;
     env->mip = 0;
     env->satp = 0;
-    env->scounteren = 0;
-    env->senvcfg = 0;
 }
 
 static int kvm_riscv_get_regs_csr(CPUState *cs)
@@ -641,8 +639,6 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
-    KVM_RISCV_GET_CSR(cs, env, scounteren, env->scounteren);
-    KVM_RISCV_GET_CSR(cs, env, senvcfg, env->senvcfg);
 
     return 0;
 }
@@ -660,8 +656,6 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
     KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
     KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
     KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
-    KVM_RISCV_SET_CSR(cs, env, scounteren, env->scounteren);
-    KVM_RISCV_SET_CSR(cs, env, senvcfg, env->senvcfg);
 
     return 0;
 }
-- 
2.48.1


