Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZyOu-0001uJ-0j
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 10:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyOi-0001ro-11
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:39:03 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyOe-0003Eh-8y
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:38:59 -0500
Received: by mail-wr1-x444.google.com with SMTP id n15so19081045wrq.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IMQ/q0xaLwK7AqObV2YBpwhdIVzutvtj/VLwg085Fbk=;
 b=MI/gUwoo0rlP6MERfCYBVFokhKtsOAvLafkIMhc3O0bpvRJnOK1z8tG972esOmjXO+
 CL77QQSw7S3bvtQ/yqVyoSeRQL/wP4mPFBwk1caTFV1t07XADj99Qrn+aQ3OrKpbAAjv
 dU1J4b2LFs54i2Nur2PuL8JM2F+u5Styeq+2Dvs62dfbY35SvMOftfYs2wCl8ZzGdgeK
 VlZpV6hl11PUrlvhNouyVRB7icNXBhnNUw9krfuX4TU465erSsG0nUtBreYN4JaIEIle
 ZpBEvq+A796MRniKvOBRCG+pJLv8MwQkhIPHe7EV4YfJkdGLBG6mKDhCJQg1ThmOonjC
 Qs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IMQ/q0xaLwK7AqObV2YBpwhdIVzutvtj/VLwg085Fbk=;
 b=KmGP4X1mRxVnki7d7kwWL0wVsWJorrO/LPhZNdSyyyPsN0y+DSU7LKamtivJo7/AUp
 3zYipXTg9aTekC1RmzrpXqrhKGClFsdKEdJ6FsQ1Zm5t7gVMjXqw5Poi3dlY2R//tfiD
 SRXW3AB4NPsNuvfo+1S22Iom+tHKj3fFi50hymO0M2EAVR979MQP9uHiY6uj3WsJjUTC
 4p+KJMNlY/aCu1aDG1q0fPRH+cap5TyEp6H72sNBrkvx6AMumk8j2eonvZrLGc1w/dTb
 Hiohl79CHcNqxD+7X7AiC+IjhqLACftFh+FlCt74Ft9GfEwnDTS0sjqss0E0OAZfUWcT
 rnyA==
X-Gm-Message-State: AOAM530eXbMJWhlslafuqHzHDt17LpsjjaWduOh6SjKmzkzpDbronkeh
 oftfieZmmWqIVh5ykh2Jbl3rXZn9W77b0L9u
X-Google-Smtp-Source: ABdhPJzRiY3KjnoRPwOkPXJ/NkXJ4E3mgdL++rEzfnNfiYZz0IGustWSvXM+7QMJ3OD2LIkmNMYOHA==
X-Received: by 2002:a5d:51d0:: with SMTP id n16mr26271152wrv.43.1604417931688; 
 Tue, 03 Nov 2020 07:38:51 -0800 (PST)
Received: from thurso.iroazh.eu (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id f8sm1293862wrt.88.2020.11.03.07.38.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:38:51 -0800 (PST)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH 0/1] CLINT timebase frequency is invalid for sifive machines
Date: Tue,  3 Nov 2020 16:38:43 +0100
Message-Id: <20201103153844.91458-1-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Nov 2020 15:39:03 -0000

CLINT mtime is a 64-bit read-write register that contains the number of cycles
counted from the rtcclk input. rtcclk clock for sifive machines is currently
defined as 10MHz, while the real HW use a 32.768KHz RTC clock source on FU310
(sifive_e) and 10MHz on FU540 (sifive_u).

Emmanuel Blot (1):
  hw/riscv: clint: timebase-freq is machine-specific

 hw/riscv/sifive_e.c            | 2 +-
 hw/riscv/sifive_u.c            | 4 ++--
 hw/riscv/spike.c               | 4 ++--
 hw/riscv/virt.c                | 4 ++--
 include/hw/intc/sifive_clint.h | 4 ----
 include/hw/riscv/sifive_e.h    | 2 ++
 include/hw/riscv/sifive_u.h    | 2 ++
 include/hw/riscv/spike.h       | 2 ++
 include/hw/riscv/virt.h        | 2 ++
 9 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.28.0


