Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A210C4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:40:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnAh-0003ED-RT; Fri, 19 Jan 2024 06:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAf-00031L-0w
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:25 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAd-0002Qo-5Y
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:24 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so6043545e9.0
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664181; x=1706268981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4V5MwJ3yzBvCl1jR3LZsLDTSMljFxa13ddLlRCJyMuc=;
 b=Yjueg+BsESEHq9lwdZMlj9v/mN0HCf7eMYlMOQLpLYbgvcVKiNW1Sy6NVRBUw33doa
 WiO3dlMZtU/SxsigLh4Ik7Yl91tqU4gMORI2UCjhQvD5Ljkwzo5AGs2WpwEl9QyT0VsO
 J3jmC4vardD9+EDk58bRG1JOn6VBL+tDpx9wfRW8NZRpjvMsy2M2HaTnGt0/VfBe3b8b
 VrYdnDrEPmPrRyJYSBPeYC4Ed3ldnT2eDO9efu0cw4ZaPuNKLmB1sRjKynUzEPkTLrhd
 e0er/XjafnznvGibE7vmn5yQlzni3N1IaTaTdPKW4k62wx/1IT9V3KIWpcwvVg3n8jFY
 thXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664181; x=1706268981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4V5MwJ3yzBvCl1jR3LZsLDTSMljFxa13ddLlRCJyMuc=;
 b=pH5MSEmVkaECj0/Zm/EfiXUWB8GJ96e18Xd6vY39/JrM/XZg7VaJp02P3dLXxvnrIN
 zqc3YRjp7whuGFc7lPZ0/ztJ8nx2F9SHXVkHdAdkqwnLQw9nV/J2lWf21bUMepUfCsza
 jieNibg46ABJS/aZ4mPQay1PD3Y3Tt+dgwR4ghNOfCWv0MVoiZCSrMp0zBAdEZ3PDJoA
 1xWqEGFik/exwPjsjexSvm6ddhu5+qR0ozOzLj77B6Dy1vtcY6ZF5KWwNWpk0fV1P2ml
 CYNIR5++zNdNpB2kajbkPple6ujG4eKKl/1KzHreCRHFaWA4amzixlCk1QISC5q5P/eI
 wyvQ==
X-Gm-Message-State: AOJu0Yw24pOIyxzxCcXbP8E1KpkAGTiM3Vs2N7bPUTWEVxMMkaljDl6n
 VV4dLCPg1YOyqUpAukzlUBd44ByRHnxLauAvLiYlP28pG8qvU55GFyBxplH6SPNkkvvul6eOWY+
 A74B7sg==
X-Google-Smtp-Source: AGHT+IGgpbNjq5TXrUvNw7z+3T1hQrZoQTJuqCujgRChB3FEIPAJzKMEz4Nex9PvXOSkxxSuxVhvMA==
X-Received: by 2002:a05:600c:1990:b0:40e:50ac:d24e with SMTP id
 t16-20020a05600c199000b0040e50acd24emr1781197wmq.13.1705664180890; 
 Fri, 19 Jan 2024 03:36:20 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 fm16-20020a05600c0c1000b0040ea10178f3sm237439wmb.21.2024.01.19.03.36.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 devel@lists.libvirt.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 16/36] hw/block: Deprecate the TC58128 block device
Date: Fri, 19 Jan 2024 12:34:45 +0100
Message-ID: <20240119113507.31951-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Samuel Tardieu <sam@rfc1149.net>

The 16MiB flash device is only used by the deprecated shix machine.
Its code it old and unmaintained, and has never been adapted to the
QOM architecture. It still contains debug statements and uses global
variables. It is time to deprecate it.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240109083053.2581588-3-sam@rfc1149.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 2 +-
 hw/block/tc58128.c        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e6a12c9077..15e39f8bbb 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -273,7 +273,7 @@ The Nios II architecture is orphan.
 ''''''''''''''''''''
 
 The machine is no longer in existence and has been long unmaintained
-in QEMU.
+in QEMU. This also holds for the TC51828 16MiB flash that it uses.
 
 Backend options
 ---------------
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index d350126b27..6944cf58fa 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -202,6 +202,7 @@ static sh7750_io_device tc58128 = {
 
 int tc58128_init(struct SH7750State *s, const char *zone1, const char *zone2)
 {
+    warn_report_once("The TC58128 flash device is deprecated");
     init_dev(&tc58128_devs[0], zone1);
     init_dev(&tc58128_devs[1], zone2);
     return sh7750_register_io_device(s, &tc58128);
-- 
2.41.0


