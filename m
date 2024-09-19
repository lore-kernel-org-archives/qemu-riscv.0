Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FE2CE8D4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 04:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sr95A-0003Zf-BQ; Thu, 19 Sep 2024 00:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr956-000393-2g
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:52 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94z-0007X4-Ha
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:51 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-718d91eef2eso279071b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 21:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726721264; x=1727326064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHfEx5g5BzL1PX1RgAlJ8l3kVoVW/oh/s4YLt1Je16g=;
 b=HHb826SwhZH+oEYl5D6yU4uRjwLwPoes64wjS5uAApZ+b31zTbnJ78V1hG9Xhn00BU
 f/i3EpPFZ1OA/7D88t6E6YZBbzIbWBax0nKdu9aX8zTxEnmGEdlg5224Yotft2hcegh+
 +4vuW4H6Zj0oy/31/jAF/v3KkLrtnH5pUjtHMD+gjSqoTv6CK6ozQMZv3IduvttVHPAD
 n9nMOI9kFDigrsEK672o6u3UYTbzEf3iLbEZEvflTU1emg+BRrvRWjTH3FEFQYHsISOP
 e5IOUyhPR/2gJRuu/4m8vuvhOSyWI5d2peIxR2AvWwwz1bcyWKzVY1kAq0HjmAPvk4On
 udHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726721264; x=1727326064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHfEx5g5BzL1PX1RgAlJ8l3kVoVW/oh/s4YLt1Je16g=;
 b=deZ+pUtLztZg0SF5589QeYPv6GvCxSuSMkcCgy5MlEMlpCfvJtEdCVTpXhUzyJj+Ym
 PqZXER7C7a7Y46/vmGcyKFQewIV7KA5WKcXjLHeCzoeLZepv+ycly3JXVnRrvZPBNUHT
 WP0+rQ7xRerHC/JW4qOjzk4AJzQDCmNHyDnZ9luPlj4mbKAqFSS6Vt4LiLlwRhbFBbok
 7q1Dv2BXhCNnY/k+GuLIR9na41WhIbZi2ynpZUrKkgsQ0lolAAoxP4rDV3iqpZXfsf6U
 DSS0zC6Se2ZRxnGfvY3VD9akbyTYQCkFAX0iLFvFZoB44TsL5p5R+uZgGUTkWGY8oqb2
 qSDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj4JHklw3J67iBBjbW9swQIU+8w3syx2f8QLwnCqbt1oH4+cA5YNnu9nPe+EGZ9Fyd4D1u0CvdGH+b@nongnu.org
X-Gm-Message-State: AOJu0YwjiM2hHnR+zRezHLXZEBvlRSVDi/1JtVwjtBvrkUVucfK4exy9
 zNmyCJtAxqqPCy4+/7IqHsfrZPiSO99obhaEGUDaIb8YSL+SBKciMH43tbUyIL0=
X-Google-Smtp-Source: AGHT+IGn0zKE4NWTBii40hBHgJl3lvYHO2m3pyUcQ8D1+09Ub75s0ooGndgxJcjdbl40KxBP6dN9PQ==
X-Received: by 2002:a05:6a00:1746:b0:70d:2a1b:422c with SMTP id
 d2e1a72fcca58-7198e2a8f1dmr3107578b3a.7.1726721264030; 
 Wed, 18 Sep 2024 21:47:44 -0700 (PDT)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 21:47:43 -0700 (PDT)
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
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 29/34] hw/ppc: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:36 -0700
Message-Id: <20240919044641.386068-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/ppc/ppc.c          | 1 -
 hw/ppc/spapr_events.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index e6fa5580c01..fde46194122 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -267,7 +267,6 @@ static void power9_set_irq(void *opaque, int pin, int level)
         break;
     default:
         g_assert_not_reached();
-        return;
     }
 }
 
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 38ac1cb7866..4dbf8e2e2ef 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -646,7 +646,6 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
          * that don't support them
          */
         g_assert_not_reached();
-        return;
     }
 
     if (hp_id == RTAS_LOG_V6_HP_ID_DRC_COUNT) {
-- 
2.39.5


