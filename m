Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA466C4707B
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:14:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdH4-0005zV-1w; Sun, 07 Jan 2024 19:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdH3-0005zJ-5O; Sun, 07 Jan 2024 19:13:49 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdH1-0000J6-Gf; Sun, 07 Jan 2024 19:13:48 -0500
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3606e11d9cbso9816155ab.0; 
 Sun, 07 Jan 2024 16:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704672826; x=1705277626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6qFn/mU863Y6eJbLzzbeKxrgve7EDyIX8A/fR2qJTE=;
 b=jnifR22zjzcjXA/iS/2QlWFNNG4QhQK35OczxD/ZFILkySec5uvgYICS3fKcP2kvSL
 /4H6RTo5GVqM3MTQqlP0EouIEfu1CWRUWBPGniV1uluG0U+vjoM7/jHPbTIt71hR4B7y
 VSCItkI9nlijX3q8Dj+RapmRqbzB1AnQbFFzOUMgSJT4dEtSvZf8Cv/wUQL1STzatZOn
 Iki/SO6+FaxUDK0UU/Dy7kxTS4koTzZQ7jXFnqBtqZCgbQ8t/LZ4AzEBmOOqVmrvwliR
 BtwrApMhQqv0phgIkIzxY4lPBYZDxx0YyFb6Qt+Lm9gwV6k59hRihgFluq2HZLFOdtYX
 J4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704672826; x=1705277626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6qFn/mU863Y6eJbLzzbeKxrgve7EDyIX8A/fR2qJTE=;
 b=pVz+Mi+mWu+zIv8RrlUCCZWvwcJ0wtmxmUcLWU1YdieJhCKMSHgozGdfiLbxM7dHx+
 kNoyVl2RucroyFqJzDJLUPzrq6txVWBXxJykh8YmHSTkW9xV+UrxEVNmH++SKZOeymop
 MURnAkAVchN13apqJzqm2tvcd3i9R7VO/rgm0lp3Ecw05U20OuNXoCkYK40vj3gfkjAN
 4X03a7kecURgW0OgYMEE0ykPa/2c2PNMr9DamC0YBlnEoRlkH6pScuwrFKh+72CbaOmW
 cnSK2JXwedVVWxDYB5qQISkImlyJ042nO0B/hIV4NUq3HndzLG42KVUnyR9EnfE7VEaZ
 Oocw==
X-Gm-Message-State: AOJu0YzkWwtLoarpJYvfE9a2j51NGRE9pQra5bXwiHD/WryPK2AD50O/
 KZAtXT3qCdTuWoX4eyaDR0I=
X-Google-Smtp-Source: AGHT+IFTs2HaEKoZrqjErG4QfDVra0ymDxIYgAM9gKYQgE0RmDuCm10BDN7er7vfcZk+xrTin2u2Hg==
X-Received: by 2002:a05:6e02:330e:b0:360:5cd9:a726 with SMTP id
 bm14-20020a056e02330e00b003605cd9a726mr6698449ilb.22.1704672825946; 
 Sun, 07 Jan 2024 16:13:45 -0800 (PST)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a170902b70f00b001d4974385d4sm4943434pls.250.2024.01.07.16.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 16:13:45 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 dbarboza@ventanamicro.com, bin.meng@windriver.com, qemu-devel@nongnu.org,
 liwei1518@gmail.com
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/3] target/riscv: Don't adjust vscause for exceptions
Date: Mon,  8 Jan 2024 10:13:27 +1000
Message-ID: <20240108001328.280222-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108001328.280222-1-alistair.francis@wdc.com>
References: <20240108001328.280222-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We have been incorrectly adjusting both the interrupt and exception
cause when using the hypervisor extension and trapping to VS-mode. This
patch changes the conditional to ensure we only adjust the cause for
interrupts and not exceptions.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1708
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e7e23b34f4..886a558a42 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1749,8 +1749,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                  * See if we need to adjust cause. Yes if its VS mode interrupt
                  * no if hypervisor has delegated one of hs mode's interrupt
                  */
-                if (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
-                    cause == IRQ_VS_EXT) {
+                if (async && (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
+                              cause == IRQ_VS_EXT)) {
                     cause = cause - 1;
                 }
                 write_gva = false;
-- 
2.43.0


