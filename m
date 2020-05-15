Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdp2-0007dw-Qg
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdp0-0007Z4-Nn
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37030
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdp0-0002vc-0V
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuX27WNv6Kn8UhBL2AA1RqIUWcivIj63B6OZkuFogSI=;
 b=B+5b4nega5fu7l0lANixNjtt8Nr+1UC56fHq5qUEHcZODWQbIqG4UlMz76K0RcSAe7IXEA
 0LZVgUIMGDSrVmnZ2OPf7yPOmjwzoQWCH5HN04W9iv8Amq0PtF5v3PQ+jP9z/ASNiB0EVQ
 P2DGe5AYk/ClJlPBJPkG+CJkPA9bK2s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-SyznNaKoPj6AzImA7INUqw-1; Fri, 15 May 2020 13:08:25 -0400
X-MC-Unique: SyznNaKoPj6AzImA7INUqw-1
Received: by mail-wr1-f70.google.com with SMTP id y4so1464020wrw.20
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuX27WNv6Kn8UhBL2AA1RqIUWcivIj63B6OZkuFogSI=;
 b=UuA3Cyb1z4DJMZ5O6dHkcy1mCA3EpUZyopAH9XpDD3lPqJer5xYZOxz3HgeWLErhzS
 bjKbGOV4CtANHbmd77g8mNNMMYI3HfqGsYeb1M+c8mpNEcA058TpVlNNehKhNOjRNS/w
 xUcx66/0YOZKk+BylSLaEqb3LSNuhktW7k7qP2s437gfq2hhGQTpB0L/Mq2wa95ySJf8
 IErL0mejZnBds6QZUHHrqFJ+YV8hrwWWX9AGrvstcDWE0Bo0shBsae++BZsPLgBRV9kl
 NcotxT0/iWHpcGM1Vpk3Iuw5q6BrhmM0KjnGHxscn0jTA8r0txbk3JKmJQBeYCoGxhFa
 Ewcw==
X-Gm-Message-State: AOAM5308sGSfNmfOR/ASEY4uX766+6gHbZarsz+SeinYc42jXoaDbsNt
 B7eDdhvkIhYRRiOMwNf1IGsWKsLe/5akH7bZxBaYkDSWwjNJ6xOAtQJuWqwW8XdZvGxqq42xkY5
 9pxR/pSDiiXNeGgQ=
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr5373991wmg.152.1589562504035; 
 Fri, 15 May 2020 10:08:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9VffLWNGOL/oI/tLQbfVUADB9+49+0dkca4XV5cjM4nxFEkeGTcSn85uECbfY2blt2s7vFA==
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr5373962wmg.152.1589562503876; 
 Fri, 15 May 2020 10:08:23 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 5sm4554811wmd.19.2020.05.15.10.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>,
 Vincent Palatin <vpalatin@chromium.org>, Yu Ning <yu.ning@intel.com>,
 Tao Wu <lepton@google.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Hang Yuan <hang.yuan@intel.com>,
 David Chou <david.j.chou@intel.com>, Wenchao Wang <wenchao.wang@intel.com>
Subject: [PATCH v2 03/10] MAINTAINERS: Add an entry for the HAX accelerator
Date: Fri, 15 May 2020 19:07:57 +0200
Message-Id: <20200515170804.5707-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
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
X-List-Received-Date: Fri, 15 May 2020 17:08:31 -0000

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
index 659092eb43..5172e9a734 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -424,6 +424,12 @@ S: Maintained
 F: include/sysemu/accel.h
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


