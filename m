Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62861CA6002
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:25:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEb05-0008DG-QD; Wed, 07 Oct 2026 19:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEb01-0008AR-NY
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazz-0001RO-DP
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:37 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Lv3L7358423
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pQCnWObGBp9nvEbETA4j4KybFYobm7JJHRegzASB6DE=; b=Mi8oYKQuBj2q4ofS
 +3yjhrvI5LjqhQvLyI5InG4tkhJl+1wn1Q18kUSaQIb6f8mNiyGeF8q/p/kjWOiC
 nFwmPh76SwbqphXmCV8Iye4c2n/XRrRcOt+BizqlwT1A6vpTF7oWK9QXC+WCqcoD
 pLpm9npGFy5SBwuLDW5D6qe0WdfdqnF3TRnZvYDjR3hMMcKXpQcrEHWVrhJxJiFu
 uBnmfhq6+ZDSo7v/HQtCbQ1cGEB4BD663FPjZWnnA/Hj/ha8edpKmzT4unUFQ2zm
 4PecnmavXZYf9L7RBMa2e7AFzWtkXkh+gzzeYJty803d8wFeGg1wTGP/ozcgycrY
 HveY3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe508nn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:24:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e46c120dfso509563985a.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415473; x=1792020273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pQCnWObGBp9nvEbETA4j4KybFYobm7JJHRegzASB6DE=;
 b=fFmRTQ+RvwMsWMtAAb9jPTVo98dDqOZYy4Rue4amgIZ1W9gznMi9UUFbIYMK/oZ/m3
 NC6VjVYjcx1HGRv5+uSpHdlNPt7Q6E7YvmusxMTfN3pRFZaT4foaKisNsIx+9Rv5jGgH
 gqR7hNIaQ4bLI3HSuZYn+HfyGco+GAIIZUgBrXgaCYTJFY8P1XRQ4sW9Sbh5kZpLUByn
 03wAVMw9efFRgW7VbzF612qA2nM5MBrIj+dlXz4d9OiDILcC4yj3ldrazPrPSyya/T3/
 h9A/4SIwWeUCbGrAjxQ9bCRn4Y048HuI6FYQnSJubd+z6GLkkJlEVcEOU7Hke7RYMy2k
 VKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415473; x=1792020273;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pQCnWObGBp9nvEbETA4j4KybFYobm7JJHRegzASB6DE=;
 b=Vsbklz9GrfzyZcO1B499ZJznN974yaEOungmwDNNK1tGUGV5VEAQxgQNRHi/RFVfo+
 bfmbSaRtQIN9v5AXSNj9uCAkj4ebJl32ExrLMfqaFfciPgN+c1MmuoKPHlPzD+qmaFdh
 lMmkg0yt1+OLNdmbr5BWpNWgQoUjxdWjQDeFgXEa7VTzMImloB8yp4hy/Lvyn6/nsxfV
 Rhz4pX4O24zqGnEA3wZzhWihShk5Fc0/oWKayM/i6ya/YOxttmiCPafzMvrGw1Q+wzkO
 TbZ1KGQV23/dU0nEpPcRP+tmMj31+oDnqk45NrsWjr+h7wPiFI8o2FlYJsEwwOlgj2Au
 eqQA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwLva04ckQIntq17l3ER05tVYL/u3OAhnPbspZmilfyoX5+cpi/cTZpeqtJSn3ccW3jUo265SBJun6@nongnu.org
X-Gm-Message-State: AFuF++lMnuqzpInU9aIxfCv72h9Mee9k/SkyXpUuVkFKj0VsmcvOzArl
 ZGKBTrxigyENin5dZJAdHAMp7YUhw7QhluvNLZu3usfBBC0qgIwdn4cxHx9n+w9nXsNb1gni9Ug
 GXiz9N7HOQLsfiHmNq5AAFaJd6TsGFzgDKhO2gdwVSKhBMwQWgvWPuHhXlnhHsj/baHY3
