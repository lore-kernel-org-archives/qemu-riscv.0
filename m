Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A42CA6009
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEazk-0007uz-VS; Wed, 07 Oct 2026 19:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazi-0007tX-Dn
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazb-0001Oq-96
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:18 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697LtXaA4151784
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kiFRfa1vn1nAsyqHzl2RG/M+r+e4c9+WlXmnF6qfFAk=; b=PJ8NbanocVGIVUqb
 cE7J31UG1Iz/vqCjjOSqHuyLJkEYZ++NV4veKF8ZjK0+DjXX+jBAgv0+UuJs2Zei
 OGoB12sRV7Tbnu4XX0U10kMJSZPljxMvREhgPBJHCoJzuFc7Gv6m8gGFVD7fHNjv
 JBXHaSfHkT3cyUXNW6LDLPZ9GwlTq0XOz200zw7Cs/EF8GRPZ2ONfEg3wbQfOJV4
 kwxI9OhT1O8QexGAlsU5908LmMev4XYUjZAIYisybxq5BB6uuVa2wZNQjHq6jj13
 xK2v3y6ANnBLRtLoMbO28gWRP3vcnTdDZaURD0lvui6poQtv+KLEEu5iV1zpx4SN
 Hr5U+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38754-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:24:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cb93c874bso102099385a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415449; x=1792020249; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kiFRfa1vn1nAsyqHzl2RG/M+r+e4c9+WlXmnF6qfFAk=;
 b=V/D0N7KSm9K8OGSmTIQf6n1787V9/CjwSDUN4bdSbv8BO4UxQfBH4BFzvGcVtUuO5u
 2/ZGfq/6l4InzgN/n2oYhaw7kixzzmImnTU2q/8LC6x/ZYQgGg5Auhl/GVrNgbEKO1dy
 AqIUVvbo/qzwCTOFizg+u1nx3nx5Ijx3izwEB5hwZTDP90WGOYhBkIdwfDP7otvWRgDj
 Mye0v4iHh04/epTP3s2uqRbEeFZLgqx48cKkiqHr9OSo3j4rj7W5MEy5LOzGxwRJtSBD
 QxhUs2GcM7K2gd9uJK3YZ9PnJf2om6jxz0GNS2SRITYDj/w2MTHbKl/k3pzVW1lhf+Mt
 YfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415449; x=1792020249;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kiFRfa1vn1nAsyqHzl2RG/M+r+e4c9+WlXmnF6qfFAk=;
 b=W6yqyLiyp93pTtPxXF5Mhv+0yHrPRiVtgrXKbx1ci2I0pxf5GHHGtfjOSju9CFDHK+
 oL6bgO4kOY+GKDEKw6GrU3yAGQg9mrgBgFMly361fliZ4lMJaPzc5ICpkrCViuntg39L
 EKjxqHdnJdLeTekuAZJMXVnpPTuvZsDVTLyyREp9O0boXJXfkuRsIijRM4cwE65zJMC+
 wa+ok/3IXGus9G2Sl1w5VjJ6RcabroDovAuCTwgrZQNsE/NpGemAy0iRPG/FYCqMCsNp
 8UoweHprc5oP+f/HqacBmpZ1NgS7KshG2qOod78LNeo+R0dTS1s31jhk7bY2+PKJ1DB2
 nztg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5u7LvQo8mEGj8BdLNHJCc3a92nsy2PStPYP8zELh0Gc3a3JoUCplzXXLKwE99rOYUDRIOGbZIZv17@nongnu.org
X-Gm-Message-State: AFuF++mWaLFVJgKKiOkJ2SaO/nPyoQIppqWlavD9me3WhqOAKkhfD/mr
 IuIz2Q19JaXJMBIYfFDH4p9yX9lXTkMIec6vGHPlf+rz8ELljRvzsqrToWYkWlHVdq7Fs5q7qrE
 NQbLJ3RE1tr4PKqBEGfkRx50gClwyFhFVdqJoGhDUTYYa/WaHb9Rj9latFA==
X-Gm-Gg: AYBFou2Uyi/xXEhl2xZtTZA6gI3YMv+herUIwwbuGbYL4ELBQWWUP3QtluoX8kfp6wY
 8CZaMVL7uGEw0bWuQwOlo0KA3Z1XjHWmZT76QiX6H+NmuM1ydayqnCVdPVcQZwQPrYZEk9Y6JNT
 SLQhF1zk7BdzLt5NTjzla13cmedg+OBjbU2UNv9dTs2jzgCgY3HIgQIjXXlg/Avnl3zlzwjBfa/
 0z0YjV6PSSDpUg3/Pxq+ODbntw87lmZGWIKq4rfIuBywoDc06+6ZqGSmJC5O5wxymfxS2La/rXq
 GFQ6eCzhtCHFBuCu3Isthauy3XfHACK2n/eOz0tS/gpB3hi1U8pAWer91ibIGW8MMyV2pDq3jnd
 nAU62E8Ray/3zWPROFGKHkfuFDwCweVU2zd5Edwqq
