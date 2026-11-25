Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D51606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Is5dbB/b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XchSfB6A
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCxc-0004em-6N; Wed, 25 Nov 2026 08:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwD-0002i7-TP
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwB-0000jU-V8
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:29 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mTjl4034188
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SGEIUTKJi4H
 KbuW7+gY4LzKvvPFfsIo/eyBqALVXtew=; b=Is5dbB/bNVPnUt98ZF4tao63ak4
 UTwJFHb6atETquJrBihCWHSgVXGNvXIV9xk0/TLY5LCcUVXFquDrmpeEWMx6C4xG
 DnnMcZDqWFRHwSCMbHXmyP0/P7jmJGxhDt82fmCyYaHjOFByOHtYlLOxb2oEuyGh
 snBCULY9vu6r3Db3oMTFopCJo9x51JS+fsQ0c5Bm7WrjATDB5McuOM2E7e2ynVpQ
 Nj5rFORDfEf3fX0UVpP60JHfWxqhsOdPv7WrMDvCMbHDmG/2f2vGiQ5rFMeT6VTf
 Eb63Hdz3+V4OJhuokJUqoIjw9Vas8AOD1DCdFqGDfXaq9mwaj79+nDPYMRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjxwx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-92135a58c91so22235586d6.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612885; x=1796217685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SGEIUTKJi4HKbuW7+gY4LzKvvPFfsIo/eyBqALVXtew=;
 b=XchSfB6A9Rr+3g6MH/RW5w/cXnLE9CZKijBHNf6/iHtI7bBRa4QWjdnBfiihpY+wtW
 sxAjlxnV7s611vg8ha88uhyVUWtYHEhKe3h8cW+Ra3DpOCtFGjUsYri+LkQee1RcGrvB
 g1G7v8mn1p0djDmDB/V4gcD5oCJDDAL7BQVzN/rSv5ITP9tDNL+8u4bJ3a2O+E7zJM+n
 HbwtjEgMCV6KEE2JTaU9sjj5alaa3nuYyo8/6bxNLFYpoziCVyo3Y+55SQJ9vphgbWGW
 /gykh2N+3XmJUo41qVb55oYl1WsDG4qjydWyyhnpGwqgZj5nPToA6jRjXI24JBZGnS0G
 aZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612885; x=1796217685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SGEIUTKJi4HKbuW7+gY4LzKvvPFfsIo/eyBqALVXtew=;
 b=EMFbrJH9KlxUT/TiRvImVZTbqze674BMyrohdQpLTTHD/ndMQgEKrQbuJfRvAxhpl3
 G5uWMSNhlwwnFkOyqmvHN1zJm9TmLdiIwgyQ3/iWu/NwOErYwXFEQtaW2CLEWgEAB8cH
 ++9wvfrUGTC+nxVzEwGFK0BPlXMYl05c2hlCNTOyIn1ybCqumF0KcIWNYhvfY0Vyvi9H
 V95lLk6w8Idz2jAun621z7kDUbNcuB9xX9fR8BIMlSztLSFEwBwhJgXGmxg413UMO/78
 gGlYOEHECmqXuBQAwmAaYBHlLagWrFzRd1s0GGcpiuOn2rD9YpbH7DD1j55Xbm2WnPCs
 6pZw==
X-Gm-Message-State: APuU4Z/odMpjth2rf7H8047zOW/oYaolVWroBBMkj5Z346SYgOC19osj
 b4dtmyzzlQwK1/yNbyD7YIa4Ol8vWDxhgs9t98Ve9sUPsCLUKwrJNw0+exhyuQNVH1FK5R2GL7C
 DYp37yL1EJ+0ylpUuZPIDj4Gm4aby019m30BlP3QTZxN8R4DxYyv0uXnDyQ==
X-Gm-Gg: AZFdTZd2jZr+fjFrKZWl6ClRnTMGcy9GOCcRIJUiwJ8uP5UwdleqLKfHttKHFGWZFhz
 s8a1yxsa3sGIax+PpBXyh79RoL4Dsxb293SeIDDB+AfsNHDGZtqWccEMaP/C3bU5zW12urzORF0
 V8UGXf/lNcXkDoh0OUyGsDl33puXoaGNFkijxxr6fHg+SzT7GEFuRGKguhmsENLyE9uXKTJjAZL
 KAgjStrf7C8v7K95toOjIM2uYbiHmn2B7r4jYVSDei3WLq0SEe10hHbs0DwOJN6uxURUOOHawFw
 qrPUe79rXhbsRdLt8nIEQupEGF+2jQorgSVjz+UrNSbAE/Snzx3oHxKAifqEItMi2FjhaBRPDV0
 f9MiYxbc0Z+ul42/TiTPHNmNXmUl0j+AipPlowVrOZEwwKoH4ezT5t1zwC4hdnMkktUcnQMYbEP
 LJuxgKE0Bqaw==
X-Received: by 2002:a05:6214:20a8:b0:921:3d07:3008 with SMTP id
 6a1803df08f44-9213d07d004mr288431636d6.20.1795612885001; 
 Wed, 25 Nov 2026 05:21:25 -0800 (PST)
