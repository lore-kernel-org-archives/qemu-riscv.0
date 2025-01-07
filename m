Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7EFE77197
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:57:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCql-0007hA-23; Tue, 07 Jan 2025 11:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCpY-0005A3-Vo
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:27 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoa-0005wb-DF
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:24 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso105487095e9.3
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268743; x=1736873543; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teELEAk9lxdpoQ7xzO+V1Ovz+lGrytHqETaOuw27UxQ=;
 b=y9MkZwjpYhU86112TslXjETumPn/Yy3dBBnlQK9HLcVf5CmonRLtscOdigUujSjGbO
 6cLe4tbBWInNv5nc3YJ1ZoYP+nbUMVZAtEeYv0ucxn9HpdGPfXRImN5MySANILy6dX+v
 LOturF7ILeNy6HC6jnwG++L58YzxdDgnsp9mnjs1vV2JNvRv+qylh+uqt5eI4HDSYmWe
 UOaGQaS/NhARLgBUG8180rXihR9kYYyS24pxQ7lYpKQ3+4Twpbl+AcN3kT0ndAfDEA1S
 vGCTYvZ9in29+dQQGEggRH50sEz/WFkqpSnck2Nh0Z6tfhG0QZDaiDrrlg4Fyo+ugJ4a
 vSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268743; x=1736873543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=teELEAk9lxdpoQ7xzO+V1Ovz+lGrytHqETaOuw27UxQ=;
 b=DIqOR7XJlD9QD5cSURn5tMXbmqWklC1n3LJ3srsweGeYjANJCVmKAg3NpYylOPXi4R
 Y4pRl5Gi2Eq+2wixIyMDbNZmRbOEfs26be5mEuQYowDfifLgiscd5m7yVIX08XVbWckV
 Y4oZcHg+g79VJA+BWKltMHyIz2OwZvnpSIsk7pxG/ZaghXTMwU8CX/6iBUgvqpA0CtgY
 sbN0lVAYcJS6Zrxmkrfi+EV5E/MbRws5UK8ZwKSdY4v+TnfA+L7K4BVdOOLb6Jil+HD/
 4OxPbbtSMu0J7ZAsA3MnRVK4OcjKIlnPjV3Pv4v9rTG3pwidOQyCNaQKODKHTDmZJe7y
 gUsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX63xclIzb9RIQiqGl3md9zhxspClwzgHyfliVWH6CqhgTCRuve1f3F0d9XJjsBL5lrP4baK1PhQNWT@nongnu.org
X-Gm-Message-State: AOJu0Yzn+M+kjcCErIskO3O3SExRylcZ1ZYAXOm/7qwa8wo77/rAqk/8
 i9KCjOD0fM2rdse4fmo91u5WSCTu3HDcRmPErqQJrjvaTVG9mWplwW2tpnOgFRg=
X-Gm-Gg: ASbGncsVJHFkPUbAZWm5Lux1i8qb5iEWIQt8R5G6cF054uDMumtQ41kQK/biHgGI8tY
 hj12UBqgyg0C/2itZ5OG17OsJpnjQjs6V0qga2r6+/SJ12PPMQ7jE5CgTOtfo/fvrP4ErMlXON+
 /mpGPm5e4uBy4r9QzNJfs7c7gWWOtDuSDyxjoGuLUT/cj4Fm+u40lwa7L3FRufa3/iTxhL9eJOx
 wJEo4lVz0B3Hp+cKvHU+g1d5NPxRMf3aU1m1ivtYdYaZ/a0c8H3f9k=
X-Google-Smtp-Source: AGHT+IF5KN0QJZlag7RaR/440PwDWziP7LBlR3PxbPOEhT7E32BnhAx1109gpcHtw8ecM45NPx6RHQ==
X-Received: by 2002:a05:600c:3505:b0:434:fafe:edb with SMTP id
 5b1f17b1804b1-43668b5f326mr488852005e9.24.1736268742893; 
 Tue, 07 Jan 2025 08:52:22 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b2afsm650058715e9.35.2025.01.07.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:21 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A05ED60679;
 Tue,  7 Jan 2025 16:52:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 29/29] MAINTAINERS: Remove myself from reviewers
Date: Tue,  7 Jan 2025 16:52:07 +0000
Message-Id: <20250107165208.743958-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The time I spent contributing to QEMU was great, but I've not been active
for a long time now. So removing myself from the reviewers list of
"Integration Testing with the Avocado framework" and
"Build and test automation" subsystems.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20250103194450.360789-1-wainersm@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cab9018d9f..c1d954c9de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4152,7 +4152,6 @@ M: Alex Bennée <alex.bennee@linaro.org>
 T: git https://gitlab.com/stsquad/qemu testing/next
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 M: Thomas Huth <thuth@redhat.com>
-R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Maintained
 F: .github/workflows/lockdown.yml
 F: .gitlab-ci.yml
@@ -4198,7 +4197,6 @@ Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
-R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
-- 
2.39.5


