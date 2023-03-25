Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2Qq-0003K8-7W
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Qo-0003C9-Tf
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:51:34 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Qk-0007bt-8a
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:51:31 -0400
Received: by mail-pf1-x432.google.com with SMTP id u38so2800344pfg.10
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZzGkDNKJyeVgH+y0I2Kdzln5emHM1louuJn4iuK370=;
 b=lSx9DPwcer0vUPxsdTS+16jI1aAOa3aTanCuhdwwUELsLTPtr5JC43Eu+YEQfFOT01
 +0cbdPalZWVEWJIWaD1ZZ72l4yXeqZwTrsNTIQ4fFlR/ruIBQUlXLj1aVhD+KL5xKWlM
 hIiG0pPooETlvyeqqRQrdJ1FSReR0sJHQCI0kbmJHpNsFnMT1RdsbclE28riTvIT/Tq9
 TN235eG4uavFli0s+JQHHP2Ew63J4FpXRrcMRRTF9XOYVacCSUhdAbEYhJok+ELuxEKB
 /MGs3lkAOS09o6AGTXfrQBcMUiaN2ByOx1+dbTrg9QhJWNVBDLzHyRKrmRriKYielA78
 N6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZzGkDNKJyeVgH+y0I2Kdzln5emHM1louuJn4iuK370=;
 b=Je0sDrbQ8EEo8fm9Mk5TATVDPmxqkhY6ATfN3lNp5cCdlQOCf/4GdMlOwJhDFPcZin
 CRfnAMLftxNkjKOYMyk6vqkQuxVAMKzOWj3xgPKhFrMH1fATOJG7h9TK5Ij5XokSjnOp
 iTMJxXFLQ6jcx331kmG78QIgOWW8lhXvlJVkYUULI5ZB9zCFx5Uq57RUeG2ArkiBFahm
 qdUajiKkwjSj0urmWJJGim9e8IndDWZ3SC1FA3fhYca2Cd2DJ0Tt2o8+2GfY8C41oS4V
 vKy0nmn0daICbYOICuXVZqFtypReUfjCBh86dTUdg+lw+SyKk40z1hwOXp+UIwY+OpcT
 VVaQ==
X-Gm-Message-State: AAQBX9dZhPsTlcfu2azHEtJz/7NciBugFAAXT7l+YB4xHt8PnFOrTDEm
 A648Qrovp66uBpuhwHdi+tBkdHehCrlDl8cjTUY=
X-Google-Smtp-Source: AKy350bsP7N35nJaG94eCYNQ7+K0szm96jbzCnBmDuHwiJprQvwPZpdF24CGaPT65CdwMU6W7Yr66w==
X-Received: by 2002:a17:90a:181:b0:23f:7c82:2468 with SMTP id
 1-20020a17090a018100b0023f7c822468mr6193690pjc.31.1679741690150; 
 Sat, 25 Mar 2023 03:54:50 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 22/25] target/riscv: Don't modify SUM with is_debug
Date: Sat, 25 Mar 2023 03:54:26 -0700
Message-Id: <20230325105429.1142530-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 11:51:35 -0000

If we want to give the debugger a greater view of memory than
the cpu, we should simply disable the access check entirely,
not simply for this one corner case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b26840e46c..850817edfd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -837,7 +837,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    sum = mmuidx_sum(mmu_idx) || is_debug;
+    sum = mmuidx_sum(mmu_idx);
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.34.1


