Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHo-0003Nc-QM
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33011)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHW-0003A2-ON
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHU-000056-Jr
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:50 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:33717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHT-0006yQ-Fb
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:47 -0400
Received: by mail-pg1-f176.google.com with SMTP id m4so1187866pgk.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tqiS7O8nKvNing+E8WwiszCtPiLlK33kP79Ar4czLaU=;
 b=O66Ta0sTT8YFDxlVUREJaC6EaV2ajA7TRHJrvPtr0P0711/pDIk+EYxPAJzhPLNzYP
 Uhc6pw6zUgVHXs7iwr7PrOzJQXq7WXmaL0UygD2Yk43XMXwZxoLPFVimnAfSUHz24zHZ
 eyUrcz7sn8XEW2k0JqsfLxVlDIMcTZmqrZlHkPBnV3Zctz/FzPh3eVs3DCRxtrpsMmtB
 NpwuHxn7C8RKoa2IXPOCzmK2tluTdsiuCDKG/eSNTGkJnLdIlA65l+iJ57CGCkwPTGod
 qRcUM0r4EOi+4TJVyA1L0gIPDylsN6grGLCuDNBAvzybuKhBOOqEEUip881/Hp+BJEXz
 cYvw==
X-Gm-Message-State: APjAAAWv+aItHidPWfw4mT7KzCnjBjFe2T5Qg0NJhru7OBYoye32Ol7A
 iHoJerBBX1m0xgu1zdxe2AMiI+2S4/gJ1g==
X-Google-Smtp-Source: APXvYqz4HgwfLHomu9GYtfbmHFaxeAkcApncvVLSSz0rgVyDrt/RXlulYvCVWYc0EhsHxAUulnhFYA==
X-Received: by 2002:a63:1462:: with SMTP id 34mr4283972pgu.417.1561649044358; 
 Thu, 27 Jun 2019 08:24:04 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id d123sm3437041pfc.144.2019.06.27.08.24.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:03 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:54 -0700
Message-Id: <20190627152011.18686-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.176
Subject: [Qemu-riscv] [PULL 17/34] qemu-deprecated.texi: Deprecate the
 RISC-V privledge spec 1.09.1
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:58 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Deprecate the RISC-V privledge spec version 1.09.1 in favour of the new
1.10.0 and the ratified 1.11.0.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 qemu-deprecated.texi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index df04f2840bd9..97ea4ef3001a 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -144,6 +144,14 @@ The ``acl_show'', ``acl_reset'', ``acl_policy'', ``acl_add'', and
 ``acl_remove'' commands are deprecated with no replacement. Authorization
 for VNC should be performed using the pluggable QAuthZ objects.
 
+@section Guest Emulator ISAs
+
+@subsection RISC-V ISA privledge specification version 1.09.1 (since 4.1)
+
+The RISC-V ISA privledge specification version 1.09.1 has been deprecated.
+QEMU supports both the newer version 1.10.0 and the ratified version 1.11.0, these
+should be used instead of the 1.09.1 version.
+
 @section System emulator CPUS
 
 @subsection RISC-V ISA CPUs (since 4.1)
-- 
2.21.0


