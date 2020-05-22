Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQq-0005pF-8y
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQo-0005fG-23
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51337
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQm-00028u-Ck
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDajBbKs4gis+0Hzyip6W2ChjFSOOWvPUkN8dD09nr4=;
 b=Z30hyoAufNZRMLZFvoYS6WxQpg4eB7RnyIRa/NYsL+m7KnBgefbr1I/aCUrgXLUlcDWneO
 RQbxHLWOz89ito9Sk/1+ofr7T12ngQsEkU1Yr+96DdiQ1MbwXhO1Bxw1CnGsFAZ6stdHPJ
 wcUmHtmAJwxMLT51dFFQBv4sgiZUXj4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-1JeT955XPJOIIqjAUUH6Sw-1; Fri, 22 May 2020 13:25:58 -0400
X-MC-Unique: 1JeT955XPJOIIqjAUUH6Sw-1
Received: by mail-wm1-f71.google.com with SMTP id z5so1414916wml.6
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDajBbKs4gis+0Hzyip6W2ChjFSOOWvPUkN8dD09nr4=;
 b=G6eNQA93Yd/p6+t9uEVgglj+K8SAc9cFq+lbtar5U9EB5+L0q5k/jc2q9eDSfiFWOv
 K6bP6F8t7XCJbbItx3HH7CRSzItak+WlRz0UxjsSFuwP6ctqrGA1L1HfcCYOwcGdAn9w
 t59UujuQi2ifNw7/3kB2tQFEK5pIEYERdjnoM1JTeWMPLiCm3qioIHgg5OMCurO4IlzA
 ieTJgYhan0o8fOmezzhNS8TSeSPLoc4QDVMWlRJ5t5Mf6DseZfABEG3U0fMblZtUby2/
 91QISeePVz46dxIHj5+0oz8y84xNGn9aOpktCn5xNpDo7UHo85hvN8Bpqbk6Meo2kBwJ
 IgEA==
X-Gm-Message-State: AOAM531C08pmdk2p90BODHXCsqadC5abloeRvhFFdBSHwyI4+AlWr32v
 oiE4CTftPkTdZiOayvuOTzxn9Du8NN8NwFqXxXRzh/purhYCiehO5ABBOU62JbyRPDLVCKO551W
 gaNt5VEYG167dG+Q=
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr14280785wma.16.1590168356839; 
 Fri, 22 May 2020 10:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyaWYO6dpnbCABYu+g8OxHh0V1WApT9Zdh2WOGUts7j67S9+77L1qYMNNi7VJtPMMSZKAj3A==
X-Received: by 2002:a1c:3d08:: with SMTP id k8mr14280761wma.16.1590168356698; 
 Fri, 22 May 2020 10:25:56 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id y204sm2077653wmg.36.2020.05.22.10.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 09/13] arch_init: Remove unused 'qapi-commands-misc.h'
 include
Date: Fri, 22 May 2020 19:25:06 +0200
Message-Id: <20200522172510.25784-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 08:01:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:26:02 -0000

Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
this include.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
-- 
2.21.3


