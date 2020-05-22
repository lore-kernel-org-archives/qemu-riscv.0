Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQP-0004FY-QT
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQM-00047A-FG
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31256
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQL-0001v7-CK
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzIXUjmQFMXKkBqElREelsSBtwnLlPTjL7FgZWSFFRo=;
 b=e/lMdQvtyj/rzuCRlBhZ5QRD0+XVPHwdrO8IJ3R4n5UyWymYOeAgTOXoauerLKt/JLDtid
 tYvC6/wFXARm7LtS7Q/bdxBD2mxE5tSO2YkWO610LAqRYt963qmb8NYHgb3+SQiYyFv/W6
 hyhcgug2fk5oeJAjuQ/CmtsJ7LUqZ3I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-6iQBdjKfN7KkMmYReIcZrQ-1; Fri, 22 May 2020 13:25:28 -0400
X-MC-Unique: 6iQBdjKfN7KkMmYReIcZrQ-1
Received: by mail-wm1-f70.google.com with SMTP id n66so4403798wme.4
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzIXUjmQFMXKkBqElREelsSBtwnLlPTjL7FgZWSFFRo=;
 b=WLyMPug52Vpn3S0A/4NZLtTMDNEHSI/fRJK6k3M2L3bFJVtNw887QFwdpao2ovcwAQ
 epg2NOf2e5QXn2jzC8C6ZzZQxHwOcvi1EdCNboveX7KGOMmlB+SwFbYv/tFBgLOQQjwS
 Mcmn3wy1XfyPOk4qahe/KdAqFsiAURxat1OZokE10PVwWUQyTi/Lf7T058D+ffEKzZvU
 4VtTLtzDVzRys00JmXlEfCsLk87AiiDH5yb/n5Urrb7zreG0k0/5C2dxKZkIeRPPO58z
 s0AMhfCGKpGLGK82zqJxeAWSaJVZm6D6WgTRsKKFiXGIyGmupNLqsrNOpf2rJKZBJ1Dx
 nPHg==
X-Gm-Message-State: AOAM533YVT4krt1XDu7MRheF9pidkgU2gVekqal7k+hyeWMcG8BAwkpZ
 cWjnETKnkdyKTKeV7YGmKuXCp3Zln41KWkZMYO+7pSQkp+HU9aTr/2TxXYXxUDJrll9y/lhhw2z
 tmUSQtYrEGN+N+4A=
X-Received: by 2002:a7b:c40f:: with SMTP id k15mr15191552wmi.65.1590168327639; 
 Fri, 22 May 2020 10:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFUMOXMRJNi03qmgZVgVUBNZc61FlTSbPs4N95RyygaMEs2jp8mbjr97TSoPRdKs+JzJXZLA==
X-Received: by 2002:a7b:c40f:: with SMTP id k15mr15191544wmi.65.1590168327492; 
 Fri, 22 May 2020 10:25:27 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m3sm9950762wrn.96.2020.05.22.10.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:27 -0700 (PDT)
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
Subject: [PATCH v4 03/13] tests/Makefile: Only display TCG-related tests when
 TCG is available
Date: Fri, 22 May 2020 19:25:00 +0200
Message-Id: <20200522172510.25784-4-philmd@redhat.com>
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
X-List-Received-Date: Fri, 22 May 2020 17:25:34 -0000

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 03a74b60f6..6bc3d1096b 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -12,8 +12,10 @@ check-help:
 	@echo " $(MAKE) check-speed          Run qobject speed tests"
 	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 	@echo " $(MAKE) check-block          Run block tests"
+ifeq ($(CONFIG_TCG),y)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
+endif
 	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
 	@echo
 	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
-- 
2.21.3


