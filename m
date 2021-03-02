Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH2Fq-0001TJ-N3
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 05:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fo-0001Rl-Gn; Tue, 02 Mar 2021 05:27:48 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2Fm-0008E2-T9; Tue, 02 Mar 2021 05:27:48 -0500
Received: by mail-ej1-x634.google.com with SMTP id do6so34271123ejc.3;
 Tue, 02 Mar 2021 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RuR90N/43hMEncbOD5dx5v2+Jo2J03Bks+rsMvsF56o=;
 b=OELaKDAXKcfghMSkHv+CjfJNMW3QXWVuvrH+XmKgzo9rXnhbM34iUrkVEcpvpFb8RA
 rIigRynTMQmJ2KZFwdpm8vO0Oa1Ve0He0xw4JH4TOyiJUKFS91UjGzI9zXIYskHLXirm
 3EPGcqpVsUI8G/k4NSFx2p8mlVtGBSTkIuK0nTYEg5pcXY3Y/LODBeUMzFz0I3Y/iQM4
 tn57Yr8BciGpFXA7Ieygv/XQYKzcZaXN5IDALOxCaFTlT8N1VxkGqe0OcvEBaEqMAYB8
 6y8bl5f55AemJNHpTWzumASH40mU+VhnJjzZEKANowCpUBP9hI/zE6uqDTKshtXgZE4w
 3orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RuR90N/43hMEncbOD5dx5v2+Jo2J03Bks+rsMvsF56o=;
 b=VR2/ymQ0Qwe9A9U2uugaxiMU4hrrK9+xPJuFe2mfZnJPWUgTGLr+Z4mRSfMofvBFJQ
 cTqB6d9T6U4WdTXxnf189QjRbMCv+oQ9YpM66x30AFLxH+kZMHT87MOeONgDo1tuJSMN
 HPlZNNRChyGGnHtssF5/HK9rCa7YLn5Kw7UEdlMehS8cbPw4g4jNGky8DSXcu4VXjUHJ
 gsJV2dqjlDRn2x/vay0M8A5gpe/yKDqqDits18FVOri8DeM+cTtPB184S3M9mqSLHU6I
 leez9FBzM3xiC7Xv7kAe34g1sJdp6+5BHo/yuYk5tMEFksXhOmepx66xcsw94dMYpr1j
 pkiw==
X-Gm-Message-State: AOAM531uFUNf7WQb49a+gucaRr/ZwWkA5vQOPXzBzeIA0d7y+D0xYoDS
 ba5D/dEf2bdc8zHpKFVNX7gOXmWz4GM=
X-Google-Smtp-Source: ABdhPJxlhnZ0my7y9JMOkhYmuHAr+vPvdBCg1dHJiqkxksWtPOc3Qn2Ay7gyjpoXQWoqrZGOdRBc+A==
X-Received: by 2002:a17:906:5016:: with SMTP id
 s22mr20312566ejj.550.1614680861203; 
 Tue, 02 Mar 2021 02:27:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u14sm16722292ejx.60.2021.03.02.02.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:27:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Chris Wulff <crwulff@gmail.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Anthony Green <green@moxielogic.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marek Vasut <marex@denx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 0/7] cpu: Move CPUClass::has_work() to TCGCPUOps
Date: Tue,  2 Mar 2021 11:27:30 +0100
Message-Id: <20210302102737.1031287-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Tue, 02 Mar 2021 10:27:48 -0000

Hi,=0D
=0D
cpu_has_work() isn't used out of TCG, so restrict it to it.=0D
RFC because maybe it could?=0D
=0D
PPC unfinished because it uses some odd CPUClass reuse, so I'd=0D
need help from ppc folks.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  sysemu/tcg: Restrict tcg_exec_init() to CONFIG_TCG=0D
  sysemu/tcg: Restrict qemu_tcg_mttcg_enabled() to TCG=0D
  target/arm: Directly use arm_cpu_has_work instead of=0D
    CPUClass::has_work=0D
  target/s390x: Move s390_cpu_has_work to excp_helper.c=0D
  cpu: Declare cpu_has_work() in 'sysemu/tcg.h'=0D
  cpu: Move CPUClass::has_work() to TCGCPUOps=0D
  target/arm: Restrict arm_cpu_has_work() to TCG=0D
=0D
 include/hw/core/cpu.h           | 27 ---------------------------=0D
 include/hw/core/tcg-cpu-ops.h   |  4 ++++=0D
 include/sysemu/tcg.h            | 30 ++++++++++++++++++++++++++----=0D
 target/arm/internals.h          |  1 +=0D
 target/s390x/internal.h         |  1 +=0D
 accel/tcg/cpu-exec.c            |  8 ++++++++=0D
 hw/core/cpu.c                   |  6 ------=0D
 softmmu/cpus.c                  |  1 +=0D
 target/alpha/cpu.c              |  2 +-=0D
 target/arm/cpu.c                |  6 +++---=0D
 target/arm/op_helper.c          |  2 +-=0D
 target/avr/cpu.c                |  2 +-=0D
 target/cris/cpu.c               |  3 ++-=0D
 target/hexagon/cpu.c            |  2 +-=0D
 target/hppa/cpu.c               |  2 +-=0D
 target/i386/cpu.c               |  7 +------=0D
 target/i386/tcg/tcg-cpu.c       |  6 ++++++=0D
 target/lm32/cpu.c               |  2 +-=0D
 target/m68k/cpu.c               |  2 +-=0D
 target/microblaze/cpu.c         |  2 +-=0D
 target/mips/cpu.c               |  2 +-=0D
 target/moxie/cpu.c              |  2 +-=0D
 target/nios2/cpu.c              |  2 +-=0D
 target/openrisc/cpu.c           |  2 +-=0D
 target/riscv/cpu.c              |  2 +-=0D
 target/rx/cpu.c                 |  2 +-=0D
 target/s390x/cpu.c              | 19 +------------------=0D
 target/s390x/excp_helper.c      | 18 ++++++++++++++++++=0D
 target/sh4/cpu.c                |  2 +-=0D
 target/sparc/cpu.c              |  2 +-=0D
 target/tilegx/cpu.c             |  2 +-=0D
 target/tricore/cpu.c            |  2 +-=0D
 target/unicore32/cpu.c          |  2 +-=0D
 target/xtensa/cpu.c             |  2 +-=0D
 tcg/tcg.c                       |  1 +=0D
 target/ppc/translate_init.c.inc |  2 +-=0D
 36 files changed, 94 insertions(+), 86 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

