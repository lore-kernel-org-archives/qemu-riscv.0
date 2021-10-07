Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYXUs-0004iC-9R
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 13:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUX-00043n-A2
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUU-0006vz-OG
 for qemu-riscv@nongnu.org; Thu, 07 Oct 2021 13:47:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ls18so5457814pjb.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Oct 2021 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vZLRJy8/jxA2VUmbIFcOC3CPI+naiU5qep1MI8LkbwQ=;
 b=Q4BrtGvXKnX/ujXqGxKCkAksE5Fw1FmhYITG69nWjvXz1j1JYhm84BGCUCVfHoUjfh
 6C670soZKysgs6FeL3y03hYCsAdnwkuKS3i6EBBcL/Ruox0kyAbkRIkgOCpgol+3YYA7
 dSpCZWLrNW94iVndyzajP1gRs8G/9idNsn4X+XzMt73DdO0Yvgc1kiKMpfAGlmBqnPET
 fX/aiaINe0eQ5lXk/DjWa6bi2mNGIQ+BfGOmRGwmoS9dYeBtJ8/EOY4eE+ezya2Ee/U2
 3t83pgIjpuKSd/uhoihhGP/7AT9rO1T4WWJgJ9sTzxVsOTbdN55zx/PXIAOdULwrwtBL
 KCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vZLRJy8/jxA2VUmbIFcOC3CPI+naiU5qep1MI8LkbwQ=;
 b=khTFl6Pw6Q0KdOVm7MzkOUYNsATHUxnwFk9Zb5lBpzyAs2G66utSCJMc/AH7DfCQ7X
 h1xDY4vunyHrrJt8i9FH99pkkzFBG+tQ8DrHKoA7wvIHAFnVPaecgE5ur6eqoQCnUnlY
 qwqfc7C6Yb+ui+HWGYzdyFBbpXG+t4i7+9hn72do6Td7BNBTcgWGwuRzOrKhMJJVTmCZ
 LaPPS63cIebtuNCYXabAnjAoPjexW02LVZcrsKWel9J2Au/6U8cPxG4Ct43s3yrcYUwg
 zgEzAXJ1NHkkUa8ZUZkoDV1zVCvQOMVl3Y6bGdGunz8tYydvU2A5vne4ZLzi0gbwr7ZW
 Fq1w==
X-Gm-Message-State: AOAM532W8dp7N3vmY1zIH3YYPjoUYN746e0tO+4bU0lbgAlj9QFx8EXW
 9rc5eRn5rdcvfFxDz+uI15dBZA==
X-Google-Smtp-Source: ABdhPJx2MwxRNEs3w8z0FHb4wBF3m9oj1N2NNGDosyitl3VUxhqXHG8bn2dhoHFVl4eVjMEKDJzWdA==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr6931896pjg.202.1633628852086; 
 Thu, 07 Oct 2021 10:47:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
Subject: [PATCH 11/13] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Thu,  7 Oct 2021 10:47:20 -0700
Message-Id: <20211007174722.929993-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Thu, 07 Oct 2021 17:47:45 -0000

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 66dd51de49..c62eea433a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
+static void gen_rev8_32(TCGv ret, TCGv src1)
+{
+    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
+}
+
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
+    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
-- 
2.25.1


