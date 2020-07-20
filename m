Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxSLv-00015a-I4
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jul 2020 05:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxRLE-0004Cz-9N
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2020 04:40:08 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxRLC-0003tq-Io
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2020 04:40:07 -0400
Received: by mail-pf1-x441.google.com with SMTP id 1so8713723pfn.9
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2020 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsLTfddsKgoMRSVCuJtsD4pLBNDevQya9a9kk1rBuvs=;
 b=HTYmFu40g+Oa9ygM0ZvoPP1PgQX2rz4Dr4B7FQOUoyPtgA74+p3GLJnMm1EwqAoPfq
 L6Zt+SOXvaJbp4E9H5OzgFZTk31lh5joGbmTEYBqxegHWHgKvG0wDecCAbV903cDH2/Y
 6CfYV1O9vl0wt+aUw6N8IxWNWOOJHAj0tUaUHtv5FJzS8vLEJMPX5H1z5AliINJ1p3XH
 oMCohpVDuEehbe4komI+eq/sPgj2WusEopgpneuMOTTQlcplMepk6qMcS1Fz50q9/DET
 J67XAJ49FhB8NetlWEpkLr2FKp+uNh5PI7QTpnt3MJT6plXriGX3WwcHEn60cH8o/xNA
 840w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsLTfddsKgoMRSVCuJtsD4pLBNDevQya9a9kk1rBuvs=;
 b=iSfWdw/MGcM0ncKamuWSjb4uqbJWBl8JTufcJz+YI9M7CmeV+96PM28X6tYPg7UfJS
 dIT/A+hq56DGHXnHpE3hl0jZGze+PBjhUZOA5XSTF4O84v0zW6KHbrE2e29hyFwNHDyo
 CRCOgCk7hGgskkeeGQHFKp0gshnImgrIdBQ8v0SOvJlz6SnBrtqfnGJAEDajH6IcnaIB
 cnxjaLJWeFCHYlvxovhPhdS1Xt8JU/lscdK/wuM5cOXeigoodH77059OcFBXFhKFb4qt
 DyGeDmDJGGr1c0BAWg3yHEiIOFA/iCzu4MJ7nmCRX7bf3gbiRnnSGsPDt3JAAtuNYjfx
 SmFQ==
X-Gm-Message-State: AOAM532x47Ve5wDn/9fkNhX4/kgWOhzPudJUxzBWI8l0j4gm1KRO4qAd
 KARYN3+1Pd4yLJNScgg/9Bpa3Q==
X-Google-Smtp-Source: ABdhPJypxHssbOrUNASzWyJtBQzO8CXAyQLzJbyxtMYaWvDwcey4PU3MRhC5jWdAbMfOqBkuecE2mQ==
X-Received: by 2002:a63:6c0a:: with SMTP id h10mr17924212pgc.11.1595234404148; 
 Mon, 20 Jul 2020 01:40:04 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id o4sm11388151pjo.16.2020.07.20.01.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 01:40:03 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/2] target/riscv: Fix the range of pmpcfg of CSR funcion table
Date: Mon, 20 Jul 2020 16:39:56 +0800
Message-Id: <c01aa428c0b4dc9c3e5b24a3d04040a1253bb3a5.1595234208.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595234208.git.zong.li@sifive.com>
References: <cover.1595234208.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Jul 2020 05:44:54 -0400
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
X-List-Received-Date: Mon, 20 Jul 2020 08:40:08 -0000

The range of Physical Memory Protection should be from CSR_PMPCFG0
to CSR_PMPCFG3, not to CSR_PMPADDR9.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ac01c835e1..6a96a01b1c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1353,7 +1353,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST] =              { hmode,   read_mtinst,      write_mtinst     },
 
     /* Physical Memory Protection */
-    [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
+    [CSR_PMPCFG0  ... CSR_PMPCFG3]   = { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
 
     /* Performance Counters */
-- 
2.27.0


