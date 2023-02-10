Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTa7-0005LC-16
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa5-0005Kn-TI
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:49 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa4-0007Um-FG
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:49 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-142b72a728fso6637682fac.9
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzjLMWk/zg5NIqlCYu8cQDO+fUx9cI+83L50z7P17cQ=;
 b=cNnhkcIFCuGHxL6bw8t3E8k8HS8HShH4D74l6t/aDvj1ckVtE1T11p2BeCybgnLl+R
 wcxixTn+lvReJCb6wL8UorjS6lD5f9UIMd00UXONbpsSo3vbPUDcus9KkT3g0zJEBTsT
 p35pOEsWGIXe+TQTokKMt43BqNkkbWeXAcHdQ6BWDYAtNsMjPp7fLmBGdl5Mv3BsL2mF
 i+5wxNJeVXrpNQrqHBB5noFtBNn3xDlkJkBUuy/iojqdwhHBMZALdmoPVzI2TJ+43/dq
 R18Ghq1SHZm2oy7kfl6VpFydNpf4p9fXiznMD4tLNvIGIvgshttz1QvJZIY6QdkDYvCF
 Htpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BzjLMWk/zg5NIqlCYu8cQDO+fUx9cI+83L50z7P17cQ=;
 b=pMofob+mucsOjVagJ5d1r6ocowzd3TKHiL4f3PETsrwCKw31ATBh3ufAGt7nexUOeR
 UBEWxaQyybCIoZTcs7jg/2wChpzqiL53JXSLipOEEN5aPTwC/eXMlDZg1kTiICzJBJB6
 K+JsnfkO9OacCNxwWLRM4AhMNeGkfCHBZCk7Bp5w0u97iUay6a+x1n+t4FW3YUSa1Uun
 KLHjE5mmEJWKu+USN+FHVtb0TOSqxJAD64q4TQLN5tvbuPa9me/HC1xpvzeP6MCpAxdW
 /iNH6haf8PyMOmGUASZzQ3PgfmDb8u/jkPTi3+RSIBw85rk/34/ZXBMY5Kh0fRCTx3Oy
 aByg==
X-Gm-Message-State: AO0yUKV5ibXwuRIlOFrKZpHqIKgj7ekX8HQAZlUspV4gBhpGHEPkCz89
 OSgIokbSIGbUZWve8ULoKsX2gA==
X-Google-Smtp-Source: AK7set/pZZ3Dc05O/812dfl+LZ6S2t6AcwYHUVEwQMeGSv8YXeA0Xg/pXsXmnSjJpiBv1epeFIlIGw==
X-Received: by 2002:a05:6870:20b:b0:16a:839d:fe51 with SMTP id
 j11-20020a056870020b00b0016a839dfe51mr7972144oad.58.1676036207243; 
 Fri, 10 Feb 2023 05:36:47 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 03/11] target/riscv: remove RISCV_FEATURE_MISA
Date: Fri, 10 Feb 2023 10:36:27 -0300
Message-Id: <20230210133635.589647-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 13:36:50 -0000

This enum is no longer used after write_misa() started reading the value
from cpu->cfg.misa_w.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 103963b386..6509ffa951 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
-- 
2.39.1


