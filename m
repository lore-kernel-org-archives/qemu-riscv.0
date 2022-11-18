Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovxWy-0001J8-4k
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 04:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWt-0001EO-Uy
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 04:19:26 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005wS-Qb
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 04:19:23 -0500
Received: by mail-pl1-x630.google.com with SMTP id g10so4033787plo.11
 for <qemu-riscv@nongnu.org>; Fri, 18 Nov 2022 01:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xEXkQ8t+tq1lZA75jL8hUMTdx4hxvqmTCVjHKWZivA=;
 b=bFyuS2eSwPGJ2PMx1G/fpfeSpJ7zOYg8fWV6/oxtKSgVrtVkZuOiSSxz0Mo5SQxY72
 p8qbwchwtaDHKaAuHz7J2tQZ+TlCSXzYZe0jPHipZaJ02A7P5E4r+NyICKWplg4xk/9E
 ZcTHBza+Ex8VHez5h4Nm3j7QXhCbp9b9fV30xccniQzNkc6YhHdT6S8Ch5L1VKGKecWn
 2wdM+0ZmTY+vWGB71ncyuialBpXTXlAPYkQEwEwMfpXXiejgdbWYBESo/hu/ETlE8bvw
 csAQgFLPjkWDysdUGdkrxkXslJP2Walk3gYJCoYUM8Bwc0ogAZEsEoeMaYrXkklb37OV
 WWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xEXkQ8t+tq1lZA75jL8hUMTdx4hxvqmTCVjHKWZivA=;
 b=atcrO19NHqlHzsdAc5ciI3lCURMYBFKZ5PjDfizpg0269mCyHIQRSh/jWK+tl1nyvm
 zXxK6GaTCI6whBon+do1evvurypfsI+s2TAe7Wz0jtJ6SppQ4N+mYh1EcKGrsXw/joZk
 CY67qOFO9dB0rF9TzWt0yutIUYi4QB0ZLjeamjuenecds+uDQUhtaL8pfEdOahZTOVn/
 O1zob+5as4IGn2zwuE5VNp9a7dj8UGg6DllD41uNDcEVlQVgMn437j0UGX8xde7iAEYp
 uFf5uNhsG2Us/bjxHgMFFYsyrlvaidpl4UI9/SZS14rcRxcPzw61aFdNDnahM4orCaNy
 9+rg==
X-Gm-Message-State: ANoB5pnYCT/cq8KRQ8h3EuB08bkb5juUe1JKtNpHzwaVZxGQ51rXTfog
 lKP40vGiQ5Sy3MR38LF1AVhqGQ==
X-Google-Smtp-Source: AA0mqf4/9L6mFTiuUIMSUzbH0eonZ3nlt1wDMd1dUlRXNp3GXpRsXzoAUhJYxVCOxUtoGPMVQVAK9g==
X-Received: by 2002:a17:903:2614:b0:188:635d:4b43 with SMTP id
 jd20-20020a170903261400b00188635d4b43mr6746807plb.69.1668763150487; 
 Fri, 18 Nov 2022 01:19:10 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 5/7] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
Date: Fri, 18 Nov 2022 01:18:56 -0800
Message-Id: <20221118091858.242569-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Fri, 18 Nov 2022 09:19:26 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu_helper.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..241d06bab8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -610,7 +610,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
     uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
-    bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
         gein = get_field(env->hstatus, HSTATUS_VGEIN);
@@ -621,10 +620,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
@@ -634,10 +630,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
 
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
-
     return old;
 }
 
-- 
2.34.1


