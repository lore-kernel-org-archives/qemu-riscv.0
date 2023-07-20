Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB60EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 13:25:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMTe3-0006Da-0Q; Thu, 20 Jul 2023 09:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMTdy-00068Z-8i
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 09:24:34 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qMTdw-0003aR-LI
 for qemu-riscv@nongnu.org; Thu, 20 Jul 2023 09:24:33 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56598263d1dso593860eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Jul 2023 06:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689859471; x=1690464271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qPOwvnef5qOMjQkH0REi4yq7z8sApVX3jbBtVHqEn7M=;
 b=Ne6AL6sWaLo6Y7wU5shQUK2cYVaHmyXSQeLVnq4ZXMLF6HCutRo0SIHR0aHpcbDz08
 0XlQJHacA6snY9wAMlg/lJsPbGM3RMf3OTuJkrCbLqFIv5LTXcLVPF0/5aK12tHrSujc
 i/8wPP1P2aeLlv0F1T5CZ+9qY9MuiMX7M238DUhRkSWkiFnlajF3A2eEBo4bp/IXeRe0
 ufPGri5oG0eLQxMiuLZTCynFV3sPxhRgOqZRcGP8X1OM1Or7iDNzrqakgV927RmBdBub
 DrAJd1hwvqzIyY5Seo5YwvfhtV2y1cY9aes5NM5epl4VQhHAfTwwOvAusdLyjnV5bQRo
 fFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689859471; x=1690464271;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPOwvnef5qOMjQkH0REi4yq7z8sApVX3jbBtVHqEn7M=;
 b=Vn4bg5tazEruHTXh1UfowIst/7i46GsQfl+WYtnPKsxQGWIAtnMV+6y40VEhfaVLu7
 0kQqmtXfgLsOW14XUE/mUJ9PGqRi0cD/Pz9Hm+qospdaECdPP91OCx2zpKqPakiRjQb0
 9Cfp06NtQUDTk/C/zC4l3BDrApsaTQkP49G6RuiaF9d8AV8DKUqNYLuK1eGA5z0bOop3
 +AI4nk2edyyLb7I9/d/Uy7FXZPMULXPh0nuCbJWAv8JGKMAPYT9Kyu4D5zl4+i449lrz
 ClIhCp6o2ctb7joa1QPRyAhI8EeZyfG6i8hHNtPGJfodSf3Bjvf6y4Z3lu5QZLVyxK8e
 VOlA==
X-Gm-Message-State: ABy/qLaTe5GJsc/cZFiXefWjVyg6NetLYCQU4hqDSrQAu3ysyLHVaUVu
 u+HnAazoKTnqACjxF9DeqB3Ngg==
X-Google-Smtp-Source: APBJJlGhIfP1myBeHa6WrnObDVHSBC6cTIQ5uWjRIP4/OuKjKvYYHRNIKD8upLMHi2KRMBUpkJdVaw==
X-Received: by 2002:a4a:41cb:0:b0:566:b483:ee00 with SMTP id
 x194-20020a4a41cb000000b00566b483ee00mr2061427ooa.5.1689859470854; 
 Thu, 20 Jul 2023 06:24:30 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 p186-20020a4a48c3000000b0054f85f67f31sm421361ooa.46.2023.07.20.06.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 06:24:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv: add missing riscv,isa strings
Date: Thu, 20 Jul 2023 10:24:22 -0300
Message-ID: <20230720132424.371132-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Found these 2 instances while working in more 8.2 material.

I believe both are safe for freeze but I won't lose my sleep if we
decide to postpone it.

Daniel Henrique Barboza (2):
  target/riscv/cpu.c: add zmmul isa string
  target/riscv/cpu.c: add smepmp isa string

 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.41.0


