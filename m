Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17179CE8D4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 04:50:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sr94g-0001Ag-Ib; Thu, 19 Sep 2024 00:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94e-00011V-IF
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:24 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94Z-0007Ik-9V
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:24 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20570b42f24so5295085ad.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 21:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726721238; x=1727326038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PbYSPAJ6rnlNnfP+6+lqxv7ue/rw4dEH/6Q+9usd0U=;
 b=d8IhT31dlD9nqG7Jr77XL0TfTShRtN9693+0ugU/8uq+5SfiILyQ7cmz6sKWvHHdMC
 I3oDnRWoCsIjzVEKCHuDyGDJykXUU3gZCLIFNjTQWbS84Wsg40ad4vUazOunpc4EIOu8
 tHD+1hJeRjSaju3dAR1S17gQDpcK81lqnuOYYe/+boOiC0CVGaUjnsSj6SXHRdllFzy9
 PrdpLSfX0JybB69/9GGBDmh90P+dVjifWz0dXISQ8G076Ua0uUYO/MT2Xp2w4RC9+sfO
 7zTreCxwZfxSd5SU8teqRJ7sKE15IqLsT1n5pSg7IAB2hxA3IPK/MxjmU1ofq9dniCwL
 0k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726721238; x=1727326038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PbYSPAJ6rnlNnfP+6+lqxv7ue/rw4dEH/6Q+9usd0U=;
 b=bd2MysxhT0GpN+Vboig6NgHutZUgETcZfmlCD7rEbfkcLeyR0DNeTT6IDPorULICwj
 5ypxTjfcv7UCyRIxa27NgBkl0G1iEJz7+xVxxKeiLf320WCg4ooGsdPLxfYy8V0a3tNG
 fjDMZE9uHtljT27hmTw6MReXNVQxI0WtdUk7dxl1bDDkbtO4lxdSmiXjUNGFHZHoBZyp
 sam9uCsqgv6o48sS0Iu/jGRqhnFJeE+FAUTZNABpsU34BX440+32kPZwK8ewwZct0Tyu
 43mb+2mB6Lqwd130zA16UQ6D4zhCJ/DJKInce6ic3pTEuFEU+KbPOBpEwqBn1GXZ2dGP
 cSRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvxiqA5D6DAvQOeCvSDFeYsruLNHytGAB2nPqOI3KragpAP/tq5M5sIeOqN9It4DyUyprCuk3POGVj@nongnu.org
X-Gm-Message-State: AOJu0Yy5w9DBhKfyCxkGdMG2LYOoL8oEBoqA1jVqCCFN3efSpq8FBy4t
 be00/bgYKrOvEJQM3SZ2YtkFXsG8obYSEeZqBV+NeEAyNqOsVFVrqTQGxOipjd0=
X-Google-Smtp-Source: AGHT+IF3mDmH9rpxImg7I9ZiTJydkdGhhv3x9u+IP9aPf7aanW6JNd2XCY8CeZpnshOcXFIkUiIf+g==
X-Received: by 2002:a05:6a20:43a0:b0:1d2:e8f6:7e6 with SMTP id
 adf61e73a8af0-1d2e8f60a4bmr8759330637.13.1726721237824; 
 Wed, 18 Sep 2024 21:47:17 -0700 (PDT)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 21:47:17 -0700 (PDT)
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
Subject: [PATCH v3 16/34] block: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:23 -0700
Message-Id: <20240919044641.386068-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/ssh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/ssh.c b/block/ssh.c
index 27d582e0e3d..871e1d47534 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -474,7 +474,6 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
                                        errp);
         }
         g_assert_not_reached();
-        break;
     case SSH_HOST_KEY_CHECK_MODE_KNOWN_HOSTS:
         return check_host_key_knownhosts(s, errp);
     default:
-- 
2.39.5


