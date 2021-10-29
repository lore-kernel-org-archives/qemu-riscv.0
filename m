Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNju-0004dt-1B
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 04:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjn-0004Tr-SJ
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjm-0004Ul-C3
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t21so6397262plr.6
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWOZNBjy2UD9L9cTxRsKNeUHvaqk8YVnIwCrDORJ5OA=;
 b=VXQJDfkTIByK9I83cKnYt/N8x6eerKWcmycd4x6F2/vLzZJGnNcWE2YQVC+dQwliY0
 sxVr7ItCTiuEDbxkS0w9uPH8iPpVOnPrTT29xuAJ6syNcuYNw7J4eyb93MAtEV3TaxYb
 VHmykT4jLZn9dk+KhCuyITy/UZf6hjBhJ2h/yTAMd8k7wqz3Z4HGfsibl6+ioqK6OmoP
 qh03lBRQft0xX+MCU3ddFSsGaJAIMMggrsstr6dFiW+gRaJezvDGqzDiC3zGAla0L5Ea
 QyX61JgKkFQOU5HXU81NVMjyyJKQHoS7b2cykq578JEFfQup3syHhk9ihgius2LzpgVK
 iptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWOZNBjy2UD9L9cTxRsKNeUHvaqk8YVnIwCrDORJ5OA=;
 b=toHAXQqcAMqiVi96fDWEFBwnkUzALyFtE5bBt/6yBy6W/F2g8HZXNOLKFkAHy60O/d
 5++kyG84I0xFELRMBG/BONXuapGj39zRd4e6Q27AOmX4o1/A4VbXJ+lrHmPo+Ums5TVi
 N/lQ/TrkeCCznk6ewYQaiS2UjnkXdNpsVjSq5FsCVtOxQo4Dv9yoRvxSS3iDdsujxrkz
 /wx/g9Ja+IATl5QyGKWYbPbATYxmdICCsSg5mXjJ1QEGzfpfvHZkyV8IY92XN2+/CE2D
 GyqPwE/Bwt+ucB3S2EMNXslU3zn560h0tBpSRAD630IL0MCpdRFmaDz5JTrPnFMupr1u
 KFbw==
X-Gm-Message-State: AOAM530+GA43+F8oF3r4SMS6zfA8P3B6uVVQfhaWsN6fl4sBByp5T3eU
 ogZyImQubH/0Su+QHROaSIilsK7sKvbgHKD/
X-Google-Smtp-Source: ABdhPJwVaPRIOsiNhxyuKLBmIG3ouahru/CGRLD55GMwwwltOfibBhYuqCjqWkdTNWZqxhdxE277uA==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id
 q39mr10215908pjq.219.1635497985164; 
 Fri, 29 Oct 2021 01:59:45 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:44 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 05/76] target/riscv: rvv-1.0: add sstatus VS field
Date: Fri, 29 Oct 2021 16:58:10 +0800
Message-Id: <20211029085922.255197-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 29 Oct 2021 08:59:51 -0000

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 72a716c9990..bb62da7549d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -409,6 +409,7 @@ typedef enum {
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bb500afdeb5..83f4dbd8241 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -463,7 +463,7 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
-- 
2.25.1


