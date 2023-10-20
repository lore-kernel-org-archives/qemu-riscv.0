Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C40C0032E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 20:03:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtvi4-0001uh-JG; Fri, 20 Oct 2023 16:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtvi1-0001qg-Bq
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 16:03:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtvhz-0005TD-Nn
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 16:03:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c9e95aa02dso9893715ad.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697832173; x=1698436973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FiZoq74TPTmMRyxQSBZ7ueLr7YFQJ1nJ6tSEflBj/Zo=;
 b=QIYAFkMJ8Yjf0p+hvwQGaBTTuVBgawJd+IzlGjbotdW3bvbcrRnrhvoP95IukHfCbp
 0JRuv3pkP7zZSddosZlM9sX/3sUPB4DR3piAbFKbeh5q9B4CPIvZ6lzLwTemzCWHzKV/
 1AF0MPeB59qbfxgWrgrv4DoWfgOaA/5TfVHPC4oraAAZiCarKKVbxU9rvwB79G0b6O4c
 DU676wVlJDUyae/XpcFDhPIyB3bn9nUKEACmrijklcT/a/UHrbteFu+b3DKxG8seCI+X
 mpD6BJgHIdlfZctbsCutiwgJ9GHJhlOX/VWOCv30cxUIFONbxrXMqaX9jZCehQpXG3MF
 22Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697832173; x=1698436973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FiZoq74TPTmMRyxQSBZ7ueLr7YFQJ1nJ6tSEflBj/Zo=;
 b=nuqU54H1Q021a2DF34CCsw8WO1g49pPXmYQTwMDKDjJohaLViWL/eKFKOuLAAaSbrZ
 J9yLgo1RvqQDl+4jqYNQ2m8t+BjcGH1k1/k1sQjhQVhoKx3NtOwAUbqbPsYhlgEWTo7B
 MuQBccudKmG3749QnrYr0L6uuiL5O3lliF87i5xOg8LKB7vd1YWFlJO07Z3pnM4Ewhmq
 Hbg/x6MrgG9uq8x/nR0I9Nm8VoaAPExqEG6qKqO5uPVdPtgNfMjVO5sqytASfYedzfV4
 IfvdsJVCcENjjzqRIm2eUQ2hPFcCTMTx5PO5Hi7PcR3ZaT8Z4lHX+RLsnQ2BPIC34Bfv
 qXiQ==
X-Gm-Message-State: AOJu0YyaMf2q7orxzuyRutPixtCgvM/IUu05aP4uUJaLYFYkf5LiHdtg
 sLNt7rDHyczLwb+PbWXfavsoPQ==
X-Google-Smtp-Source: AGHT+IHbotcB5w/GPPy+e8Zx2cDEnN1mqV+4STzET21bdO7oXWKAIQwb2UqrB2pdwgYSCINz56pajg==
X-Received: by 2002:a17:902:da8e:b0:1c7:36ff:1feb with SMTP id
 j14-20020a170902da8e00b001c736ff1febmr8571183plx.17.1697832173587; 
 Fri, 20 Oct 2023 13:02:53 -0700 (PDT)
Received: from grind.. ([177.45.186.249]) by smtp.gmail.com with ESMTPSA id
 b11-20020a170902bd4b00b001c9d6923e7dsm1890680plx.222.2023.10.20.13.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 13:02:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/1] docs/system/riscv: update 'virt' machine core limit
Date: Fri, 20 Oct 2023 17:02:46 -0300
Message-ID: <20231020200247.334403-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
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

Hi,

Re-sending it with a more adequate commit title.

Changes from v1:
- change commit title from "remove core limit from virt machine" to
  "update 'virt' machine core limit"
- v1 link: https://lore.kernel.org/qemu-riscv/20231019134812.241044-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (1):
  docs/system/riscv: update 'virt' machine core limit

 docs/system/riscv/virt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.41.0


