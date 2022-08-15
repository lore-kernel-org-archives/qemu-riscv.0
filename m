Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNfN3-00035e-Oz
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 15:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfN2-00032k-MG
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMt-0006N0-QA
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id v3so10124301wrp.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
 b=jknClf+toYIvPEkgUrydqqr9UCEeCEr58GLRzowOM/IR+L5/RRiMyasTBBMRmmqRh+
 VXmtjuUtV6pE17LQfKKL1GbOlJaW2ahc7y2BGrrhYaOsBJt9c+92OFP70Cj8GUH4cpjt
 FP+5S80H/lA3PfnsxbmYnpY4GG0F1g+qU5vO2TzsFXTvUY77ZLJIIbo/FeIaxLDF36xv
 a2R0r4ph5J4G45NgcdWOmn1wde72VHauCcdnjAES4VC1OApf+xdpoHJrnLBL4816MbHb
 KfF6rPf/qLx6WS2D4wOZsqK+d6jo6DcvcytgBHs1PuU0pgP5sxVqEV35A3KcyEKUgdq8
 ljuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OGTDkR4LI4GDhkjGHuX42mV1KlnJTimkQ9agW47gbZY=;
 b=6nX+pCF6o1tDkxWVBSnrRZF2iiuGnWc97oVl9d4Px+TPfUfqDImrsfSJLg92/JUkqv
 vqMPom1hLTDtb+TF1x2t21JVP2PHb84pKi7efmqOdYuKCJjS8jnEZuxvEdaqy838aqmR
 XxUclQ1gH/vT1mTnJNZGMqbptYmpxgyAOFDDn2JSFebOMMNnjvoUthOQ/tkHVahsq5l1
 LFNb1xO45lHoHgLbE5XayxcoNa9gtMKB6WKB8vz2s9jEYiAyhrJYhGD9cnTb3l5CXU9K
 q4aBwYxBulxObJOO1aaeJoj3YF0zOVW0/3kBoXklHBLbJ2WY7sK4RBxslxfBtXk/FMNE
 qCZA==
X-Gm-Message-State: ACgBeo1xjDMYeposkBkJUuhkvGlhkHNFAAN/Dhc1xox1gA4QdAiYmTkT
 +zmiyxUlX8+sBmgR/O9qYq6hSw==
X-Google-Smtp-Source: AA6agR6EenKqtVnb6qh+v5OZDGtZ6StmoxTQ1eASfHElCzeymsfQZli0AJNuSum8kl6Yi5j4QTlgUw==
X-Received: by 2002:a5d:6047:0:b0:220:6dc5:73ee with SMTP id
 j7-20020a5d6047000000b002206dc573eemr9634750wrt.213.1660590198464; 
 Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on and
 enable=on
Date: Mon, 15 Aug 2022 20:03:03 +0100
Message-Id: <20220815190303.2061559-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 15 Aug 2022 19:03:29 -0000

The riscv target incorrectly enabled semihosting always, whether the
user asked for it or not.  Call semihosting_enabled() passing the
correct value to the is_userspace argument, which fixes this and also
handles the userspace=on argument.

Note that this is a behaviour change: we used to default to
semihosting being enabled, and now the user must pass
"-semihosting-config enable=on" if they want it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b2..49c4ea98ac9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "semihosting/semihost.h"
 #include "semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
@@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 = 0;
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
-        if (env->priv >= PRV_S) {
+        if (semihosting_enabled(env->priv < PRV_S)) {
             do_common_semihosting(cs);
             env->pc += 4;
             return;
-- 
2.25.1


