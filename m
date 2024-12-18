Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF0BE77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwsi-0003kD-Qk; Wed, 18 Dec 2024 11:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwsf-0003ZB-Up
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:26:38 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwsW-0007rb-98
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:26:37 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d41848901bso1777381a12.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734539185; x=1735143985; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVtfGj1mN7IE9EjKx57fAetrjTJp1RBBY+kA+VK2230=;
 b=XmFu5YhYoKsCJIzA8Gj+zZNN4m3yfFkF2U7DR7z9lSd738xmHixsEnc0voLR5sCHv7
 Vn4bQzV91R4jhcEyQZovRoRtN/m4NOwp3td8Kz/MCd4pmPYOeJCBgHOjPwFJJwdu5XRL
 CHcFS8jZ3HubFcrbY8D0G+i5ocwI0CArCx5sY8QKUDv0VTr3v4XQk6BizN17MOFGPnmc
 S1fMeLFpZJBCDslXDb4dWATrk+EAsr7m84vZ3Ky8gKWQ3B2E3aTEiv2rEoe6mfjdUldj
 SJ+orEyKlQWzGUt293bM/tSbiOO+mDq9T7v/K/G+m8WuhmYoel73Fz+gZSo3OUOnI/TN
 tebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734539185; x=1735143985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVtfGj1mN7IE9EjKx57fAetrjTJp1RBBY+kA+VK2230=;
 b=ruAdYw3KusO2ZrprK+DwYcIYOC0h+rC6ZLh+jtsNcIsM6VQdHlKLE6WEs5MEVEfbqR
 s1u0BsvEtM1QhClaBs9AHmTIRcRVvjJVUBkkyyUiOE/Z8FvkawOFL0Pij5AmKpnkQRx4
 8pVJT5cn96XS4dexvUrYQucfayV/L38sD6XUd5bMQ5MxLAsDUzi9BYzYYJpUFqOjo3yQ
 iCaugN5/G81p4tnqxYnNo6eZDDx+lrnCnp9+Gclw80AZM4ETXGOXmbwF+uJdA8XqGrel
 f2Aypejk9CS0zWRZw2UMu8ka24F38Iy1pjCPffHrE7YW3IAGqun00Q+QN5OmLroPKbqA
 kHSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUjZgEokoOM97uJz+jAWMO87WRDev7u41BkhacK6g6EvqMcveT9dVX8DiXAI1Zt84qXkohJGhNHoWI@nongnu.org
X-Gm-Message-State: AOJu0YwkgzMLSUWf39eu5RAyyHk5BZmB/3A8NbRDmMsGpp1DhpBTYOeC
 x2YYqWz89cmQbDXGD79zE5gNsUnMjhjNPIKZXvvxbQS9d5jtsir74ow+2PyaEoA=
X-Gm-Gg: ASbGncvc/x52YINIilG+13IELKTQj0awopw1MQeMIw6V8+RzNXpOdnj6KjVX9PEyoUL
 JZ24aAHCgDYIjTvn1tKsf08XRi/O69o57JWSCiMYJ9SWDQ136oEyXEFrZOiuRhZq5rgoOwYvLQm
 AT+e+DfKrF485YaO0n8z9w4S8vfaZzvYBdkwLRgsfwFTxaylSI/xPaI0jYfdTcby9InS5jAzM6d
 jqdbF7ms4V1QKrWWuKX51eDOkFyyeu+VUsAGHk1v4sm64lcYYces7c=
X-Google-Smtp-Source: AGHT+IGomb4hxWiC7e6PCkn97aH7TQJwsHI4AvtNFMO+kaSQIbmzD4q1dayzAYda4S+IO0gz6xnC9Q==
X-Received: by 2002:a05:6402:2482:b0:5d0:d2b1:6831 with SMTP id
 4fb4d7f45d1cf-5d7efac5041mr3182443a12.14.1734539184676; 
 Wed, 18 Dec 2024 08:26:24 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ad1bf4sm5494985a12.34.2024.12.18.08.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:26:23 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A95EE603BD;
 Wed, 18 Dec 2024 16:21:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 16/27] util/qemu-timer: fix indentation
Date: Wed, 18 Dec 2024 16:20:52 +0000
Message-Id: <20241218162104.3493551-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Purely cosmetic.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 util/qemu-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index ffe9a3c5c1..7b71655416 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -680,7 +680,7 @@ int64_t qemu_clock_advance_virtual_time(int64_t dest)
     aio_context = qemu_get_aio_context();
 
     deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
-                                                      QEMU_TIMER_ATTR_ALL);
+                                          QEMU_TIMER_ATTR_ALL);
     /*
      * A deadline of < 0 indicates this timer is not enabled, so we
      * won't get far trying to run it forward.
-- 
2.39.5


