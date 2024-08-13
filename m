Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D69EC52D7B
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 20:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdy3V-0004aA-Kx; Tue, 13 Aug 2024 16:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sdy3R-0004Sn-7S
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 16:23:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sdy3L-0006AC-Ng
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 16:23:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3687f8fcab5so3109842f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2024 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723580611; x=1724185411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ucw1R3kvRxMvMZ60jr55/f9I1k+aTtfbeXhRVA2qPf0=;
 b=RmhmXwIp07XWFUEQZTx0Y2Sdkg4qOV5ZpincRbmpaQUAcg6KlJPzRGHBxXVcXZ4wEk
 4UamNJoXNWGvQZRwq91YV8zczLP9hTMn4VWcosWaYBgEAFZDIpBvxhMVhKFqcFc2x5wv
 pbrhOfEkbd/Vv6tgrbyo10O7xuODiNKDVJrOZsPWSTiLNubLhD8l4JV56ItsN+jiO5zp
 4fSeCzhVYFWwpZAHWf5ie5I76UjvvBcucE2wffREoFidHmW4DlmbZVap2ElVB01xPkEg
 sH36eS3Wk0RjALII3X5AFGKy+Hbqvw5ACLTzoKiU07806JzxUP+ULp/xDC0ERxDL/MQK
 +INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723580611; x=1724185411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ucw1R3kvRxMvMZ60jr55/f9I1k+aTtfbeXhRVA2qPf0=;
 b=k9mdEyMSWirIQnce0HtTfwr31Y+IZxQsSyYuTxIao0oxa6IlMbCIlyhGGISiSKB1bx
 bEooBYoyWU3LkXmcwMEjhuw2nHQch8wU+v22M26nLCdHphGzvJMyyWQlCW9BzV0LSmy1
 Ke+15ievgsERREKC566ew+COC6YiqbWPWpwjBp5/tiOF565UANjYmMSZumpTUSRTvhcm
 PPpUlDKUuEuByq9zqZlZIlQc4V77k/fgCD7Ycf7Efchs2qXb4iG+bJTiauuip8js5aGN
 G87GARFGBXFPwH+rUSyJ4pXq+kQMTDOC9s7E5VUJYwzdMxFhzo6gOc+jm3cuL7yQy0I8
 Wd7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7d3EreTOVA+6F1To9K1JjH3E5DWtTwX0ucx7PX7teW2Fp13Nlgb1PJIdbAiOZXTeemnOBHeWbRC7642wAVfk+KZYPvGA=
X-Gm-Message-State: AOJu0YwAHb5tePMg9lWhxQWI0hKKiDAwbpIEwa8xQI/LJZGvlL7x7xud
 n4zASZey/Wzvb1HTB41Nvm8+SPpq2oSOIplJ93F6pLFfwoHcZs5aF/lmUsGx7wA=
X-Google-Smtp-Source: AGHT+IEHUa8SMsB+heQResqgZkOo1Uia2USd6ZGBumq7MKEHUaZArPeEKQca7zVlUjyHzl4PKoRMPA==
X-Received: by 2002:adf:e5c3:0:b0:368:3717:10b3 with SMTP id
 ffacd0b85a97d-3717775c791mr508831f8f.8.1723580610895; 
 Tue, 13 Aug 2024 13:23:30 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37172483bd9sm2664164f8f.0.2024.08.13.13.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 13:23:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 778BC5F8BB;
 Tue, 13 Aug 2024 21:23:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Michael Roth <michael.roth@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Weiwei Li <liwei1518@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Auger <eric.auger@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 01/21] tests/avocado: Re-enable gdbsim-r5f562n8 testing
 U-Boot
Date: Tue, 13 Aug 2024 21:23:09 +0100
Message-Id: <20240813202329.1237572-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813202329.1237572-1-alex.bennee@linaro.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

We disabled all RX tests on commit 9b45cc9931 ("docs/devel:
rationalise unstable gitlab tests under FLAKY_TESTS") for
being flaky. However I don't recall the U-Boot test to fail
(the problematic line checking the 'version' string is already
commented out), and I'm running this test reliably, so re-enable
it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20240801172332.65701-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240807114059.2339021-2-alex.bennee@linaro.org>
---
 tests/avocado/machine_rx_gdbsim.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/avocado/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
index 412a7a5089..a83873b738 100644
--- a/tests/avocado/machine_rx_gdbsim.py
+++ b/tests/avocado/machine_rx_gdbsim.py
@@ -22,8 +22,6 @@ class RxGdbSimMachine(QemuSystemTest):
     timeout = 30
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
-    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
-
     def test_uboot(self):
         """
         U-Boot and checks that the console is operational.
-- 
2.39.2


