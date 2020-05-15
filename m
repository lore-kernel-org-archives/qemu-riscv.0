Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdoq-0007Ca-Iu
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdoo-0007AI-Iq
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:18 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54352
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdom-0002sh-Uw
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LWNrIr5sPkmnUIPfYOIlIROnAtcVQlofpnnefmhg9k=;
 b=RFyCVLbqlZkQeDOd3tc5rnSt1k486o35iBuDbBj+LBwdCRF7n4KFesisEiAClrSjclkX8D
 oKbR8bGFBTLG0jz9+gkKMxBV4L+jecYS8wZlIUEZHWtIj0Dzar91/TFHrNdVOybrgqKktb
 iVfKGhIIAhQ2J3eRIS7SNMn/SExwIV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-7WnrLL4GNfqUdXpW43DrtA-1; Fri, 15 May 2020 13:08:14 -0400
X-MC-Unique: 7WnrLL4GNfqUdXpW43DrtA-1
Received: by mail-wm1-f72.google.com with SMTP id a67so1465594wme.6
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LWNrIr5sPkmnUIPfYOIlIROnAtcVQlofpnnefmhg9k=;
 b=hL2s3DczSTwP7e6JhXIqoNoz0nIb7RTOY0slC2mNffCsu45+v/OdQUk/51qt5IVfrm
 xtkOfqOAtHk/bGZj58+YEtFUkSDYz5N0BDgL+RZdKbs786H07XHatpo0Vgn2mMqadrEv
 dA/PMsTDJUpWgEo2ieJHv0dQ9YoM16HRvyDh581kofVkvC4W1Y4KLSMdIXW3AZwHG1TX
 rSDAUnnEgUFdzJEV9s66WXvSKJ2NVfGb1P0YDYTfjcMLIXQBXM4a1PV7pWr1kMI/K/fA
 50WzbTRMiiNJvkBqdMe5CgqHGXQbeKX1CfMxPjkHEl7kCVo2NNdkGuHky3/WDRSAmyaL
 /jag==
X-Gm-Message-State: AOAM530ycyfPyWPR5g5H/SjpOpkegmO5+LLVPAyXKJdvzc3vsArPkKNO
 0kG9ocfqA6goEW+JQGtRMa/lX3ZDAUKkXLoN0FoK9GhEg2avGImEIxBBZ8LEA5U8ti8Rn3SVY7S
 ptyDNasH8S48ubrA=
X-Received: by 2002:adf:94c2:: with SMTP id 60mr5228999wrr.366.1589562492974; 
 Fri, 15 May 2020 10:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQhEuJujjCxs1d9TdgDo4NpobJlCQ7OImNf+tSww2HIeI5aBGI6yByw8T+d0XBO6uWfNsFqA==
X-Received: by 2002:adf:94c2:: with SMTP id 60mr5228966wrr.366.1589562492758; 
 Fri, 15 May 2020 10:08:12 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id e22sm4742390wrc.41.2020.05.15.10.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:12 -0700 (PDT)
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
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/10] MAINTAINERS: Fix KVM path expansion glob
Date: Fri, 15 May 2020 19:07:55 +0200
Message-Id: <20200515170804.5707-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 15 May 2020 17:08:18 -0000

The KVM files has been moved from target-ARCH to the target/ARCH/
folder in commit fcf5ef2a. Fix the pathname expansion.

Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47ef3139e6..fd88a3de49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -361,7 +361,7 @@ Overall KVM CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: */kvm.*
+F: */*/kvm*
 F: accel/kvm/
 F: accel/stubs/kvm-stub.c
 F: include/hw/kvm/
-- 
2.21.3


