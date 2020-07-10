Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscf-00068p-2h
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqbu-0004kN-NJ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:30 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqbs-0006EJ-U1
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id s26so2385780pfm.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dY1VnCufQZpa+aF68DC4K7OikxwvWj2GSrpOqri/zyA=;
 b=ZY9uldhl3XCVsiWK2GRXkZh5RfFmPh6KGV9OSMRbSVpk9NNnpIYmjImeKM1/xkw7W0
 fDvXKgrFg4TMXvNQXZSjdLZStDsMOISYAuIpWkrVkxYCY4wAcxopuBlaS3BTP2tlyqLU
 /EcUjFVLYtN1Y1peKwJXd0WiBrSLkcfYL7hIknrKCtk7x4+J5uowplOjEPjerkHzplMu
 wqXPTWJHHC/H3lzk8VgoOrgHfFDMfS0RjmdFcgK0gNjmhijKX3JStmBWqwL5KexpHdtB
 uMNiLgh9K5FqTTAzKRIwM+DK2eM9+4vMZ5NF2GAOAEzpPLLHZ/spTsbANhnSg0Vu3Ghm
 39Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dY1VnCufQZpa+aF68DC4K7OikxwvWj2GSrpOqri/zyA=;
 b=moccVXyrKhhvWYYcyl7KCVoiFOrnQbufg4fg6zs2us8ud3ND04rOfKvy16Fk+wvBjS
 pMfnIVp9VlsiBPkOsaJZuWaV09qjeGX/WJbnTTxgaQ3eH+ooFypdPExe5FUaFm2W+n5/
 qoty3uazZgeq2pdiWQGePSjwI0wFVbOwYRBCeELc9OJwRDF9l0ko2oAJNWFLsRYLAUqT
 G9RfgQXYSSWXeQ7nq8eeJEJ6T5jO8YXWKuO8hh2g/ZJJNxon1eD/2QTtOi5/YERL+vOy
 LYUnE1gpvs+ZnOvkoWcGAfFwHxTgtU0mTK6/H3gfyt69vyPpMSuPNuednE98mBEG0yap
 dxfA==
X-Gm-Message-State: AOAM532xWIqbe//dtsexYw5tg57J1N+P2V1ioN7xe7wWdPcixJPb2tTh
 4iTQEYZ4bOhk+ePVqUBMSac8gQ==
X-Google-Smtp-Source: ABdhPJxy8e+X38Cnw0Gzb9HAP1qeyzPcOIpSgG90Z2J1eL2fzHkCQrqPMN8kbArg0IupXeaXgzmj0A==
X-Received: by 2002:a65:4502:: with SMTP id n2mr46494850pgq.132.1594378227180; 
 Fri, 10 Jul 2020 03:50:27 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:26 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 02/65] target/riscv: correct the gvec IR called in
 gen_vec_rsub16_i64()
Date: Fri, 10 Jul 2020 18:48:16 +0800
Message-Id: <20200710104920.13550-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:31 -0000
X-List-Received-Date: Fri, 10 Jul 2020 10:50:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 433cdacbe1..7cd08f0868 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -937,7 +937,7 @@ static void gen_vec_rsub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 static void gen_vec_rsub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    tcg_gen_vec_sub8_i64(d, b, a);
+    tcg_gen_vec_sub16_i64(d, b, a);
 }
 
 static void gen_rsub_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
-- 
2.17.1


