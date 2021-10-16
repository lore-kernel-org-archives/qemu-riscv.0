Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGZ-0001JJ-Aj
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGL-00011T-11
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGJ-0006CF-9R
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id e10so3542443plh.8
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWp+DyK/MXQrYSGCBqie9Ey1GjpSYq8FmATujtXXGIU=;
 b=tI/HZQOM/f7v85O4Y420RHliIEJFRgOK86vAn9cQ8UzDdhd7FPsgLYlQDS1yQ4ogGl
 yNfojEyUZ1GQObmY2diwNuMzsnNhi6kjPP/3JM+m8Q6bJSsES+MihTrAtI+PW4woNrCX
 16/oPLDy2s0v+vgb4cmVZ0Kvxur31Yc3U/MYKzh1TVPl0DznMfQdQ+FrALgIFObcssed
 1NuShc1btS3lgEu/HLAcEUgy3sEVJwVGMhJb+rMzGXZiLIq5MIM4TbYLDJFVyNOqEeL9
 sOe+SnA0t0cEduIePx1pk3aNbpLMYCKpBwB1tpenpI89tkMazr0ybEJbPLD5jHNwUsPi
 rL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWp+DyK/MXQrYSGCBqie9Ey1GjpSYq8FmATujtXXGIU=;
 b=j27Cl9Aj1EymMmXT23Be6eR3L0bEHL68Sx9aMbEv04phl+dG+426SjapXq0ykooPEV
 Salffb6bv4FxfI2aPXJP752seZB+kzi/qH7VTC7AfPsGbh8AGRj9xz1vsgC0wN5rfdj3
 i3nD7tiLG3WBjC0ePM14M9i9TXDkJ5ByBs5WIXxYkaNpP1qVakfcJTzDcHP916R6wTZZ
 R4rlVE/t3NbQLnikZfwojXFMzx3X9/AzAsxhccnZPIa3dUYkBAOIoe0CWuomt1YRHGqu
 P2nFxs/OoVx0vZRawYT4SL3QYu7YGpo6xNu90qAXi8hl5miur4HxBfnHr6S8IdGOFwcE
 r3Hg==
X-Gm-Message-State: AOAM530Xas/jQP9KopxeGuoyK0o9uHTG3LFpk43Am8LYUfHNxH2+CwZA
 DLUx3qlhxULtrvJ3vnKRG2VZXA==
X-Google-Smtp-Source: ABdhPJyshR25TWEskYEY9XvRsM5CBsDaCqjh58315XIyybjVXbF64peTz85dUKheoS8YAoBGCCjMXw==
X-Received: by 2002:a17:90a:1a42:: with SMTP id
 2mr22170039pjl.202.1634404460321; 
 Sat, 16 Oct 2021 10:14:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 06/14] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Sat, 16 Oct 2021 10:14:04 -0700
Message-Id: <20211016171412.3163784-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:25 -0000

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..bbc5c93ef1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


