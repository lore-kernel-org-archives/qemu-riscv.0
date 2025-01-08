Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42D1E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV5D-0000mu-O9; Wed, 08 Jan 2025 07:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0y-00021l-0C
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0j-0002TH-Ei
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso111551805e9.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338687; x=1736943487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teELEAk9lxdpoQ7xzO+V1Ovz+lGrytHqETaOuw27UxQ=;
 b=SDf0vlrPMN9LzFPxdCb9wpwDTvbBiv9lxnAtQy+mx72+TBsj+fWwyV3RsMVKoJq0pH
 0J3QAj3YYhAks/xi868+JrYP7BliKbn2+oEt/Zce3GCl4X1W3qeUUTk71mf7+UYTvahU
 adjY3bV23N3/vifjn+S0RyoBFY84cJCiLAUSLAo6uwduMJvxtkYsnlZrZD9VJBMLpkOg
 Y3ot6RAeI2oa+F1Lh3ZOHuOlJS1DWWYfN3MKKcxFDJqzHWGLok74wqTDeZTD/vn0OaHj
 H007AzC6drPZQ+qyrzeyc1fK6Ka9Xozh6r9Ch+5kEWBgmnSJmjNeRWIgOFtyQbhgCbD0
 RcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338687; x=1736943487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=teELEAk9lxdpoQ7xzO+V1Ovz+lGrytHqETaOuw27UxQ=;
 b=R6zpWTL3kQN/Hm/2rCs21Vt1HQ/ENkl7wlsM0WZ7IZ3nNwSVfOUzdggMNM/e92+0n2
 wlNtxZcVoQccduWR+z9rqwM+79gmWamiBvtmlYUfpY47q7aXZvA8e0Lt2nP4+rMoca9U
 ybAtqlrA0YQk7gb+h9+kqEpgzkryws00d2Vb/MHDhYgz1uvKo4lfpTBwt/XZ5KHOJJqP
 ebNrgK4V5tl2o+rL7NKXiVGm+ZY9SybHdmYlDkQJQQVjQHnrsTL8+MVHUntuVDj/SzHI
 EJ3KTf8p/eX6LHjUeZ/8gYWzp6Z2CG2W1h3CPPeIkhi89UL3aNkdATGmWVQqu/WgIca+
 DDcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTLsBcD9zw/MFp/Rr84Q3Y91VtbK7ndasLT3ZoBYAwr8KruZFe4hLLVTXDokWtzDelqGyba6pKWQ6y@nongnu.org
X-Gm-Message-State: AOJu0YxP5EbRmZ8UB9CwBdOQhX+OgyIh3y4daGau+4ivck5kRMGnQxAp
 L8Rx8XPuxpStP/xy/uZ1gYc2eqPI8Iw1wkHK+RFdaGklMYKlVc3/GZw5c5qKSv4=
X-Gm-Gg: ASbGncuCLvQ73oP3ITGpxvjf/kGiP4z3YHkVZr5JRI7/28GQNLv1E/yy8ku3jWc27sO
 /C64sZlQD+aJPceKA3r1POp/5EvGjf99dVWBDPr3EM7BN17VaHOLgH7GugC76y0aSXfSspOpkmk
 lV3gC64q115xh5K66dw7wUszfWoMIo72E2QPsDFvfNwcnRdLmjF22vlo9ylk2UOfEUJagmEIzGs
 jTY1P4EyZuO+B4Wl2XIfeAYMtUOzEqvVfQVoiIjZG9iyxZEkA5AOcc=
X-Google-Smtp-Source: AGHT+IH9EmdrrLmuX302owwafBOgoAOVd3AQoLbVMFh6VqlzqHPPhx9nx2Xrg+9KHctVd74rmrQtzQ==
X-Received: by 2002:a05:600c:3ca0:b0:42a:a6d2:3270 with SMTP id
 5b1f17b1804b1-436e26f01aamr19025195e9.21.1736338687071; 
 Wed, 08 Jan 2025 04:18:07 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm39816765e9.1.2025.01.08.04.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:18:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B4A166030B;
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
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 32/32] MAINTAINERS: Remove myself from reviewers
Date: Wed,  8 Jan 2025 12:10:54 +0000
Message-Id: <20250108121054.1126164-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


