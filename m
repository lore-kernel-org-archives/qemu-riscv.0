Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHbTm-0008Ee-AE
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 17:23:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTh-0008DX-Nf
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTe-00065d-Rl
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:09 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42410)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gHbTe-00065M-LP
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id f26-v6so6495785pfn.9
	for <qemu-riscv@nongnu.org>; Tue, 30 Oct 2018 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=Af8rVrWHdvztrVxLd6qw2DArsRBAN4E6UCg+lL/FuHw=;
	b=LP+WjAgIRkSz6tck0pT4Mx9Jcv/WIAI5+0zI+t4wOTIXVbbe7REXbPZKfEj4Zn/KIy
	kSReDjxmXjYi1Bcs/wBqO6HICYZAhKMAsHz3PHKagc5sAfyE9DYR6PmrMJmdeduZXfHT
	b78u+C1JXkWTTJjeT2P5pEk/NZqHpMAUUq+wxNif6DraI2rlDRvl8wvx7IJC3oJG/P5U
	dfBF/r2BPWPrNFXjsgXz/79OTjFl4DsCzcx4mGxtTVXzrASPM6bA32oceC+DkL4iDJJP
	Ks0ngKbc67rqHz1EcpF65yFwNvHZmSSkiXGlD29hxIFJcrJdI3AmjyZ660OJKEszrVEk
	V46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=Af8rVrWHdvztrVxLd6qw2DArsRBAN4E6UCg+lL/FuHw=;
	b=mFJgrT1/bFN/DSbrli3ZHoN2fpkIMbm4Y+HHTHIJ9aylHiJxjdktY35tXhNCS8gIME
	/hQN9Ze939PoUPSnzA1NOyATzvJXAQG1jOhiPSIyrxsoXrWgZZ1tzd3tG1JNrtDeU8hD
	5AwMr0smQYS2NTTpd0x26P2J5XNQnvWe2h2Ig9REpqtPm/cUWgtB9OxhLH34UOaCe6BV
	iJ1P/MDnBwbYqb8Nqwoyqc3Cx9ORttCcKr2LxAA/EJyfDP9qEFwxzSod9HfQb8SxHcEu
	P0TOnJvSV2nxslVnXNp0Cr6PB9zpu1O24xNqJ2TmQRmt4GZ9rp1OefFkpFjSvX3Puy6J
	bQcg==
X-Gm-Message-State: AGRZ1gJdY035rg9+ltOZL9iL0OH73ns9w6JO4iJA2wdS9K5XU/hnEmcK
	mWDF4RyGnMfPdaRVqUe31hPP0dLgG04=
X-Google-Smtp-Source: AJdET5fO9s85vlFd+CNennRODNnorqRW+giaIyoacywagKF7b3N8ePfMuabKrzGjFKdC326rJiSSHQ==
X-Received: by 2002:aa7:80cd:: with SMTP id a13-v6mr389544pfn.86.1540934585590;
	Tue, 30 Oct 2018 14:23:05 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g20-v6sm3892617pfj.145.2018.10.30.14.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 14:23:04 -0700 (PDT)
Date: Tue, 30 Oct 2018 14:22:47 -0700
Message-Id: <20181030212249.7117-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181030212249.7117-1-palmer@sifive.com>
References: <20181030212249.7117-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Dayeol Lee <dayeol@berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42f
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
X-List-Received-Date: Tue, 30 Oct 2018 21:23:13 -0000

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


