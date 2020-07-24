Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jytgu-00037f-OA
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 05:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgt-00035C-6x
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:31 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgp-0003rh-C9
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:30 -0400
Received: by mail-pf1-x444.google.com with SMTP id j20so4730945pfe.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2020 02:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLjpUO1DCpJGaYWJ7mKFZ69DXAIjGwURbGFioJmjOJw=;
 b=R/UOv6qlQ+C3HE3ZKdhNC+cQy3FfLS3Fvll8g9nJ/HuymK0zNj1gV0AiGfDU0ggIVr
 gJdvdOF+BJimcfL475OdA3+BP1CUAi+POXo/OqdHJVU9RN+bymbbzvycj/d9LpHvT3RX
 /QPS2ag9/U/aY+WK9NddSZgbcyt2mhRE96QfCqgQ/QtfZWo/i0i1HAJatuHsItTdGLpY
 byhbZW1gdh1iVC/QxWk/e0msENz03QBIkzJfy2RDtY+2pmULJ9zIyTZ8F7cmpcFpmBUL
 v06O+b24XklRCKuAIajxYndtNpoLfnsNgj+NSaKx7SXoUJZu5zudmuZKrQZjFkOJ+oPT
 SFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLjpUO1DCpJGaYWJ7mKFZ69DXAIjGwURbGFioJmjOJw=;
 b=laXuL6jku0mY4DKer+C4t2rnEfmRbdcnUYYCIg9bKJ3x57V2xHmZEhDzcVio3UySh7
 YG4soeyBXhgCamUnTcr5XKd/4Wu90TT3WyIM8bccaI/EDuvYGeb1Mv0UP/1HC9xRrlgX
 AMA46qQh4Xs1eRs+tizO1eOOKMbHQ95mKxToyHx+CkDl+g3Cdwforv1rjXJ2ZlTgKhcf
 84wY3xB19vV3368B6kdvl7FliZyhsrI7yNaX84tq4UQG5H0Say1/9R0K9+lhY49cQnLL
 PmeaWAi70XMNC30DWTHcxGb/8Gsb/6o22Tv1LeA/Dx/7hvHmapFk8UKLEa47RLZGQjx+
 9Cbw==
X-Gm-Message-State: AOAM531/9MBowFD4oekGhBipjDNfWRz08A8z3RLvF57Y1XSGn3gA1JvS
 /pGmrYn9R4KKlkkpbwNkO1QoFuboeAY=
X-Google-Smtp-Source: ABdhPJyIp37GphfZvP1b6Kvk+cCJSeiZluNPkxcu8cvXqQDq5xyHbFKPfyAinSoUDoXWJ8bVb8uCfA==
X-Received: by 2002:a62:2546:: with SMTP id l67mr8364222pfl.154.1595581706092; 
 Fri, 24 Jul 2020 02:08:26 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id z10sm5751282pfr.90.2020.07.24.02.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:08:25 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 2/4] target/riscv/pmp.c: Fix the index offset on RV64
Date: Fri, 24 Jul 2020 17:08:15 +0800
Message-Id: <56c2770fc75e1e0c833248ea5d9faa038b69e328.1595581140.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595581140.git.zong.li@sifive.com>
References: <cover.1595581140.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jul 2020 09:08:31 -0000

On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
implementation, the second parameter of pmp_write_cfg is
"reg_index * sizeof(target_ulong)", and we get the the result
which is started from 16 if reg_index is 2, but we expect that
it should be started from 8. Separate the implementation for
RV32 and RV64 respectively.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 target/riscv/pmp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2a2b9f5363..e0161d6aab 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -310,6 +310,10 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     int i;
     uint8_t cfg_val;
 
+#if defined(TARGET_RISCV64)
+    reg_index >>= 1;
+#endif
+
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
     if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
@@ -335,6 +339,10 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
     target_ulong cfg_val = 0;
     target_ulong val = 0;
 
+#if defined(TARGET_RISCV64)
+    reg_index >>= 1;
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
         val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
         cfg_val |= (val << (i * 8));
-- 
2.27.0


