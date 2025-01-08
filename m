Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0789E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:16:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUyf-0004vl-Vd; Wed, 08 Jan 2025 07:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuS-0000oH-Pg
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:44 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuO-0007KT-ID
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:40 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so4755821a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338270; x=1736943070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCHUqeDgGCfAqVqQm1SyLdYpd9wMBKGUDQg7+tLuW+U=;
 b=H5S37wvYNgHEGOfBDf/0bH0mGnhdB8yzAFXyWrF+Y/JGwsN6DiUqA4MbWyChdLBV5p
 v53DckW36L/a7DgfHbesOZcPKp1NOeALg6GdV5Y9FronBgHWjbQLL+D8sWdc3zLa+JB0
 3SG6b4TIT6Vnl3iZhkErN1kG8TkTqsVsHDRi4uRBsUU/+dwybRl7WIwmLRdkVz2qPKR5
 U58v2TFoBw/lUcZx9l1ltILZN/7d+WORzwowifg85XzlLL2V0m79PnHmDAzRfSZ5Sfwp
 2JgHjVc0USVf/YVBOjynrzxPDrNTvKbeWxMjyr3RtB/61bahOA9MUmEUzNA2pN4S95fY
 5Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338270; x=1736943070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCHUqeDgGCfAqVqQm1SyLdYpd9wMBKGUDQg7+tLuW+U=;
 b=Z/6nnDblMMa9GfV8K83jlr1KHnJGQreB/dPf96eZ3pNucUor/3NVost5A6K9581HHQ
 FerQjsJOMXHvPpN6knsYRvXq5/+2JDDktsj4PHXD1TfL8iVjVPXT12BWsdiJYE3F3mPt
 erCSAm28RvhmtuWbJvz5yOye/MiiH4HWekfM5rU/6mCbBRb/mmyCXvPvOAFYrlwTpWfB
 P/3sXGTrGiPkfniYU9Pveu9v6ZkycotFO0rOxgZZYkvBtfzOoK2DCHk74g80u3QSXNg2
 j5LbEDwVN06mQv7erJxgrARlC/L3LLx75JPG1p43OWgkjt7nPfSBA2ZhVHXhAk8oGJLA
 27xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1l85xIdo+FgW2yagRBZJDqviYFKQjgRpQkRP/H+1vXk/f2WvCiUif7jTIMXc6lFdrFmBY5B0TCDlm@nongnu.org
X-Gm-Message-State: AOJu0YxamOa8kytJHSmj8jBFNXx91CzVA55Emftgyx9UnVbbXFxUgTbm
 Kv71N+bNJq+TDzW8O8jGllL8T10KTeL7c032Ffnr7fdQFyn/2+3c4rK9bw0bshk=
X-Gm-Gg: ASbGncsi/ImekrFaqsUqMMkb5D/ik0utU7didlP4kWU9AbhMVjCj2sYe7f2rL2NOBaG
 nSvxHEhHe8tXx4g2AWROLFAlV7kOeU/jWNM3KGhicXWBBXrJwyV4oOHVeezNvITYfUELZxXa2GZ
 DUk9U3gWeslhyEpmyGb7KPQXGYa1UKpnKh8j7WXdDoQBuUKByihPFPjWewjiqNWWx2gwhBnbBxE
 y0Pcr+EwCXxPheKs+p0SVlHNCSZOGKhQG65WtpfhsW68+t3Jd6TtY4=
X-Google-Smtp-Source: AGHT+IEmVTl4F0gts8aW70HdOnN+WrT9ngMQQiCqqerIyTgqflvn+JTN9JLVz0I+jMgdbYsAxCS/Hw==
X-Received: by 2002:a17:907:7e86:b0:aa6:92de:ddae with SMTP id
 a640c23a62f3a-ab2ab6a3fbemr206355366b.16.1736338269668; 
 Wed, 08 Jan 2025 04:11:09 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830b3bsm2510076266b.25.2025.01.08.04.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:11:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F9605FC51;
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
Subject: [PATCH v4 21/32] tests/functional: remove unused kernel_command_line
Date: Wed,  8 Jan 2025 12:10:43 +0000
Message-Id: <20250108121054.1126164-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

The Alpine test boots from the CDROM so we don't --append a command
line. Drop the unused code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 2d9995a95d..b3d3b0ee51 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -41,8 +41,6 @@ def test_alpine_virt_tcg_gic_max(self):
 
         self.set_machine('virt')
         self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0')
         self.require_accelerator("tcg")
 
         self.vm.add_args("-accel", "tcg")
-- 
2.39.5


