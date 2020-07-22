Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAt1-0006IA-5P
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsz-0006En-Nz
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:01 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsy-0005GX-23
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:01 -0400
Received: by mail-pf1-x442.google.com with SMTP id m9so876491pfh.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X1LjG6RnJFzOwqupbNN0fmDaBqQS4kt6NiMvgH0v9Do=;
 b=AsemGna+W0Blh3cqN058BH2n1LSs+uk/6prjWLWNB6knKdgwWv5/iVL0utXJMUZBa5
 9Q7DYpptA9tnQMTzjtKqBrv3t6f44nozJzC871JOaHhmlrIfeGYlw1Xg9JHUlcdRmxXS
 UjmqTuX9N2uGGZf1xgeQJVRDc8+wnJCK9L5EDbp6ktqh4o0IsYAez9grhHlbkR4vC4A6
 TztujTiqOVmC2OHfxRXPcuxSRHSjmybVBh7oXyAhWtylzWSEu5ux0dJSQdy4R1b50nxd
 INedkWUH9MiOPfNZipDBVGZploPCYTQd8YS23SwfQUMmxjc58JC46lLfm+QgVL8G2T1L
 7NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X1LjG6RnJFzOwqupbNN0fmDaBqQS4kt6NiMvgH0v9Do=;
 b=Ukhq1WXkr4gUR20eo7WADm7t6tYFLjDOjxRfktd1bjKmMxEnh1vuL/6HZ24iMvJFP7
 Og+bmUeAdq04AJT4sj33cawiL0YcoIpKJdQTTI7t/5U4I1VO3RCkc/Zf49GGs4awzEi1
 5l5BB1xsO2cxZFiV5C8eKpDaDddUIPMeGC++g+g9Xi7Xny79Jr74X/iV6km8bXqNYI+T
 PXUeORmcdhZOS1M5wgPuCdd7eB3csNUDCOdWvz1Oez9+GE/NFlNwLCncO751CttSRot9
 QZO0wmy8bKIaaPt8lP5D6Qp8fvQLb1ysR3puA/oFZm+9CPs5uIcTaOTyv1x04SkaPOdk
 2Y6A==
X-Gm-Message-State: AOAM532CkqGTuKqwcymOLSH8xA8+iFL1HaHUjVLE1tzCW1YUqPJRB71a
 VPsYDcSrByCQWDANI3+XcnDk5A==
X-Google-Smtp-Source: ABdhPJyq3lYX4I+k9jL/m85IDJag6nyaAaEwIpP+yBJ7j90p2xPOgu8VXKehVN1lTRv/PKdpZqYJTA==
X-Received: by 2002:a62:3587:: with SMTP id
 c129mr28124312pfa.212.1595409478746; 
 Wed, 22 Jul 2020 02:17:58 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:58 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 07/76] target/riscv: Use FIELD_EX32() to extract wd field
Date: Wed, 22 Jul 2020 17:15:30 +0800
Message-Id: <20200722091641.8834-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:18:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 39f44d1029..4c0a6198e7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


