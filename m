Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQ93t-0008OK-0C
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 11:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ93q-0008NN-IP
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:09:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ93o-0003Vj-Rm
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:09:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso7986883wmc.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=r1xWEOHWHOt3MBY5xlN7HosIZZCC0kMBbMC4Q6TASCY=;
 b=TtwXxZPjJkqewIsyOPEc3rczi4fDZTbgvfeIB8B62EEbFXTpX1DESdezNls8TKf6rp
 AIz8NvnUyYX9s77mYAiAWnFsm6feHnJAHTIrgZeXP/jkJvN5qGlba3r/zLLdJ3tDKHhA
 r4zBpPe8IvpNT15G8mkNcbh4q0I22fukf08/3RNhTVisZG+kOhV56wAX9vkUoG/ogTqH
 IACPfzUAZQlgGeYEFtVE0NauI1TnrH5MTzLuUw5gAamEtV4fiQfw05jQxc7bZPErslOb
 T3IP+GPs38Oaq8Qm4J2z13whK6zI9fVSj56hCs/6U0EdkMp/zpm4TyYS7SD/8UduWIZr
 q6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=r1xWEOHWHOt3MBY5xlN7HosIZZCC0kMBbMC4Q6TASCY=;
 b=MO8E/Bqivof14rmV/Y40tJe4c0StUUaUOMqnn0Fg1PPrX5OgSHJc9ZT1F4+AM+kcaS
 6D+NVbMcw37ivJBNOG4CtipIIjF3OipwpCDHU9gOPeA3+5NIDJ/FpHy6t6XkXg/JgkK/
 Oz8M85z3ctNPV9CF7ZRJNdP+fgyhqz9R7VTRLEy7F+Td5WOCOom2AqobhCCet+hImYC+
 oo+3c8qC7h2fW6mM35u809cqYfuagl0pPUfZhd4RPnprrPZlFr+PCvg+nG2aZPkcfLwQ
 KY8BACMLlJg0ZzmPs/iNnYygDV0nicOgXiGeb33BbfR8Zgz8aiyEptv4o9MDfCUhwVzf
 81jQ==
X-Gm-Message-State: ACgBeo3hSD+MyPMEZDUxHxpJojNiwEqQIgF+9XHTitMSHMcqe/xCmIs5
 LJtIE9hE3YwqQLKXT4G3djUSgzx7ko7tBQ==
X-Google-Smtp-Source: AA6agR6DNN0E2mWTaHDv6skaCGzHgfGGwSghUnFjG6NR8aFSURYg+71PMzOdi3dTTRsdTO0DDp0h8w==
X-Received: by 2002:a1c:7c08:0:b0:3a6:2569:4986 with SMTP id
 x8-20020a1c7c08000000b003a625694986mr12318271wmc.117.1661177561665; 
 Mon, 22 Aug 2022 07:12:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 6/7] target/xtensa: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:29 +0100
Message-Id: <20220822141230.3658237-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Aug 2022 15:09:54 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

xtensa semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


