Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8mgR-0004Mg-0r
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 13:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o8mgP-0004Jt-SX
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 13:49:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o8mgB-0005AW-1q
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 13:49:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso5790320pjh.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Jul 2022 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4azkuwIy0LyIoitAMeFygcelBPbgpncCgtZ0mgkTiI=;
 b=336zJp2MWF9yFITe8fha3W7AjClD5yL2G6EQHcp/4pajG7OXlnJ/9ffz3LHRK2vS6p
 s1QfSsP4hrLgP6Prfdy3NajoWGmq7PqLYJaOHJ4V55+DREYN0cuWWxlHn8wGPwkKtCwG
 SRnluu7xkiYYRIB9f1rWxmvXtMPtjdwZu8IpcJ4emMoJ33iOZ6ZiYUdVX9IfxVLtpOdv
 tnpwn7GUgAXZu31uipgSC3WD2ldnwYOUWEbsBH1RP2areleIiQyWYNHDWkEdzFe3WofH
 Z1GL1lTFgI09WwK9FkzK6bwMF1J9PWRSoqrRVvatWYLU1QIfQyLAXMm9nvKA7ZKZcP4d
 XYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4azkuwIy0LyIoitAMeFygcelBPbgpncCgtZ0mgkTiI=;
 b=nHgRx7KdwixBBykirMxnmkZDgRBj/AzA9NFUrl2P7b7d7gHz/uU+Ku0sokpeQ6AB+w
 sRDPwcTlX6AeAHKA2BttHNsD5RclzV26RPzXAhCNNk3zayqUr01pjeVzUNn4845jXqj8
 s9A5Rp4y+3irp4/gBiXoqqYoLRJBKFC3KMOo3uy16fVRxVRFhFF9SbwQDHliw5qDq1ig
 7XzgpnCrnUP09B4v/qHd/cNuhzXHKYA9Da+re/0ArEs9iic3w5/8hhaTAb18G2jFv/Oz
 xtaE1LmAOA9pIyWZmPDVezPEdQHMJ+n2zYtpP+OPThRFfU3fJQaCusg0qU/JXtM06Ixr
 /IkA==
X-Gm-Message-State: AJIora8B54+Oe6qnElqBYfpbBzUxIuJkj710t722W/Akpeu09nsAO9zJ
 a1IhbBlh3QcXGVlcxG21q86lUQ==
X-Google-Smtp-Source: AGRyM1tUUKeOkkiCl/T73KFH+NWw3+5wpyiuY64BoRg3joDhe396r+9G8wGIr2nsw2KAn2wJX6ePDQ==
X-Received: by 2002:a17:903:2310:b0:16b:fbc4:bfb1 with SMTP id
 d16-20020a170903231000b0016bfbc4bfb1mr1082903plh.100.1657043378437; 
 Tue, 05 Jul 2022 10:49:38 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902d50500b0016be372a10esm4952004plg.20.2022.07.05.10.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:49:38 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v4 0/1] target/riscv: Add Zihintpause support
Date: Tue,  5 Jul 2022 10:49:31 -0700
Message-Id: <20220705174933.2898412-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 17:49:58 -0000

This patch adds RISC-V Zihintpause support. The extension is set to be enabled
by default and opcode has been added to insn32.decode.

Added trans_pause to exit the TB and return to main loop.

The change can also be found in:
https://github.com/dlu42/qemu/tree/zihintpause_support_v1

Tested along with pause support added to cpu_relax function for linux, the
changes I made to linux to test can be found here:
https://github.com/dlu42/linux/tree/pause_support_v1

--------
Changelog:

v1 -> v2
1. Pause now also exit the TB and return to main loop
2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function

v2 -> v3
No changes, v2 was lost from the list

v3 -> v4
No longer break the reservation in trans_pause

Dao Lu (1):
  Add Zihintpause support

 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.25.1


