Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2y-00056G-Cv
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2t-00053I-SJ
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57281
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2t-00047b-38
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8CkVk2pIsA5qUp0zix2BjSa/yukK7tJBsycJrJlL6k=;
 b=FuIfgqzNsueXCLDP3pbmc90Vn0h6BKbo589Dlc3iz/SRjXIzu2bSSN3U5l4sFVpPAzrZon
 y6WKRifLDMny+WJ+FKV89AhCp4M4jW26F6d3cMgPiTU7IWF5bb+6/Ymis3kutcUzBcxHqA
 k6s/QcJodsc6oSp5l2Ow/G6QSFkkqk0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-p4pU5kRMMUajOxr31ns39g-1; Mon, 04 May 2020 11:30:09 -0400
X-MC-Unique: p4pU5kRMMUajOxr31ns39g-1
Received: by mail-wr1-f72.google.com with SMTP id p2so10926995wrx.12
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Loi2SqFjSui4Z2kBKxGGjw07sOKKiVmfF0icDHu39aI=;
 b=Sp/FQ4ch1dUEvCLYZ5XaRFfDzRRPfehogWhUYdZ3ZG4sWwXJTB3RCV2CSSzTYMO51N
 pqgBfB+jV67yoRQBWm/ImOUm44q5nCB7+fCXkPFLfG40Q+HUz/uAly2Y9oUwhxSKRPWR
 QYTBGeH6SGkXrgarX/70cph0O17VUVxg3TSNt2VsXbXSf3udHO7T5wb+cXwwBisZ0d4o
 frwpSq4r35YIo2x3mzkW2EmYdLgoRv26vo7muvzvIYYqVxxqr+7Zs2FJkTFF8l5RCMVq
 +KSD3qE/+1Ufh48NlvScoR1hZ/fWzrR/0fVUmbqqatDwk2GUHPH3Jc4f7wA+sW20vg0z
 tvvA==
X-Gm-Message-State: AGi0PuZo0+nbAeVV7n5oUyuykstdbbTObjQW4TZeAUTB6jYki9pfhcGk
 whmI1PiFSjxJNI2em+r6qCldGSI5za1/GQGzbDL0QCt7DgIoR1CwN7LwSEAXOFWaAFhY225Vs64
 mz+lcfdOQ1k4UMrk=
X-Received: by 2002:adf:fac4:: with SMTP id a4mr15444357wrs.134.1588606208432; 
 Mon, 04 May 2020 08:30:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJm0cfJlbqPAJwYrwFKRafzCoYVnnGzHPxQFg4t8os1gRI2OP5f3Fz//NjR/oYIdxM+SAh86g==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr15444325wrs.134.1588606208276; 
 Mon, 04 May 2020 08:30:08 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id b66sm15039450wmh.12.2020.05.04.08.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:30:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 09/12] arch_init: Remove unused 'qapi-commands-misc.h'
 include
Date: Mon,  4 May 2020 17:29:19 +0200
Message-Id: <20200504152922.21365-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 05:09:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 May 2020 15:30:16 -0000

Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
this include.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 arch_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index d9eb0ec1dd..8afea4748b 100644
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
2.21.3


