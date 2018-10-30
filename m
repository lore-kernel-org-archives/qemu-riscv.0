Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHbTo-0008JE-Ru
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 17:23:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTi-0008Dj-Qz
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTh-00066w-Fv
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gHbTh-00066V-9g
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b5-v6so5563756pla.6
	for <qemu-riscv@nongnu.org>; Tue, 30 Oct 2018 14:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=CFyilsJ4zBRmNwmLuX8k666TGyY+hBpyn5KMF6kl5Qs=;
	b=g2IDAnEuQ9jO1600UsDpYHIiwyB69Xt17WIaZ1XRJyrT5DDFOVjA9wYu4aafRn0sAA
	wgATC6xtjqIAYoVSIAcGTdxf70O8Xa1mzWhjQZdHGsBdn8xsUQfUtvgSVTLQcTZmY8+C
	5ZZWZC+xv1NgLv4ukPc146S9Aae48zm5+j9aM4/8gGA6tHeNaHVHogUx5pOzjWQgefjR
	Lrx1yfUOmHKNKRz0KovknSa8ysym+KjcptC5aWMC7kDGHYp7mVsbdeF7bRgbc63BVIJS
	tMV3ebIfri7KOPrKrLlZ3Z8qaOvd1SNJvQs+Qo0B1m8HNF+99wpGggJcDkGNBGi+TNLa
	8pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=CFyilsJ4zBRmNwmLuX8k666TGyY+hBpyn5KMF6kl5Qs=;
	b=oR2Ys9JwZW6B1jYf+8gpp+TCgPtpgxt18mihUMx+uLi4qOgtvtY+iOtRrqpMse3JNv
	LTHkLCdbn8ZHmKPsA1TBnGcpm27JReu4tBppkVLGlnJTfPGiXUmI3jgM00ZLrjuighjj
	VzRZ95kIQHV9tAi0Ngeymxv9LH9LtNY5PzU9UFzTT0jr/2ZYnKgwysZKUz2t+LepnAHp
	l/3iFoucLIFWFCrSV8sFQ1wRgVNhWIhhzh13vKBPVGwsNkBUzCqbs4hradlAtP7AxEog
	BINEM3dAYG2aCyAV936t+dptIRcGwRo4OPZv9ptGHm4+3ns1E8x2hXq/RKBuORYBwhCl
	sQEQ==
X-Gm-Message-State: AGRZ1gI/xZyQf0LuAjrYgsoz6uPLuBP/zrEqW95YjAO4ALhrG9yVGAOx
	FBpsUO3B0rvavoGezg9X3pHB/A==
X-Google-Smtp-Source: AJdET5eMdSSwnBKmrjV19ro37O0MmjiR23MgdtCmYFq9qp917+/h/AFPSkm4eJLWpIRnhSfrnW4KTw==
X-Received: by 2002:a17:902:8ec2:: with SMTP id
	x2-v6mr358954plo.157.1540934588253; 
	Tue, 30 Oct 2018 14:23:08 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g65-v6sm33092228pfg.98.2018.10.30.14.23.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 14:23:07 -0700 (PDT)
Date: Tue, 30 Oct 2018 14:22:48 -0700
Message-Id: <20181030212249.7117-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181030212249.7117-1-palmer@sifive.com>
References: <20181030212249.7117-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: [Qemu-riscv] [PULL 2/3] Add Alistair as a RISC-V Maintainer
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

Alistair has been contributing to the RISC-V QEMU port for a while now
so I'd like him to be officially listed as a maintainer.  I've checked
with the other RISC-V maintainers and there are no objections, and I've
also checked with Alistair so he knows I'm volunteering him.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d794bd7a66fe..d550fd8b809c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -241,6 +241,7 @@ F: disas/ppc.c
 RISC-V
 M: Michael Clark <mjc@sifive.com>
 M: Palmer Dabbelt <palmer@sifive.com>
+M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
 S: Maintained
-- 
2.18.1


