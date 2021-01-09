Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyFMN-0002AP-C8
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jan 2021 09:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyFMM-0002AD-Hd; Sat, 09 Jan 2021 09:36:54 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyFMK-0007pD-Vj; Sat, 09 Jan 2021 09:36:54 -0500
Received: by mail-pj1-x1035.google.com with SMTP id u4so6138494pjn.4;
 Sat, 09 Jan 2021 06:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+/f3Rkx1WiTjN9Uya3IVr0xy3ZcyobycCTMjhcA/vs=;
 b=C+XwxdAwFdNPK9P34XFfinIU0rlo16efNtuyxC3+nul7jRg6nT4CEGxmCBk2br2Py8
 sPHVDFWs+HXfqfOTKY4rnE6MKHuCyZ/LlI7XtG06DI82o9ATxehleitouSGKq6v8hv5O
 gf8zrhRGofu4L19GzwBpE+/n8gzwNrWVRtar4iM/EIrJ8SWUroqkv9aELqhsnojCttBJ
 9heZgojtYpXfEpW/Wu5LYMa7K+2ooM3+5ILF2x1XGPIWd9nDIrqONg4JCh9p93sBiu9o
 AoXq5MnY7+aoYNK7p+9OlGbXHNV6Tn5nM6mFUXqD0CKcfw222Fmhiq3bYeTy6ICgjw/S
 Ukfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+/f3Rkx1WiTjN9Uya3IVr0xy3ZcyobycCTMjhcA/vs=;
 b=o0/4o9bQcv7Qmiqm+D+kRRlVnV6EKIgB70v7UKrSyMHosqWsbZqL4/dUeVLejo59v2
 1M5EbV7SmpqdDl/bk+ywCaS89mPlEX/J3P7lqErYIqhPcZtf11dwINQ2o2ZPoQvk4DD5
 bIXehE4XN1WpFUKGVsbe13haOOtwLSUZQZD0iTo1C/5edan+IOnVdEBDjsp4XLpqyIF8
 So6twcxdWgQJzqzHXRUfIRh+qPiR7XFVMcwQDiVcTPt+yAWRonhRghUX0CKq2D2RtOEu
 f0JYS9y4MbL4M1sGbq+VRmHvuZkyMvZnGDi7T6Rvf2EmD3p5mA6XtmmCywK+S0dsXv70
 PvDg==
X-Gm-Message-State: AOAM530nh6S80g19D8zSuK6vSB3HrWNrjgR3941bIPFuGGpZgJxiEvRv
 3FyKHmq4/fpK0ubU4bAQcfc=
X-Google-Smtp-Source: ABdhPJyTb8Bkajm/Hx5CYui/U9WS9LNnaPk8lGDFENEyEJvE8AO0IcTrNLq06VxohDPFJZWrvfUoUw==
X-Received: by 2002:a17:90b:3c7:: with SMTP id
 go7mr8887048pjb.188.1610203011303; 
 Sat, 09 Jan 2021 06:36:51 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 37sm8820041pjz.41.2021.01.09.06.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 06:36:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] hw/riscv: sifive_u: Use SIFIVE_U_CPU for mc->default_cpu_type
Date: Sat,  9 Jan 2021 22:36:37 +0800
Message-Id: <20210109143637.29645-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 09 Jan 2021 14:36:54 -0000

From: Bin Meng <bin.meng@windriver.com>

SIFIVE_U_CPU is conditionally set to SIFIVE_U34 or SIFIVE_U54, hence
there is no need to use #idef to set the mc->default_cpu_type.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f5c400dd44..e083510e0e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -628,11 +628,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
     mc->init = sifive_u_machine_init;
     mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
     mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
-#if defined(TARGET_RISCV32)
-    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U34;
-#elif defined(TARGET_RISCV64)
-    mc->default_cpu_type = TYPE_RISCV_CPU_SIFIVE_U54;
-#endif
+    mc->default_cpu_type = SIFIVE_U_CPU;
     mc->default_cpus = mc->min_cpus;
 
     object_class_property_add_bool(oc, "start-in-flash",
-- 
2.25.1


