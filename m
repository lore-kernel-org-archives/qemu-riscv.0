Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BFAE77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:19:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUzh-0007JM-Ig; Wed, 08 Jan 2025 07:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuY-0000rC-Jj
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:49 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuQ-0007Jz-PA
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:46 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so1235347166b.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338269; x=1736943069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HuCXulvJRMZygWdnINtFY7SjYOcclpP9r7Wb7ozg1Gw=;
 b=fSUrpDVl4EeL/Dz9Xf36jSCUPz3NuyOW3lQRM7rNwfaRW8PtgPYbSizCxsYTvzlBSS
 UucgNQ1WIvERwVVvFD3fpD0fCXdgJmCccGcyJiXbc61aeAvcBmKn9asOWOYXHGaErkqt
 pk9boR9oqJYfXrmTqt2DlRKawxOLF+2sA0b6+nG6iXhE4NPm/pNazekVsgm6ILGoKlPF
 HCq4j92+UhCNZsOo2GwEHtziSVguVp9buZqP7xw1deGGc9uoPAhEPXU97OgZNf7/kEPK
 qUSWu6x/xEGWrY71Y4nAdAQHTtN+PmqswOSYAtnjHmGOkf2xlP7oy689K90cIStKsjPh
 Pckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338269; x=1736943069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HuCXulvJRMZygWdnINtFY7SjYOcclpP9r7Wb7ozg1Gw=;
 b=u9l6K22CjsprMKC4pu1USM5uEVG+tsXmV8tAwCP8rA0DA1jSM1DDxwLQ1dHeUEcAGi
 FamZmrKS1UrL4S0Dk7OoQ/dONBiBWCpHPaClugsSF0T1K0nH7cAxU8Clk+oZrZz0nI92
 XH9JXFm8+2MrmksTI99+N/9Kat812rnchqnj7SUBW9q1Eka9kAEL1b34k+lj7cvOE4am
 fodsQj6SQAOoXeqDD5w5Xoesx/2rwouXQbSzsvcy+mKqMkP7G9r8eutiNNt0HE7cwi6R
 opi2v74Wn778GHswNMxi55fJN5dK9XIHORlqvW3fyEPmcs9tmtK/cr8SGKaIhwNm5xun
 QC1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTPf3QKdoYF8yy65bq4TewAuBssUlDIgad0QmdppuVhVb6z/bys9iSuZChiEQ3oKPEPOqdrueoCv9C@nongnu.org
X-Gm-Message-State: AOJu0YwEOHKeQPi4qv9QKTGFL0Qb51IYcKCQMeBaUyr0C3pwxzp+LiVH
 LaHsstmFuvfem2tOx5QUSSTIeigm4KBWLtLZOJaF9FInFQvSh0BHMWndSNDXt9E=
X-Gm-Gg: ASbGncs6TojmjFjY/IH12qNYGugfYRWBa1BmWHYatZxUezD3c/0HflAoZKgQrdRsDJH
 7+xJYn0XO2Mmo/QHCO+N90+p58cq0KpjLTmKFp/KtTWNg5Mc4bA+eJRtbiG1rbDZh4UpX3x8i0T
 KZwh1Rjs0i34FwtDR3iGO/gOJr1mwxgbrzUG43PRgoYziJJg77DE5WNeoBaVFlQDD3wSMzYcxPO
 zpv66KgLsLAL55g5orkVtOrbC015lIMnxaEpUHwQ6NUvjW9vjLAHdw=
X-Google-Smtp-Source: AGHT+IHeGtEecnCdnr500hTk9KU+LP3vqiHrpEOKgft8A2cr91ZWcCsO3n02MTGHAGMNdk7ttarXDg==
X-Received: by 2002:a17:907:7f8e:b0:aaf:f1a:d2ad with SMTP id
 a640c23a62f3a-ab2abc9f07dmr154794866b.50.1736338269092; 
 Wed, 08 Jan 2025 04:11:09 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f0128b8sm2492701966b.145.2025.01.08.04.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:11:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B867A5FC58;
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
Subject: [PATCH v4 22/32] tests/functional: bail aarch64_virt tests early if
 missing TCG
Date: Wed,  8 Jan 2025 12:10:44 +0000
Message-Id: <20250108121054.1126164-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
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

The set_machine and require_accelerator steps can bail early so move
those to the front of the test functions. While we are at it also
clean up some long lines when adding the vm arguments.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index b3d3b0ee51..201c5ed023 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -40,9 +40,9 @@ def test_alpine_virt_tcg_gic_max(self):
         iso_path = self.ASSET_ALPINE_ISO.fetch()
 
         self.set_machine('virt')
-        self.vm.set_console()
         self.require_accelerator("tcg")
 
+        self.vm.set_console()
         self.vm.add_args("-accel", "tcg")
         self.vm.add_args("-cpu", "max,pauth-impdef=on")
         self.vm.add_args("-machine",
@@ -71,15 +71,16 @@ def common_aarch64_virt(self, machine):
         Common code to launch basic virt machine with kernel+initrd
         and a scratch disk.
         """
+        self.set_machine('virt')
+        self.require_accelerator("tcg")
+
         logger = logging.getLogger('aarch64_virt')
 
         kernel_path = self.ASSET_KERNEL.fetch()
 
-        self.set_machine('virt')
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
-        self.require_accelerator("tcg")
         self.vm.add_args('-cpu', 'max,pauth-impdef=on',
                          '-machine', machine,
                          '-accel', 'tcg',
@@ -100,7 +101,9 @@ def common_aarch64_virt(self, machine):
 
         # Add the device
         self.vm.add_args('-blockdev',
-                         f"driver=qcow2,file.driver=file,file.filename={image_path},node-name=scratch")
+                         "driver=qcow2,"
+                         "file.driver=file,"
+                         f"file.filename={image_path},node-name=scratch")
         self.vm.add_args('-device',
                          'virtio-blk-device,drive=scratch')
 
-- 
2.39.5


