Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mccZF-0004kS-DB
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 20:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZB-0004co-Ej
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:17 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZ6-0001ci-8E
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 20:01:14 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so628117pjb.5
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 17:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=rwAI9/EIpVqwgULEbFSMPpiM1lrpuntD/n+xTqIW6499dGzikZ2uzEdWrwbtdSk/uR
 NQW6psEvyT46J/G0pHyxxNf9lomJqZpwh/xlemFC7awfWV9WI9w+/BTgCedWVkB+tmY/
 uRmhRIdAHEdSenzCqi2LJ/9ZyGHtcBIUsOzQgTJpIfR7taKBsUydzIqa6K0sao1uLkVb
 JIEYePKgxmz5BuQ0O72pC5UOnEHI7Jgg1Vd9FV6YcYRzzAjgdxs7fQeaKLdrpzIfaahF
 2NMbS5UR8KkxKyXSPoZYhc28sY9f+q907JiZF+mXnRJBWCN5q5HSx69RgstOaiKmwbfJ
 x4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=yVJmsxXcM0yPOOzdHPA94XBu1LJlkR3bK9ichEuCys6xnRmO68vD3OaJFLQELEd4tp
 s67gLdL2kvIwxxAl//Jn2IQPt5zM5TRIdBoxS9IyDuyPTtNbajEr1JhZ/8b7IzkZn9SI
 0P4e6VWalBQZ3cDJdwl1dinXFv3gkti83DluGO5x6U3dQmhYZYbGGK5zndA+jWARv1Yt
 G1ewcfFy2+wwmRdb/DQSTxXVTEAqzW6eszFUxAdM68TQUF1FHCSXmOeMyiYgp8oAWyLw
 l04hpnzNxme5edwkM6657wRQmAM65LTkafkuoHxrHFvvRRS4m3MrlKQmelA1GfxmbdCJ
 nGXg==
X-Gm-Message-State: AOAM533LKxnmbpBNm64zgXcc1w/EJIUGUwqwayx77Mpqbj4uwllvBKua
 DhU8OvNU7kP4F46Ho663J8kXDRDZNxgkbg==
X-Google-Smtp-Source: ABdhPJwZe0RzSfxdrTjSRCFjkEzz7wYMqP8kROUagvRMTRG24RC4y0XU4+ozI5ObX0yjt/JUkP/bRQ==
X-Received: by 2002:a17:90b:1e01:: with SMTP id
 pg1mr2363214pjb.81.1634601670806; 
 Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com,
	zhiwei_liu@c-sky.com
Subject: [PATCH v4 02/16] target/riscv: Create RISCVMXL enumeration
Date: Mon, 18 Oct 2021 17:00:54 -0700
Message-Id: <20211019000108.3678724-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 00:01:17 -0000

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


