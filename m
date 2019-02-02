Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gprzE-00075A-6o
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 04:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprzB-0006zR-Ie
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:53:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprqD-0005oN-Sv
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:44:03 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gprqB-0005cy-OM
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:59 -0500
Received: by mail-ed1-x542.google.com with SMTP id d39so7433929edb.12
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 01:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=1CoMbp73UuffZba1TOHnL6qV9rcmsSpU5Lu5Vn5z66Q=;
	b=Nbf8lU+jQ9Qn35w+U60oiXnTu+sqhRrCEACydg35acsGR96ct8vxEOpcQDxHrdiMUk
	N1ye1eeTST1wn+u6UonmkMUXM45sZ8y7JtQRVwowy9iDuB4RLk7rU57NvJklc/BrW2vG
	9FxqJbYseq0fzewrF+63nsvWVeUW+tu+NQ1+Uo3rrSJZIwT+fP4LNYVkH9goZqPDhtVb
	7ivq6Z2MUOCqcOBRvShbtn3juWNRlhdehaZGWZagznRCdxd89toFSo/D9NaHhOTeKj8E
	ow4rsI1A5KFhat2Bt5jygERafANa5ke8gro+RWLwYbvSkGtLBAFDPKCSUXjjBp3WmTo5
	pYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=1CoMbp73UuffZba1TOHnL6qV9rcmsSpU5Lu5Vn5z66Q=;
	b=Rl8f1FsiBQgj6nvutz7DWs9BDCIeZqrpxn4iUZuLdmVHyngHg/y49uRXxWqjx24N0k
	UoryLWa61KOqMX6fDa3YfQVT2KDUXahkuJdnT8aR6Q3KDU+K1SLqnJZiCIkkvmXQv69v
	VbYSaTR7A11uqL1nM5+XQbqXvhJnIO/mKqzSopw3iZIONyv3ViQC3bu39N472emAqmBM
	5NO9QjeCH3gfDlvROiZIwjdV1c9gPphkD2kACLLuLgE6P/oART2N7ERrKK3nej9Nnw1v
	TOQxOC600kYbO4Jnw4xBlnOTbq6o74Db4porY7IxQqdFozZMtSOn57yAuCCXRLO67j54
	YQSA==
X-Gm-Message-State: AJcUukfTIqfqGLmAh6B9hyWI7ERXk0poqQN7jImXxaHLnq6LUDQmk2Uz
	kd+dNJJHJBdcfL8oqQtTBYwl2Ab4YJldLA==
X-Google-Smtp-Source: ALg8bN5scv0jaGCKYcwgK8mIQkFjSZf2lKkq6tcQX6/DUIq6BOazCp7UemqUEQn4g9ppTDMhS6HLSw==
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr42998259edq.30.1549100631062; 
	Sat, 02 Feb 2019 01:43:51 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id r1sm2590568eds.1.2019.02.02.01.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 01:43:50 -0800 (PST)
Date: Sat,  2 Feb 2019 01:43:28 -0800
Message-Id: <20190202094329.22874-10-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190202094329.22874-1-palmer@sifive.com>
References: <20190202094329.22874-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::542
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
X-List-Received-Date: Sat, 02 Feb 2019 09:53:18 -0000

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


