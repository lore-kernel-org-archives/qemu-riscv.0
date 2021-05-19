Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljOaQ-0004pl-MO
	for mharc-qemu-riscv@gnu.org; Wed, 19 May 2021 11:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1ljOaL-0004nZ-Rz; Wed, 19 May 2021 11:58:15 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1ljOaD-0000Zb-VJ; Wed, 19 May 2021 11:58:11 -0400
Received: by mail-pg1-x532.google.com with SMTP id q15so9758880pgg.12;
 Wed, 19 May 2021 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6wCzkPkZTyv1wdPSKFx12Z8+u+8agTsZVhlUSq53yE=;
 b=bEr4oZC8KQGwY/pvomZ0LKR3rpgOYeCB7hJNcUreCliI0cXUXn9d0BvuiT79R8NxoM
 KZk6dRqlK9nEMCzlvnVtrsvS0/BArJFaavra0eayAzSe5t7ubeRZqqhq1Wc5sB0vvDYX
 8W2BaYsTZj4Z78lvsVhcZyOp7jbdk0qWSBzYIkrKJHZVmFYktui6uf+Xyrk6rsafLau8
 GbDENAZQ/7HiAj0uvcxe0iZ3UbLmhJ95TSdyXGwQrrr3Sdv4yinEqLZ4qPmi/oUbAfK3
 a4r2oHr9LuxXCDR+us4dezVx+jIiBZSi8wTc9L9pMaQtYrEHtmky5YdYVf8146UWfeVa
 6Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6wCzkPkZTyv1wdPSKFx12Z8+u+8agTsZVhlUSq53yE=;
 b=a0XQihYhRLrAvlFdoCPpNXdULwuaarqCutg45BF8RXplbgDMOMXwIlTo78JlrtXe62
 sw+QNAC/3kvahJbtzkTFpaEtnHycpto4z5x7TBR8tkpFFDx+K6zgqXBIAdaSwfOFJ8fU
 JH/qrMIq5Evn2gjUucTC1sGfDQ76gji7osP0XaElm6PxDl62rA/EjtfJJYXy5zJNVCdc
 6BY6WB1yaqD6VJ1ulwNeOIYguuJxxiJLtHL5LTQgBZPMrRqhvZpbCi6WJwXMQu8yrEsO
 fe9iyZ33Vnfp5ZD7E4StW3zokIvN1JzP6AlMvN8Sh5H5m5LRJ/wP2PhU66yInxlAgD9u
 BDww==
X-Gm-Message-State: AOAM532Ww2baEm8GxBt3FM1JxWlli4sAnZuDnsb3zY9L9/goKcG0MqC9
 Iu/9xB+0b+HMK2hqti/GqjA=
X-Google-Smtp-Source: ABdhPJydGslKEp7I4/KFi1KmwMEGzR0GrV+1CqjX2DJn9aHchr/aUIvnKOHl/bDigzmI1OXQ4t31/g==
X-Received: by 2002:a63:d242:: with SMTP id t2mr11503908pgi.210.1621439878093; 
 Wed, 19 May 2021 08:57:58 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id b12sm4548203pjd.22.2021.05.19.08.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:57:57 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Changbin Du <changbin.du@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2] target/riscv: Dump CSR mscratch/sscratch/satp
Date: Wed, 19 May 2021 23:57:38 +0800
Message-Id: <20210519155738.20486-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=changbin.du@gmail.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Wed, 19 May 2021 15:58:15 -0000

This dumps the CSR mscratch/sscratch/satp and meanwhile aligns
the output of CSR mtval/stval.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

---
v2: Rebase to latest mainline.
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3191fd0082..c4132d9845 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -286,12 +286,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->stval);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
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
2.30.2


