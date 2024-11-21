Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EDED7879B
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAVd-0004cF-VH; Thu, 21 Nov 2024 11:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVZ-0004Wv-PH
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:22 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVQ-0007zT-Gv
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:21 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38232cebb0cso828494f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208291; x=1732813091; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPIFW+MIDvbZvhF0n5YdU4sfYa070860/v3aIWKALYk=;
 b=SLKr4RkFcLb2obpzzxC7+3N7f1KG4Y5OwUynXwd4cCsHXAqhEUc6AirO3tHicsTn7J
 FNmNc3OOHxyFer8PNL3kNPTNlYG4D+SnSq9UDjn3Q9Oxx0v+JE9FzDGEPlhvdmbRhcRu
 V3Zm7+4vFnZ+TxJdU/Z6HjahlOVAZYMjiKTt7NQsxkIHyLGb6rrIgAtjaWhqFqSxg/m8
 rq/5G8GjfzADoRZ+RLiSCMxIg9Z+mFqbVWslVSPrkzSd9o/x1D5RZQvTkNJkm6XzkoEz
 ZQNLoeIJI1rd9oS107yRTM48CJhbSIgbNzbpOcbSfDlQaqCZ/9bEqJHrKR6Sgb/Q3GQT
 c/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208291; x=1732813091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPIFW+MIDvbZvhF0n5YdU4sfYa070860/v3aIWKALYk=;
 b=ti+Akjqq06K2eRfwD+RhwdjW0d7O2TBinM4KupOdMKpH+vKSqaPM3Q4sG0feqM7Pfg
 2LYmoufeVH75VET57Sn+WSqN6I1wkdSv4BRe4E0kWGGknpHKDBanFZXrTEM628jux3mk
 EDYRyYps2ftoGkJwbW9bkrsO+WVWvi1dtpY7TXlyOUPePWU/3ClcK4WZxdYyN6mFFVLI
 yQoVdqDWNR96DQQAopzUgoxV/i4U8XpiOz0a9VNA+yBOlKCSU5LLcjkDrEZ0tHkyoW4P
 opcs6y74ay1AmQNMiyBo/QBSfzOn0Y7f+XxduR+ynEL1VaOg8S7sKIULXhP/UXIkd/lI
 uhdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIUrev0TxbtDnl01LdIo2MW0TcmJHjIdBvCLR2V9x1Deg9YqGIxXV7X1T7+Pwau+VTnhCrCbO7GYJO@nongnu.org
X-Gm-Message-State: AOJu0YyPLn4oL58s/uHYnGtPevHUheuyejd0XYAixa11o7k3T9wlXPNP
 03e3N8digW4H0RvCuMXO1GscPdAfE/jyaz4gp7j3SCFOf+gek015+vh86qu8sZo=
X-Gm-Gg: ASbGncsA4kQowNLwOmeigY0UIIl+l/MEiNGzQfcsYaQQ2aknuVyMrZvtN9Y/NMyzBPg
 837oNA8Sk1DCOoRa1fV7iTAYMqyDnAi9RCqZhYUbmi3lv60mpmyd1kN+jb7PyB8lWtMbvzqpzRG
 k97G1otaQ7d8APxMcel6Vz0p+uhqbjgSHCktVcmLTTejGNAU2Hbe4Ly8QWVfx2rQGgtCiYtqNsE
 Q3MHzfAqd4rAZz/Dhsu/mt9a2V21Njfdi904NpcNOnkUV3s
X-Google-Smtp-Source: AGHT+IERjNcVY63Esz+m5ARC9qYMkrCrcDvhBkmECN98q+XaP8RU1AK9ROyMkEw7IhAPD3KpHAn5ZQ==
X-Received: by 2002:a05:6000:154e:b0:382:542d:39ab with SMTP id
 ffacd0b85a97d-38254adf714mr6452872f8f.3.1732208290915; 
 Thu, 21 Nov 2024 08:58:10 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc38afsm17867f8f.67.2024.11.21.08.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C8B1F5FA88;
 Thu, 21 Nov 2024 16:58:06 +0000 (GMT)
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
Subject: [PATCH 04/39] tests/functional: remove todo wrt avocado.utils.wait_for
Date: Thu, 21 Nov 2024 16:57:31 +0000
Message-Id: <20241121165806.476008-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

We're not using avocado anymore, so while the TODO item is still
relevant, suggesting use of avocado.utils is not.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-5-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_m68k_nextcube.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/functional/test_m68k_nextcube.py b/tests/functional/test_m68k_nextcube.py
index 89385a134a..0124622c40 100755
--- a/tests/functional/test_m68k_nextcube.py
+++ b/tests/functional/test_m68k_nextcube.py
@@ -37,8 +37,7 @@ def check_bootrom_framebuffer(self, screenshot_path):
         self.vm.launch()
 
         self.log.info('VM launched, waiting for display')
-        # TODO: Use avocado.utils.wait.wait_for to catch the
-        #       'displaysurface_create 1120x832' trace-event.
+        # TODO: wait for the 'displaysurface_create 1120x832' trace-event.
         time.sleep(2)
 
         self.vm.cmd('human-monitor-command',
-- 
2.39.5


