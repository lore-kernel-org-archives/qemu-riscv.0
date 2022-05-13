Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npdZF-0007md-LR
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 18:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npdZ9-0007ko-Dj
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 18:15:21 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npdZ7-0003dU-GZ
 for qemu-riscv@nongnu.org; Fri, 13 May 2022 18:15:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c9so9233924plh.2
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsraKeFlfnb9TgM6xNyBzf8fAKUPtnh6QbNo2XUloGQ=;
 b=4Wq1ZExoKw5jDks8AiLQPaadmAweVd758eVdOBJpJkKUilYq7goKgotkjdzipqMl0c
 RmjFWmBbfWdYi/JCriV+QkTfvnOd0avIg7nPyazCD4dot55NqY8Cu20CVmbz7AmsVWfe
 ska4mZUQPc4++FZ+c+FSKxV5n4xhyjeUfGyHT6eCSO3c4XG3eBDei9MqO9OOD9/YQzqu
 UJxCsnxtn7fvNwbc7GOckLfyzFNeX/1/DdVR2Kcc7I71r9Zp5k9aLtjYlyOR6680++1U
 JFUAcuC3AeA+46ePI4p5afI+hfOG41QbuNlQrnDdXNwPIKbKknUNVnAwcfd+aQ14VX/e
 Cs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsraKeFlfnb9TgM6xNyBzf8fAKUPtnh6QbNo2XUloGQ=;
 b=dn5y8Ov7tMj1WKRm3pTBmu4ErBWbTuKAE7eYlPTj8JLfcXwzZ7RHaQFFzI/6BFTiUl
 9K3PKX9Hsi/ZjKvwRxxAP2iWTcjjveVMmW05+07UykpojhxDgmgdUP3wbh2QUYYnlv7h
 wGj4JsiMveKKZOKoROMA1bcBrDq/hkFZod2pOicU5IEQdRODWbcdZWC1rIdDMX3FCdR9
 y+gp3q4ODit6NlnWaGioqcE3unoU4SodQQzRUljpZ/0jQAaBGUUtFXeKfymbUEc2EiN/
 bOF6GMDQ1/hVEh9lEL/LYZwlazHlZk4Pws1JrqDQAyyHPSxsSbD1K2JuJB9qKrEbHySK
 t4Pg==
X-Gm-Message-State: AOAM531Cc8r810oVIOHec3fy/GH1heVopCqlMQsGjzJZDJ4f32/39pj1
 rYrFALZznPZcKAz5tKUKRX6F/w==
X-Google-Smtp-Source: ABdhPJyKtyzZfzmFJL9hMi74+cYluM0cU2xnc+JyESXAmjV3gyIn0oVKKTlZWPLuqA7Xm16t4mOoJA==
X-Received: by 2002:a17:90b:4ad1:b0:1dc:96fa:69aa with SMTP id
 mh17-20020a17090b4ad100b001dc96fa69aamr18156889pjb.189.1652480115723; 
 Fri, 13 May 2022 15:15:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0015e8d4eb1bcsm2508937plh.6.2022.05.13.15.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 15:15:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, qemu-riscv@nongnu.org, dylan@rivosinc.com,
 Bin Meng <bmeng.cn@gmail.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH] hw/intc: Pass correct hartid while updating mtimecmp
Date: Fri, 13 May 2022 15:14:58 -0700
Message-Id: <20220513221458.1192933-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 May 2022 22:15:21 -0000

timecmp update function should be invoked with hartid for which
timecmp is being updated. The following patch passes the incorrect
hartid to the update function.

Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register writable")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 0412edc98257..e6bceceefdbc 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
                 continue;
             }
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
-                                              i, env->timecmp);
+                                              mtimer->hartid_base + i,
+                                              env->timecmp);
         }
         return;
     }
-- 
2.25.1


