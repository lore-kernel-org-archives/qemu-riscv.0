Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8tOg-0007MO-JQ
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 18:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOf-0007LR-0j; Sun, 07 Feb 2021 18:23:17 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tOd-00014Y-I4; Sun, 07 Feb 2021 18:23:16 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so15170949wrx.1;
 Sun, 07 Feb 2021 15:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y1pGU14UHqg8rNsEIaCyxsn4UDDD0m20iHSEWL2qx/Q=;
 b=TKBDWfIup/ugeSs+yR9NlfKx/HGCBkDqJ00cSaUOHQEaoAWM+e++jYevmJFqc7Vg0C
 rLYD7u2CGCidVZxFaHFF7TecGq5jDWya+3LkMHbFvrCXnh4r3x9/o+VjNHpFtCuOQn01
 7ub9Ga73lnMWI3qqqcNbFPznfNpJ5s3cangE6lJwNmf84aJVRzBMYe1mXM/jkX+yuCQI
 pusn8N+w1m/6OVcS0cYX4fRBIgu9VGCuegUwVXo+bdi6nmxvYX01biBTdvVu5oQZCHgV
 6pcR7Ty0zdrMVE0E36I9iKJYBhJGdDeDfuB1Q6QMyQeZUTs3N7dEKwGo4KVjpj+cefYt
 XcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=y1pGU14UHqg8rNsEIaCyxsn4UDDD0m20iHSEWL2qx/Q=;
 b=B3/fwQkyHyO48WkcA0y7HPeZ/mwS7AV4KskNhKZ3d5jGl7brFHrX7ytFL7N6HX0EBC
 1JsSTGybvh0Naep7yhElPnZqzi5Td3TymlIs+MwOhfBg0jNVraWkKRh0ztARCvxgRAMw
 yJ02d1XoI5h1heRC6Ft72WkVhjUY9Nty2VbuXafxieM689BhsHHO4/lY64MaP/DZVzVC
 EE+vwh2gujvU+TSgUlzw9UMrjWByRJzEcxHQRUrkON7l1EYC6D4BAhJrCAfPx80GCBTS
 JQis78IHVLUSkPtzhEKhXhws/BDpCiw/jDe7xDqjRFXcFyh4hT3Yum1TC9ttlnufCrVV
 UXZg==
X-Gm-Message-State: AOAM5334i1TD+LWO2hW7Ykx9sVwAPSPiar7BiixQDZ/NJ73HxP7ntoMn
 uDqd3I3apVUWIX3LfWcfTduaacIQwbg=
X-Google-Smtp-Source: ABdhPJwSIVoWQ/Jqel/IBUw773Y2P+SPnrGRqwGLR1kgUfexXfzOflsuZqX0oBStxfASFqWJisPEHw==
X-Received: by 2002:a5d:470f:: with SMTP id y15mr16791857wrq.187.1612740193336; 
 Sun, 07 Feb 2021 15:23:13 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d9sm26583482wrq.74.2021.02.07.15.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 0/6] exec: Remove "tcg/tcg.h" from "exec/cpu_ldst.h"
Date: Mon,  8 Feb 2021 00:23:04 +0100
Message-Id: <20210207232310.2505283-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Sun, 07 Feb 2021 23:23:17 -0000

Since v1:=0D
- Do not move tlb_vaddr_to_host()=0D
=0D
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
 include/exec/cpu_ldst.h                 | 28 -------------------=0D
 include/exec/exec-all.h                 | 25 +++++++++++++++++=0D
 target/arm/translate.h                  |  4 +--=0D
 accel/tcg/cputlb.c                      | 23 ++++++++++++++++=0D
 accel/tcg/tcg-accel-ops-mttcg.c         |  1 +=0D
 accel/tcg/tcg-accel-ops-rr.c            |  1 +=0D
 target/arm/mte_helper.c                 | 15 +++--------=0D
 target/arm/sve_helper.c                 | 18 +++++--------=0D
 target/arm/translate-a64.c              | 12 ++++-----=0D
 target/arm/translate-sve.c              |  4 +--=0D
 target/arm/translate.c                  | 36 ++++++++++++-------------=0D
 target/hppa/translate.c                 |  4 +--=0D
 target/m68k/op_helper.c                 |  1 +=0D
 target/mips/msa_helper.c                |  1 +=0D
 target/rx/op_helper.c                   |  6 ++---=0D
 target/rx/translate.c                   | 14 +++++-----=0D
 target/sh4/translate.c                  |  4 +--=0D
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +-=0D
 18 files changed, 105 insertions(+), 94 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

