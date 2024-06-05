Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FAEC27C5F
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 07:50:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sElPE-0001bJ-HP; Wed, 05 Jun 2024 03:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1sElPC-0001a1-Ch
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 03:49:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerry.zhangjian@sifive.com>)
 id 1sElPA-0002q3-Mj
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 03:49:58 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-703e5a09c11so558153b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Jun 2024 00:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717573794; x=1718178594; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myve1jAhdqyP+usJqmhOYrzMqhLp4uAXIzu4yEhQwDA=;
 b=N4wBkgYtsTM7lrMY7AdRwRt7nZQsl8mEbVPnpJrs0t07aW/cNvNDSlS3s6q+I/kPkl
 MT6kV0zJHFLS4kK1yYg+N9VH2CEUe8F3em+mv5+E89WqnpAIHDyercBXYiiviUEZxcp8
 u5n2bt0ZKJqJXu5NS4SnpYpoiultujuJaFceVvFvufn8e9w0659dBL11jD7cPbDXD3W8
 rGa1Xxv2lQ3oGUfkajwI+2pssj8L1o6JCHjpFfihRj1/2H8sqGSaz4N1mWEOOGSCX9Di
 Fw1+tcSzimi9vbzGohNJSITsiNWTGqpm3jW1OlU5pRlZrSb01SphS6VmkF1bOxZT6DNS
 /5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717573794; x=1718178594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myve1jAhdqyP+usJqmhOYrzMqhLp4uAXIzu4yEhQwDA=;
 b=EYRKxLyzIFrhqUGpzW6iPfLhOFpekBlRo0SINHFn075JamZAdCBiR4ku3+NIBeS96U
 XZmbC9FUHhsh9CDT56ho4tPF6xzGPcI5hhShlgc/jEvbpRksSH0yc2h5PJTS/GmWvbgs
 E4CIdqRKQHIVEuIoFFa8YvHoo2MhLsd8Co6IYt4wwu+sSOsDk9MeupNubA8u4SmVoaWl
 cr8rsQszqqwrpcZj80js9fMrjoY4qyKs8tSWrLTksDfGmvtq+U8DK6HriE/D7DOph4WD
 ijr+drlBgDSlfR0bzcih4fC7jsyeLimAkyt4W54dLzUTyqDhyX/bNjp8LnXRcMNcDLQT
 dvHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFL69/7d2i9tqrb4lnNyav0tO+CpW5KIOLO7fUUb5+L6zvzqyuhHfh0qlgnhoSYSCoQM1+y9XHbj0+8fgnQOHRXDYqrHM=
X-Gm-Message-State: AOJu0Yw2Nd9HMES6RiHE1Ur4JqzQ+TXVMD0it3q60RZzdFlycJV1IO6E
 kuiHyDoZDg+MSRhj2KVQlmSdeVALOUnp4EyexnNi8byfCZSYiA/0AdPcRx3qIfI=
X-Google-Smtp-Source: AGHT+IEZNn7xs7/ulzxyGUjj1dj2olw324zv1yvJWyYF0T16x94j9fCgqfjkGVbF2/fofO/U4FpeZQ==
X-Received: by 2002:a05:6a00:895:b0:6ea:f05d:d2ec with SMTP id
 d2e1a72fcca58-703e592949dmr2156218b3a.2.1717573794181; 
 Wed, 05 Jun 2024 00:49:54 -0700 (PDT)
Received: from localhost.localdomain (114-34-225-151.hinet-ip.hinet.net.
 [114.34.225.151]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70242b2c438sm8066306b3a.202.2024.06.05.00.49.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jun 2024 00:49:53 -0700 (PDT)
From: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH RESEND 0/6] Introduce extension implied rules 
Date: Wed,  5 Jun 2024 15:48:29 +0800
Message-ID: <20240605074828.91458-2-jerry.zhangjian@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240605063154.31298-1-frank.chang@sifive.com>
References: <20240605063154.31298-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=jerry.zhangjian@sifive.com; helo=mail-pf1-x432.google.com
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

Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>

-- 
2.44.0


