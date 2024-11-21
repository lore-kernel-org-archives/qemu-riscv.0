Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE9D7879A
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:05:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWI-0005IM-Bi; Thu, 21 Nov 2024 11:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVh-0004gQ-H9
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:29 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVT-000826-Hj
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso13463875e9.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208294; x=1732813094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBO8uUfv3fFiWiD+w6s2aaOdqrCx/cKUKIQ69stTmio=;
 b=DwaFEwJl8uXmUrxBuuoIpwShiSd8kLbeCY1SVFRk7Bux1bcVUntwOMcEXK+7cwKj9D
 9x5UN6q96+gBlx43RJFi8XftlTx577QVFC6FGPYGyRral+zlf6vz7wje/AEMBPLMa/Vb
 FMv4G1sGxz/ErofVDB5yC0IkW0rOUGyCj7mqo4tpOAkb3A/8x4Eem9v0GPpJ2Q+bGUjh
 zipKoytRdqIrc2gG5XGaz6huLq3+/HRq0FUpwE0zbcngsTM1Fxi+5dAeWseudRUZAYMt
 y/38NFrxoTX/AddzfcpZv2u9nRy8sQVWrRNMfEfboLqviG2zJL3Hlik33NvkBU5JDo+g
 BMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208294; x=1732813094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBO8uUfv3fFiWiD+w6s2aaOdqrCx/cKUKIQ69stTmio=;
 b=Fz06GP8Zdqs8cCLDmjTCAdCTZui7y0xZOYY2/gQyKYkfBLIknleVqVTXGTCa2weoF0
 NX4utKPLgmcphzlblid3knMPshRwo1czy6eapVprCCfz1TRA3/XMHkSHL/VkuUlHYt53
 ij+t0SKstbseNkjNNcQXp9+afkWNcC/ix7KnQHwLE4ZkYnniixVGdAwc3I7pUdiUkV7H
 ssoWh4rlgexNT+vgwDOYSZok4Bn2Nc/2H1R+Vye1C3v9eda2ysHJJoSYBNetZDuVKJL3
 q2Qo4qHmIL3p3de4e/oyGFB+QZohyT1goaWkw9PDfea34K7eedKL+P2FWrp0GC5ada4Z
 fexg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpXjuYceJvkm+BKfc5rQPf84yszvSySwkbBUifV8lcr9rKGaCdL0QLnA2/Sop3yEavPliTADf04P8l@nongnu.org
X-Gm-Message-State: AOJu0YzF8/Q4VpzgnHzjDauIyylEqEzAvIaagIa8i4waP/X8OZdrAXoO
 FDqgsE+TaeyLyJOehodWS1UlWu7LMqfCTOhr0lsJIxmD4j4nEOd2KU8+jlMhBbU=
X-Gm-Gg: ASbGncv0Hxp4khLZeOIOauG27cqKGgLXF355TvjAhFx9pivpbwXkYErtfhBIcMWAdPa
 FlTEj7eICrvn9vB0JZhI1SeA9xzoBpKQuJZIckSV6Q+l5n/M34q/GDbnE7mAnH0Lvzvf3gli3x5
 rgio2TDETQKFdsBGSf/T2SkAu+orDHtUHr5SdAxzvB8Q4Bs0PfO1UmSLDFLKIqR3rH3o0I4fgH7
 0h1SBuRw5OSOtpc0TW/b552gMIVzmmtqBaTsERhww4QV93Q
X-Google-Smtp-Source: AGHT+IFluGvXNWin4wGsdyZrYLQC3KI6QlEadKc1ikm2HChlvy4kmoKlcIMmhgumhDHp74vpHncVWg==
X-Received: by 2002:a05:600c:4690:b0:431:5ba1:a520 with SMTP id
 5b1f17b1804b1-4334898172emr85435285e9.3.1732208293966; 
 Thu, 21 Nov 2024 08:58:13 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbed99dsm7650f8f.94.2024.11.21.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 04FE25FBE1;
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
Subject: [PATCH 06/39] tests/functional: remove obsolete reference to avocado
 bug
Date: Thu, 21 Nov 2024 16:57:33 +0000
Message-Id: <20241121165806.476008-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Historical bugs in avocado related to zstd support are not relevant to
the code now that it uses QEMU's native test harness.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-7-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/tuxruntest.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
index f05aa96ad7..ed2b238c92 100644
--- a/tests/functional/qemu_test/tuxruntest.py
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -39,7 +39,6 @@ def setUp(self):
         super().setUp()
 
         # We need zstd for all the tuxrun tests
-        # See https://github.com/avocado-framework/avocado/issues/5609
         (has_zstd, msg) = has_cmd('zstd')
         if has_zstd is False:
             self.skipTest(msg)
-- 
2.39.5


