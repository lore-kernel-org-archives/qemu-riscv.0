Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdpC-0007zR-MN
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpA-0007vf-Se
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45143
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpA-0002zz-37
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTxQcDt8oQCk497tRXJC3a7DdI5+FkjTGcyXVLcdRbM=;
 b=D5ffcbrPgkYFjHwoUyLNj97VAGOAoTAacwlUNgANVur2lgw9UKzaCIhxkgdllNoCxTk6NP
 UZoRN2SXEpTmXlgz1Js1gFz0xPYsK+HY/fwl7+VvMN8rAvGhULdBbZ9ZHKzmfjaP5nrKjo
 W/8mQyZuJkjT99VmuipBKntWIf4AD/A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-SoHdEqBvOZa73JzpGOn1zw-1; Fri, 15 May 2020 13:08:37 -0400
X-MC-Unique: SoHdEqBvOZa73JzpGOn1zw-1
Received: by mail-wr1-f70.google.com with SMTP id z16so1464618wrq.21
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTxQcDt8oQCk497tRXJC3a7DdI5+FkjTGcyXVLcdRbM=;
 b=MKxW54Wjc8JHGC76Dtkq50c1/CWghxAmez7E91Z9jUxnp6+k/iZyGNjNbjYSQApkHO
 UwQsnop9AS8mBp68lVvmZegCW5s+WXrZKoJSGopbztA4CQdhIalpaF36MF7p7Fejve8r
 bLYPsvm0X18T5crcw7O2XiSCmEgOqR0m13yQMTzHsjppP72mtb7cIc0K5yKIVanzJAxi
 g3Zdp6os61VsO5STQqDHEBwXFmPK5tNTZSzhAULhXDHiclUi5USdRVtBN+9YD2AI1Hj6
 HhUqTqw5+jUpiAUeDIV0qnSz9qCleRsNmY71yix0xBHITPIJjHJndYq7arfqvEChXucs
 rsBA==
X-Gm-Message-State: AOAM531AcAlktm8UfYccjrfJab40mX4oV31edATWjRB8P32Cau4XvIZ7
 belqhbfHBkUPqIUdeMzv8P8Za/97ffTu2LMbRyWtoK2NxexyBgdiLlM/hzO+/t/gEigiAAHHDZN
 rb88whQV1Gb4vtUA=
X-Received: by 2002:a1c:b141:: with SMTP id a62mr4847504wmf.7.1589562515270;
 Fri, 15 May 2020 10:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMXCpKrYtAlcGLMqRL6aDU9sPBaP9jQk+veIRTz0KWodeBom8PIeyr5nxysb1yGtoZbI4vZg==
X-Received: by 2002:a1c:b141:: with SMTP id a62mr4847476wmf.7.1589562515032;
 Fri, 15 May 2020 10:08:35 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id j16sm4368177wru.13.2020.05.15.10.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:34 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 05/10] Makefile: Remove dangerous EOL trailing backslash
Date: Fri, 15 May 2020 19:07:59 +0200
Message-Id: <20200515170804.5707-6-philmd@redhat.com>
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
X-List-Received-Date: Fri, 15 May 2020 17:08:41 -0000

One might get caught trying to understand unexpected Makefile
behavior. Trailing backslash can help to split very long lines,
but are rather dangerous when nothing follow. Preserve other
developers debugging time by removing this one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 34275f57c9..84453789f9 100644
--- a/Makefile
+++ b/Makefile
@@ -420,7 +420,7 @@ MINIKCONF_ARGS = \
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
-MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
+MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
-- 
2.21.3


