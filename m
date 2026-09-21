Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABE1C982E6
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8fPJ-0004At-DC; Mon, 21 Sep 2026 10:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x8fPI-00049t-BV
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 10:54:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x8fPG-00032W-5q
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 10:54:12 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LEGYIU1891065
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 14:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=tKqY1WpEFnhxvXUT+W1AmhpeqFJzIqdlBLT
 tXzvsqK4=; b=L/i0kN1yAZ+3T/yrsDWItB6bORkrQAh9GXB1O9oA/tfT7SDBHiW
 jz1cDFnl9P7T4Aq3L9ITznrUYvjptag+Glx4xPmTtUY3MddEVCBOqDfklAq/fBOv
 6MywWxuL6JRINtgemkqfyd51efv325qBHX56dXoqijvxyEH8qoYsO1cI3CNMFRTy
 BZCpEec0gd0PLUYkhQGB4ZS6cX87rY719NRmnJ1OES5ngnFzkDvC9QJXB0KjApHs
 ZfWdSEmv+v9FPU5zLjvk4AxkCLnbml4Jpc9c0lFJ3iF22m6uz2wjjx4zmlLADE1t
 0ZOtlcDiwHLxfvdHmYOuHtvRrNr4O3Nv6mg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1tt0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 14:54:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2db8c152622so28763785ad.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790002443; x=1790607243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tKqY1WpEFnhxvXUT+W1AmhpeqFJzIqdlBLTtXzvsqK4=;
 b=cwcziNx86pDYu/jxOY/VbbxrkzMnvDifi7BERWc7gy7U8pyiEsao97kqOeizzXQ/DI
 LT6St8nCyJ/0P4/qGSF6ZBHrMqVvbLwErC/2elDYEzd+oalR2NJoMVv3Ztml4vBwlzlW
 4MXoZrhhGK6eSXZrGojfE7K/UKJ5P9t7JuAFUqOQbCBj/nuvfjW6VxBw5nMsOM49EF0H
 Mcod3ZHAiPx9dOo8AAUJO0O0dxGxwflCH9j5PAi2/GmsALnYcwjf8onbolKyq9Z410G9
 9zIl7k3lVaRI3rEVe6FY8zG9GgAPd/E7fN9rbmMkiezZLDN0W5gnhMYohh79REfaWQoI
 5OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790002443; x=1790607243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tKqY1WpEFnhxvXUT+W1AmhpeqFJzIqdlBLTtXzvsqK4=;
 b=k6GlKqTjDGaiWmFYp8s7kcFmoj0H5UhsjhttRM4t//ooYwOcKjhFef+oNdFqWNHpVy
 G8AOLsXrNpGDhKbowSshgz2tzaWk2Q4b1TgAgN8oj1BF+gnds838GfkWGga+oqm1xa9+
 ERkQBkIe4sd5NxkHRfDNNQpZGhH/ZFMpbQPwVtLBtlEQFqQkfAjKvPi31w/22MuvQfHm
 33VHBjuQOrvzyYaXhX9KxfRAAgrF2jClUC7GZZfejLn7ojyvRE1sWkUILh1YmPAy93td
 JHyH7oPi21zpbBtko3QiScMqXCd8KsqZ6jT/k4cv1U7K7RPOh2yEWq4jGYvhQNTfBAfU
 01TQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw+f1lfqseYUZe5FmIwoVgyO7RF9/JqIxLqD4BmzFNjQX8YQYrl9a7UYoGfr/Fv2yAsAYvx7yGziKdO@nongnu.org
X-Gm-Message-State: AFuF++mvaYRXTBw9pUVxsG8rrE2E3j/wnidFI55kqZOLIJPQ3/tGFTy+
 C6QRW7wLXTzIUepBwEJz3+czZp1udPwx/tYnjciQbAVDQE5ZSoyK7pQ4QTvfLVCMfIBAqp3dAcr
 T869uuhwQdorpFPlnsCfAw1w+GcyZ7ZASuzaIhiaK0FjvS9ld5L+hE0XtiA==
