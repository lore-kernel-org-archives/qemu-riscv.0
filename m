Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX75-0005h7-6Y
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:13:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX73-0005aZ-Ko
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:13:53 -0500
Received: from [2607:f8b0:4864:20::232] (port=46946
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX72-0001Wf-0D
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:13:53 -0500
Received: by mail-oi1-x232.google.com with SMTP id s139so31903547oie.13
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YE6GU3EgdqLfh6XtDoPgH6ClC3r3aGQSWUDP080hnKE=;
 b=J7nledR4sa2KTx7Gq5OMNfpGkkP2RThYNT4H5l23Oe5nQBWjuue02kcjOAUAUZ84KK
 nkQm0kqrd19RmtCpAwa0XdpxoAvgNQq4uLF3vYcL4jT0qAg/33hVZUc97WvyWVEW/ddb
 zedVnTGaaclVmwYFlQSpwcQ1SeLZzGuVM4FWaSkxos1VI3RtaNy7atTvP+yuuci/OXZA
 /OFjsxPChsxU3S11PjeoneaPA8aebye5WNg1PnhPJOYdlP+yzh+cPpwe4ZcVFHjet+7r
 yjsAg4JZ3rP534t1L0pB6WPgF7X5MSceVzYC+0IqhsmA0MLzlIKl7NwZ0KgU4wstO/83
 HayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YE6GU3EgdqLfh6XtDoPgH6ClC3r3aGQSWUDP080hnKE=;
 b=ngeUKoTdyxOcR0MohLsxaKzhUWRHPdsxdBMorX0xN+YqjV49ms9XoXQ7mc9Sd5622o
 JJUmZXvE0Fw3h092ZijFl/G5l+fRb7244yu0WFCD/SWXIV6KexCuq87S3vVrlFn6hQYl
 1SxpMOxfb72Snn5XnGIzSnXEZFuYdDjyX95sADn9el0nMDfPOd2I0pWRnm7ZHOGs2A9W
 rmJgDli0yFhcQcDVxvOhT+27m2IRJvo1Pf9846KJMzS7iClgc5T+ORaM9aTpmqTlkek1
 e2lrFeseAZJt0AHMmJIMcUrWny0mIUO1jgcPsIgWR+P/GZjQCevTPZhZpNHB4bX7Jx0r
 CzhA==
X-Gm-Message-State: AOAM531wK7Cpt46es6TYIe1v3hgnCbTPu4TjUfZ5beQ9m6CkczWAqpez
 PiNHim0PoqX1rIlaMmtQyMJttpzuU5bjfLzD
X-Google-Smtp-Source: ABdhPJx4YETE64YG6Je0mwW8JkyU4Zw6xRrlNMQjN2lzoBepzLiuTE4pK6O/5PKavKSjymLk3lGBdA==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr34864112pjq.128.1638155266827; 
 Sun, 28 Nov 2021 19:07:46 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:46 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 48/77] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Mon, 29 Nov 2021 11:03:08 +0800
Message-Id: <20211129030340.429689-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:13:53 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 277a5e4120a..71d7b1e8796 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3710,8 +3710,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3723,9 +3721,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3738,7 +3733,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3749,9 +3743,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.25.1


