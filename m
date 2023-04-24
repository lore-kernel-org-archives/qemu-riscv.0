Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqsAR-0006YC-VO
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 05:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAQ-0006Xd-Fn
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAO-0001JI-Pv
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1a526aa3dd5so46852035ad.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327243; x=1684919243;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0ZLJMjIfbteWgeTcitGPEMCjIxn5hMvK2omBBWKwyY=;
 b=fq0Jyl4ZxwJPKbMeJLyxi9p0RP7KmtkU7WUA4tz8RC4/28JDQSA5PrCQYR1QIpn0sJ
 9V3Eam0beiDPJ0gMQfNjyqgjmaCampqBYvLatXsMPV83QqJRxrvO09bLBk2ndcjjneok
 IkFsiaAy6euujSRI2KFjRKCbW9XAQSW4cXU3z66eeHIXKzr70Zj479wojwyFQ6R2REhf
 Y5YGJkS/O52/SFkyfh2naJYgvrxN4sXPkmk4kGcqulVZi9u1KSHU3eUTqnadBg0BMkCw
 5S+pKOhIscj5ApEv0QP4ICl3URE+gJwmFyCtANSY5JSaLomfI5P8wHjyqAoywVWifj0a
 gKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327243; x=1684919243;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0ZLJMjIfbteWgeTcitGPEMCjIxn5hMvK2omBBWKwyY=;
 b=VplLyQumGP5pdRDVL2gaLUQTak7zdoLs1g1ehsIakwsrbtksQTVN9enhKNRdZzNMHq
 6cjSbJCzLXwjSQe30sh//DbmTM9UsVvPeZXrAIlqeywdGiR+AznG6DRX+7ZF09naBap7
 sZyuS+k5ckNXM1P4wfj6w1GDxm+Vbk9qBpwyQx4Sru/VqQ6PJMULqV8PCrq8m3BsneTK
 xAEtvWTiTaZ9IWnyV56ji5BYqfshR4U/cgr7WBU4KEIeXKltv3iUehuTlFEvJz5FqCSV
 8ytmir+MjsKqkXdd+jNgw3ezCFAjilEX/Zmu54Fn720Dnr2Q5eB8skj2PrSWA66WIgwa
 +C7g==
X-Gm-Message-State: AAQBX9dpNltswzxNLiiEoyFcmwNpF7ZiZVDIlR8ecmb3BrgazHxX2Lu7
 FeI1j2m9H/DHrSnM31MXmiNMbQ==
X-Google-Smtp-Source: AKy350ZoO57h/XuKK+tNI/Br+M4m5wQJx/Lip/K3clt+KuomxdZBHh9m4cRozL2p5KojAI5nWj8JMA==
X-Received: by 2002:a17:902:ead2:b0:1a4:fc40:bf04 with SMTP id
 p18-20020a170902ead200b001a4fc40bf04mr12594617pld.27.1682327242706; 
 Mon, 24 Apr 2023 02:07:22 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:22 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 0/6]  Add RISC-V KVM AIA Support
Date: Mon, 24 Apr 2023 09:07:02 +0000
Message-Id: <20230424090716.15674-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 09:07:26 -0000

This series introduces support for KVM AIA in the RISC-V architecture. The
implementation is refered to Anup's KVM AIA implementation in kvmtool
(https://github.com/avpatel/kvmtool.git). To test these patches, a Linux kernel
with KVM AIA support is required, which can be found in the qemu_kvm_aia branch
at https://github.com/yong-xuan/linux.git. This kernel branch is based on the
riscv_aia_v1 branch from https://github.com/avpatel/linux.git and includes two
additional patches.


Yong-Xuan Wang (6):
  update-linux-headers: sync-up header with Linux for KVM AIA support
  target/riscv: support the AIA device emulateion with KVM enabled
  target/riscv: check the in-kernel irqchip support
  target/riscv: Create an KVM AIA irqchip
  target/riscv: update APLIC and IMSIC to support KVM AIA
  target/riscv: select KVM AIA in riscv virt machine

 hw/intc/riscv_aplic.c     |  19 +++-
 hw/intc/riscv_imsic.c     |  16 ++-
 hw/riscv/virt.c           | 214 +++++++++++++++++++++-----------------
 linux-headers/linux/kvm.h |   2 +
 target/riscv/kvm.c        |  96 ++++++++++++++++-
 target/riscv/kvm_riscv.h  |  36 +++++++
 6 files changed, 277 insertions(+), 106 deletions(-)

-- 
2.17.1


