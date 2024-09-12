Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F6EE6454
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:40:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soeQb-0001TO-Bf; Thu, 12 Sep 2024 03:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1soeQR-0000zh-42
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:39:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1soeQN-00006U-1S
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:39:34 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7db238d07b3so384278a12.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 00:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726126769; x=1726731569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRV8cs5vGajAoqqaVP2CMnCi0idLbKzQEkk2XTwPdlU=;
 b=hskvmCdPAR9ucb0aGc8qwiq7fCLrb5JCj/kaLnd+4QbMqyCemR2Fsj+wV+7apDwfRv
 lgtyeAJGOUp5v6s7Gds0caTrN4aL15Q4AY+RaRSMgrRftwsY91ujzUzMpDOydOaqdEgG
 OOE4PWDjfgn2JYjLJQdQMhtDW8/gQnrk+Gi4A3Eh0GvN0uwPAtSKcG3029M6O4tbXEbP
 +I8iQt6EIKmTef5+JcS9ri7vNWQLpdpppqZu2/Y3KwX3NFiWiFqyZX6yn4zLVH2l+y4S
 fQ3C5t/E3EClCM6+tga4FeTaM3jDHChswzbIyWisr8PMltKolVrj/Mr2LEXH/0otOmzH
 dr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726126769; x=1726731569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRV8cs5vGajAoqqaVP2CMnCi0idLbKzQEkk2XTwPdlU=;
 b=CJ6yZroTY6tC1+x0gmkyOOrT0SrFgT6MQscEeYfBXGoRKamo9FBPyogBMI6N4qI8Zt
 yHxVcJtR1l+smkYyqTpGx/YhWQNm4SI5oZDwtDTFBe8Ir+ZWSHgNdjylsA9pBEh3Lsuz
 dJVrDmlFdkCfNcLDMior2lnGq+W0HdeZA5N1zPw3rR0CVwOJWl8vHLOx7lH8aORu9Wlc
 gCuLW6EMRqNDta5mIpHl0zWHZrM0gk3Vx54lSaMeV8UYxEJLCwrWyFNzkZJkq1I78eXq
 o0DJs4O68TNoVpP0+hyS6ZT3i91y0d96Q9joxnwFf2VWkuYJrz4yLjb1y0SuaL9r0c5D
 noTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVOsIpCs5z36xUfzeslEAfbqe1KEh2MHlZNZvRp82rRAkWNH83Cz5YEvTzgP4qo3X8NEXHCQDhPOeA@nongnu.org
X-Gm-Message-State: AOJu0Yz0HHaEY7aSw8HbosyNWBaA7N7nZWNW6jGT145qNPFXXfI9CZ4+
 6Siryjb5EO0YZ5IG7AM5BA6Wyn5O5a1CShVYySS22cycQxtgEgY8Ch3mN/H5VH0=
X-Google-Smtp-Source: AGHT+IELQJ4LN1eiiJh78GYcEX/xms21hXHkteEXLmVpd/6Wpu6TPg6l8or6duVIN2euH8mSyIIX7A==
X-Received: by 2002:a05:6a21:10a:b0:1cf:434d:609 with SMTP id
 adf61e73a8af0-1cf75ec46b4mr3157664637.6.1726126768552; 
 Thu, 12 Sep 2024 00:39:28 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:39:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 WANG Xuerui <git@xen0n.name>, Halil Pasic <pasic@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Michael Rolnik <mrolnik@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Corey Minyard <minyard@acm.org>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <thuth@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jesper Devantier <foss@defmacro.it>,
 Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Peter Xu <peterx@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Eric Farman <farman@linux.ibm.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>,
 Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 01/48] docs/spin: replace assert(0) with
 g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:34 -0700
Message-Id: <20240912073921.453203-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52a.google.com
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
 docs/spin/aio_notify_accept.promela | 6 +++---
 docs/spin/aio_notify_bug.promela    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/spin/aio_notify_accept.promela b/docs/spin/aio_notify_accept.promela
index 9cef2c955dd..f929d303281 100644
--- a/docs/spin/aio_notify_accept.promela
+++ b/docs/spin/aio_notify_accept.promela
@@ -118,7 +118,7 @@ accept_if_req_not_eventually_false:
     if
         :: req -> goto accept_if_req_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 
 #else
@@ -141,12 +141,12 @@ accept_if_event_not_eventually_true:
         :: !event && notifier_done  -> do :: true -> skip; od;
         :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
     fi;
-    assert(0);
+    g_assert_not_reached();
 
 accept_if_event_not_eventually_false:
     if
         :: event     -> goto accept_if_event_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 #endif
diff --git a/docs/spin/aio_notify_bug.promela b/docs/spin/aio_notify_bug.promela
index b3bfca1ca4f..ce6f5177ed5 100644
--- a/docs/spin/aio_notify_bug.promela
+++ b/docs/spin/aio_notify_bug.promela
@@ -106,7 +106,7 @@ accept_if_req_not_eventually_false:
     if
         :: req -> goto accept_if_req_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 
 #else
@@ -129,12 +129,12 @@ accept_if_event_not_eventually_true:
         :: !event && notifier_done  -> do :: true -> skip; od;
         :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
     fi;
-    assert(0);
+    g_assert_not_reached();
 
 accept_if_event_not_eventually_false:
     if
         :: event     -> goto accept_if_event_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 #endif
-- 
2.39.2


