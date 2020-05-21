Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrLq-0004RO-FS
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLn-0004Jl-HI
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23653
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLm-0008JA-Nr
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUH1OFbHNzJeZmlQ3HgF3hr2B5jV9dvRYR22rsqFyDE=;
 b=JcsxhVRqUZvy0phi0KefXaC9mgWvS/9J+OqZ11EmH3WqeB4AUqv9IJvAHvdAbLmsaY/40c
 WxCORLsANC7s5uuXSYA6OweBPU7mCrYjzeUCRpo6HEmIyk8QjuzwsGH2NiNFpn0D2Z+Pf0
 xRzRrWqZUbihN0Zf/2/pGWpypNV8awE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82--JU1wVkiMLy_6-slcPfXMw-1; Thu, 21 May 2020 15:59:26 -0400
X-MC-Unique: -JU1wVkiMLy_6-slcPfXMw-1
Received: by mail-wr1-f71.google.com with SMTP id q13so3369061wrn.14
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUH1OFbHNzJeZmlQ3HgF3hr2B5jV9dvRYR22rsqFyDE=;
 b=rw6sA6V0Af7WxI5ncYSgpqlq5dd3ykFplex1nwPWvZHEW2kxA+Vj+WNlcco+l03jZv
 G4EM3OWQI/kP5JugbvndCI6NFjf/AXk+8iIjHcalrQLMkX/zkuX92JnhHMm2vD5OdUjZ
 tv1rJHFh2CrUH9bZO5Rx6wVnhz2VqNIaF/mFZikdTUSM1QPT3w4lkE5mCfjmULHGxgnn
 w2270E5/HFtZ7knSepHfy/d3yLjF2BWGsOMYFwceQjwX4mc4syFJH5sl50DYOfznZgmF
 FCY83lSurMI9pG/m9yQeVNa2Y0t1+mr8VBebjM+bSaEx0+Ld2bpcHl81J6IMN2ugyGzu
 SFfg==
X-Gm-Message-State: AOAM532lyp1nOak3U+QAXUK4E+IsYic9V68zcq0zYotoYSsLEx+uEAoY
 Qs78ZmBIH3sQkdeD2WYSD6Fk7O17VV3zprr8sZOxcttKg55cJlJVOAMQGHcdzD1TMK1OSGxuDbx
 UvSV3Sk/bM1C33qo=
X-Received: by 2002:a5d:480a:: with SMTP id l10mr218927wrq.318.1590091165275; 
 Thu, 21 May 2020 12:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf2/5vizkFDODXCGechy4gRzEy5r6dl18xJAFAHaWHwEZBQajFYoXRzr3BwlgURU3Dng8wSw==
X-Received: by 2002:a5d:480a:: with SMTP id l10mr218905wrq.318.1590091165117; 
 Thu, 21 May 2020 12:59:25 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s11sm7405424wrp.79.2020.05.21.12.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:24 -0700 (PDT)
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
Subject: [PATCH v3 02/11] MAINTAINERS: Add an 'overall' entry for accelerators
Date: Thu, 21 May 2020 21:59:02 +0200
Message-Id: <20200521195911.19685-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 14:32:18
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
X-List-Received-Date: Thu, 21 May 2020 19:59:31 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>

v2: Cover accel/accel.c & accel/Makefile.objs (thuth)
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eebdcc6aa9..d7b98f9878 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -415,6 +415,17 @@ S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
 
+Guest CPU Cores (other accelerators)
+------------------------------------
+Overall
+M: Richard Henderson <rth@twiddle.net>
+R: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: include/sysemu/accel.h
+F: accel/accel.c
+F: accel/Makefile.objs
+F: accel/stubs/Makefile.objs
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3


