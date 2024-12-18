Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF9CE7718A
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwnu-0007oS-76; Wed, 18 Dec 2024 11:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnl-0007Xa-9P
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:35 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnS-0006oK-Ps
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:30 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa67f31a858so1226324566b.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538873; x=1735143673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gnnOboOf/0hyHRkIZm1r+Edttpq+V6vfS59OPkMcZA=;
 b=vvpou3K4VhRyzD5QjXDQAMj/2cEJ+hh+KaQv1u4vTwOrxW/fK0eFomk8U+CAaaNbKg
 OGuMbvuVhw/s1Bn8szivjndDgFkHHsgK1cfxE9JrH4TJdmw8DKGTiwvDuIpICUc6JfBT
 j2vr6PtB9WZR3PhxNtT2qpdaur7ouPQS84xUFALB9t9t5tAZjs91A2HA/7FM2QJegiJy
 dO7nW9UZgZf+FROhWwnktN7JEcHEC+3IMbMW1iHHc6h8vpOKBJSe8Nwuh4vBxxjUBUH2
 R17va4Gzl9na8SYHtGrn7NGrj71bziks8k2HRbQHvUFRLyxwpk2kgyuQflS2+GdejXTF
 A/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538873; x=1735143673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gnnOboOf/0hyHRkIZm1r+Edttpq+V6vfS59OPkMcZA=;
 b=gKCue1R2RpCxPi0UU5047RCs4vJV8so/12S8o8oxR0/w/ab0gc2ReHlT7u0l5pYlm2
 GrLT4izqSL+SbCV2j/4zSd0NLvDKBj1OneVrw+6WRLgeKsmLG804v8bhas/aaForiKv2
 kW868j7TU8XEP5frcuHsMV6iRGo5nmSDuZtmfY0stiLgslVQecVEpejQJXlWyR+8sluF
 oMbdG89Q1FmwG1DNmAA20BSkBr7WRzMq+VjoxyUy883GdJSjPxX/nGJLCYEqFiFbCx2E
 8YozR0zIMC9wkqPiEYCpQmwhRzCreQwNUgsHdgkJ/eGfxxH8VHwY975y/AO7uGDYVmis
 OQoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ERKbDcub/sJ8DUeHn45u5fa/u2XOwcW3TP8ho4ylZ0zNRjkmJOSLQ1kc3lz6MD62kNJgy7/GKNlS@nongnu.org
X-Gm-Message-State: AOJu0Yy4o/n/pMUGK9WSbwJFh+OzzxoLeepvfXqo0GvOA0iMyrGHW4jq
 8jbwiF36QhQQzj0QsVEV8W7zZ+wYOq51fbe5VlrWdHBZt3+8+X0tZa0lz1vlFyc=
X-Gm-Gg: ASbGncuuhJ7hUt0ZKC4AfXSytZO8l+GO+4JTgB0kljKzDr7b4zi9NxIaY5QW8Vhi9s1
 2U5De/c1NK3eQaNT58A3myuXTUEIpAFt12O2XVYyG6IS8RSPAoGkljXrdlCl4q7fG7b5i6sawqK
 VEO+4swqbLVNoHVzuDoRR7vOqXID+ADzBAGA+3FTeMk/bVWUyp1arnwDnwW2uIt9sqaPOzL7KHG
 w+fDHJEWibgXCycztAr4EBJC/FESsTA8G0twpCER10sIzAe2GPN/Zw=
X-Google-Smtp-Source: AGHT+IFPSUncdulZfb9Z4PSXS4rfpeYKO+kazxM5vbYvuaPDBrEqxQq5ZzL3ZI95Eif6zaAuQbAVKg==
X-Received: by 2002:a17:906:3190:b0:aa6:a844:8791 with SMTP id
 a640c23a62f3a-aabf48b9baamr272133566b.45.1734538872992; 
 Wed, 18 Dec 2024 08:21:12 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96359dc5sm574984266b.128.2024.12.18.08.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F28925FD18;
 Wed, 18 Dec 2024 16:21:04 +0000 (GMT)
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2 09/27] tests/functional: update the ppc64 tuxrun tests
Date: Wed, 18 Dec 2024 16:20:45 +0000
Message-Id: <20241218162104.3493551-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-30-alex.bennee@linaro.org>
---
 tests/functional/test_ppc64_tuxrun.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/functional/test_ppc64_tuxrun.py b/tests/functional/test_ppc64_tuxrun.py
index 03b47e07f2..aee67f5e90 100755
--- a/tests/functional/test_ppc64_tuxrun.py
+++ b/tests/functional/test_ppc64_tuxrun.py
@@ -82,11 +82,11 @@ def ppc64_common_tuxrun(self, kernel_asset, rootfs_asset, prefix):
                                drive="scsi-hd")
 
     ASSET_PPC64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64/vmlinux',
-        'f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64/vmlinux',
+        '8219d5cb26e7654ad7826fe8aee6290f7c01eef44f2cd6d26c15fe8f99e1c17c')
     ASSET_PPC64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64/rootfs.ext4.zst',
-        '1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64/rootfs.ext4.zst',
+        'b68e12314303c5dd0fef37ae98021299a206085ae591893e73557af99a02d373')
 
     def test_ppc64(self):
         self.ppc64_common_tuxrun(kernel_asset=self.ASSET_PPC64_KERNEL,
@@ -94,11 +94,11 @@ def test_ppc64(self):
                                  prefix='tuxrun_ppc64_')
 
     ASSET_PPC64LE_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64le/vmlinux',
-        '979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64le/vmlinux',
+        '21aea1fbc18bf6fa7d8ca4ea48d4940b2c8363c077acd564eb47d769b7495279')
     ASSET_PPC64LE_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc64le/rootfs.ext4.zst',
-        'b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc64le/rootfs.ext4.zst',
+        '67d36a3f9597b738e8b7359bdf04500f4d9bb82fc35eaa65aa439d888b2392f4')
 
     def test_ppc64le(self):
         self.ppc64_common_tuxrun(kernel_asset=self.ASSET_PPC64LE_KERNEL,
-- 
2.39.5


