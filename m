Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10FE7E657
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 18:32:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlCqA-0002sT-OJ; Tue, 26 Sep 2023 14:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCq9-0002rv-Fz
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:31:21 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCq5-0003tr-Rl
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:31:20 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-578e33b6fb7so6187815a12.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695753076; x=1696357876; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=grWWkqdcnEcul+2uzpufdVPfHu1Qwg/GgmNauuR6fm4=;
 b=S5cHqWgUCOzXJDfTWJi9LcisWqCn6/ptAE0+YjhDaAKbQWSFURPSqKQumoI4m/WnSR
 spG05Mlr8+UaVuI7TwR1eZudFH00yHka6B0Us3Cn5UTsc89A7r/lMQUD4ZpP2N3t737P
 Nf14Aim5CStH/6Xij/b0ezY2soeLcttEhAIWlOXC5ldbsk9WcRUsEBCpNgt5jD5Ve7yI
 gPlI3ZD2jG9AIfq0kSGQ3L/yGe+cv4R/1yHhIvb17qZfsHtYBOV9C38v7cKMZV/6WYU7
 JyLsfZV7Ha35W8fvTdV69j5OwPYA0GXQEywJr2Ablv2QgHmGUn0Fi564KkXMKq1wvqBI
 hC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695753076; x=1696357876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=grWWkqdcnEcul+2uzpufdVPfHu1Qwg/GgmNauuR6fm4=;
 b=L0w723WEzrhO33Bb+eKuEdfKdnzdtWn6vadz+8eARNPKXNijmFsNZumzOutGFyVbC2
 dUJQ0RxWzXGgTIhR/86HZ2Z+9G2iAPe9c2zljkNy2Ds4Uif0iKHuKVrMuYqd+5k9VsEb
 qP1EgXGBr+AwuC5+AnpRXCZLmmljLUVf/OTtvy7Nc6Jac/YtqKTJF86Tby3dXXgkjjud
 x8O89NwUTyd/qt/49rEi6ngrcMVaL45wMFjhBbicCOuyPVSVuLHJajJHjyHKHKwdCZmp
 XhvYydRFDbhuBkt+pZ7znCx+JuwMUBM8T19K2k38cxvwVNEXeqfQHFjv94FuqJ0dCriK
 cTxQ==
X-Gm-Message-State: AOJu0Yx5MZxWcIoycjbaPjubbW571KbTxrRmuF5UUB1zTNMXZySILIDg
 ARdbjW/tDN/+E+TIALJZg2NQ/02FlWYuRkGuFgg=
X-Google-Smtp-Source: AGHT+IHq17Gj3lYwY3W57g8m370twAUB5WDFcJ9NqltQ/im7scBaDKppScmk0eWD45zJLa/n8RDCRA==
X-Received: by 2002:a05:6a20:979b:b0:14e:32ad:3f3e with SMTP id
 hx27-20020a056a20979b00b0014e32ad3f3emr7221891pzc.44.1695753075852; 
 Tue, 26 Sep 2023 11:31:15 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 u6-20020a170902b28600b001c61acd5bd2sm4715800plr.112.2023.09.26.11.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:31:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] riscv: add extension properties for all cpus
Date: Tue, 26 Sep 2023 15:31:07 -0300
Message-ID: <20230926183109.165878-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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

At this moment we do not expose extension properties for vendor CPUs
because that would allow users to enable extensions in them. But that
comes at a cost: if we were to add an API that shows all CPU properties,
e.g. qmp-query-cpu-model-expansion, we won't be able to show the
extension state of vendor CPUs.

We're in a good spot to revisit this decision. We have the required
abstractions in place to be able to expose user properties for vendor
CPUs and, at the same time, forbid users to enable extensions for those
CPUs. As a bonus, we'll allow users to be able to disable extensions for
vendor CPUs, which can be useful for testing/debugging.

Patches based on Alistair's riscv-to-apply.next.

Daniel Henrique Barboza (2):
  target/riscv: add riscv_cpu_get_name()
  target/riscv/tcg-cpu.c: add extension properties for all cpus

 target/riscv/cpu.c         | 11 ++++++
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 68 +++++++++++++++++++++++++++++---------
 3 files changed, 65 insertions(+), 15 deletions(-)

-- 
2.41.0


