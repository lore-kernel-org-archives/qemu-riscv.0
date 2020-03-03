Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlv-0004c5-B8
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkO-0001Lk-S4
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkN-0004Ge-Ul
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:20 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44462)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkN-0004GM-Q2
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:19 -0500
Received: by mail-pg1-x535.google.com with SMTP id a14so651428pgb.11
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ANagWVKLvizSaKchqMWjcdMKh5oBJiAUyVPoiA3+eHk=;
 b=CZ4DxnZWJrIgKj01EvAlv80BBB3viLK/oA8TslcfgcaY6YR8308kV7kUa/inGvua4P
 t0B1wnIiTc0A0ha06wPO+TfLAUoTIeIrhxJn9sk91v4zhFAs2NTlcL9Z5fKNxMFO/Wc3
 mDfjcVHTmujZwd7DmSB46VzBDzBj3cxEwlDubmpXAhh6R9qNs6A43TTsTtybNeo4/Snw
 /PiDVkQyaG++1geTJ3c0jeo0H2PLSIve3O/EmEFUNdj4kXow9e71J5a8q9kSPxbqYhjV
 na8e6RGZz0Wl3kBHOZ9viybIJaGm0Bu9oiF9V9DELaU9TYR0r6YD3xmX4QpP/FiQVv3x
 5Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ANagWVKLvizSaKchqMWjcdMKh5oBJiAUyVPoiA3+eHk=;
 b=D5zmrcenhQ5WTHcXVTrNsathyDYG01i3udxmNdG7ZqsIaA8Xiy9eR5w5L5iBIyERoD
 fI1qAzHoxep2zrU9JDOg0xye/yniduBEYxNYwHW9zPorvdtokQNelRalcJicqz6ZIi+X
 1af/csgXvWh98gmE0JGYnyTRtFxAe4lZSMYjbJo+Y/z3Iq4p5pPrNRytdiV07RLqA8+w
 7mlecXQNMYxRw8KU/mqwO1EMDoRqUyx9oCZwiasM8H/BZyxCNEtREbbZKyZHpA7rssdF
 WN/hnxoVrzK8SpVocgZbEI8Qt0LyKH/d+ijn2vKkZ+/X9mq37cL0tHU/MAVt/d7N3JP0
 9aKA==
X-Gm-Message-State: ANhLgQ0iGh/W8lX+2YkbVcURIgxtp4Necu5zEcW/Y+Ss75AOZpDQpp7o
 d+E11n38LhOSNpZKO7T+dZUlv5Z/v0bGyA==
X-Google-Smtp-Source: ADFU+vvlXYcn0/i7j/5tbb29kKUjSUhG+xmlXIjJ3/vsn2B7Dhqx8Sr5W6nbvLON/YJ0kmahFQ6Khw==
X-Received: by 2002:a63:1e57:: with SMTP id p23mr1578180pgm.316.1583196558485; 
 Mon, 02 Mar 2020 16:49:18 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id k3sm22320070pgh.34.2020.03.02.16.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:18 -0800 (PST)
Subject: [PULL 13/38] target/riscv: Add Hypervisor machine CSRs accesses
Date: Mon,  2 Mar 2020 16:48:23 -0800
Message-Id: <20200303004848.136788-14-palmerdabbelt@google.com>
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
X-Received-From: 2607:f8b0:4864:20::535
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:22 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3fa8d2cfda..f7333286bd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -984,6 +984,30 @@ static int write_vsatp(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_mtval2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mtval2;
+    return 0;
+}
+
+static int write_mtval2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mtval2 = val;
+    return 0;
+}
+
+static int read_mtinst(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mtinst;
+    return 0;
+}
+
+static int write_mtinst(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mtinst = val;
+    return 0;
+}
+
 /* Physical Memory Protection */
 static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1207,6 +1231,9 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VSTVAL] =              { hmode,   read_vstval,      write_vstval     },
     [CSR_VSATP] =               { hmode,   read_vsatp,       write_vsatp      },
 
+    [CSR_MTVAL2] =              { hmode,   read_mtval2,      write_mtval2     },
+    [CSR_MTINST] =              { hmode,   read_mtinst,      write_mtinst     },
+
     /* Physical Memory Protection */
     [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
-- 
2.25.0.265.gbab2e86ba0-goog


