Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65157C98309
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 21:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x98Tk-0004VC-RJ; Tue, 22 Sep 2026 17:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Td-0004RY-At
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:56:37 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Tb-00010Q-3Z
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:56:37 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd04edb5so362284c88.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 14:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114194; x=1790718994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oBMRBBSVYhuVagEH9MTyYgooh4obneZYFeG93/UBHbo=;
 b=bVxRpQpERLcdEOCnU1xyAW4QzUxzqAnEZMAp0tNAiIkEOZEwYtangHcDWqwMDuZP08
 EKAqJEdwMDEiYENWuDT34MgyQNU0OfTYAWEPZEH9KhLBTCWmdwLfo87EHmo3yXdEb7iV
 kU6T2+zwWjgAydxT0FQpVfv+K2QfTSfVc4m1tHTFv7rdUTJpmAfttRGAoGuV/Hged83l
 07hT3XciHpVvJSsBar23+OibW88h7l9lRmiOrL8d8GzMVOQC3gk/OSs4dSwuZ9zjlhVL
 PICe8gTOHjW0gMfdvvXi7eANibcwST0TW147Pi0kZ1qgQwjiclusfK3dylQb7pb5vOr0
 Gm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114194; x=1790718994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oBMRBBSVYhuVagEH9MTyYgooh4obneZYFeG93/UBHbo=;
 b=nd2a5qHHyc8AoClU0US1YQKN1QihyfTHRc5D55cVkRtEashJDaOy9765Ucn5+ZKrC4
 EPQOu2YWMiyKKquflyMBBfjTVURTCobP2osVeOLBR/v4AmtUu/bxMfzyNJ0Zk1ojaOVW
 ZvMRY4f6CtWKdEWT5DDGA/Xf5beZ6zwCSIUuz2Z/lXO1dk084TZQXGlJI22pK8GGUQDa
 PXYugGg54EZJsnRYjnP3O03llTr2w+q83FyAfJcF4WP9Ix8dHGUSbz8hcLCHB9vczUOy
 o82UqMZnPLl/WKrpjxr+AeyUltwTmA1z7gxx1Aj7Vqh5ptuW70aIzz0OCYnb5jVrOI5e
 0tPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzryUnoLNz1uqGI2NgosD1DgzUCqBQIbYBlgMt4Xl0lw6VzZAPw4S33Kpa3qcCpxD1tFJ0eTr/qL3SQ@nongnu.org
X-Gm-Message-State: AFuF++kcoxO8mXtKHrv30/h8ZmD8w9poCeuYkC8ioJSWvX3jF8ub59bG
 T+q0YkhsTaRcoF5n68XB6ctuFIYPF3hZz6pU6WfSG8m4SnfLL+4i7t6g
X-Gm-Gg: AYBFou2tiYunh9jhxNSRoE9fOi3EztXafm5U+5SRkPpMOLwII0/eQ0ErX+fMfZdcCwv
 y0VYmtE0QFCubgOwiZoGDYSEyvUAFbc5+3vlWJXELzPHAHxNbku2IOMPK23O84EbjWasySwFIsb
 9w12rWsFL7Ta/PEaDKUajDRZoTFRaeTnWn02clyxHoRNNkByZALK7HD/D/fhYSCBf/QiSkplhWZ
 sYkPZhI+EcB5nE/x7ezNy04KZygG8SFix0pzZFhKhqsJkdcEjRscYS97D15N0Bsf6o/9x13K3ae
 blgUFhUaVL/niCGuXa2zEgHulcP5gDlpoYfrJ4+bXTwyQ+DEFZD3b5BsGT7mrE7MPCcSk+ebhh4
 9Jkaen/78Q0cUqWHfnPLJJ7YLzyQhaIEVcNjTttV5HSgKW2Lzy51dnWkE82Xs8VFIzv9HGzITcR
 TSP3guZ30xFEZHRUZ7h4XtUTGMMzNSR+e0hwn4BS6jDmMbJCbRqVretKrhqjSs5Tb58SfiOsL2l
 XfCuitKqaLrUy23nCpYB2cIMt5D4I3pctxDi8tQkA==
X-Received: by 2002:a05:701b:2919:b0:143:57c1:6233 with SMTP id
 a92af1059eb24-144f9154854mr658595c88.27.1790114193705; 
 Tue, 22 Sep 2026 14:56:33 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:56:32 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 8/9] hw/xtensa/virt: use unique QOM name
Date: Wed, 23 Sep 2026 05:55:31 +0800
Message-ID: <20260922215533.641-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260922215533.641-1-luoyonggang@gmail.com>
References: <20260922215533.641-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


