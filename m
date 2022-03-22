Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWemT-0006nm-LH
	for mharc-qemu-riscv@gnu.org; Tue, 22 Mar 2022 09:42:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemR-0006mp-KK
 for qemu-riscv@nongnu.org; Tue, 22 Mar 2022 09:42:35 -0400
Received: from [2607:f8b0:4864:20::1033] (port=50913
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemP-0006i5-SY
 for qemu-riscv@nongnu.org; Tue, 22 Mar 2022 09:42:35 -0400
Received: by mail-pj1-x1033.google.com with SMTP id m22so15729176pja.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Mar 2022 06:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=FA9jZSioYw87H5L2oUEYeTh1DqtACI+HmGZzDV4p7oo=;
 b=o/c0AV68c2TFeVYuwkrgonm7Z8Skcvkh8z0o0XdL3wwkO+ypytTRE3w3Ali/m5WJS0
 I4JFLXibwlK/CDIlrfo/HwI8o3s8KTmLyosYiY/u3skD229a4UTpSbKhs6Yf118EpT94
 VjBrp5a//LjJZNXdXVhFXpCxFiod/jbzPcCsxBRQFsfU3HVJwofj6eih/B9CBx4MnOLa
 hev2EYTTcbkFVPkv6F7yDuVNhauV5TATVUzDvT989efHspBKFEked+ktUN7VpFqvhCrJ
 cOAh1jV+qk5HqMrVXSYMWHDJagE73nn8m1nfWNmWFsHzMN/ngkrrs3kx4htZt+xQgTgC
 /72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FA9jZSioYw87H5L2oUEYeTh1DqtACI+HmGZzDV4p7oo=;
 b=ruhMIds0qP1B40+7C7C4ywZ33Y8TWJgEznDNhbIWACwLuk83BTyltcLdXA3cfhRPMU
 NGrjpRHhPX8V/+dkUF/naTjoMOl2+IwLa5ylrWHAAGnN45095eoVeuWaw76jRZmPZOPK
 HKdUUcqmpcDn6ZMmVuyUwbhiv/zN5GLl6HxtJwXfc2tQdzmYknym6Vv7aXQKuq+v/CVs
 ELu8uugKYC8geaTzESdE4xRsC4vlMjkrXZPBjMTxBnriBWPbXJtNEAJ8/H7ZEeFeWn8j
 GB4y7KB4yQ1uc8hu3UKrlKg7yA5WcaL8OUvUWTLqYQcfzt8LhU2JT9/jpAK4ZarjrsaJ
 fd2A==
X-Gm-Message-State: AOAM532jrCUN3Zd25bs3hQgwYh8ov10G4joh7DVrgWOQIUQpT8RmnYsZ
 rEWZYONYRxObKZx7o9kNp2STXcwzimpfHs+k
X-Google-Smtp-Source: ABdhPJzpE53G8MdhhARKFdulfZO0FJOCpw6DuBUNXlCj54bvCm2Y144sILfuITOkizwIxaTRSLCeCA==
X-Received: by 2002:a17:90b:4f4d:b0:1c7:467c:e24e with SMTP id
 pj13-20020a17090b4f4d00b001c7467ce24emr5152188pjb.102.1647956550584; 
 Tue, 22 Mar 2022 06:42:30 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm3101216pjb.2.2022.03.22.06.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:42:29 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v1 0/4] RISC-V Smstateen support
Date: Tue, 22 Mar 2022 19:12:14 +0530
Message-Id: <20220322134218.27322-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 22 Mar 2022 13:42:35 -0000

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

This series depends on the following series from Atish Patra:

https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00031.html
https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00142.html

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 550 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  22 +-
 5 files changed, 610 insertions(+), 4 deletions(-)

-- 
2.17.1


