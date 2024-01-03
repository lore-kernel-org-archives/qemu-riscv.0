Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62740C47077
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:35:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL589-0003cs-Tv; Wed, 03 Jan 2024 12:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL580-0003VG-HE
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:06 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57q-0002Oc-G8
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:02 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d76fefd6bso43398985e9.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303233; x=1704908033; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzxoAeOdiga+52AiTCmsWe8ywFNoeoZ5ZVuxsnjrTLU=;
 b=ZLps0+nU4+JNR/NQZZd/MN36RMkw1RydMXgzftF+ZsmXcXuYRV2G1vmqHuR+flMRUz
 YZxuq4neTtF+FCgSh3AtmknIrUyrmVH36lZmzTi8A9L3dMVe6ukiEZx9G9Xff1wVqenf
 67VBAAQ2TuLv5u81Wih0cRgqvvex8hWVEfsFfE62TkndggnanGtevLTecgfxwImSBkOm
 IJLJG7ekrS52ekogCYbc7bkLEVTACYhxYe0Ac0v5j7XNdFgXvUmhFRldn4+LnTuInl7z
 0Y1BHtsx9DIUGN3nJbbxdnIVZLWEObWwDsGIEZh/gQXqH3TZ6XsAQPjQvXZ9pzfTUPVc
 FCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303233; x=1704908033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzxoAeOdiga+52AiTCmsWe8ywFNoeoZ5ZVuxsnjrTLU=;
 b=qakGqJhpLxP6pNIa1Y+TdAmLuje5wMe3HPmPQ2t9DLAlFH6Ol9JEbz3/mHbnfWYRtZ
 zTBwQD1cOWy6lhItNk2wuxVdcLvtVMbLg1yzD1nm6qL+g6EAeQ2XSuFNX7za/d9Qh8Su
 QS5chxY/RSRfWMdTeawYBzzyKyfoIYXseItD//A7rYiNiyqnVsdV+W6Al4Nk34jhQJGB
 gMhaCKIgD98I+nmR8H/4P24UHt/ufhTh1g7lk8oPyetMuUVsl5Rs99BTTXei+NYja8PD
 xDczQBU9uafbbh054l/oXizB5Y/ja4EvEagcKXmUs7F1m0RP6iOINmwYuKDl+grM57sM
 Lr9Q==
X-Gm-Message-State: AOJu0YxwA/HrBieEOyMTGPyKgUmwmhcZq23pK4+nZ5vm7lhnXKs7ZJAS
 445kLZ9MBo/MaUZxk0j5k/sFO+JGNiP1CQ==
X-Google-Smtp-Source: AGHT+IGhE7/q82Jf4z4D1OPjoyeetuf4+aSfmg/R61bfYTK6tVdLZR8E2VO87yUiQHcrTBnDAn/iZg==
X-Received: by 2002:a05:600c:a0b:b0:40d:7da9:8662 with SMTP id
 z11-20020a05600c0a0b00b0040d7da98662mr2292525wmp.338.1704303233122; 
 Wed, 03 Jan 2024 09:33:53 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfe10c000000b00336f43fa654sm18186652wrz.22.2024.01.03.09.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7EB765F92F;
 Wed,  3 Jan 2024 17:33:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 02/43] tests/avocado: use snapshot=on in kvm_xen_guest
Date: Wed,  3 Jan 2024 17:33:08 +0000
Message-Id: <20240103173349.398526-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

This ensures the rootfs is never permanently changed as we don't need
persistence between tests anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/kvm_xen_guest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
index 5391283113e..f8cb458d5db 100644
--- a/tests/avocado/kvm_xen_guest.py
+++ b/tests/avocado/kvm_xen_guest.py
@@ -59,7 +59,7 @@ def common_vm_setup(self):
     def run_and_check(self):
         self.vm.add_args('-kernel', self.kernel_path,
                          '-append', self.kernel_params,
-                         '-drive',  f"file={self.rootfs},if=none,format=raw,id=drv0",
+                         '-drive',  f"file={self.rootfs},if=none,snapshot=on,format=raw,id=drv0",
                          '-device', 'xen-disk,drive=drv0,vdev=xvda',
                          '-device', 'virtio-net-pci,netdev=unet',
                          '-netdev', 'user,id=unet,hostfwd=:127.0.0.1:0-:22')
-- 
2.39.2


