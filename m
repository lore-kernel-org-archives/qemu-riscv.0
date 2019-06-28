Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hguki-0008MI-GE
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukX-0008FW-Nb
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukV-0000ED-8T
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:25 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukV-000053-03
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:23 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so3311346pfy.13
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EKsqQug7v7zszsNqo0b9Js3bl54LND9OiSrVub9vLW4=;
 b=BsPO6/0oNk/+k9H/Qh4Ns5M+zBJqswgiqGEFGjSe77QH2ZqvwgQXrUmLWow1YU5unR
 reMFzSRyCm0cCODA7DdCOO198R+G+rC/BdtBHui0lv0w11hjP4w/rC8iM4zFSSbNpDGj
 +Sr6P8jZ74dzQ/PHw/o2G0rop6bOt7RKba5RR8tpb9PTE+dogxdWEX4ANICBDJRmrGlX
 uNyIdO3c008laVBvtOIkoqVBMOQNR1B+OqrazOVSzecPbjqNMNoqKDLoJ43N8whn+MnI
 vaPvvNwtM9aXy7VbX9bvTFZftRogWosGLw2MaKSK0a5/7a8MAn7Gdwm8gkDLnlkdAKqT
 QTWw==
X-Gm-Message-State: APjAAAUTCYQs9nKICAQeO9q4PhNqnH5uiNe1xsrmwHShHMZheXwx9ndj
 4XWT+PjznoCugquOwe3IMRJDhg==
X-Google-Smtp-Source: APXvYqxVSr7isnJcgN3y2zSk0W4R3AQjxDtXhBpvEQs/RVX4AaBhqSiGViOdpd4ZWcTDvCuuksUZiw==
X-Received: by 2002:a17:90a:3310:: with SMTP id
 m16mr14336684pjb.7.1561743188055; 
 Fri, 28 Jun 2019 10:33:08 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id f10sm2317571pgq.73.2019.06.28.10.33.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:07 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:03 -0700
Message-Id: <20190628173227.31925-11-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: [Qemu-riscv] [PULL 10/34] RISC-V: Fix a PMP check with the correct
 access size
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:32 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

The PMP check should be of the memory access size rather
than TARGET_PAGE_SIZE.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 66be83210f11..e1b079e69c60 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -452,8 +452,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
-        mode)) {
+        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
         ret = TRANSLATE_PMP_FAIL;
     }
     if (ret == TRANSLATE_PMP_FAIL) {
-- 
2.21.0


