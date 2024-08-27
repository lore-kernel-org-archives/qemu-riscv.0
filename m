Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E95C5473F
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 23:20:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sj5TO-0003pU-8X; Tue, 27 Aug 2024 19:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5T4-0002Zl-KI
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:19:18 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5T1-0000pZ-1E
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:19:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-201ee6b084bso52253235ad.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2024 16:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724800753; x=1725405553;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoOLJ1vSDf5p0Vfqc4dUxk3Eqww8q10OxxejFUrpUPs=;
 b=g02zzFLx8gobhKqyCSiJCa/Ics2Mmrgrrknk1YTPScxC9ZL9RTFj7n3SNoWQaYjpHf
 Mh7RwIniAWG0yku071ms0MYbPrA/YIdK6M3Pz8C0YSb2+PEnwEQ9wzJRPLsxYyujK0cz
 JB0zY2rYLQkrWVLoMqDX9WK6+sp99HyOx+NQvjk/Z2L9DCW8BVNQmn7m20Ycy1ZPxQRe
 1KHc6JNQ6Q0ftH3IJvzU7vaRjnLiXyYJ6+nSmhBaT7FKhIGyWGbCqrWgP7E17fqAfcHQ
 YMD8RfIDZkxwBrSBk3Lhj6Hj5IyRcbfCb5d+3wydD+uAI7I0x7X1hKkWK599MzwnriWV
 Az2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724800753; x=1725405553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aoOLJ1vSDf5p0Vfqc4dUxk3Eqww8q10OxxejFUrpUPs=;
 b=c2RxYvI/M47r3O01NFs1719wVXvLIw/RtMZd/2AER9LgTpnmz892D4ShyFP4FYtKCC
 b/KA1rmGvcFTwnlAd9UqQ3XRH0eVjgY3tD2JuN6IQilO5/oRzWa3UL9Sg7UqY+quv452
 O0/YBsJZh5zKDf/VT0K9aM+YlkSo1hy6Cmeh1F32mSPgr+RIpsUwDKb0BheXTTlETLEk
 kuvaKD6W9MUAPujj3Yp+DeZePJtcen9iGvionqT+QOnD3+Sz56fPjCZC7mJ86ShjrION
 MIwNwHMu08JP4VNN3zd5PkaXepa9fV6iLZZgnNX48IpsrpIa7wMJZg/HYDsXfSAz0iOI
 oQYw==
X-Gm-Message-State: AOJu0Ywu06lsJ1FZSB51iy8sbha1oyFlL+BkLn5M9plpPw3Iw40UPBUS
 yvS4QEzvvIGOqIUIjdPB0SVmk1DfM6jdLtydOhS7F3ODi6DvXO7FoXiz25AkZ7JGiEg+X4Qq192
 4
X-Google-Smtp-Source: AGHT+IHYn6KHMObEsNpk0qA0CvpN+9r3ZY99LW+rC3IeZwuu6QTa8zcxOY2GH8u/15ySi+pEiABONQ==
X-Received: by 2002:a17:902:c40c:b0:203:a12e:faa7 with SMTP id
 d9443c01a7336-204f9b9ccbfmr5322005ad.27.1724800753332; 
 Tue, 27 Aug 2024 16:19:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0ee6179sm57785155ad.92.2024.08.27.16.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 16:19:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v10 02/21] linux-user/riscv: set priv for qemu-user and
 defaults for *envcfg
Date: Tue, 27 Aug 2024 16:18:46 -0700
Message-ID: <20240827231906.553327-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240827231906.553327-1-debug@rivosinc.com>
References: <20240827231906.553327-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

set priv to be PRV_U for qemu-user on riscv. And set default value for
*envcfg CSR.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 linux-user/riscv/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 52c49c2e42..7a68e8717b 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -32,6 +32,10 @@ void cpu_loop(CPURISCVState *env)
     int trapnr;
     target_ulong ret;
 
+    env->priv = PRV_U;
+    env->senvcfg = 0;
+    env->menvcfg = 0;
+
     for (;;) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
-- 
2.44.0


