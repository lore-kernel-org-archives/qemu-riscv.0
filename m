Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWGi-0001mx-H7
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGc-0001ky-J1
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:24:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWGZ-0007cL-VC
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:24:52 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:32914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWGY-0006lC-Mo
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:24:50 -0400
Received: by mail-pl1-f196.google.com with SMTP id c14so1499284plo.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EKsqQug7v7zszsNqo0b9Js3bl54LND9OiSrVub9vLW4=;
 b=PwbZoIfWasLfVwnLTBuiuj52DUvcxrUOZRe/DPE7mjzCy9nxEpH4Yl4zGLsyZdwM5I
 hGQtVoQYbVuLMn1Cje5WxvIN6OE69AqeRShE9djgQnFQdHH95r8I6iB16PI9xVSOv36B
 HNA87J3/85pszsJRXV+mHx3Q+mYnEthgbuk884LHAv8c8gXp3cX9JpLyb0tH8GPBaaib
 d38LVj7v77e+Okb4GKyV6x2VA22BhU66y1LgPIoucPQjyx1GNXBCI+qI6j0fqXCjzONt
 OLpDkx2vV/bu06l/Pt9mMr7benPENSG6fOkcZHl4NmTjh/1scthCKfg59e3MFwWYTLiy
 vRig==
X-Gm-Message-State: APjAAAV5P7AiTT/WggzhS83f50wXlyOfa5n15Zm0LDPZyp9oY/MRuGZg
 fxxi08qKs9MkbZ9cXO/hUq/utMoIyFPxHw==
X-Google-Smtp-Source: APXvYqyRMQg2H4LjYcqHOJbejMMN+hBHC7SOa/P/+uW0VsKzuXmE5DIcEDTPnnw01BoTEWHqExXJ+A==
X-Received: by 2002:a17:902:a517:: with SMTP id
 s23mr5262268plq.306.1561649026947; 
 Thu, 27 Jun 2019 08:23:46 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id o14sm5045356pjp.29.2019.06.27.08.23.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:46 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:47 -0700
Message-Id: <20190627152011.18686-11-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.196
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
X-List-Received-Date: Thu, 27 Jun 2019 15:24:57 -0000

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


