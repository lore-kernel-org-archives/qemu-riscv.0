Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGAG-0002u0-3P
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAE-0002pM-ML
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:34 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGA3-0006x7-SL
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:34 -0500
Received: by mail-pj1-x102a.google.com with SMTP id p12so1241795pju.5
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hQEmfK2mjoKViE0Mico8qOyhYGfBsHKCdOM7kVbAmdE=;
 b=V5HynIdAOWAdRkelQHEIXCd0q+u7BjUdCQMEVyVAcElNneDgg4cRjbwEEQIhuq+mZG
 QaCynKSPLhKAnk7WwWNiFqGjR5N6TKzFbhXHVvKxh+jNDvU804g1ul+5w1bgLkdegSY4
 KowsEl4omZQAI876wNYul5KV+u5AqZz1ZsGHFTP6kcuiu+WOt4Kc5b9b9lLenrwvakv1
 NICWdP/C1P1iN17shCphej63fpbW/QN1eZwwihMr7F8lWln/z5+Jmp4dBHK86B4RP1Td
 c2hIS4bg6195R1hkcHbipwkJjc83VFZ8esCy7wHufzq1xcTsDntrx8ljuopz7DCnMU2Q
 oHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hQEmfK2mjoKViE0Mico8qOyhYGfBsHKCdOM7kVbAmdE=;
 b=jj1rERMdYCmXvsSp5Y/5QgZoG8nxPwHbZpzMGwprcI5Y9RQ+1vCdg9VY49ovBXferY
 hWJ6cOwf751StTBWLCDcp8fK5YXO+utSlbursrA5xL+0MrRCOEnCzKP/XJ+VHa/VNl9Q
 VnxIFs8nvTsuSJ9YGSE52MgmYBkrsRSMcEPPWeP5BTOr/if0LXi3huoWvpFg42/LASNa
 YC+RW0FLo3DtJVzjRKnAWAmruAprgA4YYCKAXGDp8K5McxGDPThvwsrvwywMf2yiOfU8
 TAkaVKd/Ru5jvMpVUVvhEJXLS8c3Gl2/jnRXicR5RKcL+DPbF5I/dkYvHDQm7/l8vL3W
 KB8A==
X-Gm-Message-State: AOAM531J2311svEF2GnVn1k+fGOx2JXACZROHPo0Q1bV5HfDI7l/Mbb6
 W+Hwv3sDSONgZovQ7NAovIAyvQ==
X-Google-Smtp-Source: ABdhPJzls1Wvm6loxQNLGah9NnMA0q1wm22aiuWHZ9o1m8TpBcd2PCG2OOD3dj7kEi9aE5UK26Tv4w==
X-Received: by 2002:a17:90b:346:: with SMTP id
 fh6mr3643596pjb.225.1610444417653; 
 Tue, 12 Jan 2021 01:40:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 05/72] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Tue, 12 Jan 2021 17:38:39 +0800
Message-Id: <20210112093950.17530-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a70a78386da..c8b1e4954ec 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -579,7 +579,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


