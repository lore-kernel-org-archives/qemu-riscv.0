Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKwU-0002XM-QJ
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwR-0002RE-N1
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:35 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:37244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwM-0001hv-N4
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:35 -0400
Received: by mail-pj1-x1043.google.com with SMTP id kk9so3178524pjb.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9ud1EfWIelJCR3RcWsXtUItZIZfuEp3IhOO9JAvYEDs=;
 b=F7LSCfHi+SGSx3bUvgb2j5nMSKhMEk8WXzJWRiAjIYKjpFZWu+Ex+kKyvS8yJs/MMI
 cR7uVCfCMnBO7mZo+YqHeXiTJguoXuolmJe4wmCo1KR0L0RFurYRbOw13QLn2YznvnoH
 TUYsnfB/9TFGXxP6YSmsFZn2su/T3NzEItEKaWXlnLIRxJm63NfiFwxfie+B63WkTAPL
 9zkk3/v1EejBTRU5fNNikm1TwsMx0B17jrblwPFBMjphV55lztYH94CUmHr/hQh9LJ58
 Gmy6QcxG2iPYRf3x5gdxbMAMuIOolu/KMLjUOk3bSVSIUJQmJOoBTEKqPSdllgFrSG71
 SGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9ud1EfWIelJCR3RcWsXtUItZIZfuEp3IhOO9JAvYEDs=;
 b=PNzx154yrxJ7VM7PJQOG3D5xp2dn0q0Rhpjr8fDBmx12Gmi+peTukyJHPO3O8QVWYX
 1zY3wHsyDFPA9fZ08Xge5QUKIZ4sci1mutTE/+p+7RMWrCEXpWBRSkavHMZJFe2tS5UT
 elnIBPYX5z1u5qU8hfzEaxXCjLiidAt741LkCLTr93KfW/+kJTpzNljrFtAkoMRMD4tS
 7PHzgPFNFacC5D7z3pPO7pxOYFa6EYJ76lhzeSBOm0p+NgMOUDrdVct533uz9fXGyiOB
 q7AYyFPIhMYA0knbITHz99y+ABozP2o0XwCnIcKYFtFIv9M/ka5sQpfybXOq0AIkuw3W
 tunw==
X-Gm-Message-State: AOAM533dfb3dmP+931HzCk11bgm0QEUrKt34CZSHBCM3MRYvTA+uR/ZC
 EHQuS61C195rZo0MRNNt2BIFRQ==
X-Google-Smtp-Source: ABdhPJzcvRztNHPSE3d/SFCF3SQpUTuNJaAwVwU2+4XZqDbqT3gqZWF224FakcKDSEu14xlsyLivZw==
X-Received: by 2002:a17:90b:30cd:: with SMTP id
 hi13mr5254213pjb.82.1601406328574; 
 Tue, 29 Sep 2020 12:05:28 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 05/68] target/riscv: rvv-1.0: introduce writable misa.v field
Date: Wed, 30 Sep 2020 03:03:40 +0800
Message-Id: <20200929190448.31116-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:36 -0000

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
index 05aca3243b..9292ee9963 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -552,7 +552,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