X-Received: by 2002:a05:6214:20a8:b0:921:3d07:3008 with SMTP id
 6a1803df08f44-9213d07d004mr288431236d6.20.1795612884322; 
 Wed, 25 Nov 2026 05:21:24 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:21:23 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 15/15] target/riscv/tcg/csr.c: add mseccfgh CSR
Date: Wed, 25 Nov 2026 10:20:14 -0300
Message-ID: <20261125132015.229955-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX9CGArIrkA+FT
 Ja06bKdkORv/w57OQ1bsPvC9F2Q349ch28913LCt/CJUfv6rutiM5btQe8TOQ7LgETFAY7orC1t
 RJj1rx7/CkKTPXA16k4KTtB9vmukIdU=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06e0d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=8OGCS-QHHjKBapB54hwA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX3qLYsW6SpHPR
 Hxapp8wlPm4OpGFc5AGkX8F4MFXbxaGxWohc6XwmRBxdao7YEamCFyaEnq/YfHJhZCP/HE/wJug
 I8K8l+mbYsoaJCXyfKxp1UIvBPhLr6HbYRY4z0mmYWIJ870oCZrVKPphjXh3xnDaNMkuGYtDIW3
 yKXg9oR/OsbHXCjvCCgnSGOKJ7/yYQXqxHUnTIGEuc6Ph1u1TQebf9ySbiPNcla6mRGH47eN8+A
 aaOotoojcL31NtA5023sro3eW36MUE5U7xIlc4ai17W1S7ReffvAdOYZmQ5X4YZZrS8GUrs6SHM
 9T239aQ4nqA4YxZmPrMMVefwjaWjcO85ngx54DJOfZ1VladZw/OJhmjjAurRb2eEzSYF8C34Wau
 EXQKOtLmsHG2wYIUcw4gU3UeziZPkMF4rG0oqeR0CYYFe/YMceYJ5asDVEauhaTxoHw2X61m8Dq
 W0qxhnCT6zUXNpIXjWw==
X-Proofpoint-ORIG-GUID: r4gRohEEKjZsENKWh83yKRhulRNacj4S
X-Proofpoint-GUID: r4gRohEEKjZsENKWh83yKRhulRNacj4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Even though the mseccfgh CSR is a read-only zero the spec requires its
existence for RV32.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4680
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                  | 32 +++++++++++++++++++++++++
 tests/tcg/riscv32/test-mseccfg-bits-1.S | 15 +++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 429d7093a9..b4288b5576 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -805,6 +805,15 @@ static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static RISCVException have_mseccfgh(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return have_mseccfg(env, csrno);
+}
+
 static RISCVException debug(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_cfg(env)->debug || riscv_cpu_cfg(env)->ext_sdtrig) {
@@ -5762,6 +5771,26 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mseccfgh(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    /*
+     * The higher half of mseccfg has only PMM.  The spec says:
+     *  "The PMM field is read-only zero for RV32".
+     * Ergo mseccfgh is always 0.
+     */
+    *val = 0;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mseccfgh(CPURISCVState *env, int csrno,
+                                     target_ulong val, uintptr_t ra)
+{
+    /* See read_mseccfgh().  */
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
@@ -6665,6 +6694,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Physical Memory Protection */
     [CSR_MSECCFG]    = { "mseccfg",   have_mseccfg, read_mseccfg, write_mseccfg,
                          .min_priv_ver = PRIV_VERSION_1_11_0           },
+    [CSR_MSECCFGH]    = { "mseccfgh", have_mseccfgh,
+                          read_mseccfgh, write_mseccfgh,
+                          .min_priv_ver = PRIV_VERSION_1_11_0           },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/tests/tcg/riscv32/test-mseccfg-bits-1.S b/tests/tcg/riscv32/test-mseccfg-bits-1.S
index ffa88f5f2f..01c29577e1 100644
--- a/tests/tcg/riscv32/test-mseccfg-bits-1.S
+++ b/tests/tcg/riscv32/test-mseccfg-bits-1.S
@@ -1,5 +1,6 @@
 /*
- * Verify mseccfg bits USEED, SSEED, MLPE and WPRI.
+ * Verify mseccfg bits USEED, SSEED, MLPE and WPRI.  Also verifies
+ * if mseccfgh exists and it's read-only zero.
  *
  * With "rv32,u=off,h=off,s=off,zkr=on,zicfilp=off" we expect no
  * bits being written in mseccfg.
@@ -11,6 +12,7 @@
  */
 
 #define CSR_MSECCFG 0x747
+#define CSR_MSECCFGH 0x757
 
 .option norvc
 	.text
@@ -38,6 +40,17 @@ _start:
 	andi	t3, t3, 7	// USEED, SSEED, MLPE -> bits 1, 2, 3
 	bnez	t3, _fail
 
+	/*
+	 * mseccfgh reads the higher half of mseccfg, which contains
+	 * only mseccfg.PMM.  This bit is read-only zero in RV32,
+	 * thus mseccfgh must be always zeroed.  Write a full 1s
+	 * mask in it and verify.
+	 */
+	li	t0, -1
+	csrw	CSR_MSECCFGH, t0
+	csrr	t0, CSR_MSECCFGH
+	bnez	t0, _fail
+
 	j	_pass
 
 trap:
-- 
2.43.0


