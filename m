Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6E5CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 04:32:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkdFR-0002y9-1k; Mon, 25 Sep 2023 00:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdFP-0002xg-12; Mon, 25 Sep 2023 00:31:03 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkdFN-0007Wu-FT; Mon, 25 Sep 2023 00:31:02 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-578d0dcd4e1so3168539a12.2; 
 Sun, 24 Sep 2023 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695616255; x=1696221055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAADUFg+k/c4zaXXzz1LwvW/lPNv6yL8UJ70OyvIJA8=;
 b=jlEoysQhAqYTeSb0+lG4FbE7MAQBc/6K5kZ+j3sKnoU4WxyXhML6+pZa/1l3L0AIJK
 VEugGjs7NLEXKLW2xMk9y4SBizFbDu6x70f2n4l8dKJBB4r9/dSCpIbwN5QGgXmPLAH+
 rG0jxKa8JlTb/iU05L9bNNREjYb0arluIYmUOLlrVxw37eCnCM5+60Nv0diHESwnMWAk
 UI5qGo7O2/b3BVz59YfuZRxTTSqJpmnmYrppNLR7hz/LSHJswv9E3eFlkNhPu7ACwy6t
 reV+msMVNJgyxLcipByXZcvKeRst6B4Zmqp9c13FyQoIwOn+dycqT6yene8/V8b7/XoX
 y1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695616255; x=1696221055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAADUFg+k/c4zaXXzz1LwvW/lPNv6yL8UJ70OyvIJA8=;
 b=iBdQGfSJN3ZnJ9LqDBCVUaJOO0V2LHap6gYcRcvobMWOAiVoVteXC+q06v3YAuUGoH
 OaowJ4PhYUfTz0FTnKK19FCuh5ZFKphpBcKp+ZY8HHypbJmErC2A6sm6V0onShVuSgqP
 5tTiBeCkojQDSs7xYkjDiMBz73aMyJeqCm7i0TXNgYiFZ2FvX+8yxoM4uzSCZ7SfWs9X
 DNP31qsIpa7IQyGJRa5T/Mh/HVbpIO7GakSfYgWwhZmrbE3sIJZI5fUcxGnjxjpGbubE
 CVzSFxRFKM2Vder1ftcBf8EcMF1wod4Ve0GqMI/Ec+1Z91TKW34iwLE8Sa8yYsy0e59w
 fJ4Q==
X-Gm-Message-State: AOJu0YyS6T8Q/EWqSJKhTwtb0mZSdEhrldhJj+5j2imKjyl+xEVBk2yZ
 DL9jqfsq40BgqstB9tperzA=
X-Google-Smtp-Source: AGHT+IEQ3uqOWrJmW0WREHy+INr2DYbEVzgejDCnr7N+Mt0pFPTNPpOmdMKCSF5RBaw9tP46UELHlQ==
X-Received: by 2002:a17:90b:1d04:b0:274:7047:aa9f with SMTP id
 on4-20020a17090b1d0400b002747047aa9fmr3432778pjb.32.1695616254934; 
 Sun, 24 Sep 2023 21:30:54 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a17090a134e00b00276fef82025sm6002161pjf.35.2023.09.24.21.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 21:30:53 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: david@gibson.dropbear.id.au, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 alistair23@gmail.com, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, liweiwei@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 4/4] softmmu/device_tree: Fixup local variables shadowing
Date: Mon, 25 Sep 2023 14:30:23 +1000
Message-ID: <20230925043023.71448-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925043023.71448-1-alistair.francis@wdc.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Bugs love to hide in such code.
Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
on polling error".

This patch removes the local variable shadowing. Tested by adding:

    --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'

To configure

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 softmmu/device_tree.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 30aa3aea9f..eb5166ca36 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -418,9 +418,9 @@ int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
     }
     p = str = g_malloc0(total_len);
     for (i = 0; i < len; i++) {
-        int len = strlen(array[i]) + 1;
-        pstrcpy(p, len, array[i]);
-        p += len;
+        int offset = strlen(array[i]) + 1;
+        pstrcpy(p, offset, array[i]);
+        p += offset;
     }
 
     ret = qemu_fdt_setprop(fdt, node_path, prop, str, total_len);
-- 
2.41.0


