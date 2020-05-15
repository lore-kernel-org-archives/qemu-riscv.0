Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdpU-0000QG-Hq
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpS-0000KW-Tj
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45441
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpS-000329-3h
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBgI8c9GR0YajQTulaxYrH/xuvizDOHwgtiNZBEHy48=;
 b=LI5SkbbZ6kXtFexsC57EaCS9HQvR5ZMu0l+q/K3aFRtOUlb6MjGZM8xlvYvVVVUKS5blGP
 Zbvl4Rby7skRFwShob8N8NPzqw+X/fFxS0N7eMvwIaeZ+bqqKXT3L17teqmPKYZJkrRaZj
 PPCkKVin8EgZKRJljTfpczcembLagpI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-UcguRSkNOPOcsbTPuhGi4g-1; Fri, 15 May 2020 13:08:53 -0400
X-MC-Unique: UcguRSkNOPOcsbTPuhGi4g-1
Received: by mail-wm1-f72.google.com with SMTP id a206so1260151wmh.6
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBgI8c9GR0YajQTulaxYrH/xuvizDOHwgtiNZBEHy48=;
 b=XRlbxyQ7ppspbaWqEZmq1Z+H1GVx3ENT7vW7sCbRs/zTOzZHOBX0+mhc8kTqGc+0iA
 LTxBlrIi/Rbwqba7EALS6eMxKfmmnpsr4+JQL8AENi1ev7Kz1yQ3BUSUPtsyCr7Nn2uA
 GoT8z2mHF7tjJnsL7Jh4ko1VO96cbkNHYq0zaRcdGkXilc2M8Lxrd8Nrx5ICCUJJu3os
 pBV/FGvY4u5ZOlpYixIAR9bTdwAYpwyxZtyUx7yOAvVZ7tqV2ioWiDTWDiO+wFeEzKtw
 e/Q4rhEwE+Bd9xdTsaZqd0VnNxn4TCjKk9mjfvldbyRWrQ2+12owOCo7yiZtKKFKFIJo
 xTyA==
X-Gm-Message-State: AOAM532eIIDGHJSRxp8Nz8bPQULfsRDVp9MYOPemHrFOjjrZwvRLrGBv
 CyhZT84pmKvTTWjE4TkpXoVJAbnpltJu4XT7tgSd9KXHNNWiViSltFYRVpVf+X/ekaU3N2QoIrn
 IHCxRz2zZlu3fCd4=
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr5220438wrt.411.1589562532453; 
 Fri, 15 May 2020 10:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznHDXFYsBEWUbofJ0EE9tOVLGMkwDSakwxzf2mGgYDtyNYPruFRzgSVdhDlaSYnmIVD53jyQ==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr5220415wrt.411.1589562532245; 
 Fri, 15 May 2020 10:08:52 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id h1sm4614912wme.42.2020.05.15.10.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:51 -0700 (PDT)
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
Subject: [PATCH v2 08/10] accel/Kconfig: Add the TCG selector
Date: Fri, 15 May 2020 19:08:02 +0200
Message-Id: <20200515170804.5707-9-philmd@redhat.com>
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
X-List-Received-Date: Fri, 15 May 2020 17:08:59 -0000

Expose the CONFIG_TCG selector to let minikconf.py uses it.

When building with --disable-tcg build, this helps to deselect
devices that are TCG-dependent.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 accel/Kconfig | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 06826273c1..b4c0830b26 100644
--- a/Makefile
+++ b/Makefile
@@ -405,6 +405,7 @@ endif
 MINIKCONF_ARGS = \
     $(CONFIG_MINIKCONF_MODE) \
     $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
+    CONFIG_TCG=$(CONFIG_TCG) \
     CONFIG_KVM=$(CONFIG_KVM) \
     CONFIG_SPICE=$(CONFIG_SPICE) \
     CONFIG_IVSHMEM=$(CONFIG_IVSHMEM) \
diff --git a/accel/Kconfig b/accel/Kconfig
index c21802bb49..2ad94a3839 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,3 +1,6 @@
+config TCG
+    bool
+
 config KVM
     bool
 
-- 
2.21.3


