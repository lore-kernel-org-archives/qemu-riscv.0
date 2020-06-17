Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlfE5-0003F3-By
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jun 2020 17:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfDy-0003CV-Ge
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2020 17:03:58 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfDt-0008UT-PY
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2020 17:03:58 -0400
Received: by mail-qt1-x842.google.com with SMTP id z2so694837qts.5
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2020 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YemnOlklw+URp/aLKC6SFqz2X8HrxCoaaT+NwLjZldo=;
 b=EaXicV2SrI+jZc6jXA3EYsKOVyBml4iIwvFptjrgJSaDZTl1CxdsgLEDDrg+OTstid
 /p0bJ/ZhZckKfDS983OAVfF+wUVE7MwWOnt9zISrGsGAI0TdgZXjmtuZAkylfJPmuJCN
 rWV4jZmZvFyKeJ69TKoVLZO7ID9PNOqbFiQyfE7oNgXwzNxvShyC7SRsUU+wWv3dhOxC
 yRjfgEL1vTFweXxAEIsGR4Sy6ca4YsqjFEIcU7Fb2ifqarqgxi09BpQSMBdIr1A9I8As
 u+47cOCFkkr0RBF25khfp7+zOR4Xh0ga3ykD7odaen/IwSoFIRliyhzHsQkAhSo9Ul7J
 0enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YemnOlklw+URp/aLKC6SFqz2X8HrxCoaaT+NwLjZldo=;
 b=FEqDG1fIQFPAwwINNZxxO9YwIArDNBmNnpWG1Fj6+H+FY41u6MuzQQFgymexNSi1Be
 4XCJHqUppyWLubsiSJSfTA6brYNek38X2DqBXlSC4A2KqW6CjsjBJK1x/W4J7rUwqX+R
 5TX8oY17GtdLerBuXf2+StTCJR6CBvJaBainn57v1Jkf1dVvOGgk6GaLjYUoH9q6CPGu
 uPqvO1ndIkuKh7lCMAsix5rT7opSfc1BtM263OuzqpDQFVSvbGs/9wpVh9LZxNYOU/Tw
 uco1rCsVcQ7O98wRMk3L2NufBUvMM6rK4RadDjqGkqlx2Kjz7L+KtiSihtwR3vdDdGR0
 10PQ==
X-Gm-Message-State: AOAM532fbVG76UHu8F6wsdWsorCldv/gBQStqmV7GvAHMlEtSa28b3b2
 d0Y0SBrQlAZ5PwwyzRaXO+qHpQ==
X-Google-Smtp-Source: ABdhPJxHn8AowkC/EXsVktX4pts+OqQvGVJhH/dy8X8htxveYHYznjUY7wrfF7EOpcNQSeoyRZFQdw==
X-Received: by 2002:aed:35fa:: with SMTP id d55mr1054590qte.385.1592427830871; 
 Wed, 17 Jun 2020 14:03:50 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
 by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:03:50 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, cota@braap.org, peter.puhov@linaro.org,
 robert.foley@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v10 24/73] riscv: convert to cpu_halted
Date: Wed, 17 Jun 2020 17:01:42 -0400
Message-Id: <20200617210231.4393-25-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=robert.foley@linaro.org; helo=mail-qt1-x842.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 17 Jun 2020 21:03:58 -0000

From: "Emilio G. Cota" <cota@braap.org>

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/riscv/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index b0c49efc4a..fe1373a95d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -176,7 +176,7 @@ void helper_wfi(CPURISCVState *env)
         riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
-        cs->halted = 1;
+        cpu_halted_set(cs, 1);
         cs->exception_index = EXCP_HLT;
         cpu_loop_exit(cs);
     }
-- 
2.17.1


