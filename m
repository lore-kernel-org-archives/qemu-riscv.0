Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dQv-0000yb-Ei
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQr-0000ro-QK
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:33 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dQq-0007gz-3I
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:33 -0400
Received: by mail-pf1-x444.google.com with SMTP id d188so18659014pfd.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PmJPlLLbVG3Gytq6oYvdgoCyUZVGxpYxNeJ9teoiRrI=;
 b=I8ex4h9TehJ7xYu4pYHdQOgqG5kIJJkGa0NVgyDYJGIHqqZkCBDcjIudN/p59enxZz
 Tox13h4KTgN4D2QbG6LbiaZg9wcpJR75mXVj6AJ+Sgy0ZV/KtQdxOWh9y/vgZNGFP2ef
 RCIP42jtKRFgtMFojBSQeWbw1dV8vlL1+/yf1XLdvnCPGFbS4bEdoX0POslLOtKVBb3f
 QIjbF8g8WB+q0PzhYSqvFa8u185iymrwZKls50FWUjFpiJ1aHwkoiU0z2LgLfOq2wxVS
 D8iAgkLNqynLnWMtDd/goT2JlelMhdL6ZB8wnMbVVHolxzZP+qJ8LeM/QNjDhMHMMp7d
 T4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PmJPlLLbVG3Gytq6oYvdgoCyUZVGxpYxNeJ9teoiRrI=;
 b=g3hgBiw0VYJOg1OkM6FIc/awgAkZaXSbpGvDdEbWL6Prgea1QRsRaqQtqFMHEfXYP/
 1x7W64/+oyFoVciu6uk0du8xdHfESmezbMXuCU0YSdQZ89TTmIoyLHQfTBqmdO8tzAj7
 N7mpKs+bmvWjk1kAbBA8/kpVKJs0Ci3CYxhBH5ZtEL/mEqBgv84JKXfJKW0IhekBwx/l
 DrNGG58QF4HBILx1q6kLXXgtjMhrWmlQRH+X8NbI+Y45aH06s0CNfEH0W5wGONd1PCHl
 5DXHoTE36FVrZG/fM0GpYwaRy3MTfqw+7md7TUNlGI6BpqPj7GQ5yYLGNvxvHYPpPTpA
 wrww==
X-Gm-Message-State: AOAM532sr7mB9rs5DmLvJUZh3VhheuE7sQMvOV4J9qU/X+SJFid3YxiI
 3wlC3FMrkURAF0ADzxSHnIT2OQ==
X-Google-Smtp-Source: ABdhPJzukxB/HWZ+14qsp5oD6N71xzlQamJ37WpVqFm/d5Ve9v53vE9hiXn1o31jUe9BqSPFLyIw4A==
X-Received: by 2002:a65:534c:: with SMTP id w12mr6572125pgr.156.1596710850828; 
 Thu, 06 Aug 2020 03:47:30 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 05/71] target/riscv: rvv-1.0: introduce writable misa.v field
Date: Thu,  6 Aug 2020 18:46:02 +0800
Message-Id: <20200806104709.13235-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x444.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:34 -0000

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46c35266cb5..7f937e5b9c8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -494,7 +494,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


