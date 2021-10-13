Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1malDz-0007kg-Vd
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 16:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDa-0007X5-Dl
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:18 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDV-00086z-LS
 for qemu-riscv@nongnu.org; Wed, 13 Oct 2021 16:51:17 -0400
Received: by mail-pf1-x430.google.com with SMTP id o133so3534043pfg.7
 for <qemu-riscv@nongnu.org>; Wed, 13 Oct 2021 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=D+RKIJSrxfJNHpcJGNzGycK6QYRa2BPNPGcZASr0Mla9czcCQPwiLvZkJ5Pm8bempd
 AdxdQtZrD+QFLcWmBPcMbS0WT9qFd3WekablEFYreDsdePz0ChK9v/8Kk8wHXkfZ2P1s
 Riordpm/8amCr94KJMuJFD5GdWdQga7xSqF+sKL3Z/7nAQsD9WYZSxBwUdOgf8sCb1a9
 HsU9FlXSGLag5DfSy3tUC3TPXwnEynKHXV7Iwaf1slawled1eZxfJNoKqGSC6h52wGHC
 CmUgJMyqWiD5bXIMBqbcoa7x/8/LE0DX9wlEgxfRr+h3iu/F27yUdyYm4/IM7On2pDhJ
 cDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=pUwpMGawWDjmFMy4u5vqvWpG3kCNn32HoMrDe/WA4IHBgihHub2AwLkvHz8BEUnSBb
 4zn4yhHibcuWJCUwisedOnfY04j1zOYlbKil99iUsofgWZer1OvEvbQKjBUNEQratQ6t
 VC+7qUTRvANthW7ZxP754qbGCXERTiOiEQxJSEngEba0tQsF9P/hfwmKXXj49ESdgHfy
 GpzBvggng+lsTyjGDOmI1KNmcNuqujhsboSjXDvCeiNYZWTIsV0B5H9EIW952PEMcu6N
 s0BxlhaaS0szs+pzGBHKe4oycUJIteoJkm2hLjHDYj1Yne2f3KCZ7o5PsuNjobG8ZKCf
 641A==
X-Gm-Message-State: AOAM530bIk7VuMwqKoZIk1ANEdmMBjXooPxGBMM1ORCNtW+/uaPQ/xBN
 mKl7j2cVQwQkbL5PEBqhgV4lhg==
X-Google-Smtp-Source: ABdhPJxh0gc84dzAMCgttITqPpWRTfQieRfX3fWwJ6mQjXwixLmW3uE9hzJbdaId3iY0Jcpl9eShRg==
X-Received: by 2002:a62:e40a:0:b0:44d:a86:43ce with SMTP id
 r10-20020a62e40a000000b0044d0a8643cemr1533646pfh.69.1634158272192; 
 Wed, 13 Oct 2021 13:51:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 06/13] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Wed, 13 Oct 2021 13:50:57 -0700
Message-Id: <20211013205104.1031679-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Wed, 13 Oct 2021 20:51:21 -0000
X-List-Received-Date: Wed, 13 Oct 2021 20:51:21 -0000

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..bbc5c93ef1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


