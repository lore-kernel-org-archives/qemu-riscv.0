Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C26BE77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:25:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV4t-0007VZ-Ji; Wed, 08 Jan 2025 07:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0j-0001fk-GI
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0f-0002QY-Jm
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso165388965e9.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338683; x=1736943483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zb7xH3yqos9lFAi/HcOIGn+1EMSfay7/d3nkjMNZ1pk=;
 b=IEa+u33YioinDNU6VgHz7ZuD+4TA4tOTgzbBgi8S0y5JBNTIWEyMm6PECRmnJ+ALwz
 7Bk/D6f3FqDQorTwxZeK/P6fLbbHSbItv6knkQVc8+fcDtX4VvDvBsi1ellu+59r0o/9
 DdB6umbItAusNO6VklVSG9hKaEXR/d1Wp7AcLtAWjrgJ30llopFOl1oGKiVLJXSYLW7X
 io9VNP190riC02dXXY8FprMSxSEPD+G4B9Qi+WYbv3N7xkBX6Jw7a0djlnFrt46o3LUi
 oI1qb48iSeuho+0zEmgRj/PDoSsbr4orIKmTFj8xhF/rrwIYtN66GXNoVbRAwJo4Z33y
 /dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338683; x=1736943483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zb7xH3yqos9lFAi/HcOIGn+1EMSfay7/d3nkjMNZ1pk=;
 b=gxqPMZbNc2v8kJvFplhsda1/+0A2iu+YVerTKHMvIQ6DljgfTVuNqQuhYHhA4SbCNP
 GiZ9un23n+osNHvM9waSAgtlkHBSnnhqb7IVzIPVg0qb/32ROT57KveD9YotRO8m/oCh
 bbi9QppsT0+fJvTE/doo16Ars9QXq3ZLxGViHH6+qXVzjGcMwy1JDt/jNHyUh46IChXq
 D6tVd2kWgVdk0kqFlmMKzpkPIGwOBwUgI3+nKupJB/AQzd4B/9Mw0jBSyPUXzNfTuucZ
 3wy0mDH0eam2OZDuJa0J9E9v8ei+BRnobNVo4PEV7J4WbhkFIDWo5OrJ3SzIWgOlDRze
 2KNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnObHzCF+YuLoidIIv9AJglkub6/f9lb5JPBTUZtBQJD/sQ2aHVy+BRsNpch2WisMNXmUfRGgiLna5@nongnu.org
X-Gm-Message-State: AOJu0Yye0g4Zo9LxDXbS0KtugrdrrcL1zDYYJezDoK9FzSX+8bsQlehm
 iuHMDClnRg2sfbwwedkhMRKhkuKXBKgGW4nVLyXJI8dhv+busWL1NpKuu9zO8QQ=
X-Gm-Gg: ASbGnctNC0SZGZ3jgrhWE4r8kcgRnUFXrxL5+7AdjObU4kI7WDrzV512zmB2AExxBrn
 GF3FMaNA1OT97OIss5htuvjNPJomoaEXpymUXwaSZS2A+2toj7MhZQJ2ZnQuiQuPg7GcdNYW825
 3rc1MaZOePL9Wq7sgmPVoF23d1ljvQ/hbSDf0tqz0z2hyYiuC6OlRvfoDU0rqYfj6bNTjFKIxJw
 OLohA6TTOagi9FaCsHEiCulJqrTDwUU90sv++Ke2jEzextrFovAPCY=
X-Google-Smtp-Source: AGHT+IFJaDyc9PdIvlMp1Qb/fCGUrgwK5l9RHvUq8sdZnTNPVlPw8v8AQSVFUQxNasg1nuKuQub+Tg==
X-Received: by 2002:a05:6000:4b04:b0:386:4a24:1916 with SMTP id
 ffacd0b85a97d-38a87317c6dmr1854219f8f.55.1736338683262; 
 Wed, 08 Jan 2025 04:18:03 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e21e1esm19018945e9.38.2025.01.08.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:18:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 878CA5FBC2;
 Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
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
Subject: [PATCH v4 20/32] tests/functional: update tuxruntest to use
 uncompress utility
Date: Wed,  8 Jan 2025 12:10:42 +0000
Message-Id: <20250108121054.1126164-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Use the utility functions to reduce code duplication.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/tuxruntest.py | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
index 7227a83757..41a4945a14 100644
--- a/tests/functional/qemu_test/tuxruntest.py
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -73,17 +73,7 @@ def fetch_tuxrun_assets(self, kernel_asset, rootfs_asset, dtb_asset=None):
         Fetch the TuxBoot assets.
         """
         kernel_image =  kernel_asset.fetch()
-        disk_image_zst = rootfs_asset.fetch()
-
-        disk_image = self.scratch_file("rootfs.ext4")
-
-        check_call(['zstd', "-f", "-d", disk_image_zst,
-                    "-o", disk_image],
-                   stdout=DEVNULL, stderr=DEVNULL)
-        # zstd copies source archive permissions for the output
-        # file, so must make this writable for QEMU
-        os.chmod(disk_image, stat.S_IRUSR | stat.S_IWUSR)
-
+        disk_image = self.uncompress(rootfs_asset)
         dtb = dtb_asset.fetch() if dtb_asset is not None else None
 
         return (kernel_image, disk_image, dtb)
-- 
2.39.5


