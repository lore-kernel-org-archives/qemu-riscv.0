Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNfMz-0002v0-9q
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 15:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMy-0002t9-72
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMp-0006KN-VG
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id bv3so10096587wrb.5
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 12:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sjyUnMJzfq++0t8oacR/+QsHL+4P2X7RJJ6Y2pg/KDw=;
 b=UAj+CaFGYzEL5D7ZNriTDW2N797k1BN6Unm69rAFCPmO2hcVm+vkEeESdpQJ6eSDQf
 AFbHWqnSV/jqgkVJXkdIaFvvolSyadh41KMoII2FTx3yLWKN4Q+WY/a8snn2hc3A5HLm
 BRgGkdFRvSJ60eajasO4kykeAl7KzDv1TdHFXmvJNJClB1zbSTujppZ/nMfZw4KnHxb8
 d8qlOnKn2f5ihClsar14O9GrtYNL0ooMGtI/vRjEb0bTsGRVR7mK7S8hUQ2053nvuMge
 5QIcmJhcO9ZqM7UsODkBMXrCho6owfYQlNq+9onCMZjFg9ynF3bBepJqQ6E97fHrOI1D
 1fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sjyUnMJzfq++0t8oacR/+QsHL+4P2X7RJJ6Y2pg/KDw=;
 b=A8q03Sth39ojsKYot2jILDKY+p9GOUzLwCmygLz2ITFl41vVWg9dT//0lONZ2WTodY
 +/iPCrpcMSFZDazqWYV9f9VOkgnWuD9lRXOPk1DKMNs4X7Je76UmSy5+61l/GSFjSNzx
 DR/aTaePlolwK8z/7RLc2ghDBnqHEvpGyS3SrPnf+N3BggSNRv9GdGv3QFnC8C4fvdBQ
 DscGNvLqpPjGwoxw2SPZDv+WOokgXpdm1o6AfeThc/mzGeepateMH1Inrc4C95HL35vQ
 m54ozj0gTPuX3NKwy4OCxlrO7C1m63s3kmbCe3G+MyEPCjKavkJ2xqos7mKT8cZFz2ua
 Ly2g==
X-Gm-Message-State: ACgBeo0qDy6OVRO/+0R0Fwt0yEebQbXQMNOK0toM9+lupQHFFaEVxxDv
 X/lx35IXgI2jw0SgwjWKTNHCBA==
X-Google-Smtp-Source: AA6agR5qp8Md7YBV5/7MNmmGYSntL1TgcfK0XGcCrzL5Nh6DY2C8EmLCSDg7IrKv8sCBSZ2sdxdQ/Q==
X-Received: by 2002:adf:f7c7:0:b0:21e:fc10:b81b with SMTP id
 a7-20020adff7c7000000b0021efc10b81bmr9854483wrq.51.1660590195164; 
 Mon, 15 Aug 2022 12:03:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:14 -0700 (PDT)
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
Subject: [PATCH 5/7] target/nios2: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:03:01 +0100
Message-Id: <20220815190303.2061559-6-peter.maydell@linaro.org>
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
X-List-Received-Date: Mon, 15 Aug 2022 19:03:24 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

nios2 semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2b556683422..d1786b43a69 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -817,8 +817,9 @@ static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
 {
 #ifndef CONFIG_USER_ONLY
     /* The semihosting instruction is "break 1".  */
+    bool is_user = FIELD_EX32(dc->tb_flags, TBFLAGS, U);
     R_TYPE(instr, code);
-    if (semihosting_enabled(false) && instr.imm5 == 1) {
+    if (semihosting_enabled(is_user) && instr.imm5 == 1) {
         t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
         return;
     }
-- 
2.25.1


