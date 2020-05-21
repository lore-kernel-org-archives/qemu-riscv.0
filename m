Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrLq-0004Pt-0K
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLo-0004LS-Ez
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLg-0008H8-W4
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PeCmJfD6OD51fUU+hNrH7vrDwGGc2lOMQ5vq5LtNDI=;
 b=SrB3wQlDmwctMHxmkPG97Y4XzDnBuJcPlwSpYjBW+q5yzaY28/f1w3ly/uET+btPbj4Bca
 sfT1kPVQC04Jn4bq6uLXomotg9Bc/g6M5hDXTKFfutPI034AlD+liSmAF5ir75ZxUlrIJr
 q/oPUHs0kDpiubRaaskgnwxglBvsBJw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-sZsuy5WeNfOFZ6at5y_JkQ-1; Thu, 21 May 2020 15:59:21 -0400
X-MC-Unique: sZsuy5WeNfOFZ6at5y_JkQ-1
Received: by mail-wm1-f71.google.com with SMTP id p24so56504wmc.1
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PeCmJfD6OD51fUU+hNrH7vrDwGGc2lOMQ5vq5LtNDI=;
 b=hmVpqcVGbjxNV6iKp55xVXib9o7UvYrlJbsqLAZO7MhrnVGD2a/EacUz9hi1ZyUCh0
 AgdeQ4uF3+LUpAtkj42d8PGhRtcidsUfhsR61jQoGUh2pacISG6695jn7WBEDo97Ua2R
 yL8Qb/Rvyb7Dai8Fo+02uJ4DIlNJXF8Tm5E7v/yirlnCdd6PYRKYZ2B6YRsY3KVNr64d
 tPtipt+svL4s4ZTrX01l8OZZ6IDV7yqEpq1FNFu6PilsNk+ciHIzCbgKlfcvumVisG0p
 LJ3Au3l2nh+yIdHe0vZM3TvrFOtO9AVtQtyWmKURld309Vk/F2xjqfRdQbTh9ov6LWbN
 JXAg==
X-Gm-Message-State: AOAM530JFiopID7MSkJMPcm6b8+gxIADd/KrfvV0IFQS4BjTBSfkxmh2
 q3fM9IYzXG3CVEkB0Zc5AbOwclTPqw8yeMD70sfhtZSYJvDZ3ZBTzKDAisoALL5R+hSj8LkCbrY
 Lu2hBHhEfNFaUmYU=
X-Received: by 2002:adf:e688:: with SMTP id r8mr219325wrm.274.1590091160089;
 Thu, 21 May 2020 12:59:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpoVejH0kz77lO60AKquol15TlZOd1rsvY/A6CLd3Jv/nXTIpr8ImKojAaSJXnyxz9wcEd+g==
X-Received: by 2002:adf:e688:: with SMTP id r8mr219312wrm.274.1590091159920;
 Thu, 21 May 2020 12:59:19 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b14sm8111464wmb.18.2020.05.21.12.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:19 -0700 (PDT)
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
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/11] MAINTAINERS: Fix KVM path expansion glob
Date: Thu, 21 May 2020 21:59:01 +0200
Message-Id: <20200521195911.19685-2-philmd@redhat.com>
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
X-List-Received-Date: Thu, 21 May 2020 19:59:32 -0000

The KVM files has been moved from target-ARCH to the target/ARCH/
folder in commit fcf5ef2a. Fix the pathname expansion.

Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87a412c229..eebdcc6aa9 100644
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


