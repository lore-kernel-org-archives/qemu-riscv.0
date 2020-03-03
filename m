Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlF-0003KN-82
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkX-0001hT-A7
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkW-0004KO-Ck
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:29 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32865)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkW-0004K0-85
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:28 -0500
Received: by mail-pg1-x542.google.com with SMTP id m5so681585pgg.0
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=hAAUR4dPAibd3SLsn6SGvmO9nmVlprmLnfKwBIyEUvk=;
 b=Q9sgsuvsl/4kVFQPDMPcDftXCgps2OBKUq789Sq3kMydY011cxlJ7Yz6pRZ6Cimodu
 933e0SlLml+ZGniORT/d63cg3aNKkiCBf+QAt1bAF3WLdUc8vy4IpAklbYzD7XXvaFsV
 KooD4zLYuTmszpsUO26YJa+mnrHrpQCyaAwvaydzniXvb/qWawhZmGatspootpRAyLuj
 EDRTdDwHNQNJZ7zVmHdI49C95wzVcvG08rkO8/09mxL1zdN2GrfXzy1rGfdTd+k3Nbwa
 mc0TauyHSfHPYC21Tq61YxBy0rfgUfXensnBfuTnb+7hdCIU61k7ZSYtRsQFG7Bgm3d3
 iM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=hAAUR4dPAibd3SLsn6SGvmO9nmVlprmLnfKwBIyEUvk=;
 b=rq3RuPK0edke38BBTkNNpk2r4cNS0lSWwx5rTJk6rbrc1nFFX9JfNlWiYtWLegEnOZ
 79DMbNQFrR41KyXSQs5njjqmQErLvzVWGIzx9g5yhVyt/W+n4pHgGVGPWXZGtu9H2mu+
 DxtANaGNUUCDBT0RD2BS9RPS1z24Mw8ck0zZ+kEVdUZFVy93T6iMDPV/XRZmPXCWWeUP
 qUzCOxY8wOvAgGm/zDOMkKy2n5pOvsl9PIa7KRCl5kK03+A/XIrm8kqmgrniSu/TS/J6
 RxmVO3OMrMOpol/93vue4RKNF05caqe26SOCZrdPPlPE5n2Hsns3JUOuBUQZfWlT3dcG
 ndaw==
X-Gm-Message-State: ANhLgQ2ChZYWs/Q4JuQ/BPgmpT2LtAIq/rfGDS8GQyWDSNwa9zkzXc/B
 Ftk1c1DK7wHRo2UhrfzmV3f/fTwW5V68dQ==
X-Google-Smtp-Source: ADFU+vtCS5lc6yNToqSUIQYdAekktJUtyfWM1uKzM7yXWm1CUsqjgVBAJKAoqIGcKWLHnsBQizRd8A==
X-Received: by 2002:a63:c811:: with SMTP id z17mr1490798pgg.41.1583196566962; 
 Mon, 02 Mar 2020 16:49:26 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id r8sm102234pjo.22.2020.03.02.16.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:26 -0800 (PST)
Subject: [PULL 17/38] target/riscv: Extend the SIP CSR to support virtulisation
Date: Mon,  2 Mar 2020 16:48:27 -0800
Message-Id: <20200303004848.136788-18-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:30 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 918678789a..2e6700bbeb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -743,8 +743,19 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+    int ret;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        /* Shift the new values to line up with the VS bits */
+        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value << 1,
+                      (write_mask & sip_writable_mask) << 1 & env->mideleg);
+        ret &= vsip_writable_mask;
+        ret >>= 1;
+    } else {
+        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
+    }
+
     *ret_value &= env->mideleg;
     return ret;
 }
-- 
2.25.0.265.gbab2e86ba0-goog


