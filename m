Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2TC-0006QP-Ez
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T4-0005u7-HW
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:42 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sz-0000xC-NH
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:06:41 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so5184357plp.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=PuO28f0P2bnpHXyUz0rNB7TyCDgHQYPbt+Vkuq7Z1Jgnz8GyROJrpE11x3BlZk5j31
 kvUPJSENZN6/CIM4V6iVPArkhbT1UYoyEMw54rk8Gigq8H7Qgp5/fF0ke7a/PtAkpwnO
 jCSxku7++lhjjEb3ms2hMu9Do53hqCW+cHsHK6VbhQUKG5NxGmwwe7+MvbvcGY1p8Yv7
 mOWFLyprbuIHvSI9rg7xM5L7kUJLUBcTDClswamHnvdlz5viktRDX1FQi81PNKOFK6Zk
 hzlFK0kemh1YxjLH76DH3Q2cO/LXVEwiBPuOwWNkha09Wg9KBcEHrPDweAKFIhCBlD33
 kzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=ACRoVlQhBUweaChzoq5Ok470/to+Nrj5wA9owFgYqcAZWILIha5SqP++OsF/8V+2qv
 B/3SL9ebsKqsmvSFz3rqFTwB2pTOuLtwALL2BHMCdST2jSiletV+g5WQMY/mphIr7WEo
 QSpf+TJu5L2o3/30VFiBHHL/E0Ahlzhzx1sQ5omtOxhs/EjHCLG2bl/mld5k0BNq/C8D
 7EuTkhENkrYJjvpHs47idsNrLFJl5LwUKRn0dIUGiMzL5AWLAegfzgBJa91LO4FHo6lk
 LHcYpBa/XlHbEhTNetnUFtNmkUb5yT+B409/qi6OKHZXGe7UXS5DQlWryVa03x3y8BrH
 Wamg==
X-Gm-Message-State: AAQBX9cDVyOYSoETww6iBESZbsyD4rwtqnKJ7aFtwMmhcYXk15RRLbLh
 +ga9DF6ixyFvOC0+mKrhPej7aOuChhf2xz7yIxF6Yg==
X-Google-Smtp-Source: AKy350btT5l1y1fp+caczLmTDyTiCLpBLSqXq1lT9d38aNUa+dut3erZ8Tg+Sp+4gaxyTTy7KT5QWg==
X-Received: by 2002:a05:6a20:7b23:b0:d6:b44e:f635 with SMTP id
 s35-20020a056a207b2300b000d6b44ef635mr9687830pzh.51.1681175196486; 
 Mon, 10 Apr 2023 18:06:36 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 29/54] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld
 data return
Date: Mon, 10 Apr 2023 18:04:47 -0700
Message-Id: <20230411010512.5375-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Apr 2023 01:06:43 -0000

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 086981f097..f3e5e856d6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1


