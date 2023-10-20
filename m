Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDDCDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:42:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsWQ-0005tK-R6; Fri, 20 Oct 2023 12:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWK-0005bw-SA
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:46 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWE-0002hy-TV
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so157488466b.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819915; x=1698424715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ut1JVFvFLo+kLIKZi8qPYnpjR7G6cNfFgvYYDUExNe4=;
 b=Esduh2x9POfFkAkyY7CW+rq4rzhGBP5AXebWZsb5QXaAWv2BvfhbQdnKzu/E6x0CqL
 FE0dl8n7msDCpbpRVMvPpsZ8njjhmjBfgrmL0dqZ0vb2pMTdmtMuhfB3jElQTMkdOWcc
 dSpu5FWUTr9cBGDuiDp3I8UwuOfoWmrT7/2j8XSGYern14jE+aD6yorMxVXejEeNJLla
 tB5aYk7cNgZ+leM+0hy+YIfQUPpqn2uz8SL7BrvdxcCREa/lSWUAyrQO3u3XctD1VCUs
 D02j7jNjiOUrtiAvnqgaUOxSAD4YMKQdRW6HXy8Yk3/jrkWYfoWZugSspxBOVaHKCurz
 hmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819915; x=1698424715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ut1JVFvFLo+kLIKZi8qPYnpjR7G6cNfFgvYYDUExNe4=;
 b=BhkAf6uGKfOGR06UFEFvZ23i7UvSbVTswPcR+Qp0Z/w3EE4ydelQGnFivBTLz34bkv
 ZR04DCji1uJsmd0NA52WtILpBserUsBNhDormjs1ROt/ZufYrn3FtacAsxXl7gJgEzhe
 zvxB1n+g0ZjmgWrHWgF6Is13CKLkCqqoQF9zPzVRpJLvW0d5ZYFcBB5cTzePFymgx1DJ
 7TYfsPeSm9k5G90LRS7PkTTmpKLa7oK2203LNzJeUfcNOI/J/HJgQQcluJYCSeTZ9gv4
 axXtD36GMVba3fqAdGOWiSsRlWJKaDIdFQR6/g3+jmPtH9Ve8/WBphRa2Fr9RIHY1eR7
 TCAA==
X-Gm-Message-State: AOJu0Yz34zFoUDPbfeDUy6HiCvywls2YE8vqIn/Dara4M2mT5lnAvDEa
 Or1S6LIPTWw9yhvlZ/5cs2DO2Q==
X-Google-Smtp-Source: AGHT+IGl73D3b984YgVSErMYz9RgMLYGAfiCqAnw0A/C+rUAgxUldvhOIDj/46hx9nsUEPP1al9X2g==
X-Received: by 2002:a17:906:eec6:b0:9b8:8bcf:8732 with SMTP id
 wu6-20020a170906eec600b009b88bcf8732mr1841258ejb.43.1697819915304; 
 Fri, 20 Oct 2023 09:38:35 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 kf14-20020a17090776ce00b0099bd7b26639sm1820597ejc.6.2023.10.20.09.38.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:38:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 14/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_S390X_CPU)
Date: Fri, 20 Oct 2023 18:36:36 +0200
Message-ID: <20231020163643.86105-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_S390_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 377f43416c..1f2296f456 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -674,7 +674,7 @@ void s390_ipl_get_reset_request(CPUState **cs, enum s390_reset *reset_type)
     *cs = qemu_get_cpu(ipl->reset_cpu_index, TYPE_S390_CPU);
     if (!*cs) {
         /* use any CPU */
-        *cs = first_cpu;
+        *cs = qemu_get_cpu(0, TYPE_S390_CPU);
     }
     *reset_type = ipl->reset_type;
 }
-- 
2.41.0


