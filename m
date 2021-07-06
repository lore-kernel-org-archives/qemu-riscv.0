Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0c6J-0003CS-Px
	for mharc-qemu-riscv@gnu.org; Mon, 05 Jul 2021 23:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1m0c6I-0003C0-R1
 for qemu-riscv@nongnu.org; Mon, 05 Jul 2021 23:50:22 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1m0c6H-0000jA-5o
 for qemu-riscv@nongnu.org; Mon, 05 Jul 2021 23:50:22 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a127so18283342pfa.10
 for <qemu-riscv@nongnu.org>; Mon, 05 Jul 2021 20:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D5A5Ewl7nsirJXuBn68BIIeUoz4BuYCdCCsGziBJUSw=;
 b=UZmqGQGtkpiditaSaIKu8hDapOjJi0LzcsbYslephw4iurAcnMQLF+LTSipWRhz5VN
 csOi4V/e0u44HPe7JyLUwcxPIpBYk3QqX7ywPbf13Zjfg8k/p4Hji7HGJeCvoWm9Crg9
 vBKS8IzXIVQrfhv6SoYOMQOE86CrM7H31B1z830Pp8Djcu/ph4bXJa7rh9Gen59+Rltp
 zZKxP373Aap4e2YrC2NcIOYLYY2Ta2wtXEW24JfirR8PgCkCnkX9s76lLyIcZ0upI5oB
 hRDw9c4se++YrgSSC5nQDYkqdp4hIrGJkAc5uUsGt19w6UHv8EGKT2ZoBNZcz6+ZnyXo
 r2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D5A5Ewl7nsirJXuBn68BIIeUoz4BuYCdCCsGziBJUSw=;
 b=MjJIQGWcjvsE308PCBfLVoaIDSBf8zIBSe34Fp1OUa8adH8U//ryoT87ZMycW4Otph
 LidRW91qRjbami8Muq3wieAALseiR2OdomI3FrxZmlXyBm4bgx4562EUT8mHQHfr1e5l
 6OAC7Nq5txNwwb/csxjJ0LwLVlFn7HySfIHA+RVYU1zwn2rnEj9dDw+FBv/XBsSeLVSH
 1WmJVSEUY9/VjZ/jcqOlAIjjAcrrkN+2mTTdXGN4Mt9VOo6o5FglAo9e4XbgEbLK85o2
 77NfyZhDIu2jXOo1+FZcpR38MVM6SIwyXiUCdSz+Q+KqBJfPca93z5lbjMzTsWt5619c
 URaA==
X-Gm-Message-State: AOAM5323p057PW5uFN61cUrOA6eqHIOqvcaMgpXm/vqRO7fpQwRQ6h9x
 LiMBZVHDztNTHrvhuiyQU7hPKA==
X-Google-Smtp-Source: ABdhPJx96S/TIlHIXT8MN6EiZt09wYQC38nr1dftUB7gs7LunWQkRDP34uD+qcPlavRrXRBW+I1hSA==
X-Received: by 2002:a05:6a00:2494:b029:31e:2c3f:4186 with SMTP id
 c20-20020a056a002494b029031e2c3f4186mr9912078pfv.25.1625543419386; 
 Mon, 05 Jul 2021 20:50:19 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.HINET-IP.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b4sm12650096pji.52.2021.07.05.20.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 20:50:18 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH v3] linux-user/elfload: Implement ELF_HWCAP for RISC-V
Date: Tue,  6 Jul 2021 11:50:15 +0800
Message-Id: <20210706035015.122899-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=kito.cheng@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Jul 2021 03:50:23 -0000

Set I, M, A, F, D and C bit for hwcap if misa is set.

V3 Changes:
- Simplify logic of getting hwcap.

V2 Changes:
- Only set imafdc bits, sync with upstream linux kernel.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 598ab8aa13..42ef2a1148 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1434,6 +1434,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define ELF_CLASS ELFCLASS64
 #endif
 
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+#define MISA_BIT(EXT) (1 << (EXT - 'A'))
+    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
+    uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
+                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
+
+    return cpu->env.misa & mask;
+#undef MISA_BIT
+}
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.31.1


