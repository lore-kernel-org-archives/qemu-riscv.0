Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrMP-0006DR-2S
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 16:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMN-00069p-Kk
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:00:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMM-0008Qk-Hy
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCqDKoDbHDQzikos0o2LjEgWBMdVhgQLRqeJNp7F0OE=;
 b=Igl+592cCZi5xZTbaimnn82OFX526X7EmIlrCj6L79afLwTJTLjK33TM1rlwMnjEMXwiOb
 OKbwsoN/KE/ld+6QJT7F2fxcK7xi7cweU8B7nrS12h79nfaXeM3v4qFTR8qQ1fVXQQW8dg
 RTgEQYI3CgN6PO26DK9qWGYImjt8rOA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-vr_dJvHKON2rXoKEsoOAoQ-1; Thu, 21 May 2020 16:00:04 -0400
X-MC-Unique: vr_dJvHKON2rXoKEsoOAoQ-1
Received: by mail-wm1-f71.google.com with SMTP id l26so2144954wmh.3
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 13:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCqDKoDbHDQzikos0o2LjEgWBMdVhgQLRqeJNp7F0OE=;
 b=nDCcDebwT28P7hTSmI9is/XOK3tfaHWnMUfYfDYSiwLj7KhuqRqh5Btyylq+phIKcd
 8dq/KaOZngwitRS3nnDK2UzI0gHiVnzQ7U934HWYmipaDJnBqccQDlzteeZRy6sXvzCq
 u4N2cr0SSg0P+iypXDiIxYsdF5l/VSU8CVLUeEX8yNXzNGqazxEYYLqzYR9Eosnjmi9r
 l5QZfr6SayIJ6gDvoXLn76Kd/R5cz+86yc1R8Axne9tVEpUBIZzeH7Er5k9Alzofyhuw
 WFQIxM6QnIj31LJSlqUtcI0pSovh3ryGbLQyHNrMiLsq+CETeZ2rUk54lZ0+3dLT65qY
 EEQw==
X-Gm-Message-State: AOAM5305apj9LbIH4FOiXc+N2jvaPxScqH57VzRhXEy73RQ9sxDJfBoQ
 kU5ovgIp6zlV8UwO7qM7AFJmGet4OpSKWr8s61MewK6rkuIs9naZwS+pRCdT7GDmNeITc0O+D29
 v79yXxWCANlP7ILQ=
X-Received: by 2002:a7b:c205:: with SMTP id x5mr10741412wmi.135.1590091203077; 
 Thu, 21 May 2020 13:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywHyPjca5Ebm/EgFfbvzqRAjli9WmO/+OLcUYJ6EuqdTuNua26itFRVzTeXh8ZYdVwl7Jebg==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr10741378wmi.135.1590091202739; 
 Thu, 21 May 2020 13:00:02 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id h27sm8466721wrc.46.2020.05.21.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 13:00:02 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 09/11] rules.mak: Add base-arch() rule
Date: Thu, 21 May 2020 21:59:09 +0200
Message-Id: <20200521195911.19685-10-philmd@redhat.com>
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
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
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
X-List-Received-Date: Thu, 21 May 2020 20:00:08 -0000

Add a rule to return the base architecture for a QEMU target.

The current list of TARGET_BASE_ARCH is:

  $ git grep  TARGET_BASE_ARCH configure
  configure:7785:TARGET_BASE_ARCH=""
  configure:7795:    TARGET_BASE_ARCH=i386
  configure:7813:    TARGET_BASE_ARCH=arm
  configure:7846:    TARGET_BASE_ARCH=mips
  configure:7854:    TARGET_BASE_ARCH=mips
  configure:7864:    TARGET_BASE_ARCH=openrisc
  configure:7871:    TARGET_BASE_ARCH=ppc
  configure:7879:    TARGET_BASE_ARCH=ppc
  configure:7887:    TARGET_BASE_ARCH=ppc
  configure:7894:    TARGET_BASE_ARCH=riscv
  configure:7900:    TARGET_BASE_ARCH=riscv
  configure:7920:    TARGET_BASE_ARCH=sparc
  configure:7925:    TARGET_BASE_ARCH=sparc

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 rules.mak | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rules.mak b/rules.mak
index 694865b63e..55810d0cd6 100644
--- a/rules.mak
+++ b/rules.mak
@@ -438,3 +438,19 @@ atomic = $(eval $1: $(call sentinel,$1) ; @:) \
 
 print-%:
 	@echo '$*=$($*)'
+
+# base-arch
+# Usage: $(call base-arch, target)
+#
+# @target: the target architecture.
+#
+# This macro will return the base architecture for a target.
+#
+# As example, $(call base-arch, aarch64) returns 'arm'.
+base-arch = $(subst $(SPACE),,\
+		$(if $(findstring mips,$1),mips,\
+		$(if $(findstring ppc,$1),ppc,\
+		$(if $(findstring risc,$1),risc,\
+		$(if $(findstring sparc,$1),sparc,\
+		$(if $(findstring x86,$1),i386,\
+		$(if $(findstring aarch64,$1),arm,$1)))))))
-- 
2.21.3


