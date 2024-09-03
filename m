Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB2ECD342C
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 06:15:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slMo9-0004jw-4b; Tue, 03 Sep 2024 02:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1slMo6-0004eE-PN
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 02:14:26 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1slMo4-0002EO-PO
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 02:14:26 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-7c3d8f260easo2528133a12.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Sep 2024 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1725344063; x=1725948863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ocor0J69gEkcnw3K93XNkT/Ls3GmiKCW3UrbQY2G9R0=;
 b=eR7vWPnNMMGOJYRJq+ezUrZZ1TTKmk72UebjSo7/+sujMrvYoEfK6LV5JCWjW7+X38
 C11jvfbQjNcnsefYZfi6fQupYst5KiIGHISbEc0quS9/b9VrVhsyEvaFVNbD0B9WEkwU
 Oo4qhR3kmwyOU9whydrNnoxTmI+jYFCg8TmRjgbRPWXuWKPvVFu24y4mzlnNaUh0BMhS
 a2rIbKNUYM3WihBX4hkNGvJPHFhC+1tVv5nEu8pE8yDv9tLUktwndjY2ZI6pl216VzjD
 DEmoNg3EeUzojFwH4SwQ65kQINstxaa3lnhTFXhSxIudmcSvM4rxgjhE5wXHsW+IQO7B
 HWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725344063; x=1725948863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ocor0J69gEkcnw3K93XNkT/Ls3GmiKCW3UrbQY2G9R0=;
 b=Ejrh1lzm4O06X9h3A6WUWUVlMH+fKWCxN4+Fi4bT4Tie14YWRj8L2+atg4wb/b05eZ
 8r4+2Gx9faiAb2FDCq0hgU9LMHrl3bWhfaPdv4uALyr0Nl02WrJ6GrpUmesHWazWSskM
 2J6/mZ58wTdF/l7WTeA18tkPOseemUOE8tCOggibzZULv/WdbgB6NY06ySJr5sSMAdfB
 /G+6N4BXkmoBIbW0uk9dae+Ax8l0n0RxLf6egjMEjmLJ9VLIyuBhyXa7Bp5zjzeUBjSp
 veURk3wnYOx0aLzwAYQ9RQtxvuNDcW7RD5SlKk3x2MBqqNIPGdguSElyq85PIScgAie6
 Cx7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV90SI8ZWYTsgqI7ztT5ZwXiIA5eb1P9JsBz/jwIgJzjog/C4nIg0sLfkA+WlsPuiXZ1SJmZm60O1r@nongnu.org
X-Gm-Message-State: AOJu0Yyn9Ko9JUtNn6A0RoPn72A9kP7KBlhxoRqI5bFA5baO0kYemZcu
 /XdEDP+4PEBylsF+uSxZffTreOqGWV6CkWA7ALz1D0WPiT9zY3uEgI5nKv8IhZQ=
X-Google-Smtp-Source: AGHT+IGlW3H0k9zO3KUAuUhCu3brrjl8Zmq8jrT/neqsuWTj7tdazdx9Nl4f8aM6bKD/6QA3jg6+Hg==
X-Received: by 2002:a05:6a21:60c4:b0:1c3:ba3d:3ec3 with SMTP id
 adf61e73a8af0-1cce109796cmr14688854637.36.1725344063316; 
 Mon, 02 Sep 2024 23:14:23 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20524c16145sm60467145ad.98.2024.09.02.23.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 23:14:22 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 1/5] target/riscv: Add svukte extension capability variable
Date: Tue,  3 Sep 2024 14:17:53 +0800
Message-Id: <20240903061757.1114957-2-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903061757.1114957-1-fea.wang@sifive.com>
References: <20240903061757.1114957-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52e.google.com
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

Refer to the draft of svukte extension from:
https://github.com/riscv/riscv-isa-manual/pull/1564

Svukte provides a means to make user-mode accesses to supervisor memory
raise page faults in constant time, mitigating attacks that attempt to
discover the supervisor software's address-space layout.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu_cfg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 96fe26d4ea..636b12e1c2 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -81,6 +81,7 @@ struct RISCVCPUConfig {
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
+    bool ext_svukte;
     bool ext_zdinx;
     bool ext_zaamo;
     bool ext_zacas;
-- 
2.34.1


