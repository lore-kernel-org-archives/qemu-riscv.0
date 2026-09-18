Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77996C982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:08:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7M8g-0006sy-Kf; Thu, 17 Sep 2026 20:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8c-0006qx-30
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:07:34 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8a-0004xt-Gi
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:07:33 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d91ede8035so1898985ad.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789690051; x=1790294851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oBMRBBSVYhuVagEH9MTyYgooh4obneZYFeG93/UBHbo=;
 b=rW7ccpA/QN4Nltt1nREMT98FSfbtUgQD9nvxSE4X5k52xFrL1g4ByTK/ut5arcP1sl
 Jh5FamRLS5ihaVn8FBJvulYX+JiVm7wL6UHn5K1rjRAqUav6uk2fpuVhbYOUIb7ZGDhe
 f/HvJJN8cGuGp8EvzR2o82AmmSfiT6wrDQg0YAY0NZNI8kEZjpvAqMw1sChkWjicJRVt
 D8iTXsKWaMd/EblK8wj1i5uDY5w+0gf4xvnMNyjSxDPRyeDYMK4losVrX6Mo6Odx0QOM
 M7DbuS0hrkmmrhSa0Lie3json8mNOARqJaBqXgBXZgsldmEJN6fwQZkl8O7RCwGnOI19
 7GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789690051; x=1790294851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oBMRBBSVYhuVagEH9MTyYgooh4obneZYFeG93/UBHbo=;
 b=YS/l6W5vhT5q0f6ySWR9y4o1u4eaDAH4TCDLlijIIriP6TyC4KbrOz3++JUdjaekhD
 pi2p7TYTzMWoPkRE8/Uhyz0PGOWttSZlJVFAdPqqS2v5MmIqEh+Q50eMSWPUqT6S3zMe
 rFeQNasLkFJKX63KwFobVx4Yi1wKQoDkntC7M12FWX34icZVYd4haH9u4oD/4s2mOaRw
 bTIbNRL8jPU6eoH04+MJuh6t/zKZG+zeS+JkraIc/pSyoK0sWp8jMfZD7pn8SW8xlKHo
 cgDn6MC8DvWiaJXbo9YBf13MD9sS7Hqi6SiCWpU3xT9RjNVEvX5mvwWLaOJF/5K8Irej
 1ETA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxb0CDVKxkZWF8MUSGF9b/97/mqR/nPc35/pFQ4T73++/iKtexw+bF7wG2mcfB0ay1HDIwkMRPwy798@nongnu.org
X-Gm-Message-State: AFuF++kR04rYUsFMsGeC/PNIr+ngNX61TK86ZA9AGqbNO08RN/MbC/VX
 N9jey6wTXA/N7YTu3+EYZICq2ibo9xXbLaM+v61HH9caQGr+GL8Xa1C8
X-Gm-Gg: AYBFou0Nni6oq/Ro4vPEtk+63kRa3sLIK6arijX2ZFryllr46LibYDkFA07J1gcmE+I
 pq2C3ZYQaJBBSirDGV6S5tED9oYsMcYCnqcTq3SV0ex1xTHRa5SSVHfdn2Mf13PqUWVZOPIVhvP
 dO2T2bUrkj8i4QaKYTdql3AyWaZUu7Np7kdsL6gvjZxp6l2Fcm+NvtdBU1J4QSvspRzbDgswNgi
 giSufnzpxVPKinvoXPevtYXAd7rwsMhNxJDPp7Rhbs/gc/iFBO1iK5zemQlAAWc3uKNqbqM37SY
 teaqRTga/ahOA6qEMPBxb5FpKzK6+mmN0lXghzIZQBajDNXRj1yAp1d2S2KpWJAYuwVtXqG0QIB
 RiYGjJ4HnsCYv8e210wcTBbkAcYw9pHTM91JXk+U7QyhlClduUEXPTpEgwdhtr1ThCetDy4wxa1
 O7bc9n6ho1JiIRuQ0lbqutOYAX5ftP64jDhBUULclYEX3ENH1JAJoPk/v8jX7SQ2laD0jU79TX5
 0z9I7vlMhHp2qmKkS48EI3UUyxwU6UFNhfIQ01jvvE=
X-Received: by 2002:a17:903:124c:b0:2dd:ad74:ac84 with SMTP id
 d9443c01a7336-2ddb1be0d9bmr15362295ad.31.1789690051200; 
 Thu, 17 Sep 2026 17:07:31 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33bf5b1d335sm20328212eec.28.2026.09.17.17.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:07:30 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <17746591750@163.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 8/8] hw/xtensa/virt: use unique QOM name
Date: Fri, 18 Sep 2026 08:06:39 +0800
Message-ID: <20260918000640.1001-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918000640.1001-1-luoyonggang@gmail.com>
References: <20260918000640.1001-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Register the board as xtensa-virt so Xtensa virt no longer collides
with other virt-machine types in one process. Keep the -M / help /
migration name as virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..dc5b255b9b1 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -118,10 +118,11 @@ static void xtensa_virt_init(MachineState *machine)
 static void xtensa_virt_machine_init(MachineClass *mc)
 {
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
+    machine_class_set_name(mc, "virt");
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
     mc->default_cpu_type = XTENSA_DEFAULT_CPU_TYPE;
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+DEFINE_MACHINE("xtensa-virt", xtensa_virt_machine_init)
-- 
2.52.0.windows.1


