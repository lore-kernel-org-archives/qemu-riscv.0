Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2953EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 17:22:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qAD8y-0000hL-7i; Fri, 16 Jun 2023 13:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qAD8w-0000h3-9W
 for qemu-riscv@nongnu.org; Fri, 16 Jun 2023 13:21:50 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qAD8u-0001oJ-Po
 for qemu-riscv@nongnu.org; Fri, 16 Jun 2023 13:21:50 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1a98a7fde3eso996944fac.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Jun 2023 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686936107; x=1689528107;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fi/soSdTM+jlJPcZw9Ao4AzK7duHnLfcvlWiFKf3gWQ=;
 b=XGDy2WVWTYlVc9yjkjUyjPSmKj5JWiRfBALqdQWOwyXg2Ie06FS/2bRq9J20TZfD3/
 vNOvBdCsmaWa/d6Jn2+Z+a2YN35VaJewHa6WUp9VqvDHxVK3gmw2BUMQKTfFcajm9MMO
 qa9Bwez5PBcV2LCg4CRr0pd1AKtyVZ8D65zDpdRO84iLvwqb6clIik9ZMZbeQJmhMab5
 D0zZIyHSTeiR6qzrW0Qm7YV0fjevoVJmuRWoxzYclyT3iEDseTIImbtZ7Uz+97yRGC32
 IrhaqRC3KjDi7C8XEOAzYH1xf7eKU7GUstoUq9cCKDBb8dUYpKq3WSkVejsSHRoyc5Uu
 shNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686936107; x=1689528107;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fi/soSdTM+jlJPcZw9Ao4AzK7duHnLfcvlWiFKf3gWQ=;
 b=Na0Jg0b0Z4a/r4MqYGKMtHjOOIFm/1t6f2bMKmrbjzqSaF4oHty/TVYqDNYH3DDyf1
 v9YXdqZiLjD28cml1lUNlEZ48xknM4wQP5JDGwEZxES9KdFfkbl39RJ5bUUHdr9fI4tS
 ZGUoKcSX21IKlPW7dfa7PcwkwvoF9W8FEY6xeKYLcxltOga0M7tkCvCjUF9O5YkSvJZ5
 5o2Y0TLAX+YmsdqWLzLLFctzZh30RCSJAbyPTLka2f0YR7upb7jb6zmIisc5ej1k6UmB
 XSB2Hkew6KzU27+oxloPrcSwt/iviq6xs1YUNCYb8IEGKh3YzMFP0YccslgfFleg4xl6
 hGiQ==
X-Gm-Message-State: AC+VfDwOJx7nzUu5c6xU1zYVzp+XaaEFscSvCKWPTTfRMS0xt9tlI6wE
 YXw5UqR3tk3ZTc0gdCEpbI6sXw==
X-Google-Smtp-Source: ACHHUZ7eW9eILPmtdMwHWTSHEYDvCTaIqqVJ1WsOgfRebeIzymrulQXL//GtRJ7aCG7Hl3x+oe2L/g==
X-Received: by 2002:a05:6870:4404:b0:18e:f765:2bce with SMTP id
 u4-20020a056870440400b0018ef7652bcemr2674767oah.57.1686936106900; 
 Fri, 16 Jun 2023 10:21:46 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 w24-20020a4ae4d8000000b005584e0c8f9csm7095732oov.3.2023.06.16.10.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 10:21:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/1] hw/riscv/virt.c: check for 'ssaia' with KVM AIA
Date: Fri, 16 Jun 2023 14:21:40 -0300
Message-Id: <20230616172141.756386-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Based-on: 20230613205857.495165-1-dbarboza@ventanamicro.com
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi,

This patch was inspired by my review and testing of the QEMU KVM AIA
work. It's not dependent on it though, and can be reviewed and merged
separately.

You'll need "[PATCH v2 00/18] target/riscv, KVM: fixes and enhancements"
for this check to work properly. Otherwise the host value won't be
passed through to cpu->cfg.ssaia.


Daniel Henrique Barboza (1):
  hw/riscv/virt.c: check for 'ssaia' with KVM AIA

 hw/riscv/virt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.40.1


