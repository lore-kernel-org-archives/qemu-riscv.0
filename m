Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxlNJ-000157-Tr
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 02:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxlNI-00014T-BH
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 02:03:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxlNG-00006n-O8
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 02:03:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id k1so1034704pjt.5
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2020 23:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oJgumxJW9euJulVVhe0hfyyrmYeeSc/dhTCZ82IU9A=;
 b=AqWM1L4nVH4ahXFgl5rqP++GCiVASnr43qBgUdBAF8jWfwznwiOtRkt51fiEklU5uU
 jxC3TzwwC/a0qiTpmmaRSE6PDot35ggObusxHgCytctBod7ByQpSsJcCsnU4AaVQ4vAy
 OV1Z58TWoHH9DAtoQQPGuyB2+jCozXSgiPLDsKjixQtUBF3dcRX3tarQeLsy07mhT63B
 vD+r2elRWmMUjPcPdU2ddpVy8aAaKdjUC03c82pN0p1m3sP5osW7ztf0ZMTDaMc0TbFr
 Gu6iICCmyZfjSd1dk6+DFjdHtiMbvN4VytyaM3kpBg4xg0PfMPuyUWY/sCKrPKyJABAl
 njEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oJgumxJW9euJulVVhe0hfyyrmYeeSc/dhTCZ82IU9A=;
 b=qJpo4f+TFSkfF28DbP3C6Z7Y5OFFlVbJqyMfOeGGhkqLDtn9u1w2Fwco5X4ncX5M4q
 Q2bHiyLp0hlunmi1oEEAGXDOhw839eYvM5xIImKnUazwCxxydXSJc6Wr2DVtpStYnE8d
 LjkYqTNpOT3BFuNOT66rKYmgLVoTBMMQYUOVUiYOLURCjvdsMyZQ8chg+ZBa4YHvcwVw
 SqKqTCp4hlTqQKWIRZYFVXwUtpJEfZHZiEEERXUY4CbnIKy7xs60ZgqjXSnKlBVMZBKD
 8BfSkyxUQT3k/uGQYCv54U2H+jCpEyvoBKn/6VX3zxKzkO0W5mtQN+6ZP0w2CNJ3f9ly
 i6wg==
X-Gm-Message-State: AOAM531YktSmNr7DJikatiJ83n8kHIaLNgpIZ7TRhpRdaIuyGs93sD6k
 nMY9+YKLxhBXV5QFi7km8m36AA==
X-Google-Smtp-Source: ABdhPJwnH1xjPj+9AQqwKCenuOQaJTbBeBJibl+HGMx6MPVi2qPUAfFOGxLdsPx4EH9pBxOg7HfP3w==
X-Received: by 2002:a17:902:be06:: with SMTP id
 r6mr19621523pls.143.1595311413216; 
 Mon, 20 Jul 2020 23:03:33 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 66sm19724068pfa.92.2020.07.20.23.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:03:32 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/2] Fix some PMP implementation
Date: Tue, 21 Jul 2020 14:03:26 +0800
Message-Id: <cover.1595311277.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=zong.li@sifive.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Tue, 21 Jul 2020 06:03:36 -0000

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (2):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64

 target/riscv/csr.c |  2 +-
 target/riscv/pmp.c | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.27.0


