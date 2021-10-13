Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1malDa-0007Wh-4L
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 16:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDW-0007SM-Ur
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:14 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDR-000835-A4
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:14 -0400
Received: by mail-pf1-x435.google.com with SMTP id 187so3525481pfc.10
 for <qemu-riscv@nongnu.org>; Wed, 13 Oct 2021 13:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=EqILzztPTSxPua6iFy6dHn3jeX6cXzqW77Yl3/exjx7p+vLROqBR+ZNvehvsfpV+vX
 nBeib442CuPXopJsSX9r7Y+wCHhqnztRRWWyWM8i7NTWSdOdkAWkPVXdTm0SIzf46J80
 by/lYBIkyBLRju9BGchrTiXYrmGentSl94w2/7oty6Uzgc3vwFzhFUzzM/1aAp5W+xCu
 I2aLDe++4wXbUh2cvZRcHk7B2C6SbO9zoZaRdFyxsIcUwvtSwKjXAN8Clnn3IXkrZLiv
 G1HijfFtjCVd77CQz5fWlqCquxbQmfJ/tCXKEOwl6N1Q5mDHx3N+7UojpA4UP1dXBEuN
 38mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=C04bI/AljbXkVFfGl/On8DoyvXqz8OuzaKtzWApqnBi1aDuP6dCwpQTSQKqoSm3Lo/
 ED7ehcAJDTLMyJagg04jtUNdbn38SFJ+JW4Y4m3nC/95Ui8hEd89sCmtnLFwCl2FahtW
 rowIVRo0kSuRSAqgLpNvXY+bY2XvoA8sFTON32szXweH00f/R5SF1yjPZcWFCQ8HGRt0
 y2UzwIFsV0So6AqD8eYLyCNg6hWVf8g8LFUnR610DgyWTN1edOHM7z83ffqWnSxczf3Q
 gh87uKNS52ic0Mi4X+q8B6kZi/6uiNm4w5j3GeSdDgSxjo9YsBTC4OvzG3M8F0woMnH5
 cdEg==
X-Gm-Message-State: AOAM533iu8AsBFtPsA+Kxs6yFrM7VXRCOagFpuQisJDmqIjRn4OItmDl
 ovTyiehakamJE6Tou5XQpM6yfg==
X-Google-Smtp-Source: ABdhPJwrJFPfJ6/V8iyAtjRsITpGLi2DFp9t9aXsYGMdmU3w3c9T9JV7kNu4ylnUlv0QA4sPPoCUrQ==
X-Received: by 2002:a63:af15:: with SMTP id w21mr1123470pge.205.1634158268069; 
 Wed, 13 Oct 2021 13:51:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 02/13] target/riscv: Create RISCVMXL enumeration
Date: Wed, 13 Oct 2021 13:50:53 -0700
Message-Id: <20211013205104.1031679-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 13 Oct 2021 20:51:15 -0000

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


