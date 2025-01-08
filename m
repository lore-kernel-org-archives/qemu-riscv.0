Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E822E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:18:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUzw-0008RQ-15; Wed, 08 Jan 2025 07:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuY-0000rE-Kl
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:49 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuQ-0007LO-PQ
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:46 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1442358166b.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338271; x=1736943071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pp9Cb+nLjYnJ8bOQQMApTzM9CoLq9IVOBk3wtPI/KWI=;
 b=TJ6aJ9Qy+fi5sUtHk+bN1MswKt727yIT8DNrl5mwylU0hqHANXkTzGL8k+fgQrKzjq
 MfyIJjuPXsev/jyx1qARIHhG9NfuPUhhqWXpE3SYU8DoEJZAnugdokBKSTAAurVljFld
 JXRDZRmcCczeF+rizfP2F4MZvdml2n9uWh4uqsus4GbYGNpHmtbOlZGCKSsV0rEuyfXh
 IF0BznKoj6NmPji1V3G/KcM/PWp5wbghKKqLD8tpRkLtv2UsMiush9ukklbNI4Xk7F6N
 vGI9AzF0yOl3ZAJYnRd7nahOE7KmjQPsCleMchRCvNhgUHl9/pjnQQMMoA3rxmaO/Yrh
 ijew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338271; x=1736943071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pp9Cb+nLjYnJ8bOQQMApTzM9CoLq9IVOBk3wtPI/KWI=;
 b=DOFotjcyI3u0mH7DBtouamPrEtvmGBVzeNDvzpvilbjBMRRopxIG1yqsYQXh6L9pON
 OBaZnGhPfa6SX5TeCpcouPHvq7wARBN+nija/yThG7kbm/J/XowurWbkALL6/41lDXJZ
 MZU9orqEq29kQcI4D0B7xrQ7RrqvBtNlwD29//DGv868UOpAdBGiicojDyNMIp5oRSQB
 VcFNBG8S9mJ0JL3lfE6jY2H7cBZDFIKrpgYLWeCo2F4MMYTb5bi2UjSnNgjzTWzw8hc9
 WYWeVPcq8opYTnrH6xZ8mu+GcP0fNcgXtmuU0RWRRvcPxplzal2eSfav51NGz0Bu8Dgs
 VXQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDc+JBV5vqljatnJRKr751Ea6S01dMZZDO/wEikqSSSodd7FSf6UM1wUCTMaS3nMaslsWv352/IVl+@nongnu.org
X-Gm-Message-State: AOJu0Yw2WO1XpQUvwNEk5Bdd0pIOxMzrlLFzLFR7x2XH+C8wxctb30GN
 xk15pzW2A0I116anpJ1svwid008sTRw7Xm2nDoEpnR4WMrfsJgxoTcW1mxEKmQM=
X-Gm-Gg: ASbGnct6ki+wcdQXyymycPNrdCYASyN3PkPizMBYi3dI5QzQGwi8nTxu0C3HCfruTMe
 /qzGFp3iJ9thsiU27jfEJc++Ma51Yj9glm87BkSE1A9yDmDd+HnjbT61ojsvq/BpIQhSEKNkpx9
 ED4LeuI097YOvethjjz3t4rL4CNi5BFd6kO2WQzaEF5wCbfti+2SM8l16pgUXjTc19/WbCdB32f
 xspvhdV/CEdTCadhpsBgFWX9w1PJjhPkyl2LHSjaz2+KcAhrXxeueM=
X-Google-Smtp-Source: AGHT+IHg8YLSJJb8PfrRMVV1vxhiVHtnSOdTK8U63MIV2n3IOAMmv7R48KG+Qzj8jmtLMEzIN3mQvg==
X-Received: by 2002:a17:907:96a7:b0:aa6:2c18:aaa2 with SMTP id
 a640c23a62f3a-ab2ab73e7dbmr203253166b.27.1736338271008; 
 Wed, 08 Jan 2025 04:11:11 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f31bsm2470929566b.1.2025.01.08.04.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:11:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9E5DF6017C;
 Wed,  8 Jan 2025 12:10:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 31/32] dockerfiles: Remove 'MAINTAINER' entry in
 debian-tricore-cross.docker
Date: Wed,  8 Jan 2025 12:10:53 +0000
Message-Id: <20250108121054.1126164-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

AMSAT closed its email service [*] so my personal email
address is now defunct. Remove it to avoid bouncing emails.

[*] https://web.archive.org/web/20240617194936/https://forum.amsat-dl.org/index.php?thread/4581-amsat-mail-alias-service-to-end-august-1-2024/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250102152513.61065-1-philmd@linaro.org>
[AJB: update URL to web.archive.org]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index 479b4d6eba..7e00e870ce 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -11,8 +11,6 @@
 #
 FROM docker.io/library/debian:11-slim
 
-MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
-
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
-- 
2.39.5


