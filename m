Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrLu-0004cw-Cg
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLs-0004Y4-Ui
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42225
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLs-0008KK-77
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8n0YFO+GkTAJ70YrDyCWQHFcQ3B2rpDJ3HMzik7tebk=;
 b=Uj1W2BQyeDPBnEBpdOkXFgwDZEd1B40cv2pszsyece0cQBB4CymXSkY2MoEb1NqS1uv8rV
 3gMdUWDcWHj7INW8Lzpv9OOFEyFrYhtz0zDJpOnuVSwuEFQFad6m9C/FKE9VFDEjpkuoTv
 AZdjGAbf3XE08zs+4P0f4vMCFvWJqpk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-_GicUnKNPL-ij0rQxi_NzA-1; Thu, 21 May 2020 15:59:31 -0400
X-MC-Unique: _GicUnKNPL-ij0rQxi_NzA-1
Received: by mail-wr1-f71.google.com with SMTP id p13so3365602wrt.1
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8n0YFO+GkTAJ70YrDyCWQHFcQ3B2rpDJ3HMzik7tebk=;
 b=Z5xuTbeJJuqfDYUzG1vH2A8aK31aeklgPRCAHVT2BYfAEF6+jftd8sYAoq2dheZvT8
 cynTz5TFPBXsxjUnY5iQQQIgGsSA8jdU0L/vDVKkFheKJLXNnMkuGCmkcs1DPnKPFwN+
 iIP8lqEXoYa0pUP60ud9cdF3mWc4SkxfRhnJPSdd8eLJGNQc3P0cLYzkz69Fy5/Swbgv
 UHsXTLyDVTiNzGmJWbVAef6OU31jodw9zKO9B2jlYb4j6k00D/c9B3UJUvIAziAHOs08
 pZJhZGdAMVVuy4Rj3pq4kBf1DN754lwYsA4Ajk1VzIWni12RyusJDYFRHUQMUwd8Pfrk
 ga6A==
X-Gm-Message-State: AOAM530k13HCinBOzp8fVIEFKCmZ1VMkjtIdBwp0xs4tBv0qzTrJMge0
 /pm2ZkuUMeP3D6U/Z1QF517bfkx3XMjbnIBjB9V7vozO/QqSxNF2ZS9rJC7r1zLd1i2osNcs/HU
 QVR1TuGov7ocwFKE=
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr9536004wmj.146.1590091170777; 
 Thu, 21 May 2020 12:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlgGWH+n9W9cr3XjZ4gqfAZL0L5kC2xGoZnWi5HocvmVMMsWNDdtckiCifIUneNXcnwu3Eog==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr9535989wmj.146.1590091170602; 
 Thu, 21 May 2020 12:59:30 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m3sm7370853wrn.96.2020.05.21.12.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>,
 Vincent Palatin <vpalatin@chromium.org>, Yu Ning <yu.ning@intel.com>,
 Tao Wu <lepton@google.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Hang Yuan <hang.yuan@intel.com>,
 David Chou <david.j.chou@intel.com>, Wenchao Wang <wenchao.wang@intel.com>
Subject: [PATCH v3 03/11] MAINTAINERS: Add an entry for the HAX accelerator
Date: Thu, 21 May 2020 21:59:03 +0200
Message-Id: <20200521195911.19685-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 21 May 2020 19:59:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
Cc: Vincent Palatin <vpalatin@chromium.org>
Cc: Yu Ning <yu.ning@intel.com>
Cc: Tao Wu <lepton@google.com>
Cc: haxm-team@intel.com
Cc: Colin Xu <colin.xu@intel.com>
Cc: Hang Yuan <hang.yuan@intel.com>
Cc: David Chou <david.j.chou@intel.com>
Cc: Wenchao Wang <wenchao.wang@intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7b98f9878..0f76dc330b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,6 +426,12 @@ F: accel/accel.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 
+HAX Accelerator
+S: Orphan
+F: accel/stubs/hax-stub.c
+F: target/i386/hax-all.c
+F: include/sysemu/hax.h
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3


