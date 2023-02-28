Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0Ip-0001Jk-TF
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Ih-0000ui-Gs; Tue, 28 Feb 2023 08:45:51 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Ig-000333-1s; Tue, 28 Feb 2023 08:45:51 -0500
Received: by mail-pj1-x1034.google.com with SMTP id kb15so9888929pjb.1;
 Tue, 28 Feb 2023 05:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXGNi2tLHwZAenMcO4/YfQUnHO4lOiCQcI1eieMiol0=;
 b=bNnbHpHyyI2xqw1cJVADCObmakJa5DRHJu1lzB7TqCppvl/omQHL/iFhoEPlDJMN6z
 Tj/EpAE0LQDPZgbSj2gRvkTr9txd2IvrXaU7D+CJbgKa0kXlMkRqGA5zHfYjcVBL3OB+
 MeGblLXhjDg4hMIqXIzjjapa95WX+auHVl2bkwGXtvCatuWySnbbX9zufk8xeHYqFNBP
 Lf+d0Ch9J7yTrbbeQ2cnjVQ28wcN7a92ye6TDI247rZOd7GMpdTBVwtFVeFhg+pAqxNp
 oZ19bBwiK+fblWhWLUzwzwAVCldN9O8TzKPFViqdTDRHA2UQIjU1qeiTkuinKgFfEmyz
 TfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXGNi2tLHwZAenMcO4/YfQUnHO4lOiCQcI1eieMiol0=;
 b=kr1mwEvb/1XcM8hd3UVvYe83VAevNrpb4RiO4zgtBoL+jN7mCkmyYTg9GGHxiOKnKC
 9ynLqstjkJ4a90x5OKiB9jMID7TWB7nGs7jvDIRjCnaAtRaLmR4gOAwMU/Bk4SSDDGUV
 ImnNPZwJ/Xftv/co/DqQtV/V/I5kGkW9b7bC238n+uD9xd2VXN84Y35oB8nCA4iL8WSd
 zL66tuar2NFQ47Fpp6TlybFyv+e4BbL3GXpcW271KU7N/azZ0FvFRKse7fszCZMgFXMP
 3USfi1J/IEUqyRH35uMYRaZF4D7D9FGGHS+YCrxXOgW/7XDLW9gpSa51BakpNK43Ysue
 7M/A==
X-Gm-Message-State: AO0yUKUb92Gc3qCXbM7mTzpGecB4uSAdDLVFudSnzdri70vPILE7KVuU
 Vx0up5das/TDaRKmb7KFtr//vMXRowE=
X-Google-Smtp-Source: AK7set/UG7BajDOYOZ1abtdDOvO5cQsZXPsBIfvGIucmMypOGaL5Hxz9p/E8KLdg6So3Yh8XgEBMzw==
X-Received: by 2002:a17:903:684:b0:19d:90f:6c2a with SMTP id
 ki4-20020a170903068400b0019d090f6c2amr2139930plb.6.1677591947893; 
 Tue, 28 Feb 2023 05:45:47 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:45:47 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 14/18] target/riscv: Allow debugger to access seed CSR
Date: Tue, 28 Feb 2023 21:45:31 +0800
Message-Id: <20230228104035.1879882-15-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-13-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 13:45:53 -0000

From: Bin Meng <bmeng@tinylab.org>

At present seed CSR is not reported in the CSR XML hence gdb cannot
access it.

Fix it by adding a debugger check in its predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---

(no changes since v1)

 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ae5df5e6..15b23b9b5a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -459,6 +459,10 @@ static RISCVException seed(CPURISCVState *env, int csrno)
     }
 
 #if !defined(CONFIG_USER_ONLY)
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     /*
      * With a CSR read-write instruction:
      * 1) The seed CSR is always available in machine mode as normal.
-- 
2.25.1


