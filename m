Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNfN4-00038G-VL
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 15:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfN1-0002zk-FI
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMr-0006LF-Nl
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:27 -0400
Received: by mail-wr1-x432.google.com with SMTP id z12so10075398wrs.9
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 12:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5A8TTs3Va2xGJWkOhhlXWoJrKWuE9dh71r64qnA1hXg=;
 b=TeWQ0uXTpUmhrYxNlSOllS4QmD8AgsYS2jCWVfMlAFYXcQg2q8CEwCvzAKIYG86x1g
 uhlmYiGFqLV0s2WRElGq4bgYA/Xs2y1MIEoJPuwfB7ZSaZ5u/hrzSiEbfRDSXu1jYuU4
 ORn50gpZ/884Cr0T9N0zuAoYGNpSM3I+3PE32sDYDc2aq+xzV4Gj2uKyV2YVBgwrsGf2
 E4GycyuDeNprCM8ZAfVYFljaGEvUg8Ba++BKffpBcHQR7RSLpAyjm3wFszg0IjxfLQwD
 CFabguJUycjq5iVdrNRfLdbbls0bRnAxaidcXMaEFrINbd2oYydBtmLnt0eX87esq+qC
 rlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5A8TTs3Va2xGJWkOhhlXWoJrKWuE9dh71r64qnA1hXg=;
 b=0JLRUI7rrLVBfs9csSKNWCuDOpeX6Qz28sdzRXV32SdAkDG2fvzz4hqMc0ynZoj5Dc
 yrWSs6vM9Uyl/Ikvx8gwouFu10ONMoZmxoxsFhqeXMlXmMUUF21p79DShIaUpwCVhDCO
 O890+YrTX2ktN08JjiGDgj+U1naqoFhQSLMkUk2cqpvN3257jBZ25lX3Y/v0F/5AZ8yq
 JLL7OBwgggZ/XIy2eC8hVjDEDOmp77bZVaPzlnB2gNzjtj7XkXB/La3/B7teLy1lw9td
 TXWAcIUTdiPHrGtEMd6tkoFgj28Y4daa4nic7GcuthyFZKTo4Pp4uOoEtD74qvj3FIPM
 O/qA==
X-Gm-Message-State: ACgBeo308i+Mid4n6xgdJEnw+Fh9mJaL88toqQqDLvE6fVjfTfXbjGin
 EHqNH5pG1HM8GUn/8+4HnBUH8Q==
X-Google-Smtp-Source: AA6agR7ivGz6wiE4XkaUzAm7deCGF44hrBsgRWnrw1bfLTzdFA1uFKt/1pXreYySn9bfTKFExHCVZQ==
X-Received: by 2002:adf:a448:0:b0:223:a061:521b with SMTP id
 e8-20020adfa448000000b00223a061521bmr9765234wra.695.1660590196996; 
 Mon, 15 Aug 2022 12:03:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:16 -0700 (PDT)
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
Subject: [PATCH 6/7] target/xtensa: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:03:02 +0100
Message-Id: <20220815190303.2061559-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Mon, 15 Aug 2022 19:03:27 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

xtensa semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index dc475a4274b..43d55989349 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2360,13 +2360,14 @@ static uint32_t test_exceptions_simcall(DisasContext *dc,
                                         const OpcodeArg arg[],
                                         const uint32_t par[])
 {
+    bool is_semi = semihosting_enabled(dc->cring != 0);
 #ifdef CONFIG_USER_ONLY
     bool ill = true;
 #else
     /* Between RE.2 and RE.3 simcall opcode's become nop for the hardware. */
-    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled(false);
+    bool ill = dc->config->hw_version <= 250002 && !is_semi;
 #endif
-    if (ill || !semihosting_enabled(false)) {
+    if (ill || !is_semi) {
         qemu_log_mask(LOG_GUEST_ERROR, "SIMCALL but semihosting is disabled\n");
     }
     return ill ? XTENSA_OP_ILL : 0;
@@ -2376,7 +2377,7 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    if (semihosting_enabled(false)) {
+    if (semihosting_enabled(dc->cring != 0)) {
         gen_helper_simcall(cpu_env);
     }
 #endif
-- 
2.25.1


