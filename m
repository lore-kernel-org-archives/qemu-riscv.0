Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63921D78797
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:01:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWQ-0005cI-8W; Thu, 21 Nov 2024 11:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVl-0004lO-6U
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:35 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVU-00083S-Rk
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:32 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so10238895e9.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208295; x=1732813095; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0LTmbM5U57S+h1nWuC/fSCXp7HsRQ6Vc+lwzcBVXy4=;
 b=kP+6mnjBGfR6CwDHbCceIMj1ePq5gdh7a6SiyTbwjpRfbbArXbLD5m4ur+a4Xda4MV
 yUqZQbw7U/BhUqUbS1xx0veUwSjJ9Qt5Nsu2u+iS7y/tcp8mc+BidRicWkgTJJbQKDB3
 IefrUXH2sb8a4HoPebeKn/x/kdJnAndgkS1a96rFmDUIEoZO6P8VMPz+L/DPeQefl4m7
 OpD1T387tbKByyYAEzf6pImmz9pJvhS+dLcWHvPhMCRDx0MmGQDbzK+JjqDYmgcyVVus
 Kunulp5jcX6BHMtuRiRQyh88yLsHaLzxWpjyiSfbgSOZ2PX1v3ZWgWaQvjrdj/Hhvg2p
 S2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208295; x=1732813095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u0LTmbM5U57S+h1nWuC/fSCXp7HsRQ6Vc+lwzcBVXy4=;
 b=D3XuCNB8EBdE0k6SQaoiwhB0ZsHD/ORoqDqBaS8Q4BsJFlLRgbRGsL2Gc1A6hFOh/c
 nmfy1dRp3xEJWgHq6LuJxehoaBTlf+8dtL9/KMpWinspqAiiQJDOePh8lT79cWwCW+P8
 RAu4BN+FDHJ3Whpl7VaXoJaHSYUpq+0i0fc9FkCbZoF8GZZvgOI16sUTxjH623r5LWTU
 ojq/WIaZVeQ1dNcDt4i3Xelo14CdwidL08U8Ru/78RHbn16/M8RS4Kg3/uZDRhntL7Sq
 MHIHNc6+L6ZgeazeAR7tZwmX7cSrJv3s4GOpTAy5UtRpSP3R2CJGeA//6OmtvCFiPvn6
 dLtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9uwqZJQQ4Zb9wWzzv9MCu+u+0WKg3w7l7LtQ0B4RDUKMg1c6tPozuASVbMxeSoQGV2gZgsClnaj5B@nongnu.org
X-Gm-Message-State: AOJu0Yynv5HadRx6vBHGU4bmzrSPDPOoJfdFVSHtNnlEcWYhi2cynYOP
 q3UmncZ7p6foHxeMA75+zkK6cA/DeWHa/4fRC+VBds7mOgQZOPnE0FP4nXdlJTY=
X-Gm-Gg: ASbGncsz9JHV464chOtjQ2h5aF6GkTsiOB1UQ0fNYsEXMtTtYuP0Gz4EJCctbP5rFFT
 dgApHl5v4XtZsRqt18HJp/Gr3ngJQCdzDbj5/nOHCFruBA4xzQPAp4+SL/t0Tlei0qVAKs6CnJZ
 Lyet9bqR85JDkXu5ZOASMw1IYLimMnr5jGQsQoYpIRUt041LTSfamEMbi9HwlzZrQQJH6ZFBwcq
 fqPKJPza6BnfV66bVyFDi7ZNa2FQJHjfEgq9N65x57ZXDaA
X-Google-Smtp-Source: AGHT+IGZcvrtZB4ajZlwFzY750AnsgB90oXdYBH9qZ9M4hZxLzoQ3uzYfPKGOpJJ1YdJWEZWTBwHMg==
X-Received: by 2002:a05:600c:4f10:b0:431:40ca:ce6e with SMTP id
 5b1f17b1804b1-4334f021f0emr70165475e9.31.1732208295278; 
 Thu, 21 Nov 2024 08:58:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b01e117bsm65328985e9.8.2024.11.21.08.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8DF18603C1;
 Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 12/39] tests/functional: logs details of console interaction
 operations
Date: Thu, 21 Nov 2024 16:57:39 +0000
Message-Id: <20241121165806.476008-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

When functional tests go wrong, it will often be related to the console
interaction wait state. By logging the messages that we're looking for,
and data we're about to be sending, it'll be easier to diagnose where
tests are getting stuck.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-13-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/cmd.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index cbabb1ceed..98722a9cf6 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -85,6 +85,9 @@ def _console_interaction(test, success_message, failure_message,
         vm = test.vm
     console = vm.console_file
     console_logger = logging.getLogger('console')
+    test.log.debug(
+        f"Console interaction: success_msg='{success_message}' " +
+        f"failure_msg='{failure_message}' send_string='{send_string}'")
     while True:
         if send_string:
             vm.console_socket.sendall(send_string.encode())
-- 
2.39.5