X-Gm-Gg: AYBFou20/1h/WSl05FLBBcb8P7bzTLQrmaMQgsC/GVIV5KpkIME28SuJF+qpVWYY4K6
 kBdvZXWJ2SYvMV7VffQKGHO5xNV6nynhtEo/4iqYuC8xdUSSgtqD5/ntKQwZ8XmKkvuts1rbKmZ
 yCP68YdQdUY915FUPMir+6Qw1Ya9cz0tLffLpc6nIzDHZQwzbR3l8sqFr3jKh256kjVZTxH8GFs
 IXdnp/6A6yOuYmEQFtRZCYdFdq2drcBT0xMP+O2R9pjEmSk7gIvAF0ZN+iKwcvBtTXzreJAmcL+
 QGmzuO4RveASiKQxXdn/Sj8ZuqtqpW6mFbBbRdRXebISG+5OuonibfNqRnT8wbBBMLOBYo63qh6
 82AvcTW0kfNkR2lUIC+A/nqpfjl1KX4QzA+4ONIwyNQUXy4Ap6ZK+ag/VaO32m1j2v5aj3DHhfP
 SP1KDXwFtwHECRKK52SmDhJSSXgA==
X-Received: by 2002:a17:903:2f8c:b0:2dd:c100:4250 with SMTP id
 d9443c01a7336-2ddc10044ccmr103413955ad.52.1790002443230; 
 Mon, 21 Sep 2026 07:54:03 -0700 (PDT)
X-Received: by 2002:a17:903:2f8c:b0:2dd:c100:4250 with SMTP id
 d9443c01a7336-2ddc10044ccmr103413455ad.52.1790002442525; 
 Mon, 21 Sep 2026 07:54:02 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2ddc178900esm35985245ad.17.2026.09.21.07.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 07:54:02 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Gong Shuai <gsh517025@gmail.com>,
 TianCheng TANG <lyndra@linux.alibaba.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] target/riscv: Restore LCOFI handling in interrupt CSRs
Date: Mon, 21 Sep 2026 20:23:32 +0530
Message-ID: <20260921145334.419651-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QUD9fSI2_Jiiz3gu6BFwL1ra5kGVCkTC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNyBTYWx0ZWRfX1kFnm49Qxqjc
 Vr4b+vHi5NQjZBW8WfXy9bDIeqkRi5pLqdunV4A/ajDTCsXo+o2iT89iScsRidWX6GVflT6RCxW
 LwIFcUP5B9CbLUbpj2PWTFqW7viPGFo=
X-Proofpoint-GUID: QUD9fSI2_Jiiz3gu6BFwL1ra5kGVCkTC
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab1450c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=SRrdq9N9AAAA:8 a=UOCBzfY1ytRGBi5-TOgA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNyBTYWx0ZWRfX2Eec4Xju+Oiq
 p1BgK8Aor3LTzvEftN4mcZBPo7H01FmNbwOeYllxJCafeiZQzhBPk+Itc4ETMmel/kuCFLTjWx9
 fGTjGB1swRhmRmDxM2JrjKN3rM2U5QQjpw3Ed/i3OPgBE56d69nlSkIo6vu7xwoDqaoeAoBQjt5
 LFLLEwxSQOhnkFuiAyozUdXWYB6O9R+aWadzGW3PZ3ZO58Jy81J+ZP8XV2Wk2jKVpPKZIQJ3/XS
 ltiH9nGObyicj5Q4RjJknUJJvr5sjhZICJKDSNGvpAZvfQM9YJqmI3N3wvmqNVuzvnzjfMyrbMH
 b7XK2JQFu+kvAgWaeIXz350gXqZBcVtStfSJf6PDsKySKrJQgp8NynuERVWH1TIX8hvvizEHSdK
 3lQktC17KT84sayXPiAFzXDwQ9c/4e0jhIg5hgEIP/jwzp12Bci5C4JAvt5OeO33/Hu0wY+m82/
 zLxChoYx5qObrdKlr3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210217
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Commit 27f9566dcd98 dropped bits 13-15 from the LOCAL_INTERRUPTS
macro and hence also from individual masks such as all_ints,
sip_writable_mask etc.

As a result, even with sscofpmf and ssaia enabled, the LCOFI never got
delivered to the host OS and guest OS respectively.

Add back bit 13 in all the affected masks, but gate it on Sscofpmf being
implemented. For the virtual interrupt paths, i.e., mvip/mvien,
hvip/hvien/vsip/vsie registers, bit 13 is additionally gated on Smaia
and Ssaia respectively. Bits 14, 15 can be added when those interrupt
sources get defined.

