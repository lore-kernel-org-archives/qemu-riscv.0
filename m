Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AE3C0015E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 07:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJ7Pw-0008U3-8X; Tue, 11 Jul 2023 03:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ7Pu-0008SB-9K
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 03:04:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qJ7Ps-0002w9-JG
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 03:04:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6726d5d92afso4123565b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689059047; x=1691651047;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40LOwnc1UWDl12YW5Q5RKLcgakfGkbBCBb3K1zYDCDc=;
 b=nQP9pqZT6PCZ378cv3seUjxp5wCxsKkFIzkApO6rZTZrT0lTWL1gMe1Zv4jsCYq7mo
 KGjNEqtYISvHAK5MyKvHhTZ8CPDljl94ZEy+ksP2j+MVMJUYv7d2d0ZLjQFBj7bFoGE4
 DMlZj1EnQlqL8/hGUJYwMelN996KbYcPWtaF+Se4Ye2fvtAfWf456reZ+uo0NrJXT3Aj
 jVNj+RNQpwOswRJOAunDM+xKe1OUuKSGJmZk5NEtYPS0wt1aJwWdyE9rt7kmZO1mfT+a
 6GEsdoF8Ck2G60DKhyj5YgT4fXcCEwD6PzUn+thiXZb51ljtSqSNBv26rFw+YazgiAuk
 p9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689059047; x=1691651047;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40LOwnc1UWDl12YW5Q5RKLcgakfGkbBCBb3K1zYDCDc=;
 b=YzocJiZAUQ2sxH/Tx/KQDwe5drGg1v2aCUuht6HY3M/XzgUGpvveb83EEkqiDazKTO
 saxl9vje5BUR8hfOvtnss6KQJ81+3Zmz54dJhAA/yGGEUrFRs+VHAKHnfq7xBs9XVr8/
 Yksx2Sg2orE0yi6Jx+6o/PE98r4Fc/HQiiqUeUjTcSdYkJ+kq46j9ffgn8FYFPoZM7NF
 fIdsyi9uON35bFyW98vxsSW/yadRer7OVyEN/+8sEyc42ozuFURbfy1GyLPxW6jf6D6Z
 GP5zAeliHpw+tSBCGO6AkeIjaMtOzkRFXkdyPOa/EA0Uf0aMurh0otZ7/NNQyIl0b8q/
 X5lw==
X-Gm-Message-State: ABy/qLaQbTOkYTald/EwsrVnqHM8Oib9/ysfN5bXaS25U0dpF5bCahxO
 Qbm5VG6Ld4cbelb+nm/IaA9WiQ==
X-Google-Smtp-Source: APBJJlEPqH5dCcmRMNXhbuIZJJZBSeMscsGg1RU0qJrur/VR31zGVMI3uU/HEnUdnI91l/Te8TCkvw==
X-Received: by 2002:a17:902:d4ca:b0:1b8:936f:c346 with SMTP id
 o10-20020a170902d4ca00b001b8936fc346mr26264404plg.30.1689059046823; 
 Tue, 11 Jul 2023 00:04:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170902d35500b001b9dab0397bsm1078724plk.29.2023.07.11.00.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 00:04:06 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>
Subject: [PATCH v3 0/1] target/riscv: Add Zihintntl extension ISA string to DTS
Date: Tue, 11 Jul 2023 07:03:56 +0000
Message-Id: <20230711070402.5846-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x432.google.com
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

In v2, I rebased the patch on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next
However, I forgot to add "Reviewed-by" in v2, so I add them in v3.

Jason Chien (1):
  target/riscv: Add Zihintntl extension ISA string to DTS

 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

-- 
2.17.1


