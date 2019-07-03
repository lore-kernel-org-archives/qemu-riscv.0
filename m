Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaq6-0006I4-4n
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51495)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapn-0006CY-EX
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapk-0007Md-N8
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:47 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:40808)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapk-0007Cy-6I
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:44 -0400
Received: by mail-lj1-f172.google.com with SMTP id a21so1474353ljh.7
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tqiS7O8nKvNing+E8WwiszCtPiLlK33kP79Ar4czLaU=;
 b=ZU6Wm68R721X1MDLJBbGBihmmay0U/S91TcjXMZKcynv8E/qP1ySI5xBCrmTtYM9il
 EaV0T01nSo2MxkFs15oMk0n3CciCk9dGoP7ohg00yvHL2jiVxxKABhVjao3WP/WNJQ08
 mGpKdpE+7LAg+raEbVwxPxviRoXRtGdyVbCaN3ykN62DlVxJMU9ZimCZ4LeWIOvxOBEY
 l9PZ3GrNdVn6a8XpYWkQiOQEwqwyi1/ZgBG7ywxbRfEjiewG86eIfh8NN/VaCzMqdVOx
 YZ7Nj5xroNR7lf/gYa6nphNV0oNGy/dnqLwcYH4wau9Sy69UozZLwgIJgbgPJXQpFxhA
 rL8Q==
X-Gm-Message-State: APjAAAX4fGc6UGL9b0HXd4nikHy57jN3jK5vbGQohLUiiTPm6V7W0SBM
 M2h7qw5VC/JlEuMyUvi5LBf9TQ==
X-Google-Smtp-Source: APXvYqzMQ1VFo+cbMrLyUbBoftTk+g7bRkLXh+Slkuy2FOPprNvGFydsxwJzyhKRzbmkGFl0vSfCbw==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr19569565ljg.197.1562143299976; 
 Wed, 03 Jul 2019 01:41:39 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id o74sm291723lff.46.2019.07.03.01.41.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:39 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:33 -0700
Message-Id: <20190703084048.6980-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.172
Subject: [Qemu-riscv] [PULL 17/32] qemu-deprecated.texi: Deprecate the
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:57 -0000

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


