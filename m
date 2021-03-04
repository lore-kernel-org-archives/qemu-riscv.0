Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHwNd-0006ce-56
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 17:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNY-0006TU-DW; Thu, 04 Mar 2021 17:23:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNW-0002Lx-Pb; Thu, 04 Mar 2021 17:23:32 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f12so25576630wrx.8;
 Thu, 04 Mar 2021 14:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHeoAp8GFYRuOJSiApa7NgdOQdOqdNenAR63HpCEUyc=;
 b=nZQHZcgCU8xqNDX8qng9oiPgf0qW3QLlZlx53X5r4pDHVGALs5/0j/6aB7i8H9OKHz
 GQq6bGtqYxDYpvIDoStxk38HsHvTg8YcaWow3JW3LJQlHhn9hQoqyiiN0B7VFjkvtx5V
 5UbsPTi+QtI9n22nSknykmXe54nP0lNlT76+RMg7yfaD5Wqz2I3a9KjIHXXXX7IBy85z
 rZeFmrqm9EQxzH06AU2mG9wdr+dqGQMigBPeiUhtUAVgM1TeQeGctfJ+shyGVF/jjkSM
 8qWtyNZqwIaRgX6g6qYtMxIeGUCvE+l5UnVhRy9wJJTEOE2ZL99IbGepoObSDZhyYVDl
 BBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=aHeoAp8GFYRuOJSiApa7NgdOQdOqdNenAR63HpCEUyc=;
 b=lWLCRlw+WtL+WBh2/Argm4dOdZzSGOgqE4gzSBPrPAKptHu15vTHI03AC2KxIh9aFL
 V0VZT1O4TmLopfaQdSg+dh7p2snmBVdNZqVLV+fmOytlF6Z7DqPhexUhnTw1tpcQaWb9
 YdVRZI0ypev/+8GftNevqjAGLqwUqLtJQJphpBvYecOjcO41/2Qw5T1b58H+w3qqaJ89
 IWoxjNlAcnHKFx6P6BbsmUcEVf8sdHHSAZdIZCQMbvInf+6+pgWnczK0HAXdN7LSyBlU
 kBygXa7b54PMP2VIQPT99HlSbcYTmaBfdqs4a4JZCOlQi3PRcuOPoLR4jYhfRaI2PIbe
 Nr6w==
X-Gm-Message-State: AOAM531//+2mghMwdhn3XcXb+bkuPEKvIbEqloLK+8BXzQdMu/aRcTPA
 GaC9sjhazoRG+7CFovBSQULBWLY3ods=
X-Google-Smtp-Source: ABdhPJzpM25P3pzTne4XY3n+9TFpqUqg127nFkrsZ+E8TsHXltpF9Ro++mIJX57b2UAJNtje0WSGOA==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr6135463wro.199.1614896606291; 
 Thu, 04 Mar 2021 14:23:26 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i11sm1009229wro.53.2021.03.04.14.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v2 0/8] cpu: Move CPUClass::has_work() to TCGCPUOps
Date: Thu,  4 Mar 2021 23:23:15 +0100
Message-Id: <20210304222323.1954755-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Thu, 04 Mar 2021 22:23:35 -0000

Hi,=0D
=0D
cpu_has_work() isn't used out of TCG, so restrict it to it.=0D
RFC because maybe it could?=0D
=0D
Since v1:=0D
- finished PPC=0D
- check cc->tcg_ops->has_work non-null (thuth)=0D
=0D
Based-on: <20210227232519.222663-1-richard.henderson@linaro.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  sysemu/tcg: Restrict tcg_exec_init() to CONFIG_TCG=0D
  sysemu/tcg: Restrict qemu_tcg_mttcg_enabled() to TCG=0D
  target/arm: Directly use arm_cpu_has_work instead of=0D
    CPUClass::has_work=0D
  target/s390x: Move s390_cpu_has_work to excp_helper.c=0D
  target/ppc: Duplicate the TCGCPUOps structure for POWER CPUs=0D
  cpu: Declare cpu_has_work() in 'sysemu/tcg.h'=0D
  cpu: Move CPUClass::has_work() to TCGCPUOps=0D
  target/arm: Restrict arm_cpu_has_work() to TCG=0D
=0D
 include/hw/core/cpu.h           | 27 -----------=0D
 include/hw/core/tcg-cpu-ops.h   |  4 ++=0D
 include/sysemu/tcg.h            | 30 +++++++++++--=0D
 target/arm/internals.h          |  1 +=0D
 target/s390x/internal.h         |  1 +=0D
 accel/tcg/cpu-exec.c            | 12 +++++=0D
 hw/core/cpu.c                   |  6 ---=0D
 softmmu/cpus.c                  |  1 +=0D
 target/alpha/cpu.c              |  2 +-=0D
 target/arm/cpu.c                |  6 +--=0D
 target/arm/op_helper.c          |  2 +-=0D
 target/avr/cpu.c                |  2 +-=0D
 target/cris/cpu.c               |  3 +-=0D
 target/hexagon/cpu.c            |  2 +-=0D
 target/hppa/cpu.c               |  2 +-=0D
 target/i386/cpu.c               |  7 +--=0D
 target/i386/tcg/tcg-cpu.c       |  6 +++=0D
 target/lm32/cpu.c               |  2 +-=0D
 target/m68k/cpu.c               |  2 +-=0D
 target/microblaze/cpu.c         |  2 +-=0D
 target/mips/cpu.c               |  2 +-=0D
 target/moxie/cpu.c              |  2 +-=0D
 target/nios2/cpu.c              |  2 +-=0D
 target/openrisc/cpu.c           |  2 +-=0D
 target/riscv/cpu.c              |  2 +-=0D
 target/rx/cpu.c                 |  2 +-=0D
 target/s390x/cpu.c              | 19 +-------=0D
 target/s390x/excp_helper.c      | 18 ++++++++=0D
 target/sh4/cpu.c                |  2 +-=0D
 target/sparc/cpu.c              |  2 +-=0D
 target/tilegx/cpu.c             |  2 +-=0D
 target/tricore/cpu.c            |  2 +-=0D
 target/unicore32/cpu.c          |  2 +-=0D
 target/xtensa/cpu.c             |  2 +-=0D
 tcg/tcg.c                       |  1 +=0D
 target/ppc/translate_init.c.inc | 79 ++++++++++++++++++++++++++++++---=0D
 36 files changed, 171 insertions(+), 90 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

