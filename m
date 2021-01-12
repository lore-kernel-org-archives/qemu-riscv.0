Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzG9w-0002en-GO
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9t-0002ai-6P
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:13 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9n-0006t2-Ch
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:12 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m5so1297555pjv.5
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4Rp9WKBRHuwGqR8BVwPx7zHTTiFInEpex1TEVTg+Jmk=;
 b=GrDEGubnxai9h3tAakEiVoRDIJ5lpZrxAuFKqAsB0r2bpvgixf1cwde3F4bChcrGhn
 zZzPvul/H7EtijwX47N+cEueyJe3c47sIurll0hNL1FaUeXVTLxMY5/n81KHjxn0IR/7
 qfHciZhPLU7FKc+Q6W42lKmUNqGUDP/zudx9B6FaPmjtouIDW4GCIpc5V0L90NI58CnD
 9bn49VgIlNg9p3rE4+c7bHGqENi394ISokl4uRVDpupdjAnJNzZQqRssAZyvVm2kOE8o
 IxQixL5F12TBJX9LM2sso+Q67fDr6UudWfVYgQPGoKtjR71YLyLNUYgZ9KdL4DaDH72I
 JLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4Rp9WKBRHuwGqR8BVwPx7zHTTiFInEpex1TEVTg+Jmk=;
 b=S7p7SX1rDpyh2XqiY2oU/UaJmIMVRDVWx7DkWWGjAEnTEDNjq8u42PuNE91oh1pGSY
 Tet3j7ZrazIvg9PpFlmbOiR/uc/7ispISz+gRD27kHVvdnb9X6h73F495o/YyC+kk/1Y
 1XGatIT0nytZlygmsmnto1ZiYismsMasF53vkuheRyNdmuXu/glSIBBFeS523hiKqX+e
 KCBNKYrun9yl5uSYAInmu95jOtmuKE52HFeoLJ1tw9pYCjh5a+GqrVuzOjILuiB4q67f
 mD2XyzqIszQhEFLcP/BY55QW7+nUKJLEGGtfVIGxM7NIJ8Hi2Lsw64b7b8lBZvBDzOrR
 Ca3A==
X-Gm-Message-State: AOAM532sjoldmJ7FT2ynoJTHOeAwmvYWOkPmlv0ElX0sU3cpymmUkY1e
 yYGpPLDq0aV+QkpIqDPjVSc89w==
X-Google-Smtp-Source: ABdhPJzVkb/MSmNl51NXZutYQLuG1uZzVcaV7DeZCWwqwNyN1z4EAS5isYXENH4fzv2uBn31a1yXBg==
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr4365074plo.29.1610444405405; 
 Tue, 12 Jan 2021 01:40:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 02/72] target/riscv: Use FIELD_EX32() to extract wd field
Date: Tue, 12 Jan 2021 17:38:36 +0800
Message-Id: <20210112093950.17530-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..bc3f212ceac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


