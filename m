Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz6e6-0006JW-EP
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 21:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6e4-0006F2-Oo; Wed, 08 Jun 2022 21:07:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6e3-0003vR-ER; Wed, 08 Jun 2022 21:07:32 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z17so19763764pff.7;
 Wed, 08 Jun 2022 18:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d50h+5jGj4e24nFRKaCEviZgpl92Jn3X66D2wtXCErc=;
 b=VjFzKr9a3R9zzS2wkjCy+TnGJgbanOe40nD9g1LxV7PkAAdLJgo3hwfR3XK31dJhdZ
 56oQTzAj1DR1981d9glU8UcwMXheF9kYSkKFcnwuSAEiZ9lTNd7Rk1sAYIPTowXvW08X
 pa+/Las7Pso+kSqD/62Ylt4rEQRsa0rVerTg/fFrZKox2CpuWTB09kfwkQC+Q98CKXj+
 Dxu9OdeQCghzIFDyq2o1Q4ho7OuSlkEo6cyck7S2UXzEMrKhEVGTiQQ0BkPM9BVEGDpp
 7UVlrv6oO3BXbPj7FKVzC8oM7o3d4tJrFAJNJHbIAvHJ0iY1pZjIewGq2pfvIXE+0LX3
 PMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d50h+5jGj4e24nFRKaCEviZgpl92Jn3X66D2wtXCErc=;
 b=XzNROTfrBk7XcWksYa4lWWieAujd6BX6W60R8oES9tbp9F0nmcH/w+mHsOvfxtSzUI
 fU8XEMMvt0AdD++i2+Rbe4xMxAjjuCJkvJ86Is7Gh59Z5chzwCxcKflVAmJFFLTPzmo5
 rA8rbed/vWMGqSQKuNPPqM4HE+D8q0ac87uRN+8o5bA3yZVTpM3SC+QBovDEnOTHsLe1
 193Y79Y7T01FN2tUtOdkFiDXrdnpvuI1kN6QeXv1kv9/6JQTVEom+bFU1hYEiHp6ypOx
 og41sgjpN+2Egxige9xQq+zQz4D/MvcEaCh58r7Xm+BVf0gIja0/Wf9tMHRG87kMYnAa
 fozg==
X-Gm-Message-State: AOAM530SKRi4vpbjHIllcdVJHSGjEKAMHU2ruRCU/ZAh2s7H94tfCZzt
 KWcrfYplJrzN6PqKioDBRjXCUPubyAE=
X-Google-Smtp-Source: ABdhPJxxt8ycCXitE4SpOBbNAfo5KTESEsb6VufX0CXA582XMOuhOq36L9dlDmU7ZFde+oAqzIssCQ==
X-Received: by 2002:a63:8348:0:b0:3fe:477d:a465 with SMTP id
 h69-20020a638348000000b003fe477da465mr3264422pge.66.1654736849955; 
 Wed, 08 Jun 2022 18:07:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902f15500b001640e9f638esm15283402plb.51.2022.06.08.18.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 18:07:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 2/3] target/riscv: kvm: Set env->misa_ext_mask to the
 supported value
Date: Thu,  9 Jun 2022 09:07:23 +0800
Message-Id: <20220609010724.104033-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609010724.104033-1-bmeng.cn@gmail.com>
References: <20220609010724.104033-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 09 Jun 2022 01:07:33 -0000

env->misa_ext_mask might be set to the same value of env->misa_ext
in riscv_cpu_realize() based on given properties, but it may differ
from what KVM tells us.

Let's set the correct env->misa_ext_mask in kvm_arch_init_vcpu().

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 70b4cff06f..c592980299 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -410,7 +410,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (ret) {
         return ret;
     }
-    env->misa_ext = isa;
+    env->misa_ext_mask = env->misa_ext = isa;
 
     return ret;
 }
-- 
2.34.1


