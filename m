Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbStl-0008Hd-4e
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 15:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbStj-0008H4-8x; Fri, 15 Oct 2021 15:29:43 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mbSth-0008OS-KW; Fri, 15 Oct 2021 15:29:42 -0400
Received: by mail-lf1-x132.google.com with SMTP id n8so45671410lfk.6;
 Fri, 15 Oct 2021 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAThpzEExEQywLhzKwYqOthFiPfhu8r+HsDpRlEN3LQ=;
 b=XdzrgXKGoH5X2nbbq3X0v3OYexVR2cIr1cYYuj3EL2dBKi5e9LnF0RwOsCgB4En+uL
 0Yj5zkJWOHf0b4uVcxxL5uH4MSvy3TC58RtmUtCQepgmUxoo2sVUuslwxJQm6+IQb6kL
 nG+e6NEsLqM0WQtXPy9zq3PYRaBbNErk2olbb8G7MEZaQaQ9Yw/LnnLPTYmZZxoaGK78
 W7m/wksBrHWdOY09IJr5GwNgrAQQYGzfzluj97wcsGmusHaU+sjJoGXvHB6a+FJmbkNE
 bgYx2LlnfN3UFza50dPwR4oM0B4UwksZZADAGWU5mESSGyNoLuFN+Uu5Eg56oQEHacj/
 uEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAThpzEExEQywLhzKwYqOthFiPfhu8r+HsDpRlEN3LQ=;
 b=e3Vy9ov6hLKLb3XlspizL0ckyX21OW5whwc9QqpBz4xz0FyLUh/ilRp+KawCOkuqGx
 pwYWhQCTlbukUP7vklQN29nWEqpPDZg4SMm2ocdMeTZUOrJYi0oVPgA7zQW0u5zScDPT
 fxjUmLrJ4BCdzkuy08ckANsc9MYgO4AZEO/1/znsps73SN5w0f3KzH0UD6de5pCLUOdv
 w9hLLx4Gw/VGkS78NBV7NJjWWJv827k9IBBePQPdACvMFBHIgDSz1tYFQ2KNFR0+HFm7
 L8wrHXGLuvxcR1ScYGhpauW7FaciAhYJS9npCKLg3LV7Mdq2NrSmVWcNbiM1dJfDzcp5
 oQ3w==
X-Gm-Message-State: AOAM531leCnzFdmJRb0VUKaBpTkcJgaUCuj/7v6Bdt/8DdTBG5IcZaP8
 64QWueac/8IumRdLXWeNCb0=
X-Google-Smtp-Source: ABdhPJxwIBiLv91pJtGVJZJGTC7ZOgdSTAdw5j5s4SwM3H7EA6rxqCdBZV1sz3ynJxVFi5IGBGlRfg==
X-Received: by 2002:a2e:9dc2:: with SMTP id x2mr4979575ljj.253.1634326179797; 
 Fri, 15 Oct 2021 12:29:39 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id n19sm527261lfu.207.2021.10.15.12.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:29:39 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v13 1/7] [RISCV_PM] Add J-extension into RISC-V
Date: Fri, 15 Oct 2021 22:29:25 +0300
Message-Id: <20211015192931.227387-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Oct 2021 19:29:43 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b1..3f28dc5f3a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -289,6 +290,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_zba;
         bool ext_zbb;
-- 
2.30.2