X-Received: by 2002:a05:620a:880f:b0:93e:5677:317b with SMTP id
 af79cd13be357-93eab120455mr135400285a.25.1791415449502; 
 Wed, 07 Oct 2026 16:24:09 -0700 (PDT)
X-Received: by 2002:a05:620a:880f:b0:93e:5677:317b with SMTP id
 af79cd13be357-93eab120455mr135396785a.25.1791415449037; 
 Wed, 07 Oct 2026 16:24:09 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1f8fbsm7145472f8f.33.2026.10.07.16.24.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:24:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 05/10] target/ppc/gdbstub: Replace target_long_bits() by
 ppc_env_is_64bit()
Date: Thu,  8 Oct 2026 01:23:20 +0200
Message-ID: <20261007232326.66240-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M6pz0xjHMviEQeSASKWqwNQ1QpHXaapE
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac6d49a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ECGyvcmLiFpczC5RLToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX91yKw/rtTr23
 FRk/54lLe0XkMuxHO9oe/P0B0A/qj2Zx1oE8m2QwFIp4Aec1yshWXNVq7caOwlVSpHm6QxriJUt
 iIiTQDLfuPrpZv62I9MGGsf4rKK1Hk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX4DDVOJ59Vk4t
 NhPN6jSpTzn5fCI+I/Z/E8QLvK0+PfKFPWH3z40bIwM433XOyeRbKDLbOZPaqV1JFYoShHfuXlh
 C/Q4PjANkp3Qblqc0SjYgd3w//QCqmJrcj/S5i+hPyGDJ717kuotpknRIMTc86fPz+ExVKSACF5
 wbYjfMuKvv7hR/vVEj6gHEP9zAXY5QZ2haLwaqo9ZnNe0DSC/Y8KsnuToNU05kKRsVzGvXQckKX
 Yz6FTGAEWCpNpPY+VXdUt7H/vrZlUJDxHeyI9JfMKG0RAq5Q+WA8aSXJDFLC0D57gQVxfSDpQC0
 Vat+mqdZ0u0Kyeiqs5RZAQLD3HvPOZ994u4fO4qlE8b/wHoV6hZM3W8pAhAgrBAXPmS46OPqRT5
 OaS6azaBOKLX4NB1bumrDs94ALjsbx9wng4Syp+Zys4CUBU2nZLE/8NEU3bnMrEO7wrG41fHOz8
 xfaBewZkF49GEW27v7w==
X-Proofpoint-ORIG-GUID: M6pz0xjHMviEQeSASKWqwNQ1QpHXaapE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a gdb_get_reg_bits() helper deriving the register width from
ppc_env_is_64bit(), and use it instead of target_long_bits() and
TARGET_LONG_SIZE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/ppc/gdbstub.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 4d622c5cad5..ee02be63ce8 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -23,12 +23,17 @@
 #include "gdbstub/helpers.h"
 #include "internal.h"
 
-static unsigned ppc_gdb_register_len(int n)
+static int gdb_get_reg_bits(const CPUPPCState *env)
+{
+    return ppc_env_is_64bit(env) ? 64 : 32;
+}
+
+static unsigned ppc_gdb_register_len(const CPUPPCState *env, int n)
 {
     switch (n) {
     case 0 ... 31:
         /* gprs */
-        return target_long_bits() / 8;
+        return gdb_get_reg_bits(env) / 8;
     case 66:
         /* cr */
     case 69:
@@ -42,7 +47,7 @@ static unsigned ppc_gdb_register_len(int n)
         /* lr */
     case 68:
         /* ctr */
-        return target_long_bits() / 8;
+        return gdb_get_reg_bits(env) / 8;
     default:
         return 0;
     }
@@ -85,7 +90,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
 {
     CPUPPCState *env = cpu_env(cs);
     uint8_t *mem_buf;
-    unsigned r = ppc_gdb_register_len(n);
+    unsigned r = ppc_gdb_register_len(env, n);
 
     if (!r) {
         return r;
@@ -127,7 +132,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
 int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     CPUPPCState *env = cpu_env(cs);
-    unsigned r = ppc_gdb_register_len(n);
+    unsigned r = ppc_gdb_register_len(env, n);
 
     if (!r) {
         return r;
@@ -251,7 +256,7 @@ static int gdb_get_spr_reg(CPUState *cs, GByteArray *buf, int n)
         return 0;
     }
 
-    len = TARGET_LONG_SIZE;
+    len = gdb_get_reg_bits(env) / 8;
 
     /* Handle those SPRs that are not part of the env->spr[] array */
     target_ulong val;
@@ -294,7 +299,7 @@ static int gdb_set_spr_reg(CPUState *cs, uint8_t *mem_buf, int n)
         return 0;
     }
 
-    len = TARGET_LONG_SIZE;
+    len = gdb_get_reg_bits(env) / 8;
     ppc_maybe_bswap_register(env, mem_buf, len);
 
     /* Handle those SPRs that are not part of the env->spr[] array */
-- 
2.55.0


