Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC2cR-0000IE-2z
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 11:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kC2cP-0000EI-JM; Sat, 29 Aug 2020 11:18:13 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kC2cN-0005A0-DV; Sat, 29 Aug 2020 11:18:13 -0400
Received: by mail-ot1-x341.google.com with SMTP id v16so1769745otp.10;
 Sat, 29 Aug 2020 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jDcYY0K/h58b0nGwvA6H9r7tjjvba9vWIRW+Z67cCA4=;
 b=oQ3z908AvEQRme7iG1uz1lKCs6Sy6/tj9h1zPvoFHix4qZodDGFhUIN/miFGXZbXbN
 5HEO0CDyhoey7YK1VdGxf6HbCFPbKfsjoBZr43udfkDnp+juGEL+sMbP2+JmagyNP3UO
 7U/IuBXgDNV7PjWl3XR/Jf8GjEvgGo8v7F4kV5ByU9MwH70xST4V4pUTCbxWHLFwF+DP
 NaIwwm3AaotxVtjj+JsSJnkwxRW7UfojKU+VLi85PDNaubicz8447kV0C38CKzkOs5Hp
 jC4w4fqAcYUIMyGSfT5hseFc1inuFHkOlAX/PU4szRACUXpuac3kQbJbjj8EP3dtgy7Q
 BwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jDcYY0K/h58b0nGwvA6H9r7tjjvba9vWIRW+Z67cCA4=;
 b=mKT6ACESUQhzZaSPLy2W+lKlOHjRQgIwwrb4M7gRt7Y8AXWW4jhlwQRTUFt5CzI3tt
 Hm0UhN9yxNDhA6TL7YdmK9dHYP8VEiJElTWmiF/63c/LHwhYB2PdomPMpuvw5iGYyDa3
 4fvRpwijpDSFzPxsKqkQXp0JF4TFuifzsph5TONxTTU7R29XCKmAc4CchHJ7Mh64lRpx
 DH2RC9QsKF8Y5ELO3VapMziG+t0Ldgz0nVvWYcg/sDZcToYklL1aCa8i3U6stmCVyyEO
 0s6vqrG7vD9h6t6iz+PCcEzCxlrEtT1GBi9rF9yy6vS3+uwzvZ3e3QTdQBwPu6rWgt6H
 HA0w==
X-Gm-Message-State: AOAM533BW3A0ZMPGiRgKLFruUO64TjgQJyWIGh2Eoq9FZ0RYYQtnwcfq
 Er1SY2LSrd7OBecE3P45q5U=
X-Google-Smtp-Source: ABdhPJzrvOqhJrioJvbe3LvHWSCigMKanQL3nS3od2FJAzHn8UeZuASgqGdcYQFxDJT6o5SwN77vYg==
X-Received: by 2002:a05:6830:4001:: with SMTP id
 h1mr2323678ots.219.1598714290210; 
 Sat, 29 Aug 2020 08:18:10 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id f50sm58181otf.47.2020.08.29.08.18.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Aug 2020 08:18:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v2 01/16] target/riscv: cpu: Add a new 'resetvec' property
Date: Sat, 29 Aug 2020 23:17:25 +0800
Message-Id: <1598714261-8320-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
References: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ot1-x341.google.com
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
X-List-Received-Date: Sat, 29 Aug 2020 15:18:14 -0000

From: Bin Meng <bin.meng@windriver.com>

Currently the reset vector address is hard-coded in a RISC-V CPU's
instance_init() routine. In a real world we can have 2 exact same
CPUs except for the reset vector address, which is pretty common in
the RISC-V core IP licensing business.

Normally reset vector address is a configurable parameter. Let's
create a 64-bit property to store the reset vector address which
covers both 32-bit and 64-bit CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 383808b..dc350f0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -291,6 +291,7 @@ typedef struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        uint64_t resetvec;
     } cfg;
 } RISCVCPU;
 
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
 
-- 
2.7.4


