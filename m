Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAsi-0005d4-Kx
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsh-0005ZY-2y
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsf-0005FI-HK
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gc15so2627077pjb.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gIClYh77YnToY+rzZTLHItNPlAaqhPTdCd+nqEyek5o=;
 b=Kuoq6oHAYiTccKvHPtXDhHZUKOKrbHn2n0pH7zA2OeX8IN8tczUlD2clgSQ4ucKNu9
 +y3Mq+egu4ffVF97uKG6HX6/OuYE8fJwdyCkTxrqvgBhyAAKoV7RIuaVG8wiVfr1B+ym
 Omm8D3QrmCAlMzM/ALc0eYFtyeCYix4w6qC/EtZRMyj27oZw80ecXaN+vS3Ohc0uRFxK
 iQvK2Ekl70soezxIRZfBwz1PvKoewV+NfhUo7RlOrMdgABCObofEhazKHroTkVTgR7t1
 plk91qrK4f98Yhm44Y47DZ7KpxpcA7tAp/lMy61UEcrlsbWWX5W1rlWYiteLjHvxi5JN
 Q0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gIClYh77YnToY+rzZTLHItNPlAaqhPTdCd+nqEyek5o=;
 b=c0Jbi4dwrSXTS9p4ozgQO0s98Yt1NXWK/AW0x2I4qN7+ANt0fa1f/PQ00Mms9ZiKxh
 hIEUBrU7ixdYG+suSZNfJNa2oxr8cRIG+OVAIBJ05S0vCr+z5SbkhdILywi3EB56Ibog
 C+G8odmGbDbJOsNRIGv+yL8yx3TuElrnvK6p2p8+qsSWrS+SrdaxIDuNOWgBFehG0U0Y
 CuTI9H27MSsY3XgbVgNfSHNHABCoxUpatNQ+h6ZoBZ1oqBooBNA0kU0Ib8uIoXrSIRc7
 aK/2tiAuBP1foDRFfS18aMUYYEXoRK3Pqx45qLGBSZd/K5NehH1FLPMz72GlO7MjKnif
 ePWw==
X-Gm-Message-State: AOAM532TajdIIxxH/nZqKKT4EKAL35kOgiTS24kHXAsjIbGc16ZTfdlG
 qYUYxiYl4rMMwnwUr3bTVtaK9w==
X-Google-Smtp-Source: ABdhPJwzRRM2hFSuka3tv+LFfhOOWLxIoRmM+1tg+X4AzcR62Hguu+QU0XMPs8q/law6HhKtV1BMoA==
X-Received: by 2002:a17:90a:2dcb:: with SMTP id
 q11mr9122542pjm.135.1595409460417; 
 Wed, 22 Jul 2020 02:17:40 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 05/76] target/riscv: fix return value of do_opivx_widen()
Date: Wed, 22 Jul 2020 17:15:28 +0800
Message-Id: <20200722091641.8834-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:17:43 -0000

From: Frank Chang <frank.chang@sifive.com>

do_opivx_widen() should return false if check function returns false.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7cd08f0868..c0b7375927 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1151,7 +1151,7 @@ static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
     if (opivx_widen_check(s, a)) {
         return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
     }
-    return true;
+    return false;
 }
 
 #define GEN_OPIVX_WIDEN_TRANS(NAME) \
-- 
2.17.1


