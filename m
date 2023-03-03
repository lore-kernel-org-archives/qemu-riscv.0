Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zI-00088j-UI
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zH-00087y-OP
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:59 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zF-0007zU-Pd
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:59 -0500
Received: by mail-pl1-x633.google.com with SMTP id i3so1981553plg.6
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832916;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xX9YoSlLa+3ihvCOlNB2JgR3BNTq1PpQmJ+xcNb0lYg=;
 b=ClK2y2OfxJm7n0NGGgdJ7jLJ7wByicD9GPynkVoRAtW0NXINqAwIdbYTHxilLH/xJW
 dpHblgq5dWQQ23/OxG2IGpbcNnuO3nTxWdHbfcJHpkVQHvpp5tjuJXZesz/53+NYCx/K
 7DeTCOE1uRYQuboyzpkyzWITvrBcTuLhivlCnoynIqw+EQV7T/N1qFNGXrdI8dLMuqp4
 hiNtdFcU1Hmr3KiIKaBQDB/gvKzRLIBBZQ/gPzsAkqi9iFBqqgHV27L2qSt2yxp9GEFM
 BPd3AdO3t+uPNg9+DTO9uSW/7jfRnpfVL7HNXf+audKbZeJlmJq6oW54hv0CyvKf1Tuq
 GToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832916;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xX9YoSlLa+3ihvCOlNB2JgR3BNTq1PpQmJ+xcNb0lYg=;
 b=EvWM2Q0PDmv3k30ZdlGrLDT7JC8SKSG70H/mMwEJafo+fGEGaWH49D95CCOXLC1d1w
 sRBpbQ6nDUGfJCp6vSMiqHmgUq/RKX4VKqi9KXeRCiB5rC4IoE7NUiaikrbJ87tRK2PV
 3y+BF3GGueze5UjtKcnH8TvT56E8LYL/Kc/9Km6jfNSW9tI/nAQz+MRZBqf2shFiNQC1
 3OnnbunWtmB1Bmqzd7PVhSEjuZlrzNVluLBJaIgFR1skuwADnX6KyRiWebOktBX1iZD4
 tj3JrNcNFlKmGwswoLM6PMEht3SeLWbgrlPQIc3ggb3Vt75RmTWdPBQlwnzoWihc/AvI
 3/tg==
X-Gm-Message-State: AO0yUKWF/6hPRAG3R7KMY0ruYV8JCo0Mi+1rWJkvQ7QaGfKUf+maXl+R
 iKm7kCY1J4YRVumcYuu44p/MNBVXl1BQzLoH
X-Google-Smtp-Source: AK7set9+lqxqXkM3zJ2QMCLDUUa2AAoohVUAGFzHc2rxQIRrDs4zAIp1cCT27bUswx31wY5scLyEdA==
X-Received: by 2002:a17:902:a985:b0:19e:7f80:4165 with SMTP id
 bh5-20020a170902a98500b0019e7f804165mr1132240plb.17.1677832916136; 
 Fri, 03 Mar 2023 00:41:56 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ka12-20020a170903334c00b0019d1f42b00csm1002981plb.17.2023.03.03.00.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:55 -0800 (PST)
Subject: [PULL 28/59] target/riscv: gdbstub: Minor change for better
 readability
Date: Fri,  3 Mar 2023 00:37:09 -0800
Message-Id: <20230303083740.12817-29-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:00 -0000

From: Bin Meng <bmeng@tinylab.org>

Use a variable 'base_reg' to represent cs->gdb_num_regs so that
the call to ricsv_gen_dynamic_vector_xml() can be placed in one
single line for better readability.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-5-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index e57372db38..704f3d6922 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -385,9 +385,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
+        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs,
-                                                              cs->gdb_num_regs),
+                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
                                  "riscv-vector.xml", 0);
     }
     switch (env->misa_mxl_max) {
-- 
2.39.2


