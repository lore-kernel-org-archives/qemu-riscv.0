Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXbj-0005hT-Pt
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbT-0005a9-Ki
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:22:55 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbO-0003pu-My
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:22:53 -0400
Received: by mail-ed1-x535.google.com with SMTP id 29so9828844edv.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aKbRoFYpyWQq6lG2nZ7OcTh1eDfc3FMAkgtdEXuGp5M=;
 b=Nn35FHxtnu+IZkF+3zS+nlZgU7QFrj1cJ+97yeKNQPNPdKb/b22IwhEosXdWQ3o1n8
 WtsX3e0eDpbrc9KJupcujUM92MJt+ZNTT61nk1gUashX4BU9ZghFJysc83OS/NOhP3AR
 m799085CmlfR5d0sv0TV/MrQQbmla/cy2q+Etr2cyHAmNPaR5G8W01m8i1GS9MC5uqba
 ieY4MGeOVK79tT8ECoMt6rd6yBqdwmkk9SzMGUpKhoRz3xcgTErQGluj3i/2/Rvw95AC
 BhUZXSbgOAyfrqXbzM63QvUI5SgkwT7fku6cIyNmhob36l+bZI+hxTPv1I0DkFC39NOa
 ueYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aKbRoFYpyWQq6lG2nZ7OcTh1eDfc3FMAkgtdEXuGp5M=;
 b=mWbw1M2sYm//wiNsIVCG5trZWhBSOag2DgS5Sx5KCdg8YSJ0f0q4UJ0sprNwj0X1b7
 M5a1MS55BI8oLPm8bpMBkwFq0Ahs6ISBcEKHXC9vVZpl+dH+irNc14xhPZNUv0JqdTql
 u5e72ONeVymYg2J7w1taH0i6MrlAUUqlKUL6lHbkHa1+NcpfPxahOx/wc5aMlveCEgHV
 RPbfnbwAgic6y7xSVJNgbCs1E+2Jx4e4vTg0eZcvIAz5V3cbhujWlbpIa3knTAprsmJa
 CQWbaAzu681I5g2sNsXy799j8W1TeG6gXT5ugYD+UbdI5z7YqbCu8dSjuSY3T7ihp9o2
 eWuA==
X-Gm-Message-State: ACgBeo38434Cw9mIY7WoJ9svVKht4jWcZwvRkIloAFhdODFGBzGMwdRB
 1fVAIxcvHUmRLiTu1oUb+M20iD7RWOkKe0uV
X-Google-Smtp-Source: AA6agR4HjSrFaQX13TQm33z5sf/01d783XOxpRQU7HKfnb9NkGnbkgbgAgsKXx12g30/y0zCDdNl5w==
X-Received: by 2002:a05:6402:50cb:b0:440:87d4:3ad2 with SMTP id
 h11-20020a05640250cb00b0044087d43ad2mr47322471edb.219.1662466968575; 
 Tue, 06 Sep 2022 05:22:48 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:47 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 01/11] riscv: Add privilege level to DisasContext
Date: Tue,  6 Sep 2022 14:22:33 +0200
Message-Id: <20220906122243.1243354-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Tue, 06 Sep 2022 12:22:57 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This allows privileged instructions to check the required
privilege level in the translation without calling a helper.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a94..fd241ff667 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -59,6 +59,9 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+#ifndef CONFIG_USER_ONLY
+    target_ulong priv;
+#endif
     RISCVMXL misa_mxl_max;
     RISCVMXL xl;
     uint32_t misa_ext;
@@ -1079,6 +1082,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
+    ctx->priv = env->priv;
     if (riscv_has_ext(env, RVH)) {
         ctx->virt_enabled = riscv_cpu_virt_enabled(env);
     } else {
-- 
2.37.2


