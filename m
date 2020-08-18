Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k856s-0006ZJ-NF
	for mharc-qemu-riscv@gnu.org; Tue, 18 Aug 2020 13:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k856r-0006Ys-BG
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2020 13:09:17 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k856p-0002zV-EF
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2020 13:09:16 -0400
Received: by mail-pf1-x444.google.com with SMTP id u20so10284480pfn.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2020 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=22Zz+YwGzBdQSdlyIPwby04sg60ddKWl41y0fTGfHyw=;
 b=AXS+c3vJG4w5Jj1vig1Ym+2gUZRAfqrmSV6PfYov2m9+IkK4Rtgi8IPABOmaECviYF
 O8ntjyM0FJ6uxMJfj1h6ytuWRiCu/PNtF6iKC/4qhGptJ3I+A0rR+9GUoSycyM+ce31U
 v0SBqZfpXqn/hkO+xaYcv++TpS6kkyeY593XgtAKGP1liRXZ9c8GsAHx63XfFTqYPtn1
 SHry6JwJ7S9O0wBsMScTMAUGokAMgt95Av5Mt/sQ7QHwL6gHaCYsD/B3z3r1gOMsIsnz
 +IBethrVkAWA1ZgQlOYFgByQwmV6a6B5RFs3ZF7PAOXXsi69BEwdVYvyFvVJWpJ64HAB
 3WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=22Zz+YwGzBdQSdlyIPwby04sg60ddKWl41y0fTGfHyw=;
 b=FdrJcgAZ7IaCBM68PRiXTMzffJUFTqKkyvQ4ForVKsItytOZW4SFOlSDqsBfr/kdAH
 Wstee6w9ArB6dMfDBuSLxzD63BCnMkxF9dkLTjkA3M4wZY5qVLxrHyzqT5lTIHLMROcb
 JejmSBdzSPQxp9e+9/L8gTTkrXjsNxpw4Zy+eNAqCBE7Kt1QbCAQ44Ze+4xIafDQxTJs
 N9bFFTIZFDH9H9gBEJnV9cDfk1dsc0woLyKnLDMm/p7bDH1uv+2cnNBE0W3c+m/4d3XI
 GiqSJvh1Fs6HCRzA9qI4msQon5Ycg06AZs5Feq6/EcpClzrnm++5fd7CIOtCg8fzzrSK
 g4sQ==
X-Gm-Message-State: AOAM5328C+lRbC/ImMt4DsBCkdbMy96IY7vwY/HRiQk94NffFzNrnKm2
 elM+IUpKRyYspeTSfbh6IkbD3w==
X-Google-Smtp-Source: ABdhPJxdXpjFYeUiw7ZhNYnf3yjbbMa7dU67XLWo4wn2yRsEkCIpMeOKEGifFwKMfgbvijcsvFJIxA==
X-Received: by 2002:aa7:8608:: with SMTP id p8mr15520198pfn.62.1597770553446; 
 Tue, 18 Aug 2020 10:09:13 -0700 (PDT)
Received: from localhost.localdomain (114-47-163-2.dynamic-ip.hinet.net.
 [114.47.163.2])
 by smtp.gmail.com with ESMTPSA id m3sm460043pjs.22.2020.08.18.10.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 10:09:12 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: bmeng.cn@gmail.com, Green Wan <green.wan@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/2] Add file-backed and write-once features to OTP
Date: Wed, 19 Aug 2020 01:08:37 +0800
Message-Id: <20200818170839.20258-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=green.wan@sifive.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Aug 2020 17:09:17 -0000

First patch is to add file-backed implementation to allow users to use
'-drive' to assign an OTP raw image file. OTP image file must be bigger
than 16K.

For example, '-drive if=none,format=raw,file=otp.img'

Second patch is to add 'write-once' feature to block second write to the
OTP memory. Only keep the 'written' state for non-control register range
from 0x38 to 16KB.

Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/riscv: sifive_u: Add backend drive support
  hw/riscv: sifive_u: Add write-once protection.

 hw/riscv/sifive_u_otp.c         | 71 +++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u_otp.h |  3 ++
 2 files changed, 74 insertions(+)

-- 
2.17.1


