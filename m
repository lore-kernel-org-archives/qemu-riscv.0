Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0872BC02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 12:38:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiC0R-0004G0-QA; Wed, 12 Feb 2025 07:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC07-0003k6-Dk
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:38:01 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC03-0000fY-JD
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:58 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38dcb97e8a3so4465091f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 04:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363865; x=1739968665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reXXm8X+zlZP2Y6yVzIRnVkTJgqUEMG013HELmRkQIw=;
 b=xk6/5GDM4lginpeM5piaDxAyRepcRwowY6vEhprL7rMCybL3l67LLtVWfMDERPpUAF
 vFxngLZyE50IcQF1kplfVs802dYs2Ph9cwqFaDciDdF06La+SU1iaGj32wxQXw+OigFI
 2nJdX6CandphjrsYNiGCn3RzGvZtdTIUKLmRLKqWXf4SrXUespjRwRHphqpy24Rzqazz
 jIy1J8luKqSzsZ9ONkk847de8YzI+oSH6I2oGNubPcMjeNPCXoR5a7mzia7xYj+Uvffj
 Ky7sIrybCSF1fdhfxjHqERckxgAQOl0M+25iusXZu04kGaabOtrNVVMwVyQ7Fk0G6fQy
 hYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363865; x=1739968665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reXXm8X+zlZP2Y6yVzIRnVkTJgqUEMG013HELmRkQIw=;
 b=pcQ5Y4+n9mgf/IOcUHCA4H3ewlFH4qj2z/6SgFm1W96GAD2IiGSGG/m9Jd7Kd5DBRw
 jZxuYY7f6cWYONTF8YaCFQPU6F3mDOkCGSJhq9qKFFUyg2JtFZp7RCK7HTC5aOkEBauv
 TM19OfrJAlh38QItX31il2od8TXitl/UlzUZ+j25ovzOaAj+pURPhK1qujr1iO2aqjRC
 /gFgn63JtgfshUtafiHOTmHn8RUBEya/uUoXt1w7c/YHo/XU1KI3i0PZ8Xpl09wxZ1eG
 kqxtdoEg730tZ7o6TBptGqsaKkho++qSW4PE7ADROBEUmJgz4SfH5bun9fIuGZzRKimO
 JzYA==
X-Gm-Message-State: AOJu0YxVyvqtu+Lhu5KrqikFd9PYQpyvNgXAPgWUgBJh4Tkm8jQMEH5p
 Wxdk6jHTB8IbE7mDZ1mwUIEwJEAdObVH2ZFXNmR5zv5JjlT+Z6wQT4uBVd9UGwQ=
X-Gm-Gg: ASbGncvZFvpsyd+Mbx28wBW2+FaFGC/wgkb76TfOwfm4ovzAvUryo8WgzcpNfaTE6eD
 xnXnIfQftna9zXE5G5NTUbguSf45ybXe0iuV+Gt/nzDZ+LQ3iHPx6cvWoK2Jmb55Z0tcsldVIxx
 lPCEPXkKCuKA7QAzyWprCFabGIcANsOIVZadWm0Fpgr0LJ55l4IEda/pNpdCPB7bmJc+hvXyOcx
 O7+tQ1Acyy/g5E0S6MDT4LfYsNpkT/4yGuIqxcPzCo4djGxIYYwSt8+rLo83Zr1XfvBXVIwQaJr
 mCLf/EvrE8tkm0Fbr9Q6Lo3h6R2axTuNvBVV0yNF26hggRisWjngC0rOyDdCAtHEyA==
X-Google-Smtp-Source: AGHT+IGNj/HITUteCoHN8aCVTZehi9vpVUxD35L0fv/5K+vQo5EjfE5cTRM1tndY+7urZ2wdnX82Ow==
X-Received: by 2002:a05:6000:d0a:b0:38d:d18d:262f with SMTP id
 ffacd0b85a97d-38dea2880a1mr2229435f8f.26.1739363865520; 
 Wed, 12 Feb 2025 04:37:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06d22csm18950785e9.22.2025.02.12.04.37.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 09/10] tests/functional: Remove sleep() kludges from
 microblaze tests
Date: Wed, 12 Feb 2025 13:36:58 +0100
Message-ID: <20250212123659.52764-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Commit f0ec14c78c4 ("tests/avocado: Fix console data loss") fixed
QEMUMachine's problem with console, we don't need to use the sleep()
kludges.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250206131052.30207-15-philmd@linaro.org>
---
 tests/functional/test_microblazeel_s3adsp1800.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 715ef3f79ac..60aab4a45e8 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -7,8 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-import time
-from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import wait_for_console_pattern
 
@@ -31,9 +30,8 @@ def do_xmaton_le_test(self, machine):
         self.vm.add_args('-nic', f'user,tftp={tftproot}')
         self.vm.launch()
         wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
+        wait_for_console_pattern(self, 'buildroot login:')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
         exec_command_and_wait_for_pattern(self,
                 'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
                 '821cd3cab8efd16ad6ee5acc3642a8ea')
-- 
2.47.1


