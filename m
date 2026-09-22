Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF7CC98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 21:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x98Ss-0002xD-9A; Tue, 22 Sep 2026 17:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98Sr-0002wb-28
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:55:49 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98So-0000tf-D8
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:55:48 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-144f7915355so202231c88.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114144; x=1790718944; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fiJfh6oSUUYoPo7/xcIl4gZOELtkNOzvep6zEerumV0=;
 b=XleCNN+7djyOmaIHCXNgLXOKzIGbPv8CDKi9MfTS3sQY397Cm1KttvCeXWXCR0uazn
 AW7/YiIOUQQZC64ca0x0EIxLV9mrbAKTYA1YNLD0DUCTBN28fSq2TlnyOl+8EzHfrnlU
 SbqJlBYRA1qmt2n1B36EHj/Jcwk6h/Kzkidqs71DegIo8XzuCiwcawHpGNm3x9osGBh2
 uLTI8HW3breBfdCKrw07uQ/IlEeb17/5MgYqKJdS5N2hg5k/fYsuh6rF6JCDmjPY+k2Q
 2ceUpB1R7BZpQflsW7xFeoZ4HEBpvUtIMv3Z1PVVd2Xz4n3TwVmImrwBxhCZqqtzPVqT
 XiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114144; x=1790718944;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fiJfh6oSUUYoPo7/xcIl4gZOELtkNOzvep6zEerumV0=;
 b=EJNvELh2gFcu/8Xvftl9wimiVHrmc/02OB6YehQoVmXV7V2xca1MB+3Kq5rme2y2gI
 D2m6kllHjmubhGg5raBHb36qS46EFS8tps0a7tU0Hp+ktmr7Y5HrOHuOnu0k2miet0L6
 KG0XXVKZGfQr4koa1LMnVlphQ/ImVaxo3cVHylMrW4XLAuv29s/3XqPWXDe0ivfjn1Ag
 RzLbetsqO0Sw8mgZpGj08QZyxTGjlnQ2lYG6NXx4FQfkeS+f6DhHlDJdafnjgB715yXf
 lPT3KTfVVtrrhc+p154da761d+TZ4LaVdOZojHtT9Gop8tyMFcxkx3dS6uxZIDcESbMY
 pOXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwywYfpwn/ZmKr/20Tl15joa06Xmfsbjs3w7VR1/MljO0jK6grLyv+DB8ff4GjE0LxYSS0OOlZGziW0@nongnu.org
X-Gm-Message-State: AFuF++nc9KwvGHDxlxCWoC4t2I8Zgd1NsgnC4y1Z4ILFFGegLf6ocyoh
 cQ6wTPccvWRvG5FVtVde9AUEsHximt3Rl+p6eDeXJIOICz3KkzxKqg9b
X-Gm-Gg: AYBFou3NvEugEUrIQBDGPEVrWGTGAdnoMgPQPZ7Vc70HBB1jWUODvQx2dw7VFXOZbAh
 bYccbeUbQIZYfUUpqRYivlpSSfiwudXEcogRAaZmu9gIyhA1XlC2j7qRmXTfRI4prsLbC3ObOzj
 MFt3win1emjTymmUarMvfLk2QTabncI0jV3CdNu6+vFjYxC6wxDk6XAeWM2ICGsWAlJTqUp4UR8
 0J6od4AGkLOG5CyBQ1hYC8IaKPVBx/HpCLwkra3ZbMrN6WC3IqS9BVERLBxJ/R4W9wd1XrjGOKF
 bj1oxmguH2a4/uzSpNX3HT6HDbsO7a/DQzzUsDhPqwS5NfR/lQ2CV2mypzn48VU5txDfgCPv7Ab
 voBngW+iGE8NSlNFbEg2w3yOdWZbpI+Y8TJOK3zzBz0jypb7DmCcDkA9o29i5eyetpnIXhdXHOo
 5hYjF+ZT8Ooq4NwSCppSUKnNScHlsQR6OAZyeUDFRnKDBr1L/TyXV4ZrFlTcDhrhJZkQ4mvO7/D
 8whDLwdrM2wKNcN45sjNq++Zg3HYRg=
X-Received: by 2002:a05:701b:4214:10b0:144:fb31:a597 with SMTP id
 a92af1059eb24-144fb31a701mr174801c88.47.1790114144215; 
 Tue, 22 Sep 2026 14:55:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:55:43 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 0/9] machine: uniquify virt QOM names
Date: Wed, 23 Sep 2026 05:55:23 +0800
Message-ID: <20260922215533.641-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Multiple targets register a virt board as MACHINE_TYPE_NAME("virt").
Those QOM types collide if more than one board is linked into one
qemu-system process. This series splits the QOM type from the -M name
so each virt board can keep a unique type while -M virt, help, and
migration stay the same.

- Add machine_class_set_name() so boards can set MachineClass::name
  when it must differ from the QOM type. machine_class_base_init still
  defaults the name to the QOM type without -machine. Document that
  MachineClass::name is the -M name, not the QOM type. Sort -M help
  by that name so order matches the printed names after types are
  prefixed (arm-virt-11.1-machine vs virt-11.1).
- Give each colliding virt board a unique QOM type and keep the
  existing -M name via machine_class_set_name(): riscv-virt, arm-virt,
  or1k-virt, hexagon-virt, loongarch-virt, m68k-virt, and xtensa-virt.
  Versioned ARM, LoongArch, and M68K boards keep virt-<ver>. Latest
  ARM virt still sets mc->alias to virt.
- query-machines returns MachineInfo typename, the QOM type from
  object_class_get_name(), for qom-list-properties. The -M name alone
  is not that type once virt boards are prefixed.

Changes v1 -> v2:
- query-machines returns MachineInfo typename. v1 returned only the
  -M name, so a client that appended "-machine" looked up the wrong
  type for a prefixed board such as arm-virt-11.1-machine versus
  -M virt-11.1.

Yonggang Luo (9):
  machine: allow -M name to differ from QOM type
  hw/riscv/virt: use unique QOM name
  hw/arm/virt: use unique QOM name
  hw/or1k/virt: use unique QOM name
  hw/hexagon/virt: use unique QOM name
  hw/loongarch/virt: use unique QOM name
  hw/m68k/virt: use unique QOM name
  hw/xtensa/virt: use unique QOM name
  qapi: return MachineInfo typename from query-machines

 hw/arm/virt.c               |  3 +-
 hw/core/machine-qmp-cmds.c  |  1 +
 hw/core/machine.c           |  6 ++++
 hw/hexagon/virt.c           |  1 +
 hw/loongarch/virt.c         |  3 +-
 hw/m68k/virt.c              |  7 ++--
 hw/or1k/virt.c              |  3 +-
 hw/riscv/virt.c             |  3 +-
 hw/xtensa/virt.c            |  3 +-
 include/hw/arm/virt.h       |  2 +-
 include/hw/core/boards.h    | 12 ++++++-
 include/hw/hexagon/virt.h   |  2 +-
 include/hw/loongarch/virt.h |  2 +-
 include/hw/riscv/virt.h     |  2 +-
 qapi/machine.json           |  6 +++-
 system/vl.c                 |  8 ++---
 tests/qtest/qom-test.c      | 65 +++++++++++++++++++++++++++++++++----
 17 files changed, 104 insertions(+), 25 deletions(-)

-- 
2.52.0.windows.1