Fixes: 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Suggested-by: Gong Shuai <gsh517025@gmail.com>
Suggested-by: TianCheng TANG <lyndra@linux.alibaba.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c | 88 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 15 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 061bc9db77..a3351428cb 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1815,7 +1815,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 #define LOCAL_INTERRUPTS   (~0xFFFFULL)
 
 static const uint64_t delegable_ints =
-    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
+    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS;
 static const uint64_t vs_delegable_ints =
     (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
 static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
@@ -1877,6 +1877,42 @@ static const uint64_t hvien_writable_mask = LOCAL_INTERRUPTS;
 
 static const uint64_t vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
 
+/*
+ * Selects the extensions that need to be checked when accessing various
+ * interrupt registers.
+ */
+typedef enum {
+    /* Accessing mideleg, mie, mip, and alias paths  */
+    AIA_NONE,
+    /* Accessing mvien, mvip non-alias path */
+    AIA_SMAIA,
+    /* Accessing hvien, hvip, vsie, vsip paths */
+    AIA_SSAIA,
+} AIAExt;
+
+/*
+ * This function can be extended later to configure mask for standard local
+ * interrupt bits 14 and 15, once those get defined in the Priv Spec.
+ */
+static uint64_t std_impl_intr_mask(CPURISCVState *env, AIAExt ext)
+{
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
+
+    if (ext == AIA_SMAIA && !cfg->ext_smaia) {
+        return 0;
+    }
+
+    if (ext == AIA_SSAIA && !cfg->ext_ssaia) {
+        return 0;
+    }
+
+    if (!cfg->ext_sscofpmf) {
+        return 0;
+    }
+
+    return MIP_LCOFIP;
+}
+
 /* Machine Information Registers */
 static RISCVException read_zero(CPURISCVState *env, int csrno,
                                 target_ulong *val)
@@ -2249,8 +2285,10 @@ static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
                                     uint64_t *ret_val,
                                     uint64_t new_val, uint64_t wr_mask)
 {
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_NONE);
     uint64_t mask = wr_mask & delegable_ints;
 
+    mask |= wr_mask & std_mask;
     if (ret_val) {
         *ret_val = env->mideleg;
     }
@@ -2300,8 +2338,10 @@ static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_NONE);
     uint64_t mask = wr_mask & all_ints;
 
+    mask |= wr_mask & std_mask;
     if (ret_val) {
         *ret_val = env->mie;
     }
@@ -2350,8 +2390,10 @@ static RISCVException rmw_mvien64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_SMAIA);
     uint64_t mask = wr_mask & mvien_writable_mask;
 
+    mask |= wr_mask & std_mask;
     if (ret_val) {
         *ret_val = env->mvien;
     }
@@ -3784,9 +3826,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_NONE);
     uint64_t old_mip, mask = wr_mask & delegable_ints;
     uint32_t gin;
 
+    mask |= wr_mask & std_mask;
+
     /*
      * When mvien[9]=1, mip.SEIP is read-only and reflects only
      * the external interrupt signal from the interrupt controller.
@@ -3900,9 +3945,12 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
      *  alias_mask denotes the bits that come from mip nalias_mask denotes bits
      *  that come from hvip.
      */
-    uint64_t alias_mask = ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    AIAExt intr_virt = ((csrno == CSR_MVIP) || (csrno == CSR_MVIPH)) ?
+                          AIA_SMAIA : AIA_NONE;
+    uint64_t std_mask = std_impl_intr_mask(env, intr_virt);
+    uint64_t alias_mask = ((S_MODE_INTERRUPTS | std_mask | LOCAL_INTERRUPTS) &
         (env->mideleg | ~env->mvien)) | MIP_STIP;
-    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | std_mask | LOCAL_INTERRUPTS) &
         (~env->mideleg & env->mvien);
     uint64_t wr_mask_mvip;
     uint64_t wr_mask_mip;
@@ -3931,8 +3979,8 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
         alias_mask &= ~MIP_STIP;
     }
 