X-Gm-Gg: AYBFou2+scToW1YFeTR+izUx+dCdXY2O8Hra2k3xHPuaAc4jrOZsvS1hhNH9oTxq61+
 AJfjgpnahNPMtVB+ZwRzIKSkKlsscLshSaoRX6kBs1CYcPQilS+BEyh5+m+hP51HhrfXU1xRoAm
 lR1eyg5mcdkZWCBoZSZTWuLPT5H86pG4+XeqMPDfOhLPokDzbsNMD+jVHjYSI/46QPZcqzoe08p
 WOeEQxVvp1ApEU3CcOSKYZM2HG9hkhpTih6KmZ+MlRROXlsvU3PhdCn8aL6ymCEvChFp0vrrFWY
 rf4FeKHSqzotMWmN52AhKKnGpI36qG22/+FzIZz+qn1h85IVXkDcPOrHHje1ecMqIffPk6KS73c
 7Re2rW4pYRrChk9NMgweXnuklpS9NkH7KRQ2X068y
X-Received: by 2002:a05:620a:28d1:b0:93e:9808:b9de with SMTP id
 af79cd13be357-93e9b838791mr755298685a.67.1791415472644; 
 Wed, 07 Oct 2026 16:24:32 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:93e:9808:b9de with SMTP id
 af79cd13be357-93e9b838791mr755294985a.67.1791415472039; 
 Wed, 07 Oct 2026 16:24:32 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1144csm7341957f8f.23.2026.10.07.16.24.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:24:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 08/10] target/riscv: Replace gdb_get_regl() by
 riscv_gdb_get_reg_mxl()
Date: Thu,  8 Oct 2026 01:23:23 +0200
Message-ID: <20261007232326.66240-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7xhmEgC_dPXiw5aG06lIss-qLrx5lN5m
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac6d4b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hwDxwncWfiQWgMtNzUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX90fSm+JodqWb
 1Ofu3qGRfCuGC3QDw3DHQvokdxmdgkWFzrwGYlwfhXz6656xyqcdCszr7ARTd6QlPj9XjK6QADl
 NxQMkcK643mcDo/Qe9PX4w9oESRBAJ4=
X-Proofpoint-GUID: 7xhmEgC_dPXiw5aG06lIss-qLrx5lN5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX2KPWK+cgnQj4
 QrNOx91rTWiL4HslAdNfZTreVCDN+2cqjtBKU8gqgrNfwuLC97SJb8v6MuUB59XZcI8Zy/BKNBB
 5UWGJbQWvH3n0u1zq6enrNZvDujSyPWpRtbR/ddpmA1skRgk6iVa08mslw0OFhIU4X8R1rBQ57k
 fJfHTyH3FQXt6OZDq+k8p3D7onU7Ve/1I41o4AfxKY76CNTvDB27HQF9Ec1bu645nlPBx3R7P82
 m0AWUOleLhXaGF+Jl9yN+AYqXhBcvBdZZsGWujt9Gq0SyrA+hob7faR1Uk1C1uwhTR+swx0cRwY
 RROeM60zFv74J5tlgpaBoMXzLUGjJqdnH1DsLRgDpltmuD0Yhf1Hq1WVSSuu1yKam0vKC1Bmy8L
 Z6Y4Mlo+vjl3JMom7prQIETIb+WuSrbddAZtW2vRI1gwvAbtone5fjc4o14Uc+5Tok/0TLuIWqA
 eswbSsI7fZVYHpzpivQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

riscv_gdb_get_reg_mxl() picks the register width from the CPU's
misa_mxl_max instead of target_long_bits(); use it in place of
the deprecated gdb_get_regl().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/gdbstub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index b3c11db5397..50e834e367c 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -183,7 +183,7 @@ static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
 
         result = riscv_csrrw_debug(env, n, &val, 0, 0);
         if (result == RISCV_EXCP_NONE) {
-            return gdb_get_regl(buf, val);
+            return riscv_gdb_get_reg_mxl(cs, buf, val);
         }
     }
     return 0;
@@ -211,7 +211,7 @@ static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
 {
     if (n == 0) {
 #ifdef CONFIG_USER_ONLY
-        return gdb_get_regl(buf, 0);
+        return riscv_gdb_get_reg_mxl(cs, buf, 0);
 #else
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
@@ -219,7 +219,7 @@ static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
         /* Per RiscV debug spec v1.0.0 rc4 */
         uint32_t vbit = (env->virt_enabled) ? BIT(2) : 0;
 
-        return gdb_get_regl(buf, env->priv | vbit);
+        return riscv_gdb_get_reg_mxl(cs, buf, env->priv | vbit);
 #endif
     }
     return 0;
-- 
2.55.0


