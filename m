Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAtR-0007ST-SX
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtQ-0007O2-71
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAtO-0005OF-DZ
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:18:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id l6so647943plt.7
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9s/mCdEXcnjGeiJgQX1HftAI7OdnPJqUitl4kMdTekI=;
 b=SNzqu0lyWObzHrj0E0r99mmFkq32mfMVg/WMhcRciVL+MMjYsC9Wd4MjHOXyA5UZLu
 /djeK+l3asXlhqbT/tIbfrcdBnoQdnCkm/KOTyUFRPR69GxOW9z5GZdj/ha2G8IYZAUh
 p2FVKpQCzJ0Tu0bDNYUx9SYxivmpue9TMmZRtIsKHQVwc7VWKwUj0vYBrw5FrrCz9M1v
 /w7MP8BE0D5LOLmqenoUOPOE0N0gN9tv6xpU3TfQgTg9hcfyGj86eLnWeLDP2ju+pHF6
 wJhC05KWY0U2O+459BeWftaMkN92kjMihUTTdqcOwOO9VsSM6EtgzjklQa2/kEmX6Ay/
 8E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9s/mCdEXcnjGeiJgQX1HftAI7OdnPJqUitl4kMdTekI=;
 b=FVtSH3+Fo+pVFLuu44TMPX9iwJ8da+rzFNxeW/7wfeNrZ61AXBKGiPJNm2SSy5rHIQ
 PIobjeH3/ICrwuc6AthJl5c4giYY7j67MQsCQ/+vUxgloF0ZP839u9f2IxokUhkCdXbS
 5zxcAfT4R2lSXcyPjuXBF7FORYxREo0SlQAXBNsKNHvrJXCuOGu4tAFoWKXDTTVBzONW
 32h1o0Q/RboD982KLj76QHsn5j6DLAsdOuLjL/bCSFlmEVSrpv50nHWOZGP8CBhTiERz
 Nz6z5VUHY8HMPunAf50MwbLVy3e/5j/SS3Jd6ODdSK7sR+OM7L2/64bHmDzZxpLHauYJ
 oj9A==
X-Gm-Message-State: AOAM5314k2q20l8avFsbRDqruMNLvtFkcatpu4hLcqfdbTvnAGrCHvKx
 bN/foVLdoaAwmwW62ZGf9WU3CA==
X-Google-Smtp-Source: ABdhPJx+x/HWmQicVH9D+U7mCuKDnrujBzumWKrcukO4RoW98Ruw5qr/xg3zRVhIbIvqTE+9LZMsmg==
X-Received: by 2002:a17:902:654e:: with SMTP id
 d14mr26593240pln.60.1595409505161; 
 Wed, 22 Jul 2020 02:18:25 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:18:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 13/76] target/riscv: rvv-0.9: add vlenb register
Date: Wed, 22 Jul 2020 17:15:36 +0800
Message-Id: <20200722091641.8834-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:18:28 -0000

From: Greentime Hu <greentime.hu@sifive.com>

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7afdd4814b..fe055b67a6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
 
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e05acb5a24..cdf6198d8c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -189,6 +189,12 @@ static int read_vtype(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env_archcpu(env)->cfg.vlen >> 3;
+    return 0;
+}
+
 static int read_vl(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vl;
@@ -1293,6 +1299,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
     [CSR_VL] =                  { vs,   read_vl                             },
     [CSR_VTYPE] =               { vs,   read_vtype                          },
+    [CSR_VLENB] =               { vs,   read_vlenb                          },
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-- 
2.17.1