-    wr_mask_mip = wr_mask & alias_mask & mvip_writable_mask;
-    wr_mask_mvip = wr_mask & nalias_mask & mvip_writable_mask;
+    wr_mask_mip = wr_mask & alias_mask & (mvip_writable_mask | std_mask);
+    wr_mask_mvip = wr_mask & nalias_mask & (mvip_writable_mask | std_mask);
 
     /*
      * For bits set in alias_mask, mvip needs to be alias of mip, so forward
@@ -4065,9 +4113,11 @@ static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
                                  uint64_t *ret_val,
                                  uint64_t new_val, uint64_t wr_mask)
 {
-    uint64_t alias_mask = (LOCAL_INTERRUPTS | VS_MODE_INTERRUPTS) &
-                            env->hideleg;
-    uint64_t nalias_mask = LOCAL_INTERRUPTS & (~env->hideleg & env->hvien);
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_SSAIA);
+    uint64_t alias_mask = (LOCAL_INTERRUPTS | VS_MODE_INTERRUPTS |
+                           std_mask) & env->hideleg;
+    uint64_t nalias_mask = (LOCAL_INTERRUPTS | std_mask) &
+                           (~env->hideleg & env->hvien);
     uint64_t rval, rval_vs, vsbits;
     uint64_t wr_mask_vsie;
     uint64_t wr_mask_mie;
@@ -4135,9 +4185,11 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
-    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_NONE);
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | std_mask | LOCAL_INTERRUPTS) &
         (~env->mideleg & env->mvien);
-    uint64_t alias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & env->mideleg;
+    uint64_t alias_mask = (S_MODE_INTERRUPTS | std_mask | LOCAL_INTERRUPTS) &
+        env->mideleg;
     uint64_t sie_mask = wr_mask & nalias_mask;
     RISCVException ret;
 
@@ -4320,6 +4372,7 @@ static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_SSAIA);
     uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
     uint64_t vsbits;
 
@@ -4335,7 +4388,7 @@ static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
     wr_mask |= vsbits << 1;
 
     ret = rmw_hvip64(env, csrno, &rval, new_val,
-                     wr_mask & mask & vsip_writable_mask);
+                     wr_mask & mask & (vsip_writable_mask | std_mask));
     if (ret_val) {
         rval &= mask;
         vsbits = rval & VS_MODE_INTERRUPTS;
@@ -4382,7 +4435,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
                                 uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t mask = (env->mideleg | env->mvien) & sip_writable_mask;
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_NONE);
+    uint64_t mask = (env->mideleg | env->mvien) &
+                    (sip_writable_mask | std_mask);
 
     if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
@@ -4395,7 +4450,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
 
     if (ret_val) {
         *ret_val &= (env->mideleg | env->mvien) &
-            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
+            (S_MODE_INTERRUPTS | std_mask | LOCAL_INTERRUPTS);
     }
 
     return ret;
@@ -4737,7 +4792,9 @@ static RISCVException rmw_hvien64(CPURISCVState *env, int csrno,
                                     uint64_t new_val, uint64_t wr_mask)
 {
     uint64_t mask = wr_mask & hvien_writable_mask;
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_SSAIA);
 
+    mask |= wr_mask & std_mask;
     if (ret_val) {
         *ret_val = env->hvien;
     }
@@ -4861,6 +4918,7 @@ static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
      */
     uint64_t alias_mask = (env->hideleg | ~env->hvien) | VS_MODE_INTERRUPTS;
     uint64_t nalias_mask = (~env->hideleg & env->hvien);
+    uint64_t std_mask = std_impl_intr_mask(env, AIA_SSAIA);
     uint64_t wr_mask_hvip;
     uint64_t wr_mask_mip;
 
@@ -4882,8 +4940,8 @@ static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
         alias_mask &= (env->hideleg | env->hvien);
     }
 
-    wr_mask_hvip = wr_mask & nalias_mask & hvip_writable_mask;
-    wr_mask_mip = wr_mask & alias_mask & hvip_writable_mask;
+    wr_mask_hvip = wr_mask & nalias_mask & (hvip_writable_mask | std_mask);
+    wr_mask_mip = wr_mask & alias_mask & (hvip_writable_mask | std_mask);
 
     /* Aliased bits, bits 10, 6, 2 need to come from mip. */
     ret = rmw_mip64(env, csrno, &ret_mip, new_val, wr_mask_mip);
-- 
2.43.0


