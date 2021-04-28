Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbjlK-0002X9-Tb
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 08:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1lbjGG-00057p-0I; Wed, 28 Apr 2021 08:25:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1lbjG9-0003Uj-6H; Wed, 28 Apr 2021 08:25:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so9047786pjv.1; 
 Wed, 28 Apr 2021 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvBfaqrLHb4tu0gCH1aT7tj/L5WkCn4OrGUbeNLUnBw=;
 b=facdhzlgoRXwL0rvuXaauzuuA1ex9leW2Y7ZTjEHHPoGtb9pPb+I3pUmndGqiSsZ6s
 k9SYFjUF7nZxxWKVMvOK+VhLLgiEa2qgmgKQWO9dlBV1jtkHE5YzOLsPUE38tGI7QSFG
 ljHGjMzNThDGo8SSCUXLLrl6FaTpfD8OyRmPSpkyg2UmGF1J/2MyWK7cxc3gIhIrG16/
 MgReJmUXjlNBAVR91jhoMWnB5uSjnRBT9MLzjxuA716hwxXJVwb7bogNvpbjXbbQqmEl
 wmZ05Spiau19Jr94sM+WeGaQEtQMehzBFIvYu/rHUFC6CW2/7yleANDwaV8eE0xdaKRl
 RMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DvBfaqrLHb4tu0gCH1aT7tj/L5WkCn4OrGUbeNLUnBw=;
 b=D7cz2jcSctCZWM+Xo+7kfMWp5s/cDEG7S/DhBQvHzYZ6g8rBmLViu3E07QEuhvGuZD
 VC8KTbA6YxY/uVXxS+g5U15RR5FWhDuhZh2pi+03q0UK0vHA9wZt7o1t7ooYjzpYl7He
 7yTHWoVAxuI+GHfeQMQdvB0kaCwYw0GAugtQWTj9YrCu48DysK1ygxI1k+YYKi6Ltl0T
 9qavWFMA3N21Vg6Q0CoF+rerzdGsf8cCEtPrvQXhzDK/fAfAC1DGRJ7WAnHzUa8+4HHZ
 LaXZxvaboXe2RLct1Vk9FiO0SdXY1wsmLbPbq58r+QVUFmWW/147UhOyzBCyzuMmaQXw
 OVVA==
X-Gm-Message-State: AOAM533VbWFz3AmF7jzbpibfpVMr0yKIgZ3ztpPiyA2Pjc7+uzsn+vKP
 vwiPrc8qEyhJ10RVy0GCqz0=
X-Google-Smtp-Source: ABdhPJz+yTwxc0yEO0RwfwllRcNzupgnX4wZjdtnMDm+Wq/huLLl72G7oFmBEOU8WkpByrYqNIy7YA==
X-Received: by 2002:a17:90a:ab02:: with SMTP id
 m2mr33610241pjq.194.1619612735807; 
 Wed, 28 Apr 2021 05:25:35 -0700 (PDT)
Received: from vultr.guest ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id v21sm5017236pjg.9.2021.04.28.05.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:25:35 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] target/riscv: Dump CSR mscratch/sscratch/satp
Date: Wed, 28 Apr 2021 20:25:28 +0800
Message-Id: <20210428122528.295103-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=changbin.du@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Apr 2021 08:57:54 -0400
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
X-List-Received-Date: Wed, 28 Apr 2021 12:25:50 -0000

This dumps the CSR mscratch/sscratch/satp and meanwhile aligns
the output of CSR mtval/stval.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b67..73af6f5445ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,12 +281,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->sbadaddr);
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
     }
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.27.0


