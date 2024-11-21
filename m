Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47540D78799
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:03:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWJ-0005L6-90; Thu, 21 Nov 2024 11:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVk-0004jr-34
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVU-00082c-CG
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3823f1ed492so1273302f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208294; x=1732813094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHupEt0CMdn1N9WNkjjRD7wPBLmfP5+19fW5G6FBBAc=;
 b=drebOzxZX3rONQbSLx90vr2hsHISTBOz7gP4szoS/Ru020Y+XhIpj/2g7o6Zle1szM
 trXZeo+ZzSC+GFlgO2skbkjrRc19dz4eEMV4UPKdsbo3SaBL8uPNg2fSbb1lDgKYWaUH
 Gb1irWkJepsVBn2pkVUq6ajpe1nAoeYew37rRMSiQcYnO87pYnR9fQYnjZn6GcKB4pnw
 zKNf5NsJj/osubHvWgyodhlY6Dt7sEmaj6Q1hw2RC1ez+hnqsCk5IPIXQ8/WB0S8yqk+
 9i9VfuC5utpOk5+272oj/Lytqqiv2GCHeCAfWYz+kno+x1KMCfcGRb1QNqpupThNT+Fc
 M+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208294; x=1732813094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHupEt0CMdn1N9WNkjjRD7wPBLmfP5+19fW5G6FBBAc=;
 b=ZYnFrr4u5J6mQLUmmph1Zr1Mp0tznmdZjS+4T1jOv/h4GhDkAZaagLU8O4FgkdQq29
 ANfqRbV0CnFHgx/KcUBMeojXAR43DcNX761h1MSdshKZHtPORdbqALi++UNC2ZJUMn20
 3GoFfpkhe6UKtUyaiGOeg+OJqxvT1g6LEcTkrp9UKMsWOPA2J2Shb2nmTV0O3TXBoA9e
 1QkR+QXepKsaXsButDI2Z44dEAmiOdbw1Q4alkBP48FEegTbjZxkDpnB3hIbCEMG1HzX
 5YT4wMspm9KVDK55vgiIJHwUBI7ubd4yCSUKx/V+SBPeYKNHwWCiZT5JnKWq3UyMxqZt
 cWzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPCN6cAfYWWFh82myfihGBYVb8wZqixEaV4UbVwdjFnvqUXRR+VJz74pif5ZM3iphmlj17tJ2kbD8r@nongnu.org
X-Gm-Message-State: AOJu0YzPt1b5UduadnOiGmvfYd7KfqIar5y6oLSsuh+GIRzFqeYhGg07
 ABfz+cRSNBZaC+xgBvFzzRdHKLlOHIYXpWndK56RaAtLFR53L2jjpjd87MBlfh8=
X-Gm-Gg: ASbGnct21X7xV6n7j/dgH6wAy+MoMoDL83dnjDTDtXt7gnSjRGfvuYNOlARqYGypwV4
 bnsom4eWQpt4qBSndn3CFAkSHS1DDABd5CUGoCgGysd6NpSVd0Xt2dpsU4QRtt62/JUFzLGjN8P
 NwLZGGFLFg0h8tMs7ZTPkPl+sej35FuSE6LdIqUK8+8wExVB2z+c9ATxKX6D5gQTNPTTPj3YRFd
 64PLJnNhuuCOWVEw1vZNu1TwSPBgBoDquLY1IidM1BJfDtm
X-Google-Smtp-Source: AGHT+IFqv0OwBEVksVVw6Yj8Rp4NvrjsWc0gWEq/D/KDK6XKYqeV7+nrs5NARmd2VuEU1As/xn87zQ==
X-Received: by 2002:a5d:59a3:0:b0:37d:43a8:dee0 with SMTP id
 ffacd0b85a97d-38259d1b10cmr3258327f8f.17.1732208294543; 
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb30bfdsm30067f8f.56.2024.11.21.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4C84E5FC95;
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
Subject: [PATCH 09/39] tests/functional: put QEMUMachine logs in testcase log
 directory
Date: Thu, 21 Nov 2024 16:57:36 +0000
Message-Id: <20241121165806.476008-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

We are not passing the 'log_dir' parameter to QEMUMachine, so the
QEMU stdout/err logs are being placed in a temp directory and thus
deleted after execution. This makes them inaccessible as gitlab
CI artifacts.

Pass the testcase log directory path into QEMUMachine to make the
logs persistent.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-10-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index b9418e2ac0..ca13af244b 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -163,10 +163,11 @@ def require_device(self, devicename):
             self.skipTest('no support for device ' + devicename)
 
     def _new_vm(self, name, *args):
-        vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir)
+        vm = QEMUMachine(self.qemu_bin,
+                         base_temp_dir=self.workdir,
+                         log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
         self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
-        self.log.debug('QEMUMachine "%s" log_dir: %s', name, vm.log_dir)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.39.5


