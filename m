Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740DFEE01ED
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:20:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so9Bk-00038F-Aq; Tue, 10 Sep 2024 18:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9BX-00017Q-Mu
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:18:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9BV-00075M-5s
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:18:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7d50e7a3652so3486610a12.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726006684; x=1726611484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVlIH0vLGwHmaRGMFANFNOikFJyMD1Z2/NyDN944UZ0=;
 b=j8CR3sr0tw67dbYksDjnaDQeBLYfY9+Izh4GgWxY17gWiYOc4IJl1Sg+YxA5bPD51y
 0K7AEa5o7Fbh2rlgdaknmaSdRDUaeepsnwnyd6iQFI6DHhDqD2wydVXc7SHHt2MyhqP+
 EA76B+ZkBSg8MsMiHjBJN8U+KWNCwQktx2uMxGTSjCcgnr2HFBge32z4OFhu+RqbNNwQ
 i35/X2z9DS5yed7GMwFJrzL1Umz5skcoL7tl8qPlcbumu+b4ydft0GfqZQnjZR567De7
 8It+gUA0f8Sqt450v65QW1ZvgEp5Jl2mcb6KXViFEzfSJc9cqePCZ8nuXKqbpIhLCuWh
 PslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006684; x=1726611484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HVlIH0vLGwHmaRGMFANFNOikFJyMD1Z2/NyDN944UZ0=;
 b=SeDWX97FWkB9E7tMFJTGAGT/ADCTdiZXHDRRvX2YcHKcrwh4j/jFDQ7atXDX20A7Sa
 5COoiOkQFIYUoiWaSMe+LfwTMb+Auh26cbFlxGZ9TO5hgEwanRJe0SwFf5tBVxTciB0W
 +9HEGtCeCwmwgjME31yrvsJdKYiysB4gdbQr6UpeJ291Zq9G1AVtm4HJkkXbdFdy4VTZ
 rhPgBxBolI9iEL+d8ZNnbPB0j2daZSKye47WDRr3hM5b5TZ8Uz6LWSNATSQcEIRUSCun
 apA5ndvwtwmotktHRFbdVTxRjvRtudgTwetw6sdnwU0kCOqIcw2pftXj9PEzX1kNvAUB
 dbRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgh6R0BYnJuuBpP7ANqlxx5If9LP8cmD7ZIKJeyRPILnsSCYwuShbly26eDb4rmDtATmyK8IuPVou6@nongnu.org
X-Gm-Message-State: AOJu0YzFCZZ1bFc4UNLg20adPwym5e48mKwh1Zqq+PShOaLPygoQJoYi
 75JPHPddyWX8PIVwtZGMo8Le0gE1cyJ+8ShenNr//RC3QgHqAttX8D66nFdLKG0=
X-Google-Smtp-Source: AGHT+IGmxzzneUTyXUzTC7HDyLbhq6XrgpPzar4wgVhFnulO1e/5MM9gmR+Gi+k9UlOi7JBGbi98dA==
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:2df6:453f with SMTP id
 adf61e73a8af0-1cf5de0ef4cmr3537960637.0.1726006683723; 
 Tue, 10 Sep 2024 15:18:03 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 15:18:03 -0700 (PDT)
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
Subject: [PATCH 35/39] tests/qtest: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:02 -0700
Message-Id: <20240910221606.1817478-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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


