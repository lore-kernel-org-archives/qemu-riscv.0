Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3IID-0000X9-B6
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 09:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3IIB-0000WW-VU
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 09:54:32 -0500
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3II9-0006J6-Cf
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 09:54:31 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 f7-20020a4a8907000000b004a0cb08d0afso245601ooi.8
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g5jjcmtsXgcdYuoBpy0plLuV603JGXCxxVQ/y11M/JA=;
 b=iDWSp9LbgTkq6K4cWSXgpIwh5LqYlrLhMIKICCdbYBzmrP55/HdV9oRhmJVdc8HA4I
 CRR0DUGzvJv7BzVYjfXt/PLPR/S2FYn+ey4ocZUWTn3FwYXn8phWk4zEf6vyco8ZgpAS
 uMFxsllL50hmWeVf2kAOxBpGyzTH11f1E2gsxEN4HERz9wlrAJJa5yMWwSjgGkVrrK1F
 Wn4BywWg5Z44oNQ7bvqLBABlQYT867YXugjKD6lDMGbIhLM61/JisKsaE3kpgbhmNkMH
 6Vl3t/e2xEl9esgtBgRyY7NOa+OCP9R/ABv3ttBUeH2H162ldIMcshyfdCa9zt16Tkwd
 DIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5jjcmtsXgcdYuoBpy0plLuV603JGXCxxVQ/y11M/JA=;
 b=BNQuSPWB3CLfndBIkbdFOiXqnt0Pih7JsooZWS46IjV729JGCq2OCqEMZt5HzI8/zs
 xG5yXiToNWYKTDcjtIaAC46WOzO2EQN7XNrUvW4+p3qe93IyPJauRvdbGp1AT8Sv8Ep2
 lnzzguKDlERiPdM9B2mGy0UR1B71w2fknWVhRJVWjrfZORTJS4bSwWPg838qKNQ2hp2I
 gbjlRHGHu0wYPqTWiNrq+73WkxqiJPP/BsGwANWMlUSZwBTOGux89fwn7kIg+rcl5kOT
 Q8rqwVX1QSmi85QDmdqHx7Giwlnk6hZa8Q59ygRpS8/0pAnHBAJvjGGz60N6xaZgav7i
 Cmvw==
X-Gm-Message-State: ANoB5pk0EtjUGtrN9fJvQEunqebF3CDj/GGd2G8hqqjGHuJ8/Xf53IvM
 ytEy6tYFs1SGgdLsczRkB1RsNHqf3cCK84POies=
X-Google-Smtp-Source: AA0mqf4AHa+emN/NClnNjjAYtnkkq2oxjTw7zO6qZ2WU1HbRZv6ex0Zl+idpoSCB/ScZLgUI/tjVIQ==
X-Received: by 2002:a4a:e0c9:0:b0:49e:eb9b:bd79 with SMTP id
 e9-20020a4ae0c9000000b0049eeb9bbd79mr1026619oot.9.1670511265715; 
 Thu, 08 Dec 2022 06:54:25 -0800 (PST)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b14-20020a4ae20e000000b004968311a31asm10044225oot.39.2022.12.08.06.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 06:54:23 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 0/3] target/riscv: Apply KVM policy to ISA extensions
Date: Thu,  8 Dec 2022 20:24:08 +0530
Message-Id: <20221208145411.122799-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Dec 2022 14:54:32 -0000

Currently the single and multi letter ISA extensions exposed to the
guest vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
and applies policies set in KVM to the extensions exposed to the guest.

These patches can also be found on riscv_kvm_ext_v3 branch at:
https://github.com/mdchitale/qemu.git

Changes in v3:
- Address comments from Bin Meng

Changes in v2:
- Rebase to latest riscv-to-apply.next
- Update linux headers to version 6.1-rc8
- Add reviewed by tags

Mayuresh Chitale (3):
  update-linux-headers: Version 6.1-rc8
  target/riscv: Extend isa_ext_data for single letter extensions
  target/riscv: kvm: Support selecting VCPU extensions

 include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
 include/standard-headers/linux/ethtool.h      |  63 +++++++-
 include/standard-headers/linux/fuse.h         |   6 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_blk.h   |  19 +++
 linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   4 +
 linux-headers/linux/kvm.h                     |   1 +
 linux-headers/linux/psci.h                    |  14 ++
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
 target/riscv/cpu.c                            |  52 ++++---
 target/riscv/kvm.c                            |  88 +++++++++--
 target/riscv/kvm_riscv.h                      |   2 +-
 16 files changed, 408 insertions(+), 52 deletions(-)

-- 
2.34.1


