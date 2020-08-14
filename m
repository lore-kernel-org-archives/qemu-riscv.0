Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6clc-000703-La
	for mharc-qemu-riscv@gnu.org; Fri, 14 Aug 2020 12:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6clY-0006vX-Hf; Fri, 14 Aug 2020 12:41:16 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:50232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6clW-0002cs-3j; Fri, 14 Aug 2020 12:41:15 -0400
Received: by mail-pj1-x1042.google.com with SMTP id e4so4673410pjd.0;
 Fri, 14 Aug 2020 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lKUs7RsfnQHorD24cOgxBvy/CDttu+urOseKddDE6Ek=;
 b=LR6kurrOlFO0Rx3THi+2AlQha+YhDd9sVvQyOSSSKfMkf4nRrmBXFnB3bWDkyYMiCv
 O6sNKOth7zNiNyagGkaiEE2QHxoEKMjH6iLXz/7bIBG068DK8HBcLPMYxNhGyneyyG0c
 y8uP9GVSkAgXQXhYmIDZcwk+BLKi9/buMoQr2lynb5QeTOi2tf26cPjJbLI2SG673zG7
 M0groblXZQAN276rjt7ct/jXbvSFIpm7TLdlauM9w+8rCPWyhLqBoZbgfRXcT16DI1jW
 VjAfSLEWzdpCQVAPOtBYT2Lu0VL5b6KovOleuJsGudKVHhvbzNYR0vWdyRcz6inHmVtz
 /FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lKUs7RsfnQHorD24cOgxBvy/CDttu+urOseKddDE6Ek=;
 b=dAf4KhVUN01BqBukuas7JgoqJVNqoA8V01IyjBVhGCQwtgxB+/K/UTYlg42HTcP+0g
 E1rpgcmR+cREDAvssrSbsKTLBTO5R97JkYtoka6G9KtMWvdEf9izwbLVD3wqGQKKM3xV
 jOSObRUwVjIsvW5QGLPkUx0zXjwFIuqPIYplCe8oa86lUzUoU4/ESZkTbK8YRxo7LnRu
 l4Z8JwwvZuszlrbqRG04y7LCNXs81OsTQHKWybyLL6j2mcgrfGALM2gqi+sZ9PH63Jg3
 XTT3S2pGAOdHzPCvDyxpmccC2L5J29IRBDBnFkW2c1XhmNeOvR3YUpHYMiacdphrTOm7
 /JIA==
X-Gm-Message-State: AOAM532BE8N3ltjZeZ/iEfXw9JAiV0JMx07ZRSgVo4r+Ui3+yHsGZ0Ki
 Dx44zbHhOD9VmXYDFaVlG9w=
X-Google-Smtp-Source: ABdhPJwVVNRQJZDzxzOwpMBPVLYtDEeQGRjbkSqFaWHEsxlMNn7RfFoZJU7OhiCer1XE2ZUtb7eyeQ==
X-Received: by 2002:a17:902:9883:: with SMTP id
 s3mr2551764plp.271.1597423271182; 
 Fri, 14 Aug 2020 09:41:11 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id 16sm9836332pfi.161.2020.08.14.09.41.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:41:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 01/18] target/riscv: cpu: Add a new 'resetvec' property
Date: Sat, 15 Aug 2020 00:40:39 +0800
Message-Id: <1597423256-14847-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 14 Aug 2020 16:41:17 -0000

From: Bin Meng <bin.meng@windriver.com>

Currently the reset vector address is hard-coded in a RISC-V CPU's
instance_init() routine. In a real world we can have 2 exact same
CPUs except for the reset vector address, which is pretty common in
the RISC-V core IP licensing business.

Normally reset vector address is a configurable parameter. Let's
create a 64-bit property to store the reset vector address which
covers both 32-bit and 64-bit CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bd..8067a26 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -518,6 +518,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a804a5d..d34bcfa 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -291,6 +291,7 @@ typedef struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        uint64_t resetvec;
     } cfg;
 } RISCVCPU;
 
-- 
2.7.4


