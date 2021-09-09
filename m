Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOPIA-0003W3-01
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 15:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPI3-0003Ov-Vh; Thu, 09 Sep 2021 15:00:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mOPI2-0007JU-0X; Thu, 09 Sep 2021 15:00:51 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dc3so5609083ejb.10;
 Thu, 09 Sep 2021 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Uy4W/w5VWCArHlK4VP/qHZmCDK7+4bDDY66JBulCrE=;
 b=kxmFupLkN4ObNA4u7QoTFIDlQJYDTDftZf2MMBeXm58H42fa1DQorLwZLcpG2UI5xF
 LsXAJJZtGnM7DDB4v6cb+7NNrsrpZexJqM9Lq+tv/QaF1YlRlfVGoxnW3vC01MLX7AvJ
 i38roP0ADa9X6WvjTDlpTORzZ8PM6uoUg8/DMKJLZyglm+Dyw1dY+dC+IQ7jKfW9JqsU
 hEBAMU9PZEo+zyGwN2il7gyGfryaa6EWRqDje4TtaSOd7sd4i14R4mf2ap/Tki+4Oe2h
 TqXF9JE2Lg1BDydx1DvTrBeG4B0MdKcpxmSOwlfG+9kdIdmaVPJMhpuMQ+Gqy9f720yn
 KbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Uy4W/w5VWCArHlK4VP/qHZmCDK7+4bDDY66JBulCrE=;
 b=4pzsLKMTFGw8jI0CSVS7hJL9/JXVwuQYfKdqTRNRBsybikGVjBbu4JbvxY4yn/sBwl
 m4UH5OtzJzN2DJpsb757c8QFp15c6ZkKKpWdnsXx4XgkvdxvZpZ/N2GZmQSNuTH9L5AH
 7UyGlqH0GsLJ3XuhM0cz39ZH0JCCZ+eMQ3idx5kiS/SUWHwtam5pl3Qrx0wz1SUj0/6p
 JXFW4YiFKHf9FdliN44OhyUWQ9iZVQ1Dnw8Oz8GfetubVt5TMUDGFImLoJJGptGrPdVf
 Gjgpdoj1BunFPYKEzc/ejvH4ujs9lyZe1gWtE+hJrkERwOJfUtpZO7+E7oC718fXK3QT
 M7mg==
X-Gm-Message-State: AOAM531btBczvva4cir4/OHxuTMYMqZ6+tJqV82GQdEXW6c8QSo/Cbln
 XPsd2A0v9+M1z9DdVSZF6Jc=
X-Google-Smtp-Source: ABdhPJy5rClZBwxvq9YBdBYHKgQ17uYsVl5xKe2Mhc3z4f5eyudeF+0E3drkcxMC7zHRTeLDsY+QZw==
X-Received: by 2002:a17:906:a3c3:: with SMTP id
 ca3mr5165812ejb.337.1631214047526; 
 Thu, 09 Sep 2021 12:00:47 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id c17sm1514588edu.11.2021.09.09.12.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 12:00:47 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 0/7]  RISC-V Pointer Masking implementation
Date: Thu,  9 Sep 2021 22:00:26 +0300
Message-Id: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 09 Sep 2021 19:00:52 -0000

v10:
Hi folks,

For this iteration I fixes some minor things Alistair mentioned in review and splitted one of patches into two:
one with preliminary CSR numbers(unfortunately there're still no final ones) and another with actual CSR implementation.

As for not raising the exception on writing into PM CSRs in wrong mode, it's expected behavior and reflected in the spec, but I agree that it's odd.

Thanks

v9:
Hi folks,

Finaly the J-ext spec has table with preliminary CSR numbers.
Rebased and updated CSR machinery for recent changes.
Addressed Alistair's comments.

v8-resend:
Resending to trigger recheck due to minor codestyle issues.

v8:
Hi folks,

Finally we were able to assign v0.1 draft for Pointer Masking extension for RISC-V: https://github.com/riscv/riscv-j-extension/blob/master/pointer-masking-proposal.adoc
This is supposed to be the first series of patches with initial support for PM. It obviously misses support for hypervisor mode, vector load/stores and some other features, while using temporary csr numbers(they're to be assigned by the committee a bit later).
With this patch series we were able to run a bunch of tests with HWASAN checks enabled.

I hope I've managed to addressed @Alistair's previous comments in this version.

Thanks!

v7:
Hi folks,

Sorry it took me almost 3 month to provide the reply and fixes: it was a really busy EOY.
This series contains fixed @Alistair suggestion on enabling J-ext.

As for @Richard comments:
- Indeed I've missed appending review-by to the approved commits. Now I've restored them except for the fourth commit. @Richard could you please tell if you think it's still ok to commit it as is, or should I support masking mem ops for RVV first?
- These patches don't have any support for load/store masking for RVV and RVH extensions, so no support for special load/store for Hypervisor in particular.

If this patch series would be accepted, I think my further attention would be to:
- Support pm for memory operations for RVV
- Add proper csr and support pm for memory operations for Hypervisor mode
- Support address wrapping on unaligned accesses as @Richard mentioned previously

Thanks!

Alexey Baturo (6):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Add CSR defines for RISC-V PM extension
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  31 +++
 target/riscv/cpu.h                      |  33 +++
 target/riscv/cpu_bits.h                 |  96 ++++++++
 target/riscv/csr.c                      | 287 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  42 ++++
 9 files changed, 498 insertions(+)

-- 
2.30.2


