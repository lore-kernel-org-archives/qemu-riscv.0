Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIMof-0007G4-76
	for mharc-qemu-riscv@gnu.org; Thu, 01 Nov 2018 19:55:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMod-0007EB-1J
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoc-0005JB-7L
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:54 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gIMob-0005IR-UT
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w24-v6so118076plq.3
	for <qemu-riscv@nongnu.org>; Thu, 01 Nov 2018 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=4I2mnYR2G028736kl1gDSfh5Wt/aTsLmyZ1p7pZCLpE=;
	b=B4DIrHpt5CYLpGgnMzytE3P+Fu+vEAsH7tw/sD4t17I+I1HrYNjk2MkToZVqblpSEK
	yrWy733PE9aMRRqv986oBthNMCxwGjfyPhGm0JLe04z5UdvNUy4DnP3HuWmWRlW+KSWS
	SvPT1zdc2d9LaBreremNx51zu0rD7jJgCNCd5xqF+FICUvbSsIqEAdtcnSlsNuQRMjnf
	UlL40SyK76sQJ+eelOePYNFfj15UsNJz8Tx56KoK5Noo1sTkzknB9SxxH5g9wryJTDxH
	jEp1oEIdoqSN5alkIBvQfGvOX6HSy3Bmtm2dd7CebmSouJQbLybrOi/Gn4NXMKBKlFfU
	F+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=4I2mnYR2G028736kl1gDSfh5Wt/aTsLmyZ1p7pZCLpE=;
	b=lkEfEXcG7TFpsuj4VKX9qqSFK3dTiHS8DrofkN9vHPRwOrZtWfMXoTRE7Pgn1cHFXg
	T943xQ9kUAX3d0tbNJnS9L1bckCUjdLN0G7lTIgAyCaLWXMcmO3iZNvqab8WqNVJ6JZs
	mwxxdhtwiZqugjN/5hKv/4p4GGvFOiX4iDYyk1viNtO1s7nFcSKsGBV4t+mzODz+Z5Da
	imcozJH5lPldwGE0twcBBU+AQqPXf4MaiQg32GUeUlxlylcLO5h2NTPcLT+tir5npJqg
	zYtnt/x761nJFYoz8HW/yksXPj7OtGyKIkWAvJ9n4uVDdvrPpzcjO+P06Z9Z0kQS6f++
	mmyA==
X-Gm-Message-State: AGRZ1gIYhNujVL1sfku2RkZ2/rZKLJr5j3amsPvN2xLb8/eR3RU9YwU0
	PnqhN+4UsPFFNE4Du3fqRcYZs8RejRE=
X-Google-Smtp-Source: AJdET5cayCQ0AkLHQoCRCOkyIoXzjJWkin/3uvvKIPVHSLpt83A0/BZqMO4YommguRB52O+/tdjm1Q==
X-Received: by 2002:a17:902:4222:: with SMTP id
	g31-v6mr9474748pld.236.1541116552490; 
	Thu, 01 Nov 2018 16:55:52 -0700 (PDT)
Received: from localhost (198-0-202-11-static.hfc.comcastbusiness.net.
	[198.0.202.11]) by smtp.gmail.com with ESMTPSA id
	j67-v6sm1127767pfb.124.2018.11.01.16.55.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 16:55:51 -0700 (PDT)
Date: Thu,  1 Nov 2018 16:55:25 -0700
Message-Id: <20181101235525.29042-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181101235525.29042-1-palmer@sifive.com>
References: <20181101235525.29042-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: [Qemu-riscv] [PULL 3/3] Add qemu-riscv@nongnu.org as the RISC-V list
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
X-List-Received-Date: Thu, 01 Nov 2018 23:55:55 -0000

We now have a RISC-V specific QEMU development list.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


