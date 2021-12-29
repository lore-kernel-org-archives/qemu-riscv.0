Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2Omy-0002oj-EX
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omw-0002lo-7Z
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:02 -0500
Received: from [2607:f8b0:4864:20::634] (port=44786
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omu-0004ZC-OK
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:01 -0500
Received: by mail-pl1-x634.google.com with SMTP id h1so11610677pls.11
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qaVaNth+UNNyKKt08kGpoylZGoBah63Av7+61N/IayU=;
 b=lWVwlYEw5HRZQYlv1817KmX7iCT7vVxJwPvTPedQuROCmBE1QeP5lj7Nn7TrfiNm1/
 fvqldqLgRapX4e5GSaS+SoDkVh/RJhzI2Nr8ysPNvgVgSSJvV4+Eh6saCBqSMQ1ICer3
 LuGT5MW6JNLIwqRWFMsuGaQjwbKoK9/PvUubticj6nkrhveNhu/q/BCRbDHFu1f96fWr
 oFDEGz1l0qfgaL5JRKPpVdzrCLyILI4jUrZu8kh1d55Ezwc0uPgFDmEh7olihEKi96zM
 /CJBkDR4wfBmdVP8ChnMfnvrfMLQsojpxXIAeCPJIbKvhr4f5Co9BXOKQCsb0UUWc1Dt
 vgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qaVaNth+UNNyKKt08kGpoylZGoBah63Av7+61N/IayU=;
 b=ItonJuUyYsLHcybi4FY8tmsD6LGr7kLLXN3Qrvz0XRUPzOdSetkjfZHIDF7rwprfDE
 0KZNdumn8lzfcjL/k19gWLA6gSWCzEOBuImmlA89uhjRuBMvTtvK3SSLOTPHw8ww1Nwd
 fnrj8m9azKS3hc3a5AHAVbTjz6rqsBJvg3Eq7gjuY+h9olfECwF8LrPh3hHg4NI7D6z7
 62SXc/ahAyBnPZDy8gQLHOyPAAp801Pukdbj+TlndTJKYN3VPo8cAGsGoDCOCnk0s/oa
 HZto+TkY7h9YxKHS80sbbzSL2jIq46AN4Lfburu/YsaV153S/eegcEvhz5D2d+whKUrY
 qTeA==
X-Gm-Message-State: AOAM530+lQOy1Ps5LGcVwLSlvB8OWojc9hJLIQgQ+YzQJuUbr2ky4o48
 RLmH4oQEi7Ge0erd9xTdsPBFww==
X-Google-Smtp-Source: ABdhPJwwm1PapsekaqyoXS8fFgj8SP9TK1fV/Qc8+xJEc8SvckTzwu61R7US/Sp4YQf+bstQ9CH6ZA==
X-Received: by 2002:a17:902:c443:b0:148:f689:d924 with SMTP id
 m3-20020a170902c44300b00148f689d924mr24491062plm.78.1640745239597; 
 Tue, 28 Dec 2021 18:33:59 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:33:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 02/17] target/riscv: rvv-1.0: Add Zve64f support for
 configuration insns
Date: Wed, 29 Dec 2021 10:33:29 +0800
Message-Id: <20211229023348.12606-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:02 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6c285c958b..5b47729a21 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -129,7 +129,8 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
     TCGv s1, dst;
 
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
 
@@ -164,7 +165,8 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 {
     TCGv dst;
 
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
 
-- 
2.31.1


