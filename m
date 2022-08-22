Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQ99h-0008Or-Fa
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 11:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ99e-0008KO-Ac
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:15:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ99c-0005AC-Tb
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:15:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso6189866wmr.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=otAuKbBd7la4jsEiv/+EcRkvB4vfTN2cbw4MQWM69+A=;
 b=iGrhbUTYZzSuMCovEXQuIMu2UGmKnnYiHdDlMwDoy6GlMj9NKUHv56fC0OgpwsIsKg
 kM5A24R7LWh2SHaQCyqJMcwFCJoO+tHHazR7NNBTQha22ewFwhETodZq+iFsNrK/DIeH
 Cgcwp4aFpNQM6aM0bA5aJvcyeiVly9aKJnngSdz9y7VeOBoqPgzJ8Q6+BKw+iHDT2q8o
 9grvbo9KeApdAM0vA7TdBbchqEBsZkqMXqxFtEwLEx7SWJWE2qy3KOkpnmsJQIqP52L6
 eKGCH2BGOcZcyQa7A3k/ZwJeDAWxzjyEC4PG4z4CDDfVXgyqO7rfitdhL/PElCh0ag2N
 Yafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=otAuKbBd7la4jsEiv/+EcRkvB4vfTN2cbw4MQWM69+A=;
 b=fp2q4r4et2gq4NAA5uj4BtjOZjKcFi09EPJAEr6v7m/6YdOzoZVx+IoKmU8oejdrFY
 79wuRh7CS/sGYhcdli9ecbNcQXRYKjdDEIPYeMjQ98FCqm3695aGVvp7zzj2ClCaQuL8
 jrxUur6pn5qhJ7e7BDPQ5d8Jt2qzliVZ8EjZl0+kqqgGZiUjHPJjR9Avz8x9gc7x4DmA
 52gWSlA5sSc8z4hBedIRnn6u0Mrv2R94pzvZucv8riQ5A47z/Wmop5JwR8nVT+TOEpzc
 5vqsioEhuHtraxipuwJ1lWmvcFBPQVficdir795SZ+PP2cEqnAif2usjiI1bFzOot1Nc
 5QOQ==
X-Gm-Message-State: ACgBeo177Ke70vX353ZmCvdh0Q24t1/lF2AqlyC3IpxleIH6D7wDzQW9
 lwrx3jvFw8Q5UE1YLNSDauKxKyvldn1Nxg==
X-Google-Smtp-Source: AA6agR7kfN9t5Yvi9jiAceupzqjGq+sYLW38v7WIYrUvSANg4jCdu5uM85Ee/+XIk32mpmfkvYy4fA==
X-Received: by 2002:a05:600c:4f4f:b0:3a5:a530:4fd7 with SMTP id
 m15-20020a05600c4f4f00b003a5a5304fd7mr15782794wmq.36.1661177560235; 
 Mon, 22 Aug 2022 07:12:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 5/7] target/nios2: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:28 +0100
Message-Id: <20220822141230.3658237-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Mon, 22 Aug 2022 15:15:54 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

nios2 semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


