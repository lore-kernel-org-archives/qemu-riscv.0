Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2C1CE8D49
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 04:50:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sr95P-0005EV-Q9; Thu, 19 Sep 2024 00:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr95C-0003qi-Fb
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr954-0007ZY-Mu
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20570b42f24so5297585ad.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 21:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726721268; x=1727326068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJWuRI2a+xcGlqE9ilLL21KPqsM5FE8vZBWYVBf4fqk=;
 b=FqnqmtXH52xcJ9aenpC7ZsFzTXIS89qdfvjkFQkaqp6Yn0CA2I/PNBbGN2CaznZd23
 N3eArcNFEScW1SvTSCpVM9gbFoJp5cZetFWPI8qnftlm37nbYXpCbBWBV+kDZ9GEs7aB
 yJAqIbxnPUnpktFg9AHOuaAL577Ngud7tkg/uvJuLANMAaZGMAXtJFxyu/WynmlpE+qA
 ZKWt4/jjwbNF113SLYGh3WSMxCywYsXvFVhwovHVFXZlkInm2pF+FiEfhZPQ8CSdU3Uw
 iuo81LCGMW4vEbJQoTsVWobmffCeowvsYgl6BPDRtmd32HyZVOCYY+j5lT43VgnUYB+X
 4o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726721268; x=1727326068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJWuRI2a+xcGlqE9ilLL21KPqsM5FE8vZBWYVBf4fqk=;
 b=ayXGXSv2NFMgAvhxvPl7unbGjEDH688H7XxLoDtECIs92K2/hexNsWYsL9hzsRjsjm
 BFNU73+cUCwjj1OmVcg7fKpL3k1Fwe8aBT8NCIStyknzjpVb3OJVWo747XAS6PJQPpZb
 a3dxWj3yWknVq/XiKbtthi6M98t1k+1JWdCqC1885CTMfmltNhY/F/1ouCQ7lnXPL6it
 dy04NLD4MbyXdwxok1LGOJq9UIjvvWAy9M679GDsoWrmOfxePprVOsPtV+OxAV3xgfxn
 r6js86RZ48mE6KVyz7GeKG5ChVS5nB/pI98xTfl5u7r2HFFov/KYhu6IeKuBZojRMVjM
 TWIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzEcs/eMoGq93CDuqyCBHbjRyfBkcKSu+5KjCOHpUUcwmbW2iLF/JLb0yh1gQqYyRRqyxLxf2vFEpu@nongnu.org
X-Gm-Message-State: AOJu0YykuAdpQXfbxC1zv5YLJh0gd3E6OHymNG+LnIIA9A6bV38LJVh0
 ngOyuANIPlZed+xzhVmrcmSZRT5Yt4H2EmNWdgLthK9EjZf8depA1xJTGq/CJsg=
X-Google-Smtp-Source: AGHT+IEWVDdbKcjFcT6g/UvYMSE83MFSMfB5S4IXaD3yJyhmupuCthkvU2aYKDc9W7+wO1/hWbEPng==
X-Received: by 2002:a05:6a21:3a81:b0:1d2:e8a5:689b with SMTP id
 adf61e73a8af0-1d2e8a569famr9583177637.14.1726721267939; 
 Wed, 18 Sep 2024 21:47:47 -0700 (PDT)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 21:47:47 -0700 (PDT)
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
Subject: [PATCH v3 31/34] qobject: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:38 -0700
Message-Id: <20240919044641.386068-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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
 qobject/qnum.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qobject/qnum.c b/qobject/qnum.c
index 2138b563a9f..dd8ea495655 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -86,7 +86,6 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 /**
@@ -124,7 +123,6 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 /**
@@ -157,7 +155,6 @@ double qnum_get_double(QNum *qn)
     }
 
     g_assert_not_reached();
-    return 0.0;
 }
 
 char *qnum_to_string(QNum *qn)
@@ -173,7 +170,6 @@ char *qnum_to_string(QNum *qn)
     }
 
     g_assert_not_reached();
-    return NULL;
 }
 
 /**
-- 
2.39.5


