Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8t01-0001nu-An
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 17:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8szz-0001n1-JV; Sun, 07 Feb 2021 17:57:47 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8szy-00010k-23; Sun, 07 Feb 2021 17:57:47 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a1so15094184wrq.6;
 Sun, 07 Feb 2021 14:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBvUJmuO1HWJsTmwYfeM1sBfouhQ3Mk2gM2vgeBV9Hk=;
 b=AVBRIJnuq4XUcYbKytWtpsNdZLuvdQNxYpjreIU/X+nFY3DtBiHBNG8RSUHwxRWLQ+
 6xy13W0QGNXRXV1f+Ln+ObXEmzypBaaKmifRkOu4sn8Nbgt+PwZ1TQ1jm90midjSReKe
 uBhOa9ggQhcmd0wEJoZwITS3kn9zLZyN41Bwcuk+e8ibMLJc163/reFRjWItf5iOMBpO
 S7UrTJSQGUbd/0EzJqOYIxaB0AJFUuXb999JoO22lphLj0QXXiLmufywuDIx1hps13wm
 ePzCYSCEZyDei/yI5FO28d4zTfd5KJvATLSNBSfYnxeguLsLitp5KcZC0+9REEqjPRVi
 W2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nBvUJmuO1HWJsTmwYfeM1sBfouhQ3Mk2gM2vgeBV9Hk=;
 b=S7yrIgu8FPUEedcTgqbsk+/FHQwoqAuzd4UV8ll1zWlHAARqRF+j1zm1hO8eKtTGqO
 ia18qeYilyZTYKM70AV+TD4kAtjCi3GcjcAzFfdI/rFZLQne/9XZR8RiVAZrTvXD6c3l
 QCEH0ZURBV3ubobFJzH61g75g3H+feBPRLv+wJh4dUwqllSad+fYf0oMlOE9CusXXveP
 CoB1C7qVoy+xo9PxTDs2o0HZ1D29mBSTpykY3gP6+0jStKutaIoCioodDk6gAPyT/9qX
 QFEXlcP7rpLDZMh0l3UjbH+eba7TgOYY7A3hND/L2NpCXHu05TDIBcV932lRLTfwxbqv
 R/5g==
X-Gm-Message-State: AOAM532nw+zNnQtpy9e6BpSSa8YYx9Kzv6wpY3pJH429blIY+998bg1v
 2DeByfUkfswax7Vge69WJzi1v46EWw4=
X-Google-Smtp-Source: ABdhPJyXDkfsv4Kkjaef9D5iaDkjJTuj7kNBEVYXqabnTqDo02q4ytD0wMAEDbAl7UUgV2CD3R3wyA==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr17382674wrn.63.1612738661431; 
 Sun, 07 Feb 2021 14:57:41 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o18sm9676117wmp.19.2021.02.07.14.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 14:57:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 0/6] exec: Remove "tcg/tcg.h" from "exec/cpu_ldst.h"
Date: Sun,  7 Feb 2021 23:57:32 +0100
Message-Id: <20210207225738.2482987-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 07 Feb 2021 22:57:48 -0000

Hi,=0D
=0D
I wondered why changing something in "tcg/tcg.h" would trigger=0D
rebuilding the whole tree and figured the inclusion in=0D
"exec/cpu_ldst.h".=0D
=0D
By making tlb_addr_write() static to accel/tcg/cputlb.c we can=0D
remove the "tcg/tcg.h" inclusion and reduce the number of objects=0D
to rebuild.=0D
=0D
I added tlb_assert_iotlb_entry_for_ptr_present() but there is=0D
this comment in target/arm/mte_helper.c which I don't understand=0D
much (so have no clue how to fix this TODO) but I suppose this=0D
would be to add a proper implementation and not need this ugly=0D
tlb_assert_iotlb_entry_for_ptr_present():=0D
=0D
     * TODO: Perhaps there should be a cputlb helper that returns a=0D
     * matching tlb entry + iotlb entry.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  target: Replace tcg_debug_assert() by assert()=0D
  target/m68k: Include missing "tcg/tcg.h" header=0D
  target/mips: Include missing "tcg/tcg.h" header=0D
  accel/tcg: Include missing "tcg/tcg.h" header=0D
  accel/tcg: Refactor debugging tlb_assert_iotlb_entry_for_ptr_present()=0D
  exec/cpu_ldst: Move tlb* declarations to "exec/exec-all.h"=0D
=0D
 include/exec/cpu_ldst.h                 | 52 -------------------------=0D
 include/exec/exec-all.h                 | 47 ++++++++++++++++++++++=0D
 target/arm/translate.h                  |  4 +-=0D
 accel/tcg/cputlb.c                      | 23 +++++++++++=0D
 accel/tcg/tcg-accel-ops-mttcg.c         |  1 +=0D
 accel/tcg/tcg-accel-ops-rr.c            |  1 +=0D
 target/arm/mte_helper.c                 | 15 ++-----=0D
 target/arm/sve_helper.c                 | 18 +++------=0D
 target/arm/translate-a64.c              | 12 +++---=0D
 target/arm/translate-sve.c              |  4 +-=0D
 target/arm/translate.c                  | 36 ++++++++---------=0D
 target/hppa/translate.c                 |  4 +-=0D
 target/m68k/op_helper.c                 |  1 +=0D
 target/mips/msa_helper.c                |  1 +=0D
 target/rx/op_helper.c                   |  6 +--=0D
 target/rx/translate.c                   | 14 +++----=0D
 target/sh4/translate.c                  |  4 +-=0D
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-=0D
 18 files changed, 127 insertions(+), 118 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

