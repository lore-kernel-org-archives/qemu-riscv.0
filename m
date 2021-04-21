Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZCyf-0006qQ-GT
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 09:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lZCyd-0006o2-6p
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 09:33:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lZCyb-0005nS-Dm
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 09:33:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e7so32425978wrs.11
 for <qemu-riscv@nongnu.org>; Wed, 21 Apr 2021 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zSkFusyEvXXQUVc2IgzyoEjzFxTRCgOWIAsV4aalh2U=;
 b=B1RcB584z+cL3N4OTeh5aL9inBWL3RUqYkuIV2Qv2uQI2YnKswc0MxdObh/d7hCZMT
 pV+gzCfmoILGflUZAEY86+FkR2heeI5t0BmHnX0ecQXCVnOAVDEnZJ+EbhnVIi4XnEVp
 d9bx7NTzOPB6QStceOinqy9sP1pr8S1G5OblpNEwCCuOHL4JQNTu9sbb7OQhm9sMz7cM
 ipQ28GXL+F8XzOkFcwgGkZOXOaHlo2J8aaTqMQQ62Jt0S+Wm7cE1B6pO7Kfx5Aykts7f
 LS7N9hBqZpfvOGm8ROm1MEGTRzIwObk5m4//+ICNJEmKHkH/m3lWHG+qYHYbMePzXC3P
 wMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zSkFusyEvXXQUVc2IgzyoEjzFxTRCgOWIAsV4aalh2U=;
 b=D8chj3IsT2TUtSeltbl7TRAv1iOQ+j9hIeusosZFiz7jsvvcyOJjGkYI37COoRwPVC
 MwwJnlnHVsjnH0eWHvKuouLIPYphFuToEBvWScKD7jSbEpukt+kZekKquQKh4iLiJzfZ
 li8fMDs4Y9nbYRiUeP6kHaNs70YP5+GC6oaPNHl7+xtACtdAt/ZEuXIO5NdUX4QcF+t4
 nAE0L7YuOCS7pPULiPziYiWRtGqGXS9Y3K8S++SYZYhu6xSpu74Ly5ZIKpNqzURW/WY0
 ckRZuwx5G83d/J23iG0KKmC6JH3VlMaz8bbziUaHOE3w2c3YP8ep/JRNkGLfw4rTE5FI
 pa3A==
X-Gm-Message-State: AOAM532N3BvVkWXQA9DYh0pIOZVakDJsxCwpLjvS9zmqrMw3vJAzs76b
 yFdaMgtXO7KMcsiDULLpApb2Rw==
X-Google-Smtp-Source: ABdhPJyoy8c2O+YxPomfdw7xfPo3rLMbrPVz1Nb+GM9zs8Wmy3Qo92YwgRzu2mV7B2Q/3sX942cOHQ==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr27483416wrs.168.1619011987514; 
 Wed, 21 Apr 2021 06:33:07 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tln-1-134-231.w90-119.abo.wanadoo.fr. [90.119.102.231])
 by smtp.gmail.com with ESMTPSA id z18sm3229471wrr.9.2021.04.21.06.33.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Apr 2021 06:33:07 -0700 (PDT)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: 
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] target/riscv: fix a typo with interrupt names
Date: Wed, 21 Apr 2021 15:32:36 +0200
Message-Id: <20210421133236.11323-1-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 13:33:11 -0000

Interrupt names have been swapped in 205377f8 and do not follow
IRQ_*_EXT definition order.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b6..c79503ce967 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -88,8 +88,8 @@ const char * const riscv_intr_names[] = {
     "vs_timer",
     "m_timer",
     "u_external",
+    "s_external",
     "vs_external",
-    "h_external",
     "m_external",
     "reserved",
     "reserved",
-- 
2.31.1


