Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F6ECA1012
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 08:15:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu54O-000617-5I; Thu, 04 Sep 2025 04:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54L-0005y1-Pl
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:11:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54B-0003wq-JT
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:11:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-620724883e6so159818a12.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973493; x=1757578293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfipyU6Vd8H7OBNmQiaCitsZISqNnzAeEnNiRJw+yKE=;
 b=j+t4M6t4+KAzEqB4WncLVFK+vDTk8jry+wESXKfSJo3iaEEZodCOFGFvrmVIxjgnjG
 DreE72xXFyNLECwnamxe4RHC0mBASb4VRx5EmnNXqJEGgGBeWVa/ydcJF86fSd6ktQqR
 VrAWBWtBUS999mW1m07sFq1tuEcXV/MkGANYhI7SOCrgnyBGvNZIBK9+NrozYjQJ0hjd
 MVkM3ltKL+V8tfyd+ZQO2Mp7753i7XQEPcEymhpIE8nk0X6ywIX5mB8px8r2Ve8k9Kft
 d5Rh78Rvj1KfRbw2/Tl5SCiRTI7CtEWrcnL53DvXiGo+aCDzzlDhcmP/lXcWYXTUhnIT
 2YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973494; x=1757578294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfipyU6Vd8H7OBNmQiaCitsZISqNnzAeEnNiRJw+yKE=;
 b=kE7AiAJ0BpT3t3/VZIBI/MTAcocsYyOL/OFxe+ZQCBYT1bvOP2P5FP1mpwbIsh/Ob2
 78o45Fn0LFtO4JAilcWCnj7AoJjUp4PRzFLFH/rN2WxTCJyDAzceTPiCSbzF7W/Oywbc
 i2NT50rsBKnK9eC6tUBo8Cq3YOpFz45qNgaOrvTEL3EHPD21X/BglX5fZFjPQGtANpAR
 yHKgCQnWlq9LNByaP/m3e7A98UDUn0NACN4uFPdE9f++PWP5fyAAYqdGpyGy/F1zBCzl
 RnuE/hRSrmj5x55C5yxX6o66hF9uElTgxfm7EJ2q3Y/8i7Ofer+Vm/ZAACkcinzyDAEK
 P+6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5E5xiUeWkyZD+2ROWeKOO3GPv78b/ySBhAmHOzplFFbgG5xEig37vQBjs8wUJb1PznhQm+QU0Q9Tl@nongnu.org
X-Gm-Message-State: AOJu0Yx0X+oKgJN9E+XIyfDP2BIPiTybcmRWiOlKVZY9djMw12NnS+ox
 JMFuzQxXkHgg044CDvMhjNHafbjROn+bxadnMNxqANNbN0U4iKPLT2Osu4CewNTYBdk=
X-Gm-Gg: ASbGncsgd0Vr4J9ykjnpZyM6r0i0YUcMSThKA5rda2o24NaJL50loe8lJ63ht+MeapV
 uEK5YRFfacrVpeog1FjIIiEWzh6BCFzV43Jb7AZditooSf/2rvNqvrFOuKOCTcEbxMENo7ltupH
 3SQmw8CcQvKCXQWEPSg1cBD9MXBEOQDB/NPWxXCzUEHF+AQ+IG3eIC+ziPxHJ3xFufn1ATcQ8PS
 +SNrgZrstlZT+z0UCaE1jF7rJBd8g1vbgHkD8Wx+03korj4u07vgItMlK7Ft8c264DWsLns5Gsc
 lW4qHASIuddzG7K80mtnvGd3UiXmTAIiTUx5e1t4Pt+C1h5HBLEhQfJWQitQSQgwea6xnIF3qn/
 gg7isn67kyEDOumkqM1mEE20=
X-Google-Smtp-Source: AGHT+IEoaLYHbkuQ5w0GIOHrSrp6jiGSZD/L88aCCuGmKVKhMNAGz92wDlGLKlrjfHoRe3Zrhm5FPg==
X-Received: by 2002:a05:6402:40c8:b0:620:1c6d:e6c4 with SMTP id
 4fb4d7f45d1cf-6201c6de967mr689986a12.38.1756973493583; 
 Thu, 04 Sep 2025 01:11:33 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc52ade4sm13646124a12.45.2025.09.04.01.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:32 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 674E15F913;
 Thu, 04 Sep 2025 09:11:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>
Subject: [PATCH v2 002/281] scripts/minikconf.py: fix invalid attribute access
Date: Thu,  4 Sep 2025 09:06:36 +0100
Message-ID: <20250904081128.1942269-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Fix parse method to use `defconfig` global variable instead of the
non-existent KconfigParser class attribute

Fixes: f349474920d80838ecea3d421531fdb0660b8740 ("minikconfig: implement allnoconfig and defconfig modes")
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Link: https://lore.kernel.org/r/20250820-scripts-minikconf-fixes-v1-1-252041a9125e@linaro.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/minikconf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/minikconf.py b/scripts/minikconf.py
index 6f7f43b2918..2a4694fb6a3 100644
--- a/scripts/minikconf.py
+++ b/scripts/minikconf.py
@@ -340,7 +340,7 @@ class KconfigParser:
 
     @classmethod
     def parse(self, fp, mode=None):
-        data = KconfigData(mode or KconfigParser.defconfig)
+        data = KconfigData(mode or defconfig)
         parser = KconfigParser(data)
         parser.parse_file(fp)
         return data
-- 
2.47.2


