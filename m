Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E5EE645A
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soeTJ-0000bb-NQ; Thu, 12 Sep 2024 03:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1soeRq-0007RC-I8
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:41:02 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1soeRo-0000xK-BZ
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 03:41:01 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-709339c91f9so207159a34.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726126859; x=1726731659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UU43OuMIYQY5gzBd9N0OsX2nGrNJ5ON22GSd3bl0bUA=;
 b=UoJ7fUdiBgVgXNmI4zA4bj+aBo5hVNJuu1Q+RL7QhilGvRAp9h4GtWbeqGA4laeCod
 485hphwQsb8jWqTB36TVx5YTsqA+yNpHsytvbG62tUjEHkA3phC3mPR/S4GgZ5/jVlbl
 D61QcSt/yOl5qo/YUTj5FpgR8yk+8ypnKjZQcWKHfPeiCDwKSf7vtdjroCBQEmR4o+Y+
 tN9lpiyDtLh94fPlrCVhPxz06EzKI2URyAWK4iXuhoXTLJTXwCUMZ8BM5mD8LbdqfDlM
 zbcDSw8KzzKEG9Sgfan2hyxS7UfD6V8lkRdzhkA0P1m+sNw3fAOxaukCmPiUlafnmGMb
 LOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726126859; x=1726731659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UU43OuMIYQY5gzBd9N0OsX2nGrNJ5ON22GSd3bl0bUA=;
 b=vQDKBA0E361dVndfhm9xJk9JseE0UXiMRpGduKvgXgtkoI6FBtmI9D+xCbsPxw1t2j
 Mp4m5aY4XvgyOv2Q3WIghfniOieHzuemKEnAND/AF2nvYIrjmKF6xHC0qcvtbIjnziCX
 tfyKYCrIuvedplwxT1HaJ00B5WJ/iO+vDcsUOJ4J1rw/Wdjt35LFczxRPh72LVSNebkI
 O5PEdUIEe4xWZ2rDQH3oPFX+01hWLa/Lz39aZwGd/dQcIGtjvIqH50wJde49MUMp0GVd
 +c5FIWHZhFq0z1Q7r28K41EGPkAsai/VCaCvq5jV1JlMXBZcI0BLCmnn+UCKAqh9y4Md
 fm0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuivi6M6uB8WE69DB8OXHmGaU6EtjdgPxFlwEhf2R57R4SGWjnooIHUxiyfwkeel0q/U+EoVNuLNmc@nongnu.org
X-Gm-Message-State: AOJu0YxqHY7HT55xuSDCeYVP8f6ecH/USUqNWMHoHhiF6ztpMGTHdU2/
 aDnbjcbVdy+ptLOmpjiDmckEQYsf8rXg8185lrUNINMIsyMpE8/ePrDMvPXDEG4=
X-Google-Smtp-Source: AGHT+IF2wNn0ur0oT/D0x/ryrXGcpmcSlu4jLOalBhzoC7Sb43ZM6r5tgiThqhwY6bCeeW8Z+2hNyg==
X-Received: by 2002:a05:6830:3107:b0:70f:36ff:ed09 with SMTP id
 46e09a7af769-71109571674mr1236876a34.28.1726126858602; 
 Thu, 12 Sep 2024 00:40:58 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:40:58 -0700 (PDT)
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
Subject: [PATCH v2 35/48] tests/qtest: remove break after
 g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:08 -0700
Message-Id: <20240912073921.453203-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-ot1-x331.google.com
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
 tests/qtest/migration-helpers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index a43d180c807..00259338833 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -76,7 +76,6 @@ static QDict *SocketAddress_to_qdict(SocketAddress *addr)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     return dict;
-- 
2.39.2


