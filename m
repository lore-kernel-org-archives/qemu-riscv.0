Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6IqA-0008Lq-Kc
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 17:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iq7-0008JP-0G
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:05:59 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iq4-0005gZ-NR
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:05:58 -0500
Received: by mail-ej1-x633.google.com with SMTP id jo4so341443ejb.7
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 14:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exsCe7wqZHx39cKtIHty5MCcAiVROc/nRl0VHcIQsKU=;
 b=byTpMti4F7j1AT70zf5hdcZBnjoRJI/GNo0x+g5nfmK44hjKdofc0zgxky8GBZTF9j
 G8Onm2k31BgznW/DBrlM6XiKl8ZJpADULRyzpWeqe0eWglWuqqShWLzDIV988NhEQwHj
 xjHqk87C2nTVuoMifVukHrhsA0huT7t416wYbvl1aH5r/68pMfDTQU5sEev2mcaSKxNV
 Efzuvap0wIWSY/2UuOc0ppnrub4jZ+pShTVMT0n0YazQHcUuHvS2ji2sUSdx0QD+GSEa
 gEW8fgl2EByKexX19+7vNWYXAMeYViqEJn4Y8JcIiZ3HIGjYiN8Q/yQAc4Cq0RdvCPc9
 D3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exsCe7wqZHx39cKtIHty5MCcAiVROc/nRl0VHcIQsKU=;
 b=q8/RaoNYf8PHSgrxCPlPsnYjdzdCsyMPeJMl9SZ91xumOTdK0vBm2KIjbC5z85Zlct
 EpsIInAXxiN2PGwtAOSputuvNONxidaK3uM7Oizk24io5qG9G1zJ1mNtsoaRpZ36il3L
 2q0HCFIuPze93CDjWXNWHX77N2II3EP29IjZ/LQOtzeYYyWq3PG+hQqEutbH0V6C/mhY
 870QmrakCwYQt+/omKG6PFbiv20hm7PUXksKoaL1gWuAS2IuqNSwpQktzKGI/XjjjILw
 3+BVfPgPo/afwCe1WGtllsrWeLj+Uyy+87X/s6OYnJAbrGgVZtuU/Fy4Oq+wP3HE8Yjv
 KMMQ==
X-Gm-Message-State: ANoB5pmdOGwl4S1CtKx494CdKlhya8SYO8GScn3IdM2enSrl4wteagQC
 SxTZH2jj29b+1jYniyLiblKvMw==
X-Google-Smtp-Source: AA0mqf7g0g6ryxpPtX73BWZYR3b4/Yv49OJXAmxRuwI4hMeAK/zpT8TTx7rJXCWfZtuY7bbo5Rdd1Q==
X-Received: by 2002:a17:906:ee2:b0:78d:f454:ba04 with SMTP id
 x2-20020a1709060ee200b0078df454ba04mr29013194eji.3.1671228355449; 
 Fri, 16 Dec 2022 14:05:55 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 pw18-20020a17090720b200b007bd1ef2cccasm1260491ejb.48.2022.12.16.14.05.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:05:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/10] target/hexagon: Declare hexagon_regnames[] in "cpu.h"
Date: Fri, 16 Dec 2022 23:05:31 +0100
Message-Id: <20221216220539.7065-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 22:05:59 -0000

The hexagon_regnames array has TOTAL_PER_THREAD_REGS elements.
TOTAL_PER_THREAD_REGS is defined in "cpu.h". Instead of pulling
"cpu.h" in "internal.h", move the hexagon_regnames[] declaration
to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.h      | 2 ++
 target/hexagon/internal.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 2a65a57bab..9e8cd5a257 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -178,6 +178,8 @@ typedef HexagonCPU ArchCPU;
 
 void hexagon_translate_init(void);
 
+extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
+
 #include "exec/cpu-all.h"
 
 #endif /* HEXAGON_CPU_H */
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index b1bfadc3f5..1a6386e0ac 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -38,6 +38,4 @@ void hexagon_debug_vreg(CPUHexagonState *env, int regnum);
 void hexagon_debug_qreg(CPUHexagonState *env, int regnum);
 void hexagon_debug(CPUHexagonState *env);
 
-extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
-
 #endif
-- 
2.38.1


