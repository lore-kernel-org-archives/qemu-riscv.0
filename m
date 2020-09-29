Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKwK-0002Kw-A2
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwE-0002Jl-0C
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:23 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKw7-0001gU-VS
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:21 -0400
Received: by mail-pg1-x541.google.com with SMTP id t14so4614107pgl.10
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ro+8tc5U3YoDYLJHgFJhwGBQOgcFJAzFR3QPTbXt9U8=;
 b=W3sSnziOd6gcEFYsmOuKnvcU644KzXdXb5ryC17MNqYRCKmZdYeVXHN31fTwbBnmUF
 6bidWQ1QobLFqnibiOFAC5pJEGeOfdW+uiw+RKmidlrXL2VAw4x43Z/+wUmk463lmBKL
 G5s3AfvtlCGtlQh9pI28egoMjkXy4ELZRFCxzpf0wwDx9sTo4cDU0qh8aGg9Hi2KLR5Y
 IQU9Dnes0Pr2Ke5cls+XUoEd9luYy3g9XIwu5IbHjN6ee0RMJ7VrByf2fgmeX1uvEp7f
 Mhngd2TPvS06tRf05V07a4qFrlSU+8kF+6JY1uZUrjaK4ElDwY6SI2OD9tNh51LbjGAL
 i78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ro+8tc5U3YoDYLJHgFJhwGBQOgcFJAzFR3QPTbXt9U8=;
 b=YU9/vO11j37uv/xngyWI6HU+8cZoKjk9jofjRcK5ELHK9B7ks48q7wEogX5dqV0lgZ
 KiPdya0AJKbkl81OW9rjwZOy2Lsx2Qh5wTNmGvojO5ak+6ZDaP4nhtzG2oHVy0mjPpiA
 1JrYeR7v7OquFACwjtjunkQWaqtL/F/OQeFyfFXWxBLrfpJ+l0ggGK0YUG1/sBcvij+f
 m3aIx2iNItR2nDNyaB8FdaQKEFhVoU+9067HATOPvgBPMT98AYubzz6UcilQkMtphSXC
 PWyCvPxM+2ONt26WFmmTJ2C66zVr4ztKYthhjffWRuHuGVkEfoQIg+4JJNFctvPDQ2eO
 aH9w==
X-Gm-Message-State: AOAM533x+8U4ZUCEc0Vusw1I47vUP58yW3SmiIfX5tdgi5dZNLQmm5R8
 tcHvoHPWWlEw2s33XwZxULDzeQ==
X-Google-Smtp-Source: ABdhPJxnjk8N8XphMQvV8dtbcW3Opffbry5l5//kM8ChvQVatySyMm6OE3aSqVrtUEZVzerOny1Uvw==
X-Received: by 2002:a05:6a00:844:b029:13f:dd99:d1a4 with SMTP id
 q4-20020a056a000844b029013fdd99d1a4mr5600379pfk.31.1601406314825; 
 Tue, 29 Sep 2020 12:05:14 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 02/68] target/riscv: Use FIELD_EX32() to extract wd field
Date: Wed, 30 Sep 2020 03:03:37 +0800
Message-Id: <20200929190448.31116-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:23 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d28..bc3f212cea 100644
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


