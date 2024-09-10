Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7428EE01ED
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so9AS-000107-1K; Tue, 10 Sep 2024 18:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so99n-0006aV-Pg
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:16:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so99l-0006T7-HK
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:16:19 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7179802b8fcso4380372b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726006576; x=1726611376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIrX6LSYcWKQ7NWgVt5fl+kpf/h4MdU5BhontmNSP2g=;
 b=mExn9ZtcTMXAA12LnB1F36zN5UZGDhPJVn232oGpUBBZA7HrdhTDVwkFmo6o93IpMN
 fU8RX5dTp5RLYW8wTOEiKuPozs+t/lob/hvD5G/bptg2k+pEthkqp4Yb4gIY98lkwvxW
 kz0UdqErQznUfA+hgcUZgh1OOYsr3/fPV/lhx1YhqmtpC6DodSGstpPeR+m23kj8FQal
 diR79BxyHFUq7shKawvqSl7qreX6I7Qx7nVEd54Qa2GCfKWj5/YTMMsNL240QZIdwTiT
 l7CsW8Sssgf8JKI1IKq4zuADOS+0wUY9JJLkUZVjV+F8gJD1fB9x5lAnYo8i2jRDZTdh
 li4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006576; x=1726611376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIrX6LSYcWKQ7NWgVt5fl+kpf/h4MdU5BhontmNSP2g=;
 b=fJElaSdZeJzUeym642GpNR2gCIyO0cf4B1mZuFfKFl0NpVh83tz1QF5wjw4H5JdnkM
 TRF/B6QOwdxbPiNjrnF3fdQkfVeQ3sJq0YRb954+YQqtjjqHj7tI+h2LwVzWjGpzzs4Z
 et/YHdPyJMzwtREuMw9pduOgvkwMKOj4pECFgIgMN5bajVAD9IW/CQv4svWhIjctwBWp
 gkxWoDF4bjbd1hq9ewVUAejLshAoJcMWk8xhfhiPMqeYkMC70rkx+6MGF66CbasdT5qF
 pvBApsEAbCVt0A1jojCJe9H1DM7uyL+KfA8tRhEtwiEoNf13O2RaGycEfQm9GRKr0p1q
 4Slw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo25hTqwUVZBNqep1coP0vGwbkoqg9dQ2+YLShnM/+LE+1njsJcmltP18WFqCDuzaALNfB5h5KLeTn@nongnu.org
X-Gm-Message-State: AOJu0YxRs74Y3Z3PK7eMRR3Sj+7F9kjLxeeDkno721/sXnVZRZqsPeTW
 JY+oeol+I4kv1n+4OjMpA4YwqAXIBIZTSsOCD+OJKdAUfp4qs+82EZsSMpJcQk4=
X-Google-Smtp-Source: AGHT+IEi6PPXSaCo/MzwCiwcFBkPDWeKr8hyR+jrhEtygwmYUnxCgU5X+xKQ+1rCwoEBFzE8VZ/xcQ==
X-Received: by 2002:aa7:8883:0:b0:714:2069:d917 with SMTP id
 d2e1a72fcca58-718d5f0fcccmr19299081b3a.25.1726006575824; 
 Tue, 10 Sep 2024 15:16:15 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 15:16:15 -0700 (PDT)
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
Subject: [PATCH 02/39] hw/acpi: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:29 -0700
Message-Id: <20240910221606.1817478-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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
 hw/acpi/aml-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6d4517cfbe3..006c506a375 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -534,7 +534,7 @@ void aml_append(Aml *parent_ctx, Aml *child)
     case AML_NO_OPCODE:
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
         break;
     }
     build_append_array(parent_ctx->buf, buf);
-- 
2.39.2


