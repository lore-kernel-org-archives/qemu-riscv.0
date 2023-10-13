Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AAFCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:05:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrIkL-0007U1-4C; Fri, 13 Oct 2023 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjc-0006Se-Uv
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:01:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjY-0002Al-VY
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:01:48 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9b96c3b4be4so325782066b.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205702; x=1697810502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+CI7CNyKCf2sfXCVGyXf+Xiyom2vjAqTqQsK0XbX6w=;
 b=LJ9E2vsewDJHLSe9ksPsq9PVCwtPCaja9MLokt31CRJZa41OSe8M6bAPpmRdJU9ow+
 kPl8rbASSiN6DfJhVSPHWRQ0ynADZGYAKSLnqc4baFdh+LhZbElBc5CWYI21bgT8phRR
 I2Cg9qnMQox3iW+VvkoU/jUOYVMgWTXdibtQc3i510//qJzsgHBFNBcqvA05wWcvJz4b
 Z7v1KFnVtlaX+XZg8OUQ7YIoASi6GDNGUKrCm0QF9vDoz+SkffsokZGdXyPRSh00sMBL
 y5ln73LyTDsJUaXPqA5hxIVTcKpv2voYP8WBtoZwUTyKH/x15rvzi98S+mE9sDWYJAoh
 7jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205702; x=1697810502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+CI7CNyKCf2sfXCVGyXf+Xiyom2vjAqTqQsK0XbX6w=;
 b=C+hxFcvtxelG0IS8iY2c5jCSEWLLVjbJEAG9ny6PngF4OdfuF+jBlrvjnanlHvtF9X
 CJ/hea0SeBp7HbmFp6Ai1QlQag2mNKvwXWcShqAR9P4MCUPAaogCuWECsqtxfO80oNBx
 kvVa/hsQ+OfR9M7//GgjgknQJgEoxVZShuOBAIzPixbq11dSaTi+jTdevPIH1oBFbXl0
 0cAu5awwE3fxBOZaMseuEPeN7HkFEc8aPMF/vGOpPyamZphSKyqlsVZxRr6GxDCz4yAz
 /sIcJqQDJrPB46BaZoJCvEAUQf6vRhJMa3GEDoP66LBcuWy6aePRWKpt2DDcKoaJcQKj
 cZgw==
X-Gm-Message-State: AOJu0Yxpss6Hy+SJk7gxnCqWWpEeYcfzRyACJ38st62JgltNr+h9knRk
 ui21Pad70g52EM+t/128kMziKQ==
X-Google-Smtp-Source: AGHT+IFxAJ2mZhFZyRNHIIYV2j60M9eF4SgMSFq1kU+dBZfVJt5JZQLyVzwmHauEjFhgCHn6gS3z7Q==
X-Received: by 2002:a17:907:2d25:b0:9bd:d405:4e7e with SMTP id
 gs37-20020a1709072d2500b009bdd4054e7emr1060527ejc.6.1697205701761; 
 Fri, 13 Oct 2023 07:01:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1709066bd800b009b29668fce7sm12367817ejs.113.2023.10.13.07.01.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:01:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 02/16] target: Mention 'cpu-qom.h' is target agnostic
Date: Fri, 13 Oct 2023 16:01:01 +0200
Message-ID: <20231013140116.255-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

"target/foo/cpu-qom.h" is supposed to be target agnostic
(include-able by any target). Add such mention in the
header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-qom.h        | 2 +-
 target/hppa/cpu-qom.h       | 2 +-
 target/microblaze/cpu-qom.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 153865d1bb..dfb9d5b827 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM CPU
+ * QEMU ARM CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index 67f12422c4..4b1d48f7ca 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU HPPA CPU
+ * QEMU HPPA CPU QOM header (target agnostic)
  *
  * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
  *
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 2a734e644d..78f549b57d 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU MicroBlaze CPU
+ * QEMU MicroBlaze CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
-- 
2.41.0


