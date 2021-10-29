Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNoO-0002QI-Kb
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoN-0002NO-AT
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:31 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoK-0006qP-KB
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:04:31 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t7so9297342pgl.9
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoS3RxKtxYn80WKvuq4uHEnitPsEPyYOQSmow+3YimM=;
 b=Ec/b/HV10EGpyIvTPZDf7u21b3rdmtRqYkzxRK1BU6YdIHmW1dbODkTyrjHuwA/kSu
 zpG/kM+2tHVKA26ue2BYkxAUfn5S2IKEVd0fuyZtR+Qy7pKSxLn5wlT55LN7XIxth/+/
 rjYbkUUaR7P8lGj0evEPTlHamkNW10wuNf3basT9ZgCKdUsLAjbBHYXmQSmhKPR0QhXn
 eJsppiVpYbYkMj1SYIyUsEdlmS/ka2ash1DK0J6CL3gbvtR1qe9fCzHUpSqwMJVoZICg
 r/seB6VR/qQlktye2yiOxnCbF0pFMBK8fVY6Ms+w94xED/8xUq2FEmV/+b/NTtX8KHYq
 HEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoS3RxKtxYn80WKvuq4uHEnitPsEPyYOQSmow+3YimM=;
 b=C7eiF8bsFYZ0HK5Yiae/0EWB4w3gvUTxPrQzqG5chptukToXdPrJ+ZLWxM2GgzlgZ2
 64FH19l3PlJalr3yEvj91KVNisy8nfdDSShoFXUFxaCsTMv7UBXtbZvZ6PJbnN94hxsN
 mBrb3ipVpMav2p7tc0QG7//tGnkZmDqp+lGHMmo7m9u5A/l861d/IDBXf4WuH6+9Ehlb
 Iu0V4jX2Q3Dn3tvFRPCarFUNjx9F/K1v3e1s8D6UlQs7Vs1xqWNRXaBCHhqoqIO34tWX
 cnNCm/zlTTFy8ZkC3tP0np/n/A4IlDLKjEm0iQaIAn1NBzrcHxawqvcCip5nyJHFSVfj
 o97Q==
X-Gm-Message-State: AOAM5301azjlc6JLRzfOO8S3NgZv+j4NQf6YVxgsVXcW+UZTyhiq+Rwi
 GrwjdEU+WbHwxbR1fk+9GagEtw==
X-Google-Smtp-Source: ABdhPJw2lyVureaTrrE8juOaOMhEoeHwK0P9DhNAFDl+dno5kMUmdfKTdj//IF7pgXm9H6h6Ccf4vg==
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr9611704pfj.79.1635498267391; 
 Fri, 29 Oct 2021 02:04:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 76/76] target/riscv: rvv-1.0: update opivv_vadc_check()
 comment
Date: Fri, 29 Oct 2021 16:59:21 +0800
Message-Id: <20211029085922.255197-77-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:04:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
functional changes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 33ef7926e64..47eb3119cbe 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1613,7 +1613,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.4)
+ * destination vector register is v0 and LMUL > 1. (Section 11.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.25.1


