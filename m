Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFW-0007gj-5K
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFL-0007Tj-9o
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFG-0008AS-HE
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=O+2xDPsPJH1jiXin8V8D0SXVvB/V0YB5Tyh/FbitQfqIr9Y+KMe6lcW0pwpKcteAPVonF9
 qGOuMcRtZ/AzgkUi1C8StCUvlusTtGqkHBGffu1yZQf9EKrIlPFm4jjQCn3VQgvPMOK7X4
 nvWazC4pCzVgcrXCLSZF2rp0hQ6Cmvg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-kHd_zJHjNnKPAK6Mzgho_A-1; Mon, 08 Jun 2020 12:03:20 -0400
X-MC-Unique: kHd_zJHjNnKPAK6Mzgho_A-1
Received: by mail-wr1-f70.google.com with SMTP id c14so7329066wrm.15
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=E+tUlVyQkDSkLG3rjBDaEFoFVbTNGlBxnd3vLTh6AZy2rOuXPLf76Eq96poOxwMVIV
 DZz0jgya9ABzfA/TMUgPd8vJHVI/Syqb0MfGZiqsOUynA8d3O0c/rg45xb6z0ef2jRJB
 V56e2YL+0BPZ3NFgBamtwOwsZXSrvWcpkhGfProlaeB5TVo6jsaeImMchbsu6zkv/Oul
 g269LIGx8xaAOQ6W60c5YGvm+PXRwXYg/zUCer/rMzRzdLnkEqKOojBHmvFagZJH6F0w
 UmVvIBNBUwaVStU1N44MD+SPpAYtQHc5hLGhVQiO/0FtNzceVEZB3xcjmKZxQlz5F+v7
 PJcQ==
X-Gm-Message-State: AOAM5317Q7xCwxZh/p36bV/no/xgVEj7AZ8K99R4FTVFV+C93ncxBois
 WyJxGV5LJcleMjlPlPZQxKDWCCFtdgjy/p+LHYeAiUM4uqbo4td/i/sqoyU1TAyDXQbGETp3xHf
 sm0MRgrxWxmhOzZY=
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73257wmn.88.1591632196834; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3xkvh2Vk+4PYCBSKCv2fZwGK7MNY+4FcnyFPW+oUbVotWO8gdASoKL+nfN+0YxJIIGJ7I2g==
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73234wmn.88.1591632196640; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm32396wmi.16.2020.06.08.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
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
Subject: [RFC PATCH 26/35] hw/openrisc/cputimer: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:35 +0200
Message-Id: <20200608160044.15531-27-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:40 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/openrisc/cputimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..60f2c9667f 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
 
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
+    qdev_warn_deprecated_function_used();
+
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
     cpu->env.ttmr = 0x00000000;
 
-- 
2.21.3


