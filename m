Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED091EE01EB
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:21:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so9Av-0004Do-QV; Tue, 10 Sep 2024 18:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9AI-0000FZ-J2
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:16:53 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9AE-0006hA-Ra
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:16:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-71781f42f75so4834659b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726006605; x=1726611405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaOeMd8XzZwIKO+BVAeDQHacTyR7MUVICUu2Groumoc=;
 b=YoII4GwF+1pNYlfKQgENBZdC8OSmOmDGJjwAa+vo+cfmm9CEdwrXjKcsYDMorVPCoj
 Vu2WyAr/bc0N9GMfc95gwP7poeUMtyfNpXDQaWGkp+kTRtUSXkLHdfJ629I0DIU7DGBA
 ujzyOMtu6cPEbnANqrA2qY3Cui3bFDaCcv2JYPWJiNQoMJuJAxt4HsPWFrPq1/ec98ll
 cKKYSjFmqXdF59t0qnsS94piFkntXtj1RtBnTdYPYIDKxAkrf2BwEvZnffdDDHSls/5s
 7afWfxiXtwklUvUR4pVyNLOdh0S83YEvMpgC+o4s3ebSVu2Z8RUcBsn1cShHey2A+XlD
 DwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006605; x=1726611405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zaOeMd8XzZwIKO+BVAeDQHacTyR7MUVICUu2Groumoc=;
 b=CNqB4r5Q/RR8jb9WQEIjEBzn1LeV3MKPd+sXWfX7TR41LF2uNssw1PTxiGQbcsMVVF
 +2gubzsPaRAG/Rl29m8to2meKZq4X4IBGQTuBPvm6OPkJiQwhgXUWcLsYLGAwVO04eEm
 308hlBib7aZitOQLCGXXEqsRRT9Ag/AbaRWmiHhgZa79yv/Pk0BI6d62HKfk32HvQtN7
 JzjqAVWlJ39/e2YLhcEzbmFjQQhasbPI+aUIZA9vT7okuzM7qx1ecFj0lT9A3+Dxil38
 Z0SX4vULfLZARsjXCeV5V2ot6QqDjOgryMO/WQ9QF7QtWtId7YePiLSvjWoh78l7ErRx
 nGDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk4pE3B1U5F0BvgbKzECa2ATdatxN4lNg0fmFfgaDRNprIT9pnyyV1i98HdWpIc0r/UJdLdsKwSOeS@nongnu.org
X-Gm-Message-State: AOJu0YxeG8Iz5WeZR4Z6tCHkJO9DB0QAuHPiD0KTJZRJxt5+DnH48VVN
 GLMfcxU0whVUCHd3QXFFC8lwljHgMC4e8KMoVgEswsR/MkFRJNx5hkjr3N4jcb8=
X-Google-Smtp-Source: AGHT+IGXdkrxhCzNyeQ+oPHQ9x0IFNSkeXfls9xHWi0Sicojf8vp5qG1xhcR8cFIxRHQi1oprvgqcw==
X-Received: by 2002:a05:6a00:390e:b0:714:1ca1:7134 with SMTP id
 d2e1a72fcca58-718d5ee3ed9mr21940217b3a.18.1726006605401; 
 Tue, 10 Sep 2024 15:16:45 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 15:16:44 -0700 (PDT)
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
Subject: [PATCH 15/39] block: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:42 -0700
Message-Id: <20240910221606.1817478-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 70b19730a39..bdc6337826f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5299,7 +5299,7 @@ qcow2_get_specific_info(BlockDriverState *bs, Error **errp)
     } else {
         /* if this assertion fails, this probably means a new version was
          * added without having it covered here */
-        assert(false);
+        g_assert_not_reached();
     }
 
     if (encrypt_info) {
-- 
2.39.2


