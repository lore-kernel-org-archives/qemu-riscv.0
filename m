Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb716-0008DP-15
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb714-00087M-66
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb712-0008PL-Mq
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
 b=Eq0CkKPdV0gnZLD8QPuLQLEoV6kQcbaBGuhu079an6u7C9bclKgQD1a9Ee5FsPvthNlKx0
 wWVHKBPTdsMMy1iX8SI+zuJFw73kAho4AxoGm5Odk+D9pV75fz3CbvJKjC9qmpBKeDkVri
 iBOdupa23JLzSCUGFw8ifq9LRLQ8smo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-XbgEVufYM9mQhOlnwpk46Q-1; Mon, 26 Apr 2021 15:35:28 -0400
X-MC-Unique: XbgEVufYM9mQhOlnwpk46Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so131793wmg.4
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
 b=jG5TbqEfZyVXUOREhBvTHuF/uJcGKzj4AXGAZ3EzRBjFqB2rGz9wtYGrNSLr34x74B
 4c/lwzKLMpEoK3kshO9070Qejy6GY193CtpOhL5jDJlD8UgMb6XJ9txKhh8UqanR/r9B
 CGI3Wkt2SIQYcZqrHtApXYVDpyg3+ihhGaISPqo9JYkAGMLKFSpCZET49fqTKnRjV5OJ
 SZUaUArTuPrnyMpm/Ure8Vc7bG4pM7jq/a7ytCe3/fsq5qFGSbBNchjEgQ4yO0PnJElh
 Uvf6GoxyPg2B4egBN/clsXS1sbW/lJ0wSqGzQXuurFLkXwL97sE5FMHWOno7atzZpvFl
 2MIA==
X-Gm-Message-State: AOAM530Y46oRub/u9oGAFdp7lRjatDLTqDBB9PzFtJaOXjQSWj4E1qlh
 RbH6ceKX7shoBnxFjvPaWgQZ80dET8xJqdAc87Un0QxcO5BN2mscHjNLiZ19+en75UBvcL1FU6U
 X3PUQEeXcQ3G85Fw=
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15241560wrp.320.1619465727166; 
 Mon, 26 Apr 2021 12:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2kJ4FNyQP9qvfWFDwZZ0ClRS49xdh+DCuUW2SUocKMlWCZIT0zufxLO6nlZj80yh2RjuW1g==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15241538wrp.320.1619465726990; 
 Mon, 26 Apr 2021 12:35:26 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u5sm396893wmg.25.2021.04.26.12.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/7] stubs: Restrict fw_cfg stubs to sysemu
Date: Mon, 26 Apr 2021 21:35:14 +0200
Message-Id: <20210426193520.4115528-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 26 Apr 2021 19:35:34 -0000

User emulation or tools don't use / require the fw_cfg device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d609e5..4ff36401cf9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -12,7 +12,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
@@ -49,6 +48,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
 else
-- 
2.26.3


