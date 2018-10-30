Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHY7y-0004WC-Jl
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 13:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHY4f-0000id-I8
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHY4T-0006dU-MA
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:44:59 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gHY4T-0006ct-Gb
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:44:53 -0400
Received: by mail-pg1-x544.google.com with SMTP id k1-v6so4594704pgq.1
	for <qemu-riscv@nongnu.org>; Tue, 30 Oct 2018 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=yvEEmUYHpdYM57JuzbvImyKfpbdaSkBP5AnKimFXT4s=;
	b=e5d70HcySvAHeBEslMqKomAUAZU6N0CPHeAQBxvEcswaCKH2mqbiCDhscuN04S3KpF
	A2HNPFGF1H4gkQebM3QGT+3KY3b4nL3tqwt+PejF+En7R5sckAEg9PmyXTzmMI57G1AT
	xPoWxJ8Jo8mtl1TiQY4cPco8ufsq8ZLGYJfaxqGYC2313Er6hLmI6xbwHBU0F9T+qL3N
	xIkiE4Hm5GnFrFCfite6wBHKnuSum9oKw1aI7DLPN06gniK6+xQWabS5BfX0tLLk07+W
	/XItfvKM4SfHlJJxheiC47jCVTkGDJh4M2sno9ZvshU2ASc2QaHwnIMKJe8CiK0Dyot4
	LqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=yvEEmUYHpdYM57JuzbvImyKfpbdaSkBP5AnKimFXT4s=;
	b=myKauUQ5UCW658fCzve8lzUNuFQu6ha8pmu4loBTlRIZaQNAK2YtkHAxDn7ArfWfk5
	AxCsi4UjwUgxWOM+zw8lW6BTehxQu1u5xvVCft5A3prddz4o6tG4aaFKP0eTbf9gEZHN
	i2Tmswl3xfEGzRaPGsdx/9gZ8qTsgNr6k61RDRJlaIjUzvwgbkF3vqS0bB4+rj/d4Qja
	hWkWQk2RHqQB9HCDWGZBUpNkLKj7BFooxhKvaFKa3tnY8E+UoXcjBOeRcJyoYuKa4I+o
	u7V8rpw7+9LvqU66H4aZXx7uX1Zy6WbnwxNFN5IfFvszgYL4N/zYe/qGU7AYpnRkBOX1
	Tn5Q==
X-Gm-Message-State: AGRZ1gIzRfo8Ge3mTnhUWNa1xx+FHga24lQN7t1ofasUGKU7Uw6sfE1M
	3MB6KkgQjVMk6Jt5mEEys7nuTA==
X-Google-Smtp-Source: AJdET5fxm/uRUC5fehOO7EIpZD6AlAexrThT2dkr4isf/qusnHhrH2LwScIcCYjosbAFRad1zaqhQQ==
X-Received: by 2002:a62:4784:: with SMTP id
	p4-v6mr3848036pfi.257.1540921491932; 
	Tue, 30 Oct 2018 10:44:51 -0700 (PDT)
Received: from localhost ([192.55.54.58]) by smtp.gmail.com with ESMTPSA id
	r81-v6sm56986507pfa.110.2018.10.30.10.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 10:44:50 -0700 (PDT)
Date: Tue, 30 Oct 2018 10:43:56 -0700
Message-Id: <20181030174356.16915-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-Mailman-Approved-At: Tue, 30 Oct 2018 13:48:29 -0400
Subject: [Qemu-riscv] [PATCH] Add qemu-riscv@nongnu.org as the RISC-V list
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
X-List-Received-Date: Tue, 30 Oct 2018 17:45:09 -0000

We now have a RISC-V specific QEMU development list.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d550fd8b809c..10983bd52d64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -244,6 +244,7 @@ M: Palmer Dabbelt <palmer@sifive.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
+L: qemu-riscv@nongnu.org
 S: Maintained
 F: target/riscv/
 F: hw/riscv/
-- 
2.18.1


