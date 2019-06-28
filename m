Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgul8-0000Lh-DE
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukk-0008MT-TQ
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukf-0000QF-FY
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:36 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:40046)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgukd-0000Lk-3R
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:32 -0400
Received: by mail-pl1-f172.google.com with SMTP id a93so3623603pla.7
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tqiS7O8nKvNing+E8WwiszCtPiLlK33kP79Ar4czLaU=;
 b=U039H3a5wf6b1AyZithPQZ1m/bn+OpJvK1leheLc6+b0EpF5tyFR+DZ1KoZU9iOabj
 OpWLYOK+XT/NFowd0eZPH0bt5d/9HBnXNs7WCaTFoadvZ+9zLhKpZR6oIida66gy4YdD
 Nv3y2kyKgrBgwrDPsc8DQxUrNSF9LMluywiW7dbY4wsY2xPWFFfLqb1PlVn2lUeYSDpK
 Mc3p53Q/+swaxwBl0vELr2CDVGYMP1crqxQhNsHgH5gTaRQLCTifsmW984VX39x6EYLV
 j8kvYQmU/qy/7jGcSXBOjoYPGc4PTbEZyRoUySt81ywVYasbPE58RCLOwRrKwoyQKItA
 o5fQ==
X-Gm-Message-State: APjAAAXoYkbtjKd2REBobIq5nQ7EMRNtcjaGBRJ8JyqkMnsRe2MEWbxp
 hFQdh7zTFTDyIXqgBqwdwSuCug==
X-Google-Smtp-Source: APXvYqz2Phe9wsb6jVXHH5nAKntUl6lV5AglKx3d8FPwbmkuG9lg9avengcgdLrFQq+vGm1K2MCmsA==
X-Received: by 2002:a17:902:e490:: with SMTP id
 cj16mr12760904plb.136.1561743208023; 
 Fri, 28 Jun 2019 10:33:28 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id q144sm4125528pfc.103.2019.06.28.10.33.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:27 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:10 -0700
Message-Id: <20190628173227.31925-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.172
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:42 -0000

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


