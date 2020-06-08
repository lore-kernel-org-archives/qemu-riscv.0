Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFQ-0007W2-VF
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFJ-0007Sf-Ec
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35421
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFH-0008B3-3h
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6htctWfi0MuFSG0QMH05N/TPpEubln82RtGM2+VRUkY=;
 b=YqR4yZt1laB/utzj/ZC6yJNAhjVi6JaseEpPv01mzcP779paceZLF3JdM0VgBcf8L6/Rfc
 nBXLlgSRlbeXIT/eudEOZO0Oyps3drwh/LufUfI2pyCz4MFa7wS6dPieUARzrrxmS1RJO6
 1OBYjgLBHhcP3LthzbkPr9odEjblTac=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Vi1SMJzZMu-n1Yux0BunYw-1; Mon, 08 Jun 2020 12:03:26 -0400
X-MC-Unique: Vi1SMJzZMu-n1Yux0BunYw-1
Received: by mail-wr1-f69.google.com with SMTP id j16so7294767wre.22
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6htctWfi0MuFSG0QMH05N/TPpEubln82RtGM2+VRUkY=;
 b=iiXeEuSljCSiMb7lEV48kftZgApCfub4Z7tl8hqPi62WY2iw8PvC+FKMP6qy7ZtnsB
 JR08c+/TgnyKxByK+BwyQD35rGNYuME7eF+IpkcyGZg4yROWqBpYX4aq8JTzHQa7BiMP
 SgmQFgel1mKIYQ1nKw0bGPs7REpUkYWODF+eP7kmOCFKA3+QHdnfQv0m1dRrNjNpFV17
 2DwZ6IEhWCJt60r3tmqfq9aZG65/bwRQ/2vwdYRJsPahBbuFmogT6HhfWdlm3d4gtT2F
 ETd2Tp+xzleDPvyWEaXtLhRbB0tEU0DTj1CXi6hXgSQ9O1/wyCDNrBnaNNMUVlD4LK/v
 atXA==
X-Gm-Message-State: AOAM532HaT6YZkKplzCks10Kvts3DX4+LJYP5DTrfoBcYgX0UGIXZye2
 jzTcybt7qeTrpRCBCaZzY+rgPIPbR/nPn06y3MZzkRQz7kCpyYXj6nKGiYJiSFMmIcANLFYQ2ad
 PxhL+i7Axh4djrME=
X-Received: by 2002:a5d:5585:: with SMTP id i5mr23967096wrv.112.1591632204337; 
 Mon, 08 Jun 2020 09:03:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPoWRkkwB/FnLCAhEPa5I9PvgN5hBH0wEtPqJP6K6G5xK4bW4Hm9SvYdS2VHkDfOIc4QPeAQ==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr23967049wrv.112.1591632204161; 
 Mon, 08 Jun 2020 09:03:24 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id f71sm21622wmf.22.2020.06.08.09.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 27/35] hw/ppc/ppc: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:36 +0200
Message-Id: <20200608160044.15531-28-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:34 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 4a11fb1640..39fcf746c5 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -37,6 +37,7 @@
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 //#define PPC_DEBUG_IRQ
 //#define PPC_DEBUG_TB
@@ -1114,6 +1115,8 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     PowerPCCPU *cpu = env_archcpu(env);
     ppc_tb_t *tb_env;
 
+    qdev_warn_deprecated_function_used();
+
     tb_env = g_malloc0(sizeof(ppc_tb_t));
     env->tb_env = tb_env;
     tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
-- 
2.21.3


