Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E9AC2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 14:36:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uH1ad-0001h6-F6; Mon, 19 May 2025 10:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1ab-0001gc-1Q
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1aZ-0007PZ-0d
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so4659499b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747665332; x=1748270132; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40itAGysfNIjQ/fzPkWnlZm6Ucscvk9farBtstKM3UU=;
 b=BR4joDmEDv802Pr9fJ/9ibagX99jRxqu3v+YLdV87nVgB5DgxwlkqnufT9opF4125W
 ERBBJa8rI3I7YYnAst16pydV4mEQomLO/CaJT+vGz1mqIOFNnIMuqdxxdo7fXpHzCs87
 BkxoRf+EvTphvJ8LMgfraklzyJoIuDbVxo95zsbW1Nm/mDNmtZ8KUqZ/sEiGX2USG0/w
 rJvm1WTlilxLqqi4z9k05baOVq+e4MBlO5jgtzalDLCjWS3UkrJUHmSh1ajzzYCAzVn0
 1kaIYaB1hnSUYeplQkIIkvF5xGmYLaAWUpUJvxCyWEfHyUCoONoxnziH8uKYx34q/YzS
 n2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665332; x=1748270132;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40itAGysfNIjQ/fzPkWnlZm6Ucscvk9farBtstKM3UU=;
 b=c0nAtTjjVXJpm99NyGIt5liNRr8LTbqM3I17NuydwqjPpLtJxBT0F8+52/Fjy0Gqm+
 2US8IJRUrjlRAoryxssab6wdUm9vjoXBdaj+5dofWnEt6qWyTtkiglg5E1iFK190K8FK
 Rnk9n8LxufTDzzKxdSXsNL2z5jRu+6mDOh2Nkv+eG0KyHlZDAL2Hxf4Z0HApf31I/jjn
 m0fSnBf3xIX/RPVCYTOD4uY8IuZH1Q+LNY7chsEjbgN3K80vDkPmW1cU30GhxpXZzc8U
 WQ+zkboOTB+C9QfR7tMxrp6+2fIPW1V0V8q2JFJ0ScYQzlRIPCLzznna53ZsExy7dbxo
 FEyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmOY4lUQpiEAbw5X1UHjrNvYuemsNKusylMHjCmirIFCXlnxbP5k/7Klg2TuhkF0Xp3p4CDmggFAym@nongnu.org
X-Gm-Message-State: AOJu0Yy0yMI+diJxUt2FrJab2LPn30i4g94r+md+LqWm89UtBnMh9Gu+
 Wa9ugyWdopFYO3fBFmwaUWH19wd6Gtz+zSrT0CCe6XRCpaVZwtZsxt3bWbvs/6vulJI=
X-Gm-Gg: ASbGncsMDhG/Zxl11JpoQ1LoWZ9uUkLyseaFTisMmHd1HS/G6bfPZoZPd8WbDZGXfRn
 7/YXRyFFKraDRBICR2MLizvnvK9RTjMyVG/lMWoBRio4Ot7yhy80Wipb9lcNkf+bzsUkCuQlvva
 U8QQu1e+2yCR4KDgNbyihKLKPONlDMc1Jrr64jqEMhb0JerlKr5uteBpyLxeBv/uL3MET3aVKl0
 0/nUupAn/qn9xK4qlRjDeijAMjrZkZc+gpmi3KM6uuTDcDTswojrWuA63fGtgEr/Ba/J5iD+AM7
 82WBxcJdNZY50gMLZRuLKHsj3x/ZdGcPaevRR4lh5BR13GD97k7TZ9TxR9G0tlK5i0nnOK2wAw=
 =
X-Google-Smtp-Source: AGHT+IGB0MMkDMsUlLrVg2uQHdqGcIangQnghRhV442caTvr/+OcTNSr6IH0wM7pnYPP4fcbuIfgxQ==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:80a3:b006 with SMTP id
 adf61e73a8af0-21621934388mr20108307637.21.1747665332368; 
 Mon, 19 May 2025 07:35:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a32edsm6297683b3a.162.2025.05.19.07.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:35:31 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 0/4] Several sstc extension fixes
Date: Mon, 19 May 2025 22:35:14 +0800
Message-Id: <20250519143518.11086-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch series contains several sstc fixes:

(1) Writing to ACLINT mtime should also update the period of S/VS-mode
    timer, just like M-mode timer.
(2) VSTIP bit of $mip CSR should check both M-mode and H-mode STCE.
(3) Writing to STCE bit may enable/disable sstc extension in S/VS-mode,
    which should update the timer and IRQ pending bits.

Changed in v3:
- Rebase to riscv-to-apply.next

Changed in v2:
- Remove duplicated code in riscv_timer_stce_changed() function
- Add sstc spec description in the commit log

Jim Shu (4):
  target/riscv: Add the checking into stimecmp write function.
  hw/intc: riscv_aclint: Fix mtime write for sstc extension
  target/riscv: Fix VSTIP bit in sstc extension.
  target/riscv: Enable/Disable S/VS-mode Timer when STCE bit is changed

 hw/intc/riscv_aclint.c     |  5 +++
 target/riscv/csr.c         | 55 +++++++++++++++++++++++++++++++-
 target/riscv/time_helper.c | 65 ++++++++++++++++++++++++++++++++++++--
 target/riscv/time_helper.h |  1 +
 4 files changed, 123 insertions(+), 3 deletions(-)

-- 
2.17.1


