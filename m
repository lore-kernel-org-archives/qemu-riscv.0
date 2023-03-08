Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0Gm-0008Ij-Ud
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gl-0008IF-RU
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:15 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gk-0002TF-Ao
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:20:15 -0500
Received: by mail-oi1-x236.google.com with SMTP id bh20so13111220oib.9
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjW2PxIff7WUC8TEvCQOmsPa06E64WLCwTpLzA9jEVc=;
 b=iSRLjPSvBltwfW8ERamN+xLffumBPsIW5XKxwlt/cQPIugDdfgNunqPDAYwC/jmPpM
 QgcX4fvZUS1QZLhNLCiNJooa7YZbMLHcGjxXdbLCU6GW1/M/3MVF52D99KQdpM0ClaGv
 NcEoPEBRIwv6/2vLsgMZyBsuLTqsVSd6aqncVodeA3tC25rHDsXVlt76b3SVfa843uP6
 MTkzygazlGlg2cpMGnGnt2RRp+C3bv1f4JxoIediyase/9ruR1+UvCo2DXR/4bd8ZOQ/
 tjKvPmHr2gP2LLRsei3dPGOrdguIh/OoAAD37pHT+Cjli1Ikc8u0UjtIhW9u4+X16jbH
 +wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjW2PxIff7WUC8TEvCQOmsPa06E64WLCwTpLzA9jEVc=;
 b=6dJVFzvQh7FrIJCN98WsBoFJmw9bEn1hVQZVOBJDONyL4NZS0j35mYxWK02T4DCuzr
 qq2cxnvOkdIApur+CdgFnM0EloqG0NpsMqu59s+2ufX+7De+xMa4FCj42qsfMc9nPrJM
 5IGTSoHeQqaJm7I0c8wSYF47l4mSlZ37L3oEedfLZ1/ZZq9NdeQMVny7wSpD6YZ0efcD
 y8OK6vbGBIm2pOXH6EUApFGeXxUHCxSocqUn7a6Zxf8Xz8/knrgwlxrgB+bGXuzHSzTH
 v3YAC56Ag1N23HQuevjToLaWhEzkEBFVPXg19XOruhZWFaDfu/u+d/B0BdyXowixqwDC
 4R/w==
X-Gm-Message-State: AO0yUKVrfcLXSrHG1gPAUXLqKfTwov7WyUAZ3ktXLiIGgmVl+Hr+vhvw
 hkAAPaMjMyuurB3CpPJ3pWCbvQ==
X-Google-Smtp-Source: AK7set/07PVVxP5LDvmFSZtH5XQ6CMkz6B72/jKe/BSM1jwUIgLvsoKm8UNAxsreKCruRkyK9DykNw==
X-Received: by 2002:a05:6808:8ef:b0:383:bdef:6589 with SMTP id
 d15-20020a05680808ef00b00383bdef6589mr8332866oic.56.1678306813713; 
 Wed, 08 Mar 2023 12:20:13 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:13 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 14/17] target/riscv/cpu.c: do not allow RVE to be set
Date: Wed,  8 Mar 2023 17:19:22 -0300
Message-Id: <20230308201925.258223-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Mar 2023 20:20:16 -0000

This restriction is found at the current implementation of write_misa()
in csr.c. Add it in riscv_cpu_validate_set_extensions() as well, while
also removing the checks we're doing considering that I or E can be
enabled.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49f0fd2c11..7a5d202069 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1045,15 +1045,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_ifencei = true;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-        error_setg(errp,
-                   "I and E extensions are incompatible");
+    /* We do not have RV32E support  */
+    if (cpu->cfg.ext_e) {
+        error_setg(errp, "E extension (RV32E) is not supported");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-        error_setg(errp,
-                   "Either I or E extension must be set");
+    /* When RV32E is supported we'll need to check for either I or E */
+    if (!cpu->cfg.ext_i) {
+        error_setg(errp, "I extension must be set");
         return;
     }
 
-- 
2.39.2


