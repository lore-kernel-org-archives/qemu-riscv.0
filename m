Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5E8C98318
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 08:18:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xANZm-00082l-D2; Sat, 26 Sep 2026 04:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANZk-00081w-5J
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:04 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANZi-0006mJ-FF
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:03 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd04f7f2so1238019c88.0
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410561; x=1791015361; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=e/A1ak6zerCgv8Ghn9vTShOZwcbaS07iq7JcXAHPfBU=;
 b=Cft6CTNYROVd6i6mvJECvslUBfaHl5eP/mwvn26RcuCq1+3+MEqfIuAYoHMkS6aNid
 nUoiilko5CYBRPUnurPOfXdSWjCSOXX45CXrSxuD6nyc8ZHclWnxBNE0BN5SAFQGJvnG
 oNzgeHUPDwFCWJ3OrpJUi3ON3LLvnqKeoyNhdhWKSom6SE3cwuzxFo/4hx41gDb2wgIF
 tBajPME5LmeWTKkVwqaMGj79rG3kerBkQahrk9rpuiRWPQQGAt4bwWpciqMGYnJ6aECf
 6HEpYV9qYB4d7183f/Im1wWhnDVIuT4qTNiThKTy/uRzqSuoaEpd/uzGnpMS3Zt6uAOk
 V/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410561; x=1791015361;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=e/A1ak6zerCgv8Ghn9vTShOZwcbaS07iq7JcXAHPfBU=;
 b=yvsQQ2uG1esOvzcvUt4x3+ptGpanfW7ZY84hTFt6nDyKsyvX83mUXkkBbPkElpRQLp
 YQsgul8pAw2a1mho084f5d33KJajm9XuGAGBQxk5/CBjc/z/9wSya2YDaWQpWKVmEJZi
 kwuNwwENVtNroOEYb6XImQ0Zupi6CY1BL8XV7EU0i4somtflRa2rQ+5GI7w1AmgSvP2W
 sGHWsatOCnXTQIa+PkF6RR2vkQ7zbHe5pY/dcFxtANeKH5nTRWT3pwgFHnErwkWhu79m
 KIsh/D53Ex6PCzy7TYkk9Gk8m3QCveNkjSl/o7uVGdft1TjDQZfvNuP/ykKWghub5Fh5
 97Aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpyuROuP66pJF76pJKVQTEKKjU5Cmw7Jvnd3RtOIZbc4pAoD9TFig7TIqD0EdHTpAw7EfQ2cGNNiA5@nongnu.org
X-Gm-Message-State: AFuF++nErzkqvZjKorVz1nQF2px5hym+5aVyUgo/XlFMC1pPvZYvRpwu
 xJtoYkDHQFqmGkduYtfX86LvZRg9195v1DMRUjIWaIyn/emF0wJNr2az
X-Gm-Gg: AYBFou30gWP0M4F9CDVXcE3HVDeafXnIEc09C46j9Kwtj65kRTxm9n0r5Tb5PEFp6U8
 BsnV2+HUBjLlcjwysT9m5PPV5aQ9ANlFu7emGAFHNlDc4tFL73P3Iwbwyn4OWvsBE5svtuli8X2
 GCSvOB6Tb2BnCBdAeTbt7u9ta2b/9BR2i2YKiBxuSOjlO+dBd6wSlyb0IWCZNRoL31DLuu9zYDF
 IxiJ4zYIYet+ea4MxTVz6Sj65JeFoAP9PvwaLrj0TP62ZvWL17/WJyYoaq7zAahTJXIx7WZfSOZ
 YzkRZT81xs4gUpSVnqRX61g2jP7b79NwQECXsxDlFUEtZMf3kek+eHxdJFVxSbQdhios4rlUH+N
 m1Od3ce+C+OBi+1eH1mAwIFcqC7VqA4NYgzs5Lf0s30XYNyam7uI8DBsssyvL4jqChVwcoCEXcB
 r2KF5FgX5QsnxV+gXVob1uj65hFsNUBkd0zN5SHVxm2SMUS2bxt7Lv7+/LvzIBU5bQEIzulxj5A
 Iv4QgonKaCM0JNOPJgIQElCxK7GQ/c=
X-Received: by 2002:a05:7022:603:b0:144:f47b:d31a with SMTP id
 a92af1059eb24-146ce29fdc4mr3248748c88.1.1790410560658; 
 Sat, 26 Sep 2026 01:16:00 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:15:59 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 00/10] machine: uniquify virt QOM names
Date: Sat, 26 Sep 2026 16:15:40 +0800
Message-ID: <20260926081551.29-1-luoyonggang@gmail.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Changes v2 -> v3:
The versioned-machine example in boards.h now follows hw/arm/virt.c.
machine_class_set_name() keeps the -M name as virt-<version>, the QOM type in
the example is arm-virt, and the latest helper is DEFINE_VIRT_MACHINE_AS_LATEST.

Changes v1 -> v2:
- query-machines returns MachineInfo typename. v1 returned only the
  -M name, so a client that appended "-machine" looked up the wrong
  type for a prefixed board such as arm-virt-11.1-machine versus
  -M virt-11.1.

Yonggang Luo (10):
  machine: allow -M name to differ from QOM type
  hw/riscv/virt: use unique QOM name
  hw/arm/virt: use unique QOM name
  hw/or1k/virt: use unique QOM name
  hw/hexagon/virt: use unique QOM name
  hw/loongarch/virt: use unique QOM name
  hw/m68k/virt: use unique QOM name
  hw/xtensa/virt: use unique QOM name
  qapi: return MachineInfo typename from query-machines
  machine: match the versioned virt example to arm virt

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
 include/hw/core/boards.h    | 26 +++++++++++----
 include/hw/hexagon/virt.h   |  2 +-
 include/hw/loongarch/virt.h |  2 +-
 include/hw/riscv/virt.h     |  2 +-
 qapi/machine.json           |  6 +++-
 system/vl.c                 |  8 ++---
 tests/qtest/qom-test.c      | 65 +++++++++++++++++++++++++++++++++----
 17 files changed, 113 insertions(+), 30 deletions(-)

-- 
2.52.0.windows.1


