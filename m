Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotnE-0004oK-Lk
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:36:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn5-0004gV-Fp
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn4-000075-3t
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:47 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40283)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotn3-0008V2-TY
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:46 -0500
Received: by mail-pf1-x441.google.com with SMTP id i12so131881pfo.7
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=1CoMbp73UuffZba1TOHnL6qV9rcmsSpU5Lu5Vn5z66Q=;
	b=j+hJVkCx1TObPbxDf3+T7Bi42XejxxNJEMhxm+1KU0z6yEaTMTrQas1V7aLCSuxqvs
	8zr3DYNPX0WDkerEfTMe8MnJUeN2kShhpy5Oj244qrK/gPWJ9yjeAxOQpZ7pAlKQtYTt
	IMTGXaibkblsfvol3tAiFLOwJrmwUsLrVsGf04KnLXMDRmKQ+N5SBo1GLAScM9p6gEbC
	gfFVyevzIsATFg+raTJTdIrU2Q2O8ltnXu3JbwvPzSMSVKanmoUPlwRytfSssl/ktxnw
	hLbJrM+iMUc6Dco/6DZhM6i/IvBZslMtMCW1SeyCiJMbn9nybIoZgdHkxav4fdDeZsL2
	on3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=1CoMbp73UuffZba1TOHnL6qV9rcmsSpU5Lu5Vn5z66Q=;
	b=spYUW3OLgNtpky6in2CIY8PHEhNM6k2UBL1M/rfaDd1F4iaYoOAOVABAoOdWb8i1+V
	IOWpHhhDJvuxf8Y/89Yl0AkaTkDFFLnc5XvWFekNYjrFzH65Mbw+CL1/fdPDXcOrUOV5
	R5Q7FHvKrsHSlc5HXsOmef8A88wAzqPJFi+mb4sd3qP0aGJkyPtmUg1mMoqRQZdoJBU9
	T3yrKVXF7+3hTZth/u8RCN8QOAp2Ynlm1871HiaGJNH0Td9HmoTln+yZ873EZC/rEgIb
	hcP3292AtpoNwtt0khU/hI6bCf2W4WEuz7PSXKLWHcNxqUjH3NU1b9vb1dX3/qMuC8aG
	bEmg==
X-Gm-Message-State: AJcUukcezO6KofUOTDAIXILx6Xj7igNjVtZ+WybcQPR4DaB1VUSs65pR
	ibe2UcPD2pNXq556qPszwys9jhY6FqM=
X-Google-Smtp-Source: ALg8bN5t267gdeICSM4cyumAhKi+Mntvob5oxnl83QXlqbAQ9Ru9uuakpCshZEypmB8kiIZLT8T61Q==
X-Received: by 2002:a63:6704:: with SMTP id b4mr28482191pgc.100.1548869793137; 
	Wed, 30 Jan 2019 09:36:33 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v9sm3193198pfg.144.2019.01.30.09.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:32 -0800 (PST)
Date: Wed, 30 Jan 2019 09:36:00 -0800
Message-Id: <20190130173601.3268-10-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
References: <20190130173601.3268-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PULL 09/10] MAINTAINERS: Remove Michael Clark as a
 RISC-V Maintainer
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:49 -0000

Michael is no longer employed by SiFive and does not want to continue
maintianing the RISC-V port.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index af339b86db76..47cb3c14298e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -259,7 +259,6 @@ F: include/hw/ppc/
 F: disas/ppc.c
 
 RISC-V
-M: Michael Clark <mjc@sifive.com>
 M: Palmer Dabbelt <palmer@sifive.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-- 
2.18.1


