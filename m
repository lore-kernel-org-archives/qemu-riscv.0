Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE3BEE01EE
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:18:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so9AQ-0000qK-NB; Tue, 10 Sep 2024 18:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so99r-0006ma-FX
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:16:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so99n-0006Tz-IZ
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:16:23 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7179802b8fcso4380399b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 15:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726006578; x=1726611378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtg/fsM266byh2SMTyHSqLuDJEbiLWNPpLD5jMD37ko=;
 b=vU7HUxHRd07I/fSccd80dgOMFcFUKJ19JMOlQ2Jo/ioNpUR9UF1ADDHHshr35NANir
 mG6C/Nb1Q1UW/RzsG+7Z+usBFxYtBMbAC8KeouomsQ+iF6FhyRkC677zvsoOfPLFLFU4
 NXJt+r8CNXR5lesVMreKRrXl+u0ZrLFLo2nYotIlBFoksqXkidLocsFpRGhA97dBmp4O
 xgLPjV7uO59ZrYh9UKEga9CcDYpNt2Zyl4dHjBXvSV+TuNoVOz3uyVtRtRLpw3dwBxtz
 hKEXRisAlyT6OEbhw33zVk8i+3VVZVAWg0jcfQQYRWeVQxslcv6TBe2RRdAw1b635zDO
 NWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006578; x=1726611378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtg/fsM266byh2SMTyHSqLuDJEbiLWNPpLD5jMD37ko=;
 b=lzct/EP33n90OCGaCdEZ2GuyIOYo80L7hq3ZLmgSMlXY4XSAZ2IpPT0mHOTP2vK/hj
 hGgvs+IdtT0JTfBu4p7ZSB7XCiwvDi9AB0RGt8QR/QfXgLInzfxY+VjLzdfTnByh5Wn6
 2xfJQIHKr8Hd4PjaLDXykIrOwcCZQaZwj5noD6ON5WCqBgtM41Vv+U3A3bg1sIGKfuxN
 scC3SQp8lb2hB2meb30ITAMBRBRu/B4wmWVNe6haSPZYAGcuwmaYTNIBVeORZMVGAJTT
 /K1z+YVVnDhvnLu2TJwJLtlKL/jZ5uNDsiV+4QM2pwT9ywVRAVLoN3W0WbG8S6VevWMP
 hcUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQOa96HUUMP22j32apMtf8bk/ijk60L/+faJkhE7BuM347mJybGqF6QX5sw4oGkI8uiF9m0VmnTIjr@nongnu.org
X-Gm-Message-State: AOJu0Yw1c00m1B8pJMM0DN6/5J4uoMfox7LJoEOSfG9lnCrDsRIVXUha
 7Gg8YzAv6iFIqFJHY2c/S8ntKAodgvfn5WiVj8Jmst1JrilfN6Tz+IoJfTAlKU4=
X-Google-Smtp-Source: AGHT+IHWOSynm87dcJ/e3spTuAWJklvasOkQ7Uz80yLy824x7t0cXJiqR3CMOljYmSMNtVZtD8XWTA==
X-Received: by 2002:a05:6a21:b8b:b0:1cf:51a1:8e89 with SMTP id
 adf61e73a8af0-1cf5e1c5ef2mr2725772637.47.1726006578083; 
 Tue, 10 Sep 2024 15:16:18 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 15:16:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 03/39] hw/arm: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:30 -0700
Message-Id: <20240910221606.1817478-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c71b1a8db32..72c4cbff39d 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -199,7 +199,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.39.2


