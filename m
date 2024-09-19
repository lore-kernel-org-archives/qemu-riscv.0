Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED0DCE8D49
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 04:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sr94c-0000pO-4A; Thu, 19 Sep 2024 00:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94Z-0000c4-3t
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:19 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94T-0007FP-7Z
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:18 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-718e3c98b5aso280195b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 21:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726721232; x=1727326032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFDTm87nVz3V5/Slt3dbvL2tTaVEGEVOzfLYJ3PuoMQ=;
 b=kIno0OyJgxlTknCKux+9CqstgID5Oh4ryJpyb0hA1xlVpnazjQ44LXiMFEXb/Gi29K
 O+Ns8bksFHax95qY993GhUVJgzno5REZhwrT2+FRl8YNHVV+CwxFSBPGC5M9JFto5o6y
 y1AuQWTl3VBzybVpIG6VMj1DMHbKJn3gd0Ew6IaRbOQ/L6F60uua7Bb92j6ni4Vi/eSZ
 cirhl8/m6tNzttmMC+AXgasf4E/Ak6jrfLGv3HKFqhNoisMITEws5hhwwMiqZ8WFGyIC
 b97YDEpM+GGFF9N0ZS7LzJBtuRchmOUNALekyqS52JuKhfCsssZghx0b3cc3/l2/OqP+
 LRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726721232; x=1727326032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFDTm87nVz3V5/Slt3dbvL2tTaVEGEVOzfLYJ3PuoMQ=;
 b=dH0uA/QoaaGcGewjEX6GiDgFFS6xmn2OyJc1ACKXJvkwt404Z8rzv6S1bhL/4gF1nV
 JUWo+RoDIUAUTeer3R5d/0RIq+Mlh4YKh2mEqQY4/82Vwvj2Vf2zTQWIvPU1HtqcPtDG
 hNev5oVpjXR3zW4VoMh5UTaxZ07ba/Qsi55bB+uqSa2VdwOzjK9krEfugPq5CmfDOkS+
 EZMce7K4u2nLIy8aL/sTJMepL9Mq1nUOPxkVOd8v55gFAUSyGaRI6T4ZdwYEV63maehR
 N1JgW5CqyZcAeiB4I07/qXqtAKLpLW7KY97g5nnFbgusJ4lY9L8lugFgsrFzZn1DHTTl
 c5Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Rh0GW7IwWah9EBfvlkZ6/xjUTYNzzmi6eA221Dwy8yptn/J/fqdsIwlrTzRykMhT7Q16yyTVdE3I@nongnu.org
X-Gm-Message-State: AOJu0YzQ55oUene/SSsixF2HcLcSGXaeiMC8WRC572QAkCzKabhm8tJb
 JNk/0pULTmWXGC8BQo13EE94cBwnD4Qt0SpY19gQXIy0AJxd+YITU2FFyJRcUR0=
X-Google-Smtp-Source: AGHT+IEyMy6V2A0OtvCxf4O48p53ASfDnJYGmnLQMeZ/04wkCNDXNGA3OfpgkgUg92nhjq5jeesYvA==
X-Received: by 2002:a05:6a20:e30b:b0:1cf:3402:6e9d with SMTP id
 adf61e73a8af0-1cf75d76b46mr35535691637.2.1726721231866; 
 Wed, 18 Sep 2024 21:47:11 -0700 (PDT)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 21:47:11 -0700 (PDT)
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
Subject: [PATCH v3 13/34] migration: replace assert(false) with
 g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:20 -0700
Message-Id: <20240919044641.386068-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/dirtyrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 1d9db812990..c03b13b624f 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -228,7 +228,7 @@ static int time_unit_to_power(TimeUnit time_unit)
     case TIME_UNIT_MILLISECOND:
         return -3;
     default:
-        assert(false); /* unreachable */
+        g_assert_not_reached();
         return 0;
     }
 }
-- 
2.39.5


