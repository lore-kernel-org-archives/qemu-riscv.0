Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxB-0000tv-7H
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxA-0000sO-5D
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:04 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdax8-0007HV-6D
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:03 -0400
Received: by mail-pg1-x529.google.com with SMTP id g184so795311pgc.6
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwpoK3AkOygt2vmGyYqeLXwkxSReL2Mm2DFdwS7n58E=;
 b=Dn1j3YgMijQdCi2jIkl0pjXQjTPy04t20DzLMQeyg0MLtujRSI782RMWOe3NUWfDtI
 fxtScXARJxz7scnn6oYptBZq4KoLlfy032GVAEyvdl63J9m/rqY6ktKyGgGdbQVboNXv
 QgzVv5BDTm9zgmvxdOM6RWM8pWurxy1V8xao+cMKXqPqRn+m8TJJa75SEOxQvm/YRAIS
 XjP2xuVT13IcHOTk7uhQ+d8wWsSD5Fb3zw7obFUnnnE5tL+ScuQtWpVAwxCNvKQYjXE1
 kE/zlOvP8Kk/7Ov6R8/QKu2/CvZUSR8XjGzSRU/0kAJTFuL6qIpUlUMvOtgC1z7RwVpM
 AHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwpoK3AkOygt2vmGyYqeLXwkxSReL2Mm2DFdwS7n58E=;
 b=RKWSR9pA7rfxR2lnmjKiZkVoJQWece7mulkgWGtibN/34DqRRgdJPn6pjVNfCKa+ws
 Q1ycvZmjQil19WhHN2BHgkh7eDgyuaXWi9dF3hhMn/pb3AgIK+z3JSIiYvYOrHzwext+
 qsMcgJtx/8pq/6Ha2wDFnWg1OaTqkcRQlDByqdpVV6k0FHvZaKI9AkveSGauNNeejCVH
 oiMnml7abibpgKnUb/FM+rqfGClkLQruUrDVilPn6nVO3BD5Rq0cvBIrRPoCciW6zyVz
 /VnrW6FPLEUkhV9y+ZClcysB33vk3e/lZ/81+IbCUP7EUssjYoJgPjxsv19S3HQ9qeak
 nFMQ==
X-Gm-Message-State: AOAM531sC6p7haOOLPaJp06XwsyK5oJv9qPem52jRlwcw7YMzatjxGDe
 F2FSAoX0gHIyYDVK45e/B6LPQwtyLGd+Ag==
X-Google-Smtp-Source: ABdhPJyt7nG7PV2N8MXVaajGbiqPTFrUKm/HUa2P39kUhOkHQPnN0w/g/qaCHMv/VVIBTlbdtnlmVQ==
X-Received: by 2002:a65:6398:: with SMTP id h24mr5148478pgv.367.1634833800243; 
 Thu, 21 Oct 2021 09:30:00 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:29:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v5 0/8] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Fri, 22 Oct 2021 00:29:46 +0800
Message-Id: <20211021162956.2772656-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:04 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfh - Half width floating point
Zfhmin - Subset of half width floating point

Zfh, Zfhmin v0.1 is now in public review period and is required by
RVV extension:
https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ

Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
respectively.

The port is available at:
https://github.com/sifive/qemu/tree/zfh-upstream-v5

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v5:
  * Rebase on riscv-to-apply.next.

v4:
  * Spilt Zfh, Zfhmin cpu properties related changes into individual
    patches.

v3:
  * Use the renamed softfloat min/max APIs: *_minimum_number()
    and *_maximum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.
  * Add braces for if statements in REQUIRE_ZFH() and
    REQUIRE_ZFH_OR_ZFHMIN().
  * Rearrange the positions of Zfh and Zfhmin cpu properties.

v2:
  * Use {get,dest}_gpr APIs.
  * Add Zfhmin extension.

Based-on: <20211021160847.2748577-1-frank.chang@sifive.com>

Frank Chang (3):
  target/riscv: zfh: add Zfh cpu property
  target/riscv: zfh: implement zfhmin extension
  target/riscv: zfh: add Zfhmin cpu property

Kito Cheng (5):
  target/riscv: zfh: half-precision load and store
  target/riscv: zfh: half-precision computational
  target/riscv: zfh: half-precision convert and move
  target/riscv: zfh: half-precision floating-point compare
  target/riscv: zfh: half-precision floating-point classify

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 180 ++++++++
 target/riscv/helper.h                     |  29 ++
 target/riscv/insn32.decode                |  38 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  20 +
 8 files changed, 824 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

--
2.25.1


