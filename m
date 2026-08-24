Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74C2C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 05:59:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNhH-0000VN-2C; Mon, 24 Aug 2026 01:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgT-0008W1-Jy
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:30 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgN-0004FY-2a
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:23 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84874b52eabso4048341b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 22:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787551035; x=1788155835; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5w0zTlYONzeGW1r7MUxxRRSGYvKItq3LTMlmC3GgUzc=;
 b=Q9jPr5EOuwGgJibDBM5PDQoIdz8V2XWd443tlg9jROeAyfpP2ZY3unu7+N29dyJ17Q
 ntqdV/DGql5zr3lx/cp/WXCXr9GZPCDAwVbGeI01b98A7BP22JtjD83Hqphtv1GeclS2
 wVjM9pkNX3u3vrL/TlGPwokholV7NtyFzQl3w3lilG48xTqX7O3ViBVjkCRH+RcJBfPV
 yjNDLJfNb2Qw02Fq6axGyWtnyIWCTmNQG7slz+HH0g9pz/B88/2rpkVkLqNhHLyMjdHI
 MXTrd9ZBB2u7TrGXfvFi3nQ/IfJ24pxSCu1tfV0x4tEVSn4tMvy6P+iPBMaqDPchOiQs
 iNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551035; x=1788155835;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5w0zTlYONzeGW1r7MUxxRRSGYvKItq3LTMlmC3GgUzc=;
 b=G9YQ4gmD20D+ZMSFWztWZHEIStjSuOMZgzLAcCZDZZZUMEhtmpYmDHLrzW1rTG98o6
 TX5SySynRsRx1npx75ThA27JOGZHQwwxDY+XwbYIEKRS4n0sciabcTdr2W5fuC+G1kxW
 /I4AfBINDFT5THJcrrdCrFaJKSe9M5wq5Kzinvqbji/E5sihVFtvZQjbOVpsMEBQG9NX
 r5bpkH+dSziUwtILELimza476hZ+YjezyyGKNTyiEshrDrA+sfCxzfSAFslm+xbnoSMB
 Xy20vaGuEmBVn+0yvVr93s/5l4zIDHkDMOB6Trv178t/SUwdSH7sVJaA4s9t6k25f5BX
 +FtA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrwBVKNP6Cmc9ZDtu6Zwi4wSqhcV4TvUNrOLrnMlubhGhgqWwebd6LFdMetgzUcjZcwMx3y8I6XeIg@nongnu.org
X-Gm-Message-State: AFuF++kMADleHZVDtZ9Vl7xVVhUPYwjdGeskdw8BOuhPD7DLfNTZFT1z
 pl+ODS2fAn6oOpEy5loetRGKLd5O5sqCCuPsr6LLUvqoUC1RYYAwGnrV
X-Gm-Gg: AR+sD10b7Wi8jMjneVWueSlUygHx5Tf3qDJo6Rd5Tys8iAISxNw9QLstpoifIhQEr2S
 f/QaVqaG63HBnSaYcZq9u6r+7jjYTycnIt8XeOiqGLxR8Wp7jfISTbLyceYn04tljvk26iSRpUs
 LARkN3OMRWaD1pa3wLBpst3vp9vnApLLWT2Vq4PJKNkhbH8P4dFd89ZiOH7Wr6nNw5FmWnOW5zT
 dm8UowaaiWN4EQWJU+nU3GyULPTzt9nH+GDcGZTW4/Hg7cab32/YwOGAX9xo6wEOPQEkIQuqpP+
 5HXufaGKop+o9nKXr0e/XxKD+WT1fd6787eZbXpJRVszUdDlQjNyBlci8jsbIOQ6zkpW7QAFmLA
 +V+ptfrBnEjmhrkfpNi6Fun98cIzF9Rw76meZqGjGMgQGYvCgPKC+Q7a3soG9M4cBlbNYTvBHFs
 nCD/BZh9ucoAT6eTOCwpVQTVvuVq/3/ILqpwMH1OkikenEaw/hT4/MaEnfc8SCrjcJESB2wcZXp
 p68dQ2kKuC9OJeFhIPSbuKN3rO84GmdPgbD/AIWof1EBsfdlsOLoEipnCaWQdyTxMu8VEjfYJgj
 YqlgHZSw6W+R0Jn1LVqZOw==
X-Received: by 2002:a05:6a00:7497:b0:851:fb36:a702 with SMTP id
 d2e1a72fcca58-851fb36a9f2mr34795777b3a.9.1787551034897; 
 Sun, 23 Aug 2026 22:57:14 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520f03b494sm1583474b3a.33.2026.08.23.22.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 22:57:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH 2/4] hw/riscv/virt: Use hwaddr for IMSIC device tree address
Date: Mon, 24 Aug 2026 15:26:38 +0930
Message-ID: <20260824055642.41098-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824055642.41098-1-joel@jms.id.au>
References: <20260824055642.41098-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

create_fdt_one_imsic() hard codes the top 32 bits to zero. Instead take
a hwaddr and populate both the high and low cell.

Suggested-by: Philippe Mathieu-Daudé <philmd@mailo.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d58656f70d1b..b91d5066d8ad 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -383,7 +383,8 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
     g_autofree char *imsic_name = NULL;
     MachineState *ms = MACHINE(s);
     int socket_count = riscv_socket_count(ms);
-    uint32_t imsic_max_hart_per_socket, imsic_addr, imsic_size;
+    uint32_t imsic_max_hart_per_socket, imsic_size;
+    hwaddr imsic_addr;
     g_autofree uint32_t *imsic_cells = NULL;
     g_autofree uint32_t *imsic_regs = NULL;
     static const char * const imsic_compat[2] = {
@@ -403,7 +404,7 @@ static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
         imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
                      s->soc[socket].num_harts;
-        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 0] = cpu_to_be32(imsic_addr >> 32);
         imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
         imsic_regs[socket * 4 + 2] = 0;
         imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-- 
2.47.3


