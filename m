Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ADCCA0FED
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 20:36:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1urMse-0003or-0b; Wed, 27 Aug 2025 16:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stove@rivosinc.com>)
 id 1urMsb-0003mt-CN
 for qemu-riscv@nongnu.org; Wed, 27 Aug 2025 16:36:25 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stove@rivosinc.com>)
 id 1urMsY-0002Rw-Fl
 for qemu-riscv@nongnu.org; Wed, 27 Aug 2025 16:36:24 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-771f90a45easo280486b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 27 Aug 2025 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1756326979; x=1756931779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ddve7p4fI8qnHNRjLS5NATRfUqe+W6ozPOkYas4euQ=;
 b=J/xpgUX+OUnvJfcyFlg0W+gYkrNX+wjUs4uf9FLZC6zZtYyYFnROFu3Jw3b9F7xDLW
 wI/K06JV6u2L1bxk5ob9UTxwcDFhii+8ix0bkOPnonrD2tmJ2fNrbKIQVtJYCpNtyHW9
 Gpk4aPLb4x339XPRSLEmit6NhO/zFjmqdHi0Nv646eYzREK3rlZSMpC6ykz986OD7NtO
 oQdlBQiQWhjBSLhbMnLH1+Ym5FPLjJfePTB3BId2Va2/ddx/XnxH67r+nS88T6Pb0TUe
 dp4B37VMgW7Fyk7bJszxIus6rKZxTW4fgSwaqQDEvodQB4TyrjyG7tLa1z9hbhDZO4QC
 xbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756326979; x=1756931779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Ddve7p4fI8qnHNRjLS5NATRfUqe+W6ozPOkYas4euQ=;
 b=U2kCyE74c8P19ZA86i2VSTsKpLQtyk/gI6LGn660u3EwUkgiq9zc9gVlL39ZGrRd8e
 p3OelGlHd0ZcfQvCSNmA0d1Op9mGri+3XIfve7eKGyHA1yPiH2WF32GYm5M/PPMFrou/
 Y9l4WjK4444xErBIhPr2Ufa5F9bhkCUKiMaj8gPaMfI0nmcbp3f6CHCLe54xvD+0KjDQ
 ReUTOUycgWMBMVUl/VJmjnHw9b7TNl/tE2MNZNVWTlTDqd3BEvSwq3fHZ3B0VdK78eSQ
 NFZ3xCLbEhv3HpqUwFfZGrVFbtf/VVtZYni1MjddOeYY8bAl6fZQEUH17vI1ub1r4VBl
 p8EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTDRthunEyN391w6ZsvTxea7Jxs9OhpwYYDdTOiZJfHGJgZ6XlXf+1594cLjvk0Z6C5LN2Mwuvsms+@nongnu.org
X-Gm-Message-State: AOJu0YxTtPcQ6lmddQew9t3GVaNExuPp7Cw/uu3bXtRh9w/tL75tkKmu
 yTqd1ClZ8EVdROYL505CFHbMKIvodxRO88tsEykVrnP2AF6uBZI29vN0K1+zEfxRjis=
X-Gm-Gg: ASbGnctqTYGMu4ltQ34G7cyg0ek4JEub/4cs1JSm5pVFWTympKcN6QITGu4WO6GSnC4
 ZWeoXNUV7gsZDJjNCvYkWYwWlVfIDo5GwMWH173TbKsmw3Xszzvv8M8vIw/4ct98/cREOl2xr8Y
 pTgT2xpafA7rRD3o86jLcpgE9sFPzyDzHoEay0UiRcnAnym7FDi1tJa3J+/FSVC599kgn1loiLW
 bYLF8VuaAMtxHxKRLZRLUx38MZStmwuT3bevEbMCQBd3fGOwYyfU3YKQOdqLcSECzQmpz4c/vHF
 mnycPxisDXp5YE2htMfu07d1x1/EzpuP8BFp503yHlG9UyMDsZ62pfIqKupHWHAHf8WP5e43t4Y
 Kb/j+d+Bmu87v1V3YSZOiZIzmaomYNjSyKHbxVENY
X-Google-Smtp-Source: AGHT+IFx+fyEmVZjkee3XZtmXtLNubdmYGpTt4glOlJ629w74cDd8GBr0FIJTxAK3IhQosGL0NIkPQ==
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id
 d2e1a72fcca58-771058e5ff3mr16281797b3a.8.1756326978817; 
 Wed, 27 Aug 2025 13:36:18 -0700 (PDT)
Received: from mbp-nixosvm.ph.rivosinc.com ([12.151.45.234])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771fc95888dsm4959732b3a.89.2025.08.27.13.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 13:36:18 -0700 (PDT)
From: stove <stove@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 stove <stove@rivosinc.com>
Subject: [PATCH] target/riscv: use riscv_csrr in riscv_csr_read
Date: Wed, 27 Aug 2025 13:36:17 -0700
Message-ID: <20250827203617.79947-1-stove@rivosinc.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=stove@rivosinc.com; helo=mail-pf1-x435.google.com
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

Commit 38c83e8d3a33 ("target/riscv: raise an exception when CSRRS/CSRRC
writes a read-only CSR") changed the behavior of riscv_csrrw, which
would formerly be treated as read-only if the write mask were set to 0.

Fixes an exception being raised when accessing read-only vector CSRs
like vtype.

Fixes: 38c83e8d3a33 ("target/riscv: raise an exception when CSRRS/CSRRC writes a read-only CSR")

Signed-off-by: stove <stove@rivosinc.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4a862da615..dca8edff6d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -873,7 +873,7 @@ static inline void riscv_csr_write(CPURISCVState *env, int csrno,
 static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
 {
     target_ulong val = 0;
-    riscv_csrrw(env, csrno, &val, 0, 0, 0);
+    riscv_csrr(env, csrno, &val);
     return val;
 }
 
-- 
2.50.1


