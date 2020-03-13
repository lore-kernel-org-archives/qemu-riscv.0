Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBx-00011p-0C
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBu-0000wY-V5
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBu-0004TC-01
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:50 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54163
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBt-0004SH-Rl
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rpQjl/4AvtYAvRXnGhGAakMCQznzosD1UbxsdwPAhc=;
 b=PUgg4MU4yaoTxeMJUx68Xa9xrhnB+Z1tqPpyhnGQ0vu5tiAuF6AcNWidFLHRpuT+cUMpr8
 nqPoIuEot4mFX73dE5PCYiRvEJy99Xg8HjS6sm5OMImPkLcORy+5L0U6IQ+YC7QbrkL1pn
 3J5KCLoGyMFx2vOkZaYo+uf+MLPO8fs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Q6EA5UyaNC6ps8TSSqc3gg-1; Fri, 13 Mar 2020 14:37:47 -0400
X-MC-Unique: Q6EA5UyaNC6ps8TSSqc3gg-1
Received: by mail-wm1-f72.google.com with SMTP id n25so3298024wmi.5
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5D+mNrA7Q9tvp/FL52Wgm2fEGpMf3trSL+14VYf2HSA=;
 b=mWKhCSTl5BsE4huf2lR6USQW8ngQVOTIaFPfVnvXrszsWgsplwuk10Rlc2soElZxiI
 RdqiYsCgNRc2CEF1K8/fyC9L5/uLBNzKRwJgGvYcz5Zi9YjAZ3Ld4OsDJu3Pwy/gK1qT
 /8K7gjz8sD8sDtpBI67Gss6egK9ck1HZQnjPGKfXh93FhGHGgGbYwS6f9h+xFHYTeEiX
 P68YCopXDPaJl8riFn+I6hNd7QcGPo+N5/h4t7++xtAWVjlYQkH9zQp282Mz92MCWDro
 7Xbajsvm9+7+6b7RohygWqR0wgnecZe6IK4/fAo4FKyTt8PG6suwcofIjnEWI1wO8sjb
 b//g==
X-Gm-Message-State: ANhLgQ1LTphgjRr2feiJq7OKvtwuvkPfOrjtJnks+lz2Jn75+5na7nFm
 45Yjws/SdL4HOow8c3aPu0cIgpAKvA+4G5PJdEktmag5Ypik9n7z8O25b9nphYXkkXMTd88uHLI
 zBDdgsdthpSHPCU0=
X-Received: by 2002:adf:b650:: with SMTP id i16mr7761463wre.316.1584124666610; 
 Fri, 13 Mar 2020 11:37:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtbgojL+JELKTTQY7b07V5DyCa0cnA6l8unuf63XU4fZEe0G8Ebz0T4lqt+EoIkgCebb1/0fg==
X-Received: by 2002:adf:b650:: with SMTP id i16mr7761438wre.316.1584124666470; 
 Fri, 13 Mar 2020 11:37:46 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id n14sm6761179wmi.19.2020.03.13.11.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 10/14] arch_init: Remove unused 'qapi-commands-misc.h' include
Date: Fri, 13 Mar 2020 19:36:48 +0100
Message-Id: <20200313183652.10258-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:52 -0000

Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
this include.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 arch_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index 705d0b94ad..074fa621b6 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -27,7 +27,6 @@
 #include "sysemu/arch_init.h"
 #include "hw/pci/pci.h"
 #include "hw/audio/soundhw.h"
-#include "qapi/qapi-commands-misc.h"
 #include "qapi/error.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
--=20
2.21.1


