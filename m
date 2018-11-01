Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIMoc-0007DP-GO
	for mharc-qemu-riscv@gnu.org; Thu, 01 Nov 2018 19:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoa-0007CZ-AI
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoX-0005F1-LU
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gIMoX-0005EN-FL
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:49 -0400
Received: by mail-pg1-x534.google.com with SMTP id o14-v6so108188pgv.7
	for <qemu-riscv@nongnu.org>; Thu, 01 Nov 2018 16:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=Af8rVrWHdvztrVxLd6qw2DArsRBAN4E6UCg+lL/FuHw=;
	b=MfjVXeUI91yMAL3zHg6i8pq5rZGiBxqU6QKW82ik6P1WIpZ5M3onU4xKAY9z8V8Gj/
	tAXAav+MGzdDlwvYY52u3PwIJsV/hi15WAH6wTnaV0KfT1IvS9dvKcbXgRH1GBl4kAYI
	8q8kG+RksD4C84hw+jyvYmle/ZQx1UcmP/CGGP/leR6wHvq45YKxX5Lrpg5jfKe0GkjT
	SYRi9XU23bvdoV5l40Y+HaOUyjGhRr3JBJfgd4IV5dOR5gmJ3hTU3k2MaFnqZ9RLi0l7
	/+ZL2iFnr8iLvyAVB97SRppx3BNSHNYJ7OGmOZufrWr5x+ShjfBbleJVRIw34gvTi4qs
	4ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=Af8rVrWHdvztrVxLd6qw2DArsRBAN4E6UCg+lL/FuHw=;
	b=eq/bOUQEzuBWzsLmmtCX+osqBLvTdyeFv/4mPdI2BX53YYxKUw7pJX5RlxlN7wcD73
	KPqm9oZGabiwW22MxMLmuYBzIURT1z8aV3gLYNj4IH+2Y1FEyCLsuxk5ik39n56PpkpN
	je70P/Y0wsYYjqd2WBJ7X+H4rcEmY9Me6o/8Vr1OprXibMP9yXzUj3xhcQ7KTToNxvwy
	68ZgGWf4wvQxZ6pRNJ8t0wvU8IQMF9d7O/mxjlJZ2oJFyGyd32kXDpNqsy/C9uVUr3Sp
	lxwrDA0m3d8mvmDo8ocyoi2n6QVXJ7ph+D/Qy5Eg+2m0Lo/HTDmGvvINl99Ac1PFLLqV
	k0mQ==
X-Gm-Message-State: AGRZ1gLvFgcLx1/RX8q1G5o6p1rtkChC4Qp3dtibEWILqsfY9/X0u9m5
	mTs+ymM8VAZ6aVMcxKGw9FaiSK4rFR8=
X-Google-Smtp-Source: AJdET5fzvHW42HQ7P60catbkRTH+VMa3+f5j8XiVd2MKlc7+vqscn7FyMtmn66nKc6C6tIw6+YJl3w==
X-Received: by 2002:a63:1e17:: with SMTP id e23mr8877289pge.130.1541116547950; 
	Thu, 01 Nov 2018 16:55:47 -0700 (PDT)
Received: from localhost (198-0-202-11-static.hfc.comcastbusiness.net.
	[198.0.202.11]) by smtp.gmail.com with ESMTPSA id
	o27-v6sm35037743pfk.85.2018.11.01.16.55.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 16:55:46 -0700 (PDT)
Date: Thu,  1 Nov 2018 16:55:23 -0700
Message-Id: <20181101235525.29042-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181101235525.29042-1-palmer@sifive.com>
References: <20181101235525.29042-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Dayeol Lee <dayeol@berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::534
Subject: [Qemu-riscv] [PULL 1/3] target/riscv/pmp.c: pmpcfg_csr_read returns
 bogus value on RV64
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Nov 2018 23:55:53 -0000

From: Dayeol Lee <dayeol@berkeley.edu>

pmp_read_cfg() returns 8-bit value, which is combined together to form a single pmpcfg CSR.
The default promotion rules will result in an integer here ("i*8" is integer, which
flows through) resulting in a 32-bit signed value on most hosts.
That's bogus on RV64I, with the high bits of the CSR being wrong.

Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index f432f3b7594b..03abd8fe5eb7 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -325,7 +325,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 {
     int i;
     target_ulong cfg_val = 0;
-    uint8_t val = 0;
+    target_ulong val = 0;
 
     for (i = 0; i < sizeof(target_ulong); i++) {
         val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
-- 
2.18.1


