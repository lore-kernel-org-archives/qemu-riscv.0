Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dT1-0004Qa-BB
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSy-0004J5-Ex
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:44 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSw-00083i-Mu
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id y206so14428203pfb.10
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DQhH2Q4YXEvegCMiWnmy59ZjpowYkn1863Fk7UHo49Q=;
 b=RQ2zqNxhZk49Ts2mpe1T+5pIJ/G7/aBW4vrT6RvizMInbOIqWVmHuzpe/WcQxrUxiX
 UVVQ7J/2cHSdimQqIEqwc2I9REkLC3cBlyzWnjH9jT3h3zw504bkviI/nUPZmC8VpVcL
 0KXZlHYJakba4O6mhleokDTBx6Wg7lhO20qDke1ai4PfY8hCjiVzjE/nIsynpsQ9ONmX
 yoHXBQJtBlwDCpJ7Fv4Is03W1kRtrojCH0AeO0/1aOahsvyJWgttlZOJfwzfq8FPAYP/
 PoJ5DHj5MAIlS0cdxNDlKRGclTRyQy05tm5RTz5upU96lnkGpI1RbRw1qYHzBSuYPxLn
 6O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DQhH2Q4YXEvegCMiWnmy59ZjpowYkn1863Fk7UHo49Q=;
 b=IgyCNLanS5LJr3uMggp7izAC3KsvXtT53BFj/UaUpp85y0Ubyx0zb97bRzz8OK1Pdy
 +SPoidwMJ4mJFvY4biifWsXuPLGV3H1VKC/jQQgFISU47Fs5xV5y82p6e5upPgpjuy0J
 y6EnM/4PWVJBNkvOt8jWPoJN2MzWun+F9eRomP7qYqeF3C+BYseUl68UsWBPrKhf1pzt
 VoP1EJq8EQ5R2lcOmZCj/xec8hSGcwC8E7EC9Rkw9w8AKdO4z/mXhC3/eeR2UWQIWH/G
 90mQ1UHphbJQZve6aNzFJaTIL2UztXjUNq3erdznw2JEHet7KH2mx6iwGOyOfv6+wZ2G
 twdA==
X-Gm-Message-State: AOAM5303T4wvhO6D0YVvI5buKvesQtz9JujkKl0+glGKPE/WsX5OqKpD
 Tn5tYt1PbYVyW20wPclDKyBk9g==
X-Google-Smtp-Source: ABdhPJyw3RVjDkYcyh30/fJ80sFTIxjKQCstNrpmEojzumQmg3ItF5mEgNLdi2rJkqn++RjvGtAR/Q==
X-Received: by 2002:aa7:9519:: with SMTP id b25mr7537412pfp.292.1596710981504; 
 Thu, 06 Aug 2020 03:49:41 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 58/71] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Thu,  6 Aug 2020 18:46:55 +0800
Message-Id: <20200806104709.13235-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:45 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 9e8798902a3..64bd4aa239d 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2965,7 +2965,7 @@ GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.17.1


