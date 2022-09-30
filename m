Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oeFCL-0006Oy-3m
	for mharc-qemu-riscv@gnu.org; Fri, 30 Sep 2022 08:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCJ-0006Ln-IN
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 08:32:55 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCG-0003N7-Sb
 for qemu-riscv@nongnu.org; Fri, 30 Sep 2022 08:32:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id lx7so4164946pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Sep 2022 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EvpZGxtdQDHMpbTl0uzPjFTlaXuEhBN2xlHcSljddHY=;
 b=Hi9OZxDmI/BpFz3hDfPFW5WZqBORstjWImooIgvxPt0TktM0t0OmzEa3B61aCMoXiq
 JXFYll+pXelOr1j5xGACgQCS5VKqt54U89bQtC3ASia/iipRrdo2P/OWAAO2KgcGOEXQ
 dRtW+JDA1P1N8qMo1Sy4nsE4W4rgxZGr/5KFDLW0Is17Bhte7v4dHZqrFdnXOe/kIAwn
 SZAFsDql+y8V6vdElp9mszTeWFvoCWpMFtiZf9v2Hn4FrX/kAO4Kn5TJqKtvQZRSjzlT
 JtDuOLuneeJnlD8F6smWGjqSrBodZ/HGEfRJ5VJtddw6vcmaleaM0ZgNt6XooPN29hlz
 U3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EvpZGxtdQDHMpbTl0uzPjFTlaXuEhBN2xlHcSljddHY=;
 b=IT8Apqbgi4279lwJO3MxDfNP2Bn3BNYWVBWrkeBS7AZjhkdTdUwO+g6Lk4wb+KiETj
 Ft/3+c4RWVKUN5vjCykRouUpmaRuoEsJ7x3VM90jh2VQrsCdxcYrqoPVRrOlh629LHIp
 W6AP/8fqFfBc8Rd4O4fSCw7WrJDvOmHl3bsVMF26roucymdUJmwtrOxE15zzB+zLdEC/
 yY8OgY74Z2yR60PtK399deFIaYsL5Dp0lcRk9QK+mVaWL+PppOo1ZJ9R2fF+bQ3OplRd
 9VG6/bzrLp+gIYpt1QI7vozxEFjQmU1UYtDNlWZhREsb+XTE1wpLPBPMNBHrUPd9qzUp
 aJsQ==
X-Gm-Message-State: ACrzQf1Wxgtze5nA2zwLCjlRkDRwO6mNA04HRbinrKDBuBaKYpINSKU/
 Ejjt2+Iqiq8caYYFjqNI8EXc2Q==
X-Google-Smtp-Source: AMsMyM4l8y37LNCaihO7PXKvRmZ2SfuRTZkAPQFQH48daszTiXUBFgp1l1JEqg7Xl3mNHyR2hqHQ+A==
X-Received: by 2002:a17:90b:3889:b0:202:6e94:5e3e with SMTP id
 mu9-20020a17090b388900b002026e945e3emr9254402pjb.135.1664541170871; 
 Fri, 30 Sep 2022 05:32:50 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a62d154000000b00537aa0fbb57sm1649880pfl.51.2022.09.30.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 05:32:50 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 0/2] Enhance maximum priority support of PLIC
Date: Fri, 30 Sep 2022 12:32:37 +0000
Message-Id: <20220930123239.15515-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=jim.shu@sifive.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Fri, 30 Sep 2022 12:32:55 -0000

This patchset fixes hard-coded maximum priority of interrupt priority
register and also changes this register to WARL field to align the PLIC
spec.

Changelog:

v2:
  * change interrupt priority register to WARL field.

Jim Shu (2):
  hw/intc: sifive_plic: fix hard-coded max priority level
  hw/intc: sifive_plic: change interrupt priority register to WARL field

 hw/intc/sifive_plic.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

-- 
2.17.1


