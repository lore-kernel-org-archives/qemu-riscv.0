Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdox-0007S8-DT
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdow-0007Os-0T
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49705
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdos-0002tg-CW
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtqBVDpcxzLSIYr46Mh7kdVW472e1QUV+XMsC1Vk51c=;
 b=fovsmLAqsKcuttUUSF8HXN1cOfhnVKOFnY5uyRRLsFjcdsEU/+rD7WX8N9LjuzmnaqufPe
 R/k2zUoqvexnQ99TmtcfcCS/oVK6klizCiRYHB0BFjHHUs4KknpFKvW9keYQOIGZUrT41H
 9qTQmOBwk9ajLfu6x9AhVxwNquHPS9s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-dm87fLOaPaGkPAMXVFKfgQ-1; Fri, 15 May 2020 13:08:19 -0400
X-MC-Unique: dm87fLOaPaGkPAMXVFKfgQ-1
Received: by mail-wr1-f72.google.com with SMTP id i9so1496521wrx.0
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LtqBVDpcxzLSIYr46Mh7kdVW472e1QUV+XMsC1Vk51c=;
 b=emgty/0Yz4VnkGKje+9D1zljSp9Ujei/w2YYcjZ0rOWb+1ZPzM0oo/oy8QbwxyDByL
 koxvJxphCG5OeqEuRNIP+e/tWD9c3/WVHqlQtbGSIRQ0QMCvJc0rjCgWDzuuvA31H6Dj
 TEclL0uzN189uiy97UnXc0c/97Ym2+iPlcThFII8dZuwfqyKMGMXZIBBB0d6iKI2nkda
 xnFkt2LYdnHse7i4I1Ji5rASvxjkNRvrTDDIjs7FL4VG7QxwyB2Ck0TVNaUO1xQ7rlS8
 RtukA3QthkL07WpFnjZOU/PGXoeQMjtB4MLrpLcvQkhHmjnk2v/nGRw7Lpjh87vabFOG
 T1YQ==
X-Gm-Message-State: AOAM530qkEOEn2tHO8izwieliBLjv7+rgWmqwFIeaxIcl7/g9R0dJS3T
 KsymJwpSkqZpakJQGq/QQkDNCcQMyb6bWljoxgEK2MBosPscX45QcvsyFppSEQXrCxEWDPtubou
 kgzvo6kF6GMjCVFg=
X-Received: by 2002:a7b:c086:: with SMTP id r6mr4873601wmh.29.1589562498429;
 Fri, 15 May 2020 10:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4umMWdgiN1Dgl83Lg9rVKE5hcBz1uRpI3ivnkOUtLlLFcj5d3xhgJtN7a/k/lJp/Ro/1N+A==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr4873567wmh.29.1589562498195;
 Fri, 15 May 2020 10:08:18 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id j1sm4416059wrm.40.2020.05.15.10.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:17 -0700 (PDT)
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
Subject: [PATCH v2 02/10] MAINTAINERS: Add an 'overall' entry for accelerators
Date: Fri, 15 May 2020 19:07:56 +0200
Message-Id: <20200515170804.5707-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
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
X-List-Received-Date: Fri, 15 May 2020 17:08:26 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd88a3de49..659092eb43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -415,6 +415,15 @@ S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
 
+Guest CPU Cores (other accelerators)
+------------------------------------
+Overall
+M: Richard Henderson <rth@twiddle.net>
+R: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: include/sysemu/accel.h
+F: accel/stubs/Makefile.objs
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3


