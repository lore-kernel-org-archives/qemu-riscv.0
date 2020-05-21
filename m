Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrM6-0005HJ-3B
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrM4-00059u-1W
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrM3-0008M5-9C
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
 b=HpfOgZ58q8a6kFCt8TeI6IpjiOOiyqFz2OwLnzCTzH1JTLOtjHW8hv89QAPDqaEr/uU2YC
 3t7/CVwXGjKwfk2sfdRZWXGWi0ZllUsq6GsALeq+uysQNjrOw2rOfNvBnlY7LtRtQvC9N+
 oSbupkNUUon7EQuq/eYJQOQXddmeHUs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-n9NJqBNFNUq141ehBbNiBg-1; Thu, 21 May 2020 15:59:42 -0400
X-MC-Unique: n9NJqBNFNUq141ehBbNiBg-1
Received: by mail-wm1-f71.google.com with SMTP id p24so56608wmc.1
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
 b=uZZZNk47dk/YVdTeFikXjR/1K/sbPZ9mPEa7N90yxHYUy4WlblWyKjKOrwiQnguSiY
 oqJmxuG/uPcGbfdywqM3BzlpQkV5v2hAcgzkGOp89VsCTyqI7pzTmedH7xBM2GFC8/RO
 VdZqbGF7d9B+gy1jE9wX0rstmdvSUy3Jikdvb3bluFs2ZD0pvTDYWW1yz4t3pUcd7Se0
 QTMtitAw0KMKhN2wV80xAWthjoiEdWm7mMMEXet9o6eMV7cX6amS0mqTNXxQPzZynihj
 OjhGhepJ8t9og47tfnz9Z6g6e/oYsv/PLLcN+ToR2QAIoOVTNRHGKkmOmlF0ksJvBL7C
 5jAQ==
X-Gm-Message-State: AOAM530RRPxuiKpKtDw3xQ4jxtZ/WWNbe1ZdEK/FzdruFXdQKxu2vjxV
 RgeBHQLuLhkCrwQ24jMeX8OTLyJfuBMrL4hBcAbPW6/UsorMG4/jOYLOmSokcKyILL9zB2uuZzb
 mPTzhogPBNANNgfI=
X-Received: by 2002:adf:ea09:: with SMTP id q9mr199799wrm.399.1590091181642;
 Thu, 21 May 2020 12:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeaXm4iwycnKbL3KPvGpgmGXlS3CyVHkAmumZ3hSREIGIXaWVOKv0e6o6ImxUtk7uwY+Ha9A==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr199773wrm.399.1590091181402;
 Thu, 21 May 2020 12:59:41 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 40sm6315242wrc.15.2020.05.21.12.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:40 -0700 (PDT)
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
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 05/11] Makefile: Remove dangerous EOL trailing backslash
Date: Thu, 21 May 2020 21:59:05 +0200
Message-Id: <20200521195911.19685-6-philmd@redhat.com>
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
X-List-Received-Date: Thu, 21 May 2020 19:59:48 -0000

One might get caught trying to understand unexpected Makefile
behavior. Trailing backslash can help to split very long lines,
but are rather dangerous when nothing follow. Preserve other
developers debugging time by removing this one.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 40e4f7677b..6c9d718b2c 100644
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


