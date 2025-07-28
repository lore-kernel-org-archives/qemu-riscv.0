Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EEEC83F26
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:06:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ugRJF-0001MX-Cy; Mon, 28 Jul 2025 13:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ugRJD-0001L9-NC
 for qemu-riscv@nongnu.org; Mon, 28 Jul 2025 13:06:43 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ugRJC-0003Ly-1k
 for qemu-riscv@nongnu.org; Mon, 28 Jul 2025 13:06:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-23fd91f2f8bso15618805ad.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Jul 2025 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1753722400; x=1754327200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VL/GpLMH7cGlZR162hdRsE5cfJwNx9PW5FkHzzwaK6g=;
 b=LrDKomG7X1/8gdltwlDvT2jm5ckrga7gaKgovs+ykGKCqEHzfOlJ6BG6Gsb6ZfITkb
 cr/i95ns/odsMoGaV/+/x0/Im9krZfuiaRSUgW8f8c0JRTGSoa0r9My/LYuqShJikhjo
 OhB3Bzp0lih9Pe5A6vQBkFFuPVFOF58kvh4h4Ye7t3eouv3Qbi80LmHyr0HKkxI0i4Ts
 fbZ6sDxEQftkV3uv2KA2qjKEuuh06MSKTP00cOQ2BiFDiklRQz2u2DcVLvph3m8tc3ci
 FcSMMmU27nTZHWUMnxyosQcoAop9d7C1dhiv/8rgwDzjnJK7b6u/xMWq9b1STH62NGaq
 vggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753722400; x=1754327200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VL/GpLMH7cGlZR162hdRsE5cfJwNx9PW5FkHzzwaK6g=;
 b=OTavO0br20eGYyvJWPvvrLOtyZES3wg90MxRIPMbG+Etazr6c9xKak2k3BBwXnDfH6
 nB0l2VaUGdP6FFHssidsGOg2o7PNbsUQbnY3iwrlydUt0AhKQW1dRKGk/bFLeP4NJPnF
 9jVsQHRCAA/8RGGuTA3xW8Xk9AEfqobh2FE0g7uLIuuw7AWuhCw3s7gVJX/7wi/US8Ol
 LHo000dBCt10wapg48vxETOqFoFBSv4nKr39tszeqHtquZr8tx/BRkQZrJDbjPExtDY7
 IyoVuDEmHrcT1NQ0/xSuZOJPILMSViLpa/UWljFM0LW5k9fonmOaQg3+8HvvjbkpXjBK
 k9tA==
X-Gm-Message-State: AOJu0YxB1DmG0CKyAW7YNltuLgsUqoxANtamtL01KhrOYwGNzVfhAB0h
 KVC9Zq0gHYAfGmWbu6UHwbB4H0NqDsT2RiFPsvz487Q5Snf3XS1UzbOf8ZZ9hyXRKYvZKldx4dK
 CLTLn
X-Gm-Gg: ASbGnct7ikaRN2bkKiuP9i+IKwR85hRn06WxdKZsTJJL7jVBy36fRC9jUC5Rwr+nZu9
 Ny4EqDtgLLd/TZaSMQT3xBfI6sLn/XbcH8qT90JANYDo+sO1l2kly+OLOgcmo2FeagFo5BvbGAV
 wXb0F15NXGULnvIdfqY1yBoDGxI1UJ5kF7ElSQZekA2rK7nq1hsV9MNbUiX1bdXYZ/gKfwmeAH8
 Aa8SnI4eIibGjRdQSflLPR/Q8juD58Qf6GdukoQ/EpkIYWoPbCy49oy3tokI+aVwtqdvonvZ8hk
 UbecRLeaLCnzXb1inI7xyI1rspFKrOu3Se+RjOba08yReIwFnpKGCC8kFwmh4CWZwAaHJOjMFfX
 V6lpZlK1opWf3zl0fTM5CPyT9us+kVYaBchS+4WoiF0zO6nYHcmM=
X-Google-Smtp-Source: AGHT+IG70zqOWyA/ft+aW7WeoMJ705Enloj5cXCbVPHkEDVDmalblQXdaMCDOsZzp45k3W93HTCa3g==
X-Received: by 2002:a17:902:d607:b0:240:11cd:850a with SMTP id
 d9443c01a7336-24011cd898dmr66764625ad.11.1753722399693; 
 Mon, 28 Jul 2025 10:06:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.170.118.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe571652sm58682655ad.196.2025.07.28.10.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 10:06:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] linux-user/strace.list: add riscv_hwprobe entry
Date: Mon, 28 Jul 2025 14:06:33 -0300
Message-ID: <20250728170633.113384-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

We're missing a strace entry for riscv_hwprobe, and using -strace will
report it as "Unknown syscall 258".

After this patch we'll have:

$ ./build/qemu-riscv64 -strace test_mutex_riscv
110182 riscv_hwprobe(0x7f207efdc700,1,0,0,0,0) = 0
110182 brk(NULL) = 0x0000000000082000
(...)

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 linux-user/strace.list | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index fdf94ef32a..ab818352a9 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1716,3 +1716,6 @@
 { TARGET_NR_clock_gettime64, "clock_gettime64" , NULL, print_clock_gettime64,
                            print_syscall_ret_clock_gettime64 },
 #endif
+#ifdef TARGET_NR_riscv_hwprobe
+{ TARGET_NR_riscv_hwprobe, "riscv_hwprobe" , "%s(%p,%d,%d,%d,%d,%d)", NULL, NULL },
+#endif
-- 
2.50.1


