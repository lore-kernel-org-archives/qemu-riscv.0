Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2g6-0002wd-A9
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2g2-0002t3-Ea
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:18 -0500
Received: from [2a00:1450:4864:20::435] (port=44802
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2g0-0003jh-Lg
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:47:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id k18so12698547wrg.11
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFWdAc24R5bk/lz7ZOcbeThuxCwHiUHamVBHOFjNars=;
 b=pCW0HCmHe/BmNfrblSAjvA8mR6Z/pkledRmVDjmbfIpLGuf+Txk3ZwB7SyPrTUVimy
 wutwSKl24CXZlVs2oXudK5rmEzYTbBn9czgXlqhck2x8sKb+FN2PT7CdeM+ScvW0hxIZ
 PxJaLj8wZYSFclkwcOIJZ/xuxCbrmwismSOix1xYyYjtzvnP6aoK7zfdZQRN10iOkV8a
 BkBLPtDta1WeEJMsp6QQzoM0cuiQZBc0c6n4PhvKjCohwrb6HAo447zpVaR9xSvWn3Uw
 ukXDGIt4DlSdvFMwDAYT7sebsdLnYVL8+M3CVQYwbRnPddYoLDEwgYZG3YLeksBKi+hj
 rn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFWdAc24R5bk/lz7ZOcbeThuxCwHiUHamVBHOFjNars=;
 b=Bu60JdonSK09DcPnUHoWoTgiZmA5ti0fi7mcV01Fa0tJlTu0T/Y7sGRRX+ol+R7K8O
 EuJ/1Lui3G/6Phv4lXeUe/6uEXJ1gadPwcWsu3l4TxfGyQFrDlxV7CgQhW9CxgWNRBN8
 GpR97ILPrMdS1vBpMYYVUrW2aGEVGe7JeX6gQIbJsGlJQUC25AAuJXU7xAF5ydUCytZ/
 UuyLeYPBo6zSJYLlAptgyZiWucfx9WwOoQsRI2LTh6WE3CqFox8q5RE3pvpCKEJDv1IW
 7LNY0tFy0+i8KqeVCY540hpLZRwhkLo7liDVI0djg1H7J+hAoDqChbAllQML3h76y58E
 JqQQ==
X-Gm-Message-State: AOAM532vG9T4VhQQb2RhdY5J4b6ChGcqe7i3pp9IM/daMsckq4QnIPNT
 bsJHfv5CO8GmXt6vBLZQ3r93yA==
X-Google-Smtp-Source: ABdhPJxC0AQUwvgOJut1U1gfJQ96umnXzR/RnXM8LfPetQ7GLlCMseKq6Ru4xr//VF7nCx33IY001A==
X-Received: by 2002:a05:6000:16c8:: with SMTP id
 h8mr3333366wrf.693.1643996835388; 
 Fri, 04 Feb 2022 09:47:15 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:14 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 01/23] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Fri,  4 Feb 2022 23:16:37 +0530
Message-Id: <20220204174700.534953-2-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::435;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 17:47:18 -0000

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e5f9d4ef93..41a533a310 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -186,7 +186,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


