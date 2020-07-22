Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAtK-00077K-39
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtI-000730-EO
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:20 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtG-0005Kj-NU
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:20 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t6so656765plo.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1cl9gO8y/icELzV9+Mdcow3ZzOPLl80F9cpANs41GGE=;
 b=ZoZhNXrY1v1CX3TdbURkvJBepuybqmKdHEDpXXmzsrtlnloSj9sJrOfEKOR1o7OUOS
 vvkOiJIJKphU3PkjRtcfyC8ouwKF0bYbbI0NIz28/4fVL619qgBNS0WQPAI9r63/I/xA
 GsCLHpqiASFPKdBN4TmELaoh0y8OjllGhVnaqF1YlPdL8KVHKeDa6HvcNkD1xC0mIPXD
 q/fKb39tQJxVzcssO5855uH3yZHuumnlMDYLKQ0Y4Db3JRRaeCT/IALt7VfAdgIljIih
 oCsWvcLZpy5xlxe03gmF/1h4ULY2ypc20mSKz36YziCxXKPiAuTFvf++XnT/doHaTPeL
 dDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1cl9gO8y/icELzV9+Mdcow3ZzOPLl80F9cpANs41GGE=;
 b=JosTf9e3Li7v+jU3jukCNoHgyHNFkQ3GTupgYw+s4Le1YJ7UPzb2DCYNNOfKpPYlpe
 YLReONqU31jwNjo3NpTKwEe/y6b84KOrAXcVP3fkLOVaofFs78TIF3Gzb6HPUGjSiS8y
 p0Mo6lNhmHucZkdgFzZP8E+h9wfNUlMt9yLe2qzxX9PRGswnYoy07MSIus0vsr0MZ/Jd
 Kf0QudOThwbG2UlXo2WssMawMPHWQiAS8K80X+pYAhORWWECH+3nEjl6nbyGrzrYDfXW
 FqFBqXPzu61Nscuht1vs39rJ0p5DuondE1xl7sPILmX8hk3ipbUrtwACuRzTldJGYxcF
 bnVg==
X-Gm-Message-State: AOAM5305XKUOiarheUj53irdsd+uBv/+m217lrrrtIhVDxnoBCl9/pzI
 Li9Wdb0e6zSr3E7KXJd3ABexKA==
X-Google-Smtp-Source: ABdhPJwCRpCllYGI8icT9GL9/mX+HeXCZ6B4BO4a4mKC6laQ6RzlfFKT5wdGhinwhKQbCwMy8vXqCw==
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr25242309plp.271.1595409497490; 
 Wed, 22 Jul 2020 02:18:17 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:18:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 11/76] target/riscv: rvv-0.9: remove vxrm and vxsat fields
 from fcsr register
Date: Wed, 22 Jul 2020 17:15:34 +0800
Message-Id: <20200722091641.8834-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:18:20 -0000

From: Frank Chang <frank.chang@sifive.com>

Remove VXRM and VXSAT fields from FCSR register
as they are only presented in VCSR register.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab4a4fc132..33c77be06e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -166,10 +166,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return 0;
 }
 
@@ -183,10 +179,6 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
     env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return 0;
 }
-- 
2.17.1


