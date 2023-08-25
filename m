Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BE8C3DA66
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:11:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWYk-0001YY-EY; Fri, 25 Aug 2023 09:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWYi-0001Y4-On
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:04 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWYf-0006t5-UI
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:04 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1cc61f514baso540844fac.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968940; x=1693573740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rvYRF8za4flh/G+InmdjRqkOWx+mIw76qZndTZ8FOWw=;
 b=lC6l+1rc00VJLoccQjQ15AXsFZhdEoU85rZoHSdb7T2FTBZdw2DrQF3Hua4V4y3Q8k
 zCh9R0A0VWf2y8OdFTFXUR77W+/1j/0XLuY6Taw6y5NS6Qr+ZirgF3xCMcNMREquAoLf
 dq0fB2wlug0uI51qvxzhG7+AxVS2Gdk+e9+rGOGH1lEn72z8xIIVQHp55oGRJ5sbCXUw
 xY5r+dRb066xbxX/1IrYSyCL148doy3OPOvjUN1nCU6zAXA8fXPfNm4Mi1mV+I1Q9lUd
 xu+Ho7cGKGVYczPaKkK6QgeimsPulwQTqeypJ2Tw6VRq/YrEl/bI1OXqLlT9iuXnvNWB
 u+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968940; x=1693573740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rvYRF8za4flh/G+InmdjRqkOWx+mIw76qZndTZ8FOWw=;
 b=NXM88gbTYkyoTUNbqdeyCI9AnmhNR3gIqoyYLiIFu6oVSc+aUV+VPqul3QfsfB+Z/c
 qwixWBPLZN+Ecpn3zJKJir9/nu9kgsa89J7iX+lrRR0ZNvHH09CgN5Zsk33xmdOUe+ke
 wcUUxUGd0PM6r1TYfQbRasD9duTHmO+CTxSQ0WkeJJNSHd3G+uvewC51tibETmw58bkz
 TqRC3Fq19UjneqkMEiYxCkdiih47Fhjn7w8AzkQIigt0v0GMquUyszztDCnYkA/C9hoG
 rX5Fy+3H51dnchiKpAQeAL60zdjg0a7MDHBB2rHDU0cKoEA1MYT5fc3IKyb4+YSBgVYQ
 ypIA==
X-Gm-Message-State: AOJu0YwoTyTXm+RBLgmBDvFiLNn9V5bKefrIlSPErwOf1YHfAF16RfOm
 F0JAqLv+/d2hZxJbNLKbHYvnEg==
X-Google-Smtp-Source: AGHT+IGG78IN1RfPh0cA/IgNp9Ou6rGUNvPMEYUwB/zA7GSdE6l+UBdjUuWubqjIYToOc1RSLiM4PA==
X-Received: by 2002:a05:6871:586:b0:1be:e925:3dce with SMTP id
 u6-20020a056871058600b001bee9253dcemr3169843oan.7.1692968940119; 
 Fri, 25 Aug 2023 06:09:00 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:08:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/20] riscv: split TCG/KVM accelerators from cpu.c
Date: Fri, 25 Aug 2023 10:08:33 -0300
Message-ID: <20230825130853.511782-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Based-on: 20230824221440.484675-1-dbarboza@ventanamicro.com
("[PATCH RESEND v8 00/20] riscv: 'max' CPU, detect user choice in TCG")

Hi,

