Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C54ECA5FE2
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:05:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCdru-0004SW-7L; Fri, 02 Oct 2026 10:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdr6-00046S-75
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:39 -0400
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdqw-00085o-JO
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:19 -0400
Received: by mail-pj2-x2b.google.com with SMTP id
 d9443c01a7336-2e2c7eb3b8cso19932105ad.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790949788; x=1791554588; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GKrqihNO+U/ukaztxIdG3/LNHBcG4c2BJLSOBgDBU+g=;
 b=loQps+ohHsW94Cd20lUrIog5zIB6N2jbGkk//0MiBPjm6H4wwPFv0SBRdIAKcVDb9P
 SRSfgAkEpD5bHrjMOJuI5ErMk4G5IQ4bOKf+jak9dsP0ZJreF9y1iJSRuJuXk4Nmgwkl
 4CHk/d5DqJ3OsTX9SgbfIHBQVdviGU6CTwJjTz0dQGUTpVv0crcmGoXDwSZaxEXiPPlW
 vuVRUxYcRQKjXEjr9eg9xzzgY4IjmE5m4fLPEIS0TaBfSHYpw7+kpSFSVBkUTly/Gg7D
 uEYI7iwsPF6JM7hD9zCAen+71WGgwYY+mX7grDO/8sZ9J45Cu593c0GMpDfFouZiA79q
 cZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790949788; x=1791554588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GKrqihNO+U/ukaztxIdG3/LNHBcG4c2BJLSOBgDBU+g=;
 b=a57j+vvZG9NajFZ0mNRUcmDOcSpMpoMQ1ulDKUYHlGqS7AASY/MiVHfurViUltBna3
 aKU8XQ+x89DJgkq0NhAJsKUepn5ofbERVXwRyONtQ4npjcPVdTEdakrFBxuodk6rZODE
 yhxQgxJIAS5cnrAofy0c5JsIpwcTg759c8/xrlk/t9S79XpcGcuFO4yR3gcCdLtZ8N6Q
 vzXqC3EwJ8u7pdy5w2Ktl7zKg0PjgAmddVt54p3e4kHlZz+Ke6TdTVALpb7Fg1ck4aB4
 ELGv/MmSRWRMZcQr+MhtMf6XnI5oegRyt5LMIOcoHXw6tPx6Vq13XUGqsC/eYLgyEMnL
 Azcg==
X-Gm-Message-State: AFq9FYIAsmhhLdmtqZN1ZYojuCCRHYTsqGQm8wxYWo2CP9c5l2gBh3EM
 EoxpCMlOf+4V1ggtVYeN0nzpr0kNWoYmtuX/51uma+ufUnjJ5W3atkth
X-Gm-Gg: AYBFou00NcDiX4tpLabfZ7HZF1lqVm2/WTW1Myvg+b2AFkIGKngi6CDBhi5q9j5Ptgg
 yLhnij/aeaOIS5SEu9KFDZOWwKYRnYHLxrt2H5zCbgrNz9uP8hQPHiTwvezDLNYn/PbcZBRQlp5
 XYBF6K2+aGVpHgdesWCu+TOoplfRhyBSvmV5dndVrwDxbKK8jr8kP3RbdFN6ZWXjMyGShSTOvLh
 FaTRuU1qhu+wgM4RRcQoBmHitLR2Dis5e1LCYohju8XogsWqFEGcp2Fj4wiZ5uVYrIhcdMdH7Xt
 kfyrKMLsghsve8XmsYoxKN6byHpwhQfHHwsvhHBbVmW3TLqqvxr+8Gi0w97AZIxGObN+DOiLN7u
 hEyhK8ORHrib6ve5r4Wa6oUcNQyLaoNab4tPMjp3ip2mIHOE7f7vLiWlbSONcUbnhvFOve12sOi
 xMR/vFMp4mTPVPVctEGIy4Na460lGHF5VsZgqk9bxsZIZB4mAXs6cu+hSVzVGWVs6snvhLwkYLo
 s/Y7SNztU4+lMFK
X-Received: by 2002:a17:902:e5c9:b0:2e2:d72a:e710 with SMTP id
 d9443c01a7336-2e49b67e228mr23111535ad.12.1790949788420; 
 Fri, 02 Oct 2026 07:03:08 -0700 (PDT)
Received: from dt-VM.localdomain ([101.207.27.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f723a77sm7996165ad.71.2026.10.02.07.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 07:03:07 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>
Subject: [PATCH v2 3/5] hw/misc: use hwaddr for the k230_decomp_gzip input
 address
Date: Fri,  2 Oct 2026 22:02:43 +0800
Message-ID: <20261002140245.30214-4-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002140245.30214-1-dingtao0430@163.com>
References: <20261002140245.30214-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2b;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Use hwaddr for address calculations to avoid 32-bit overflow and
address truncation.

Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/misc/k230_decomp_gzip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
index da4dc6f954..54303c0e7f 100644
--- a/hw/misc/k230_decomp_gzip.c
+++ b/hw/misc/k230_decomp_gzip.c
@@ -102,7 +102,7 @@ static void k230_decomp_gzip_finish(K230DecompGzipState *s, bool crc_ok)
 }
 
 static bool k230_decomp_gzip_load_input(K230DecompGzipState *s,
-                                        uint32_t addr, uint32_t size)
+                                        hwaddr addr, uint32_t size)
 {
     s->input.current_offset = 0;
 
-- 
2.43.0


