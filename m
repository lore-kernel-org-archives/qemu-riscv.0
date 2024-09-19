Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45745CE8D49
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 04:55:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sr952-0002qS-Af; Thu, 19 Sep 2024 00:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94q-0001xJ-Rl
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94j-0007Oh-F5
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7198cb6bb02so269538b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 21:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726721248; x=1727326048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOTDlymCoYoChOB3X8FuVGmcdRWIYVQOru1+/fCCr8A=;
 b=ZaC+YqWmznBoMCMkfDLMaw7G5TyLwN2c6Szpv2AClIQUQv0CP6NOz7YoRRv3g+GFas
 Bzh84/ilO1Wcx6OUa6jtI4iTtWJKPW/mKlZOHKaaB0ktTA0/iZfWbFvNCjPrssr1o9aM
 thVrG2+PM+wGCuF3uECxKRliVuT3vRz6gOlEVaqqitNu73z6h7VYD4Rf9tAbjupmp76n
 aeZLF1wiVirhIpqJsHUP9cUlFJmgwx44ZyqiqtgjfwRJ6PctFxMQYcFSCIl7J3UAvSSD
 CmgroWqe6i2S3MM/mIJAKJAjbLZMr6sQGm9G53tqDlZDl8/dSrVNKMxAVUNF7d/FE9Cc
 vh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726721248; x=1727326048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOTDlymCoYoChOB3X8FuVGmcdRWIYVQOru1+/fCCr8A=;
 b=qZ45GCPPhH4K6fOJx696o9xKVpiWQQEF9Os5GwfvL6ZxcDFcyIIw5zFhZuaHmTjRiH
 MLQva1wsLmsB/MTe+9EKEjZYvVwrh4xIAlpFSILcB8nLRAUMwJmRRHijI77S5T9XrtzT
 NCI8EBWVTgNuO0a+OtivDpO7If+b8AptU6k6AYZxHMVDtuBHC+5yOwy5BeJfFX9WmE6e
 7bheBmst2+vvKg1/wBIaUpAa4hrgJV3XfGo2tyvBRhMzccCr43lw0RG1m4JMvtGTLMVG
 DDY9INt3LlTXYKSMonGEu/2vQa6NO0druffT2LxgHHttwKGa0iLRtcPJa6fTHp0CUUoB
 wzfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUhacxWSIJvtnWgofWsf+dPolHm78sfoSA92qMhETyxZPxkhYnidkp38Oa/+M46iMoy5JTYg5ZI4hJ@nongnu.org
X-Gm-Message-State: AOJu0YzLR+mX2v6UHjRuWfYVrmk7kmma5Y+tHnDmiFEx9u/kv+Cx+oHJ
 bektMOn17n40djMWKr+oHmwygyGT808YsQNV/Pvu4JA8JRA1SmiIxE/PbopKPNU=
X-Google-Smtp-Source: AGHT+IF4VdR408ElGh9vDAVjdbcMP3qqXEsAp/0wcOEvsQ0+y71/UwITZuPKa7pIAYx77zAYCo1WvA==
X-Received: by 2002:a05:6a21:2d86:b0:1cf:5437:e768 with SMTP id
 adf61e73a8af0-1cf75d7fe57mr34834771637.7.1726721247872; 
 Wed, 18 Sep 2024 21:47:27 -0700 (PDT)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 21:47:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Hyman Huang <yong.huang@smartx.com>, Halil Pasic <pasic@linux.ibm.com>,
 kvm@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>,
 Peter Xu <peterx@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <laurent@vivier.eu>,
 WANG Xuerui <git@xen0n.name>, Thomas Huth <thuth@redhat.com>,
 Rob Herring <robh@kernel.org>, Eduardo Habkost <eduardo@habkost.net>,
 Nicholas Piggin <npiggin@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Ani Sinha <anisinha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-riscv@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Jason Wang <jasowang@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Weiwei Li <liwei1518@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Helge Deller <deller@gmx.de>,
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>,
 Jesper Devantier <foss@defmacro.it>, Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 21/34] target/arm: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:28 -0700
Message-Id: <20240919044641.386068-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/hyp_gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index f120d55caab..1e861263b3d 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -158,7 +158,6 @@ int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
     if (len <= 8) {
         /* we align the address and set the bits in BAS */
-- 
2.39.5


