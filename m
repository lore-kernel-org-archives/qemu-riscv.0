Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGZ-0001KD-Gd
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGH-0000yw-RZ
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGE-00068K-1l
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:21 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so11610290pjb.1
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=u/Ho6YpMB/JA3oBuwbhMUdzOubnEI0b+vpFFEabycbDn46ml2EVDt1ucL2Tt7PikHE
 HpmwE7LgiYCkdpnw29zGXPQUYGe4xypgHOojz1x862OGoBEFJOCwSxUiJEUVZBrOx9Za
 HxvjNFwZBUWvaot19hpaNIdpvQ1v96kdRC/U3Ty/j4sDereJyCBPO00pEhEtPbHxLW9A
 oijDkh2M4MK2Xkot1D6hqhr2wmuuKS6ujwAigqVaqC56kUmvpRijpIQxCDpoOLUNWeZo
 TEAKuJ7oQfuHg5cA7FtCUnVHLyW503yKt53Z8w4WbQJX2YSTORZ7VMSOYpgSKzD8D3Du
 ucHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JW/tzOqQKK5hRD4CRoj0kca6rOybKGXTUDDhLFOWwb8=;
 b=Cny3Wx96h5zDcdFa2UMgOcoKyUqvom1aGG15bYKy0kySS/nQqkj5FT6nE1FQSAZ4Vm
 Goo5afZoGeHiI9pQ0aW8UskWWtsSqUGeW0+KhxfOsF0E1D7WM4ziujHg7yaV1gTsbAXS
 UkOvgsXUCkHdjxglfLE/Ha/4kbYVNYBptTRpM1sKXcISQgrR+OcvD7/xXdv5r3cSSdwk
 BaJaT0c1T6ZPW7VrFyL/hBHgm13maNybjO5DtgIs4V8OuuP3rR4NvB+gw2Gv2xZZN7pH
 j5PXk2HZ4DFzk4urU7Iu436XW+NEFc+Dnqfy8Ce60ZLrPFOi/etR7mLvUc9KTHCYNDr0
 BKnw==
X-Gm-Message-State: AOAM531bjW582LtZKfbkQcfH3EC04ClNQnK5qw/oWk3VKduZb3xyBLCv
 CZUJQowxZSxKNfMBz08Db5P83w==
X-Google-Smtp-Source: ABdhPJwLBTVqvj5/GGBUJ5vRpABaryIMDAWERDwz4Aw/yM2m09T4GFKSn08KFJnKfAap0A+yxwGJnA==
X-Received: by 2002:a17:90a:8985:: with SMTP id
 v5mr35678507pjn.222.1634404456283; 
 Sat, 16 Oct 2021 10:14:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 02/14] target/riscv: Create RISCVMXL enumeration
Date: Sat, 16 Oct 2021 10:14:00 -0700
Message-Id: <20211016171412.3163784-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:22 -0000

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


