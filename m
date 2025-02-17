Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DC4C021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:20:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwM3-0005mv-7L; Mon, 17 Feb 2025 03:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwLx-0005XK-UW
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:19:47 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwLr-000170-Bf
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:19:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-220ec47991aso36966825ad.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780378; x=1740385178; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDAvIEmpWpFT/aa/l7nf99wPxKKGcDh5A57FUObLhds=;
 b=KoM7RZqNHShrN3jS+aIKXF1/YSryOE6kWlNvcCP8DpFQjpt6JmbH1/++eulYj7gxsI
 zNb6rRK+SG380ikdjfpZjYSunwftz0DbO6H48qfuL+8JiIb3NkwQe53/oAureB+59Y1S
 5xDL4KPX+87Zc4JjVrlQIfogf6+6aQ+TpL33nPLP6ON6a3/UwEjzKa/rKNCtMgcCc8XM
 w1Q/K7xTjdfStRrnt343Y0bqDm2cVjthO+2mMfDO8vnu97jOuHkS9MVDFKOcAp3gImN0
 iHHubp4Ro6KImAgV/drhwd2mlGgbspp6Dnxj8nWOM0GurHGkgBpLN2Jjycdo3JKurvwq
 kinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780378; x=1740385178;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDAvIEmpWpFT/aa/l7nf99wPxKKGcDh5A57FUObLhds=;
 b=vA5lXqP3SH+Rwbvnhs9Z81MLpNw/u+tbt+UdXF4oaxr9KvXUubrcmh016qXKkxbh2a
 ihEeGYJMEkM0E1SxRCaW7J2uuDiZUlY3OxuZBW/82mlLKaOmRFTmbMlEeM+cjBgBDKEV
 Tqx6woTcRF1jLouMGecayU0bzxGsSKdEuo+WAGGkAODDFQNVcbXtqBQlUp40BSA7m8dF
 BxTaZuDe+CoI3jEgLmYSovnaGi258qLLjmyGI+RfZShfYEsxxNxxoZhWtSFt+fh9Y0TR
 fIhO6P963/6ibFOM3KMEYbMyxrWOemFDqGWMSCCC2ar2voUiJ0Sop5UEJzlp8AclLZWI
 WPDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv+g7VbMG+pwllULpWMZ9nkY6LzwamuRD0HSZ1XpY82PlB/9dtrVjgwFdm6eRjWBtNvbmRZpmGI8JT@nongnu.org
X-Gm-Message-State: AOJu0YyI7VFSKUnY0YQg+4dHYeWiYDRR0AuzuUxJXPC9PT16Uo4jd5fi
 YT3Mni1NgVpkPV2178qbzDJrZGB8JIO1yPtBJ37CYPMGrS5h+Fr91J2c+wbP4OE=
X-Gm-Gg: ASbGncvTmVwyUnHEk5MyttU6TVov1I461b/ZuUG3lZB5wC3C8XslXwD4xcaitOjpSKf
 4Hko2ReuzUdqjpWoGAGlMTy4BcFs3k/7pvxD6wYT9QtzINdycC5BJe1GJ+M/obph1QeKCt5B0sr
 2siI3eMYYONUAqyEe9zavnY1qCmqSOqPT9yQq8rTmB+R7FudFY2WDYgiakTgpUJoVybjdxwzTWa
 MnRh8hLZwLUXkFlWOWswaW5IhwWazd1HRTB7h0cNCg1PxTadrThdIwgD/BCRCVqUekXbh/9TEQt
 4Tr6X4ewD5zj9x2kbWNPGjX6kZRXZZCAVjavBFZ8VwNTGg==
X-Google-Smtp-Source: AGHT+IGVSAgiuDdPJw7fIZgiH+FLHuDrK75AnVxFL2DNppjkS8MubIX1kmvusJ8RTG+hRgPXGNC8nw==
X-Received: by 2002:a17:902:e88d:b0:220:cab1:810e with SMTP id
 d9443c01a7336-22103ef206cmr134473255ad.6.1739780376631; 
 Mon, 17 Feb 2025 00:19:36 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556d5e6sm66023445ad.173.2025.02.17.00.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:19:36 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 0/4] riscv: AIA: refinement for KVM acceleration
Date: Mon, 17 Feb 2025 16:19:22 +0800
Message-Id: <20250217081927.10613-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62a.google.com
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

Reorder the code to reduce the conditional checking and remove
unnecessary resource setting when using in-kernl AIA irqchip.

Yong-Xuan Wang (4):
  hw/riscv/virt: KVM AIA refinement
  hw/intc/imsic: refine the IMSIC realize
  hw/intc/aplic: refine the APLIC realize
  hw/intc/aplic: refine kvm_msicfgaddr

 hw/intc/riscv_aplic.c | 73 ++++++++++++++++++++-------------------
 hw/intc/riscv_imsic.c | 47 +++++++++++++------------
 hw/riscv/virt.c       | 79 ++++++++++++++++++++-----------------------
 3 files changed, 102 insertions(+), 97 deletions(-)

-- 
2.17.1


