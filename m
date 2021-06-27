Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxTPn-0004jY-CX
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 07:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxTPl-0004jG-OC; Sun, 27 Jun 2021 07:57:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxTPk-0000BG-6o; Sun, 27 Jun 2021 07:57:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so272443pjb.0; 
 Sun, 27 Jun 2021 04:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Vi4YFVaED82i+uQPFTQwIXlawHY5dAL4/ruCENK+Gk=;
 b=Kn7qbj/ysn4wvMwq4gUM+d6YF4qTVEC9AwqIKCRt1I8q5cXGyFWKfIkr2tWWfw6bPZ
 Ivktxa5q3AA/LNCb8XyDBy1LeYugUxcXlscgQOD/dtBMcqMCW2TRbj0TkS60F255A3uZ
 cxgHl0ETS01XIoIKJgHYKpw5KGoSa/W1FmEsKFvIkj6CW/fbZjLGyGknAzPOLnaKJlNN
 wE0iVmNxuZN/iMzlvHddn6Nt4doLqyJmJ8DzRGDba2S7YS5C6x2Ox74cDPzvPi9N7oK4
 D+EM6orWRUi2ae5zZR9HQC+mrmuKd64HdhcB9Dr9lKTgL/Yzx4vzCWlHAL/bruxTQlHn
 F8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Vi4YFVaED82i+uQPFTQwIXlawHY5dAL4/ruCENK+Gk=;
 b=sd5f7tccJwWVD7WVP7IgFDZgV9DbIWKbmceCT1Sje63XHlBIk9KwQcuCBnsIHApfAX
 txd85CZI/3NdGKQo80WQTJDpCPyEKHl1kZOBaLZ0TJ7CMqeLUoSpS5EBGADVcN1QlZbx
 nkLJgUuYFUswMoBy2VCHxvrs6W4K7kgfIaRkRek1meVxcyPfkqTvD1fVU7KRO/ngqsnz
 eVoztM/M5Y8L+ml1UxtZHSYpWPRfypKHLiXL9BLRTpxdHsowqZ3kO2fGfYpuhikkhhU9
 Eo0RGv12gE0dW+hB4Vx+XMrKkWA9MTd6XeL+skxqvCBgADShTLMflrNlnRrjoUblZ3Ib
 f0YA==
X-Gm-Message-State: AOAM5336EMRIEjKlSDhbowM/AzPd9FGPc2Q2YzxZAHLCm2Nfve5lIMxh
 GBvloHtWw8htKJojwhlfIKQ=
X-Google-Smtp-Source: ABdhPJz7Ai1T5pxeGyoWyTTbDyXRAtEL1UNDVM6eEm8mZo7RkoRvX0quXgNQfH+XIwI7VqX1xFKQEw==
X-Received: by 2002:a17:90a:1f4c:: with SMTP id
 y12mr18772457pjy.2.1624795046060; 
 Sun, 27 Jun 2021 04:57:26 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t17sm3268005pji.34.2021.06.27.04.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 04:57:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH] target/riscv: pmp: Fix some typos
Date: Sun, 27 Jun 2021 19:57:16 +0800
Message-Id: <20210627115716.3552-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Sun, 27 Jun 2021 11:57:30 -0000

%s/CSP/CSR
%s/thie/the

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/pmp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 82ed020b10..54abf42583 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -456,7 +456,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 }
 
 /*
- * Handle a write to a pmpcfg CSP
+ * Handle a write to a pmpcfg CSR
  */
 void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     target_ulong val)
@@ -483,7 +483,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 
 
 /*
- * Handle a read from a pmpcfg CSP
+ * Handle a read from a pmpcfg CSR
  */
 target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 {
@@ -502,7 +502,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 
 
 /*
- * Handle a write to a pmpaddr CSP
+ * Handle a write to a pmpaddr CSR
  */
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val)
@@ -540,7 +540,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
 
 
 /*
- * Handle a read from a pmpaddr CSP
+ * Handle a read from a pmpaddr CSR
  */
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
 {
@@ -593,7 +593,7 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
 
 /*
  * Calculate the TLB size if the start address or the end address of
- * PMP entry is presented in thie TLB page.
+ * PMP entry is presented in the TLB page.
  */
 static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
                                      target_ulong tlb_sa, target_ulong tlb_ea)
-- 
2.25.1


