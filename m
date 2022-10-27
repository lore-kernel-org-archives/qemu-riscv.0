Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oo63S-0007nq-Kl
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 12:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63O-0007IS-LN
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63H-0002Q4-BM
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 12:48:21 -0400
Received: by mail-pg1-x529.google.com with SMTP id r18so2019877pgr.12
 for <qemu-riscv@nongnu.org>; Thu, 27 Oct 2022 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6iyPZgBe1iNrOkj3Tn5anzDtlrl3yPzW0hHihe0EGPM=;
 b=ECxWNsV0FtSHhvz6c0DnFrVuUI9MOzC8aDQY1tWUGjLhux5X7CTMq3Jlz3QbWsb1Uz
 5a44Bd+9mk93CGX0SrO3GyRYU4zf8gtgvCZr4dT/ApzBDdfbWzzPt9n/xOv2BPQXssDi
 +GMNWClzglZmDG/r7+FNSi8BUV9iZaHyL/QmvcGxciq7ruAzy/9Cq+VtjOAYK3sqSbFH
 QYMXBL5zY6L/0OGd5of6CGuxKkpGUTrMKUp0A6ib54G9ByCM5IQbCU151SXPjrG3Cd9r
 aj6JOAFVmqTHbQuB6QwwkWmrIHM7tahvYHJ/vYXSlCqMLzGt/TdkPbWZplRAanMFo//t
 wXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6iyPZgBe1iNrOkj3Tn5anzDtlrl3yPzW0hHihe0EGPM=;
 b=wrEyoBhRQVN99oL1jQt/AntUleY5aa4PEkjvzlsfGpAU9AG2Nu4rSCCEtr5m9+vly7
 NusnL3dqkO2nZE3SfFFZDW0yGO34iowZT+oXSQY/C7YHSHY7LZarZ/pvr2mMGsDp8u/E
 oHXqT3MCfJVByazXNvXnHiJQKf36+c18BlUIU98tf4krm6ZVmikY12+gbx2lic8VLPhx
 +N4jHDkOPSYuAxEEYCC9/87DV9WIw6MCqJww+MdO1wY5Zd/sF9sUJtxNwfGgS8mpiUxS
 vyiQzEPa8G5BVpCgdIAR2jKbTh7blk4IT9fCq/35EWMgV8KYRtidgtCjLdSKzpggqXG5
 juDg==
X-Gm-Message-State: ACrzQf1rtUv7qDntDCtavVoaEyYnHtF+QjCc8uFZ7XsTejyegM+gy2CM
 oc+L0Is+SQ/+LpWrwcoxux2qI8ErZ/97Mw==
X-Google-Smtp-Source: AMsMyM4yMzwuZ8mGv2RdzC1qMz7NIaG6yHQGOes7mYpraDGEIDV+zyNhyVLSJszOYT5T4wAGpLZ1qA==
X-Received: by 2002:a17:902:e888:b0:186:a6be:1106 with SMTP id
 w8-20020a170902e88800b00186a6be1106mr22114793plg.150.1666889286771; 
 Thu, 27 Oct 2022 09:48:06 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/5] target/riscv: Typo fix in sstc() predicate
Date: Thu, 27 Oct 2022 22:17:39 +0530
Message-Id: <20221027164743.194265-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 16:48:28 -0000

We should use "&&" instead of "&" when checking hcounteren.TM and
henvcfg.STCE bits.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..716f9d960e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -838,7 +838,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
-- 
2.34.1


