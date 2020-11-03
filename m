Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZyH0-0006Ma-HI
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 10:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyGy-0006KQ-L9
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:31:00 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kZyGv-0000I1-Bq
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 10:31:00 -0500
Received: by mail-wm1-x342.google.com with SMTP id c9so11641249wml.5
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ex8Cu72ryprd048dwHy6RWF2MfmtcXzaxb8YoaWjEWE=;
 b=KO1VH8nHC5Ojwu8srLUlAMn1IFMyZNKcibDfVBBkhjVq2Iv66gwxVhBJAReGfH/sby
 NRDmdq3KPju+3De7wokrMWfSi0DEq8qQg8OcyKkVlzdrqgg/r8/noV6YbUh18epy93kl
 GEaUKiaKqWS/hi7C3TuQQju6b7sC0KTTYcCOjquYMNSlbtbZfadhU23m1WewPkuIyp9T
 dmXqKbWpLQtC8KPfqZqM4wkKEbPIsLi5u0etDKMSR+nk5GRptCmiKuKumwOBUEPifmVy
 OyrUxiKXZpcL+0AkxBFOu/ZTxAhV8795ko2FZD5zk5HFg26jDkIKTW0vbb1Nk0qA/nTQ
 dpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ex8Cu72ryprd048dwHy6RWF2MfmtcXzaxb8YoaWjEWE=;
 b=B79NucE+BWpPANiCcx8qhXnOKKLLO8vIwpX/kWD202Fk+tlNV6nnwt7RmUGllbMNxq
 1vedEY88lQqAVrd1kbqTOLRtRepJCg6eqRC32lKLkNr19HxH2SHjNES0csmXQP1uMTsW
 B5soR5p/yN1K4AdNR60WDpAuB1TNxOGZMw20q6YwbiLrzFJLBAWJMZuAqLvHDnX1navW
 S5qd77ZGVYFPheV4LdfaRzTlP/s8f2J/VutPMWDjBgDjESW79NZqj7cKMlvBWMVPyOL8
 17nIgzpj1bvnLORzuMRsezpWT18yjh3z81LbRzYzia7I1CPkyax1INm+9PQ3HAAkuPnC
 5h2g==
X-Gm-Message-State: AOAM532FI0bPEX3ACcs48JuzT6OpF9ZmyOC7UDe11IE41LQn4VXymG8t
 rDZ0yOt6TCAXKoRSq/N4bMmZmwN06EhEFxg4
X-Google-Smtp-Source: ABdhPJze8z0kmbcHUOatnz1AHUA/Qx0DX1UUNOfWxQUx644FykPnma6wJXspT3AfhGPidNb8hkeTsw==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr296339wmf.37.1604417454864;
 Tue, 03 Nov 2020 07:30:54 -0800 (PST)
Received: from thurso.iroazh.eu (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id e6sm19443716wrs.7.2020.11.03.07.30.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:30:54 -0800 (PST)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH 0/2] Fix PLIC issues
Date: Tue,  3 Nov 2020 16:29:17 +0100
Message-Id: <20201103152920.90957-1-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wm1-x342.google.com
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
X-List-Received-Date: Tue, 03 Nov 2020 15:31:01 -0000

PLIC may trigger a buffer overflow when the highest IRQ source is signaled.
IRQ0 being treated as "non-existent" IRQ, N+1 slot should be allocated and
handled.

Emmanuel Blot (2):
  hw/riscv: plic: Fix highest IRQ source slot
  hw/riscv: plic: Make IRQ slot 0 part of the IRQ priority array

 hw/intc/sifive_plic.c              | 27 +++++++++++++++------------
 include/hw/riscv/microchip_pfsoc.h |  2 +-
 include/hw/riscv/sifive_e.h        |  2 +-
 include/hw/riscv/sifive_u.h        |  2 +-
 include/hw/riscv/virt.h            |  2 +-
 5 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.28.0


