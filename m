Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcqyv-0004rb-Ia
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 11:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqys-0004m4-R7
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:46 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyo-0007Ta-8Z
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 11:24:46 -0400
Received: by mail-pg1-x531.google.com with SMTP id c4so12631111pgv.11
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=oSHSzyl+0YEoYo3DImNOanUBwswlpvbVBX5nM0So6eJa3nUXscwS7h9Do9CqBSWePu
 uxsEDre1AN/LmZ6VhlkNQL4jHKefAF/NCW9kMoHGUEaTDi+X7Q1YPrjeDL6Qy/Zccd8h
 uNiw5Krptdcizh81zaRoDmaoSP207839+yFDHZtS+JivqdxBPryXuV+wqL9mmfbR7Nxs
 4gGMb26bT8WvuMPxkMxFeWc4LtTm1Sr2Gyr78qiFnNhiEbC5Ov/eH8WiKVyV69b1Yvxz
 Q6PbMK61dBwTs5jwnsVq6zWHfpIO/cR2MhctNPO7bCHHteePhEM9HUPEVG7jdP4Opayx
 pbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=4Sjn4Hhka9/sFhkSrSXR9ol/G0rpzrw7pi7LKryFbhpxzmlkEuLRzt99xeiDcyW+za
 56UXTxFzrzwbuRBfRX1mfcI5SVa/3eHVVyj3Nz/NmpikjP24GFzlft3Ss3JQGHrX1y0z
 rNFm8vV2ncNrdVVr9OAvu2cbS+r+9jRy0j+lREXyY1Cec1CUREcs8QhuDRtI1Q3OZeIf
 is1s+F1s3Ste69e2YzrhFh/oRcgYOfi/YvYCsTQoXNDBWtpAWM1K5K9x37QHQ3M1fohc
 alPim8W4n4d4OmjvJ9ydWXpyGrPB4vTmQjUnz9M4DStkt9ICA5viVZ0+PkFH83/CDDuT
 BrMg==
X-Gm-Message-State: AOAM5303OcHQa2bDOVGUBoDDyx4ajpdDGeplAOM28pUATTBCJeOoyJB0
 bZRuuRVccG9llqJ3pHi0PMAyZw==
X-Google-Smtp-Source: ABdhPJxGBwTDfp4HIDiHMqu4Mh2tdouSDgVUAt574v2HlbVaeAMPvy8sWQoWtKlpRo8UskTn8aYfZA==
X-Received: by 2002:a63:b91c:: with SMTP id z28mr17756291pge.393.1634657080938; 
 Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v5 02/16] target/riscv: Create RISCVMXL enumeration
Date: Tue, 19 Oct 2021 08:24:24 -0700
Message-Id: <20211019152438.269077-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 15:24:47 -0000

Move the MXL_RV* defines to enumerators.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_bits.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..e248c6bf6d 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -364,9 +364,11 @@
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
 
-#define MXL_RV32            1
-#define MXL_RV64            2
-#define MXL_RV128           3
+typedef enum {
+    MXL_RV32  = 1,
+    MXL_RV64  = 2,
+    MXL_RV128 = 3,
+} RISCVMXL;
 
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
-- 
2.25.1


