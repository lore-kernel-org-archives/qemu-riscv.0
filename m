Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noQMh-0008L9-A2
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 09:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noJa1-0005td-3D
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 02:42:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noJZx-0008UB-KF
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 02:42:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so1134454pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 09 May 2022 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8IhicH2gHlNfTgfegpg/zkoYnjoTUmLta4pv1eT89A=;
 b=3RjS+uB559RobrnJTnZJzqGKI0J6KC+cm30Yq7zeO/arm4HFBQY7/mTEgIOgi+7sT5
 Nwr4sodkiQ2zshXg1hANVZ58gXhL6x9CJ3wG/ggAAmFs7OWFBXXXdS6PqGihU+raoV6I
 qP0pmraFShH89yMp8ezGbvMV+st3uJOgv9i6zPGeeMfW9DcYCpLtUCxAqJtggBw03kJf
 Bk95825lsb7+q+YZUpF2sSf103Ga1cTY+75gDKkKJSy+V3cyeSH0DhWD9qr4Zq7iDfPp
 CtXgw+4mlTuJ3lyzzBy29nwBgzYGuxhVIWntErYRSv74+JrBrISZVM4cZYSgl2PNm8Jl
 225Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8IhicH2gHlNfTgfegpg/zkoYnjoTUmLta4pv1eT89A=;
 b=PkgG/JL+NK/Abv+iMKafRX474yvc6bxY6jcgeisn7912A4jplyaz1sAlV+3WbZdznZ
 MSMcJZuJaCfGyi/Fxc911ndwZlosZMDHl3rwHE28tt5QrwC5vmtLhRPkpomEtORwcovo
 g4sKCMv+RTRMWlMK3YxcYvVEjc88AvK2uRHCsGT74OlOKYzzBXyVV8HefxHmdKQu5qe6
 sXDCS1Pgwfs6op1rbCx7Q6j933+TuzQFTwdZQikc2hXqxq3kf1xrIC76PmMlZ4RekQRc
 WOCwktVhooo0RAdoweWi3OyPhMim9U3idAc4wqDaN+rjPQQNL4CfyefB3biuNqfqbwtU
 Uw4w==
X-Gm-Message-State: AOAM532a32+P9Hi69xdWWlkdvTFPQZmDo5P3tm//3g8ENwyhl/Qf1qtz
 yM6QornyBvAytZXBa8hFo2DM8A==
X-Google-Smtp-Source: ABdhPJxxNdldJdu8+EgJJ+WvBCxyPZ/8SJWKmna/gbTi7E4zToXD4YHMR7yj4jcgwM1e/vUp5HnkRQ==
X-Received: by 2002:a17:902:ec81:b0:15e:9cfc:a07a with SMTP id
 x1-20020a170902ec8100b0015e9cfca07amr19383196plg.62.1652164958169; 
 Mon, 09 May 2022 23:42:38 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090331cd00b0015e8d4eb247sm1078082ple.145.2022.05.09.23.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:42:37 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 0/1] Add Zihintpause support 
Date: Mon,  9 May 2022 23:42:30 -0700
Message-Id: <20220510064231.1384670-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 May 2022 09:57:13 -0400
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
X-List-Received-Date: Tue, 10 May 2022 06:42:45 -0000

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause for TCG to mainly be a no-op and break reservation.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.36.0


