Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqsB0-00077m-Px
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 05:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAi-0006mv-Ib
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:44 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAg-0001Lj-B9
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 05:07:44 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1a6670671e3so37096535ad.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327260; x=1684919260;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Fua0B/nbmKUJP9K04TOuYhl26KH1ZTyjvPcnsj/T2bE=;
 b=k7EoDrjMFvWCasc6+7i/ZJAEukqdW68vCJFzSTMnXxSdO3useorqP56qd63TTfYkf5
 geY0pVq2k+aw+XUGk978QNA4fTpJDrMpvbHClMxamDSCWt5+Jy/FHO9rUaCG2JnyUtyw
 LocLBJezivMbnF7V6KrOSoO2qAMEUQ1v+jeRlXIqgqCF+j0IGAhlONKkpt+/LwLHtMpr
 bJs3pngJo8lOiIVuZ9xTeP6lH2xawBfW2mbDNEf+GnjxmFTaPCnutT9zoK8WNIUA9dGa
 cR41Slzq78Ohn+jMeYgr4ZVgplRoZhz/2ryiK5U4Ireutdtfr5w9B2vDp2nIBWCtE2Uo
 827A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327260; x=1684919260;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fua0B/nbmKUJP9K04TOuYhl26KH1ZTyjvPcnsj/T2bE=;
 b=XFX6ZgWse+NaDjjEtbnh0nV3ebWqfvJKqd7bIPLYj6zmu57YxfASeKT1oWXoYf/noY
 rV2vW2eInmm9zuxmn2S55ko52nbkLsNWpg51HEkowk5w4y07CKLqFQmpvXxawCD0kahk
 Nw670H1t8g6PYlcFRsHhHaaXJTXUKJt9ZeQekblTbRaLdjZdw9h7plmw8eohyC2opD9o
 dEjuofVIRVc+hyBabZs52nWWVLEOFIoiJRxnZ8KO4A/3v1F39NzjtpU4XhIUvQj6b4Uv
 2RyeTAEaAeMvGdCDW7qBucTZNA+8yXrK4cKhNBq0IV/oBvksk2XgPBEckp+F6FyytT5a
 Wrdw==
X-Gm-Message-State: AAQBX9c8qcoEq/sFnCt0YIW0Iv71HxP638Mgf6PAeEKv4+26YjPLcfP1
 XIwrHICVbBKjs7tHjqBFrsuUEQ==
X-Google-Smtp-Source: AKy350Y0kVgXK6MzgqOE+iENhZhpis8rzzeUu2s5kgPtN4XeCpSsdsoSS99vmnY0iNRjzTZaFcPT9Q==
X-Received: by 2002:a17:902:ec86:b0:1a9:5674:282e with SMTP id
 x6-20020a170902ec8600b001a95674282emr10310838plg.14.1682327260677; 
 Mon, 24 Apr 2023 02:07:40 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:40 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH 3/6] target/riscv: check the in-kernel irqchip support
Date: Mon, 24 Apr 2023 09:07:05 +0000
Message-Id: <20230424090716.15674-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 09:07:47 -0000

We check the in-kernel irqchip support when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/kvm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d6..6aad25bbc3 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -433,7 +433,18 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    return 0;
+    if (kvm_kernel_irqchip_split()) {
+        error_report("-machine kernel_irqchip=split is not supported "
+                     "on RISC-V.");
+        exit(1);
+    }
+
+    /*
+     * If we can create the VAIA using the newer device control API, we
+     * let the device do this when it initializes itself, otherwise we
+     * fall back to the old API
+     */
+    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
 int kvm_arch_process_async_events(CPUState *cs)
-- 
2.17.1


