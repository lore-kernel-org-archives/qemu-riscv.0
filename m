Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2E4EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 21:22:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEz4w-0005y6-4y; Thu, 29 Jun 2023 17:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rory.opensource@gmail.com>)
 id 1qEyzo-0004C7-U3; Thu, 29 Jun 2023 17:16:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rory.opensource@gmail.com>)
 id 1qEyzm-0003A3-N4; Thu, 29 Jun 2023 17:16:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b7f2239bfdso9802385ad.1; 
 Thu, 29 Jun 2023 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688073363; x=1690665363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7X9d72BCoA+Ohk3weR16JViqcFRwaA3N9SBHVeZFH6E=;
 b=RIE7VIkClRMWkwm90Y6kQU+z5yAGq5yfB4Xy5eWpdMirLGhB4L9J7w5/55wI0BFGEO
 MXfZIDhxUvQRomKz4cskDdYdS8KaqTcDW7ugwkbspxkE4esFEAApsuepkiClN45Jxg+a
 dw661TD+xlSYs9veCt/uE7j5qBtL3ga/PXp97FyNhLOG8GPme4tLm/DI8dvRS816dA80
 m2eHktm4ZsjNapd/Lb0QMOKSIijdUapxEjTz83BMN9SPRAaIrK6OVTJNfw7sK+tAY8gO
 zumJBehaniMl+No6pDNVso337JiQes6YsZpfpCKRSvdZ0b6v06XpgF1VGxClr6RctUGp
 TuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688073363; x=1690665363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7X9d72BCoA+Ohk3weR16JViqcFRwaA3N9SBHVeZFH6E=;
 b=SSeEB0uVjeCyZ2+2G1PaowVp+3whmfMFrLMDrwKICtOeLJmeW8YpN8UVSgDreoNWKW
 2RSjzeEy1U5SZF5R0vRwDqLqvdxhIpNtP7Q7HeEPts72SOilHaYh7VYM0uXgoin8scmT
 Clp8E/gDZWCUjw2gD2xQGtTyAUVZAyveBAO/kxylLYmqoasci8Yh/Cllms0uxBLcnJvh
 BJQhNib6tdPkOxiRL4b6dLF7+TfVhv3MDQN+l3t6p+WDo9AI3w4U6I6Re9edEgNSwBdf
 sviDJ0Q8+rK+0srAmyLhMPI1Qj0QOo/FgmtJ3gc3kE564jn7Yv3wuN9OnWZ1fWA8yo+V
 Eoqw==
X-Gm-Message-State: ABy/qLbWjdVC8uBE+sma6XLLUnKooTOfBTE7YFPamZfL7JlKsofrFHxE
 K/Z0QQY4cJCwg9mOZdRtARGMA7srCPmi/g==
X-Google-Smtp-Source: APBJJlGRBMR25QzzxyaaKgE41VhdsbOlDys9gsma/8YAE7vg3Tt9eO5V8sc+LEAUyF4+BX85ta+PLg==
X-Received: by 2002:a17:903:238c:b0:1b8:11b9:d3e4 with SMTP id
 v12-20020a170903238c00b001b811b9d3e4mr321618plh.53.1688073363490; 
 Thu, 29 Jun 2023 14:16:03 -0700 (PDT)
Received: from arm80-riscv-dev.home.arpa (cpe-76-91-194-167.socal.res.rr.com.
 [76.91.194.167]) by smtp.gmail.com with ESMTPSA id
 p9-20020a1709026b8900b001b83e5ec666sm3046176plk.6.2023.06.29.14.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 14:16:02 -0700 (PDT)
From: Rory Bolt <rory.opensource@gmail.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Rory Bolt <rory.opensource@gmail.com>
Subject: [PATCH 0/1] linux-user: add support for big endian variants of riscv
Date: Fri, 30 Jun 2023 04:14:08 -0700
Message-Id: <20230630111409.2819-1-rory.opensource@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=rory.opensource@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Jun 2023 17:21:23 -0400
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

Rory Bolt (1):
  linux-user: add support for big endian variants of riscv

 configs/targets/riscv64be-linux-user.mak    |  7 +++++++
 configure                                   |  1 +
 linux-user/elfload.c                        | 10 ++++++++++
 linux-user/include/host/riscv/host-signal.h |  3 +++
 linux-user/riscv/signal.c                   |  5 +++++
 linux-user/riscv/target_syscall.h           |  8 ++++++++
 scripts/probe-gdb-support.py                |  4 ++--
 scripts/qemu-binfmt-conf.sh                 | 12 ++++++++++--
 target/riscv/cpu.c                          |  5 +++++
 target/riscv/translate.c                    | 13 +++++++++++++
 10 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 configs/targets/riscv64be-linux-user.mak

-- 
2.39.3


