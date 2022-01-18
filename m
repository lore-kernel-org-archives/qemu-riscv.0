Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9daH-0000qy-9l
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:46:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZg-0000nI-Vb
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:23 -0500
Received: from [2607:f8b0:4864:20::62a] (port=41884
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZf-0007dl-B1
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:16 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e8so9385920plh.8
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZhf6WUxiKUaxehAiUz4fIBn6ErxVvFCLfHb2BIaP+A=;
 b=gS6JR6YdwD6KfLuxojUqW7t1c7Y9Jrsrs1q6Yl512Gmd3DifQFgfx0QHjMfMuGlosb
 sNDras4pnkRGyfJiXXWmPh8Y0tE3R0m2p9D67GlXHbuTmJHAwnJq2Y9U8iUwBMRbMU9t
 /Nwxy+R/GWWVIjuw5wA1mq4YHBBatVDOrb8cRJFRDZxntXqz7gsTT2WcwBINos1hLeiW
 nISi/4FnZL88LbTYlS/KwaZEbdT8cpTlp4LqivmNQYI6+/Es769hLGRG4/zZvOUmrGXt
 nU/CBFRhPZLeGzqM1l9jF1JDT+82so2xVSAcQV5C6+7oHwSy9A5i/7TLC6JEaVDG7SoQ
 e/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZhf6WUxiKUaxehAiUz4fIBn6ErxVvFCLfHb2BIaP+A=;
 b=sZBh/NfP1H2lt2Go0DdZ0jOJOYfekcsWB9RZSLgKBQtrLNBTqsTkgbdno9BT5mXzgw
 rDv5lP8MQolmAzxbnNbVGGgK2hrvlEF3eWJOXbHU1NSIbJtTwxTHbJxfF4npvwOeX+rI
 D9o8VlGGQE/oI7cEbfRIeoj4WrFk92FsUSlXzgQ6QLjwcS9qOpn2II+CqEmObpGDJ6kU
 xWFM0Zb67sgFRzmGAbHmd+7GWdOjL1tZklFgFi/Y1ZctAaQQwUCeSNR5wB8ZifOjLWPG
 3O8ko4Zewm39BKsBi7P3uzMFdMnsZuuDYlqOfm7cLlzYKUMLGSVlmC9pC4QykDpUUtHS
 jA7A==
X-Gm-Message-State: AOAM530Ttf4ie5xRSiO7qp0hqOcieDNxBKIg1HggGQjFPNOKK/JXYl+z
 0ZZwVwPD/P2VykVeDpHvD+XqyA==
X-Google-Smtp-Source: ABdhPJxommjD7m1NyRx/kahODzsrVkkq+ETzjK/Z28jOmdJrxlzrI3OtXDsLj2L3xP2ucW5yrzWP8Q==
X-Received: by 2002:a17:903:1c4:b0:14a:555c:adc0 with SMTP id
 e4-20020a17090301c400b0014a555cadc0mr24999641plh.101.1642470374143; 
 Mon, 17 Jan 2022 17:46:14 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 14/17] target/riscv: rvv-1.0: Add Zve32f support for
 single-width fp reduction insns
Date: Tue, 18 Jan 2022 09:45:17 +0800
Message-Id: <20220118014522.13613-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:46:30 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector single-width floating-point reduction operations for EEW=32 are
supported for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fe4ad5d008..b02bb555a6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2976,6 +2976,7 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
-- 
2.31.1