The idea of this work was hinted at during a review [1] where Phil
mentioned that we should handle TCG specific constraints in
AccelCPUClass::cpu_realizefn(). While working on that I came across
the work done in x86 by Claudio Fontana in commit f5cc5a5c1 ("i386:
split cpu accelerators from cpu.c, using AccelCPUClass"). The design
implemented here is heavily inspired by Claudio's work.

An AccelCPUClass is an abstraction used by all QEMU accelerators that
are already streamlined in the init/realize process, doesn't matter if
we use it or not. Using accel classes allow us to split accel-specific
code from cpu.c into their own files, making easier to support
accel-specific builds in the future. It also gives us a template to
follow when adding new accelerators in the future.

The final goal, not entirely reached with this series, is to have cpu.c
hosting only common code for all accelerators, in particular the code
related to extensions support. We should declare extensions in cpu.c
then go to each accelerator class and do what you want with it. We're
not there yet due to how we rely on isa_edata_arr[] for both priv-spec
checks (a tcg only thing) and provide the riscv,isa string (all
accelerators). Trying to untangle priv-spec and isa_str is a fight for
another day.

You'll also notice that I didn't move all TCG related files to the 'tcg'
subdir. The reason is that Phil already did that here [2]:

"[PATCH 00/16] target/riscv: Allow building without TCG (KVM-only so far)"

and I deliberately avoided colliding with what he did. Phil's series focus
in splitting TCG includes and ifdefs in TCG specific files, while this
series focus in decoupling accel-speciic logic inside cpu.c.

The only behavior change implemented is in patch 20 where we block
vendor CPUs from using KVM. Most of the time I'm just juggling code
around to avoid breaking what we already have while trying to keep
patches review-sane.

No other behavior changes were intended with this series.

[1] https://lore.kernel.org/qemu-riscv/3b93823c-3d12-0d67-b814-54a3922d027f@linaro.org/
[2] https://lore.kernel.org/qemu-riscv/20230711121453.59138-1-philmd@linaro.org/


Daniel Henrique Barboza (20):
  target/riscv: introduce TCG AccelCPUClass
  target/riscv: move riscv_cpu_realize_tcg() to TCG::cpu_realizefn()
  target/riscv: move riscv_cpu_validate_set_extensions() to tcg-cpu.c
  target/riscv: move riscv_tcg_ops to tcg-cpu.c
  target/riscv/cpu.c: add 'user_extension_properties' class prop
  target/riscv: add 'max_features' CPU flag
  target/riscv/cpu.c: add .instance_post_init()
  target/riscv: move 'host' CPU declaration to kvm.c
  target/riscv/cpu.c: mark extensions arrays as 'const'
  target/riscv: move riscv_cpu_add_kvm_properties() to kvm.c
  target/riscv: introduce KVM AccelCPUClass
  target/riscv: move KVM only files to kvm subdir
  target/riscv/kvm: refactor kvm_riscv_init_user_properties()
  target/riscv/kvm: do not use riscv_cpu_add_misa_properties()
  target/riscv/tcg: introduce tcg_cpu_instance_init()
  target/riscv/tcg: move riscv_cpu_add_misa_properties() to tcg-cpu.c
  target/riscv/cpu.c: export isa_edata_arr[]
  target/riscv/cpu: move priv spec functions to tcg-cpu.c
  target/riscv: add 'tcg_supported' class property
  target/riscv: add 'kvm_supported' class property

 hw/riscv/virt.c                       |   2 +-
 target/riscv/cpu-qom.h                |   5 +
 target/riscv/cpu.c                    | 999 ++------------------------
 target/riscv/cpu.h                    |  31 +-
 target/riscv/cpu_cfg.h                |   1 +
 target/riscv/csr.c                    |   1 +
 target/riscv/{kvm.c => kvm/kvm-cpu.c} | 153 +++-
 target/riscv/{ => kvm}/kvm-stub.c     |   0
 target/riscv/{ => kvm}/kvm_riscv.h    |   1 -
 target/riscv/kvm/meson.build          |   2 +
 target/riscv/meson.build              |   4 +-
 target/riscv/tcg/meson.build          |   2 +
 target/riscv/tcg/tcg-cpu.c            | 864 ++++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.h            |  28 +
 14 files changed, 1160 insertions(+), 933 deletions(-)
 rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (89%)
 rename target/riscv/{ => kvm}/kvm-stub.c (100%)
 rename target/riscv/{ => kvm}/kvm_riscv.h (95%)
 create mode 100644 target/riscv/kvm/meson.build
 create mode 100644 target/riscv/tcg/meson.build
 create mode 100644 target/riscv/tcg/tcg-cpu.c
 create mode 100644 target/riscv/tcg/tcg-cpu.h

-- 
2.41.0


