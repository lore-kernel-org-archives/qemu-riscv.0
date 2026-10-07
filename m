Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F85CA6002
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:24:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEazx-00086D-Vs; Wed, 07 Oct 2026 19:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazt-000844-DM
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazr-0001Qe-Or
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:29 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Ltm5I977273
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PyrVazVg2ILwvk/uJX9ZwLiX0Dw0xfAYEtSge0I7qp0=; b=G2zZeXp1+ZGBvl5e
 UAwhrBGVrzLUUR5EpdhHoTDZb/98kyjFn1b7Guqa8ddDro57DS3Lp8JUXgN4oMJ5
 dh5PyKyCYsqKUYkv4l4CsDAK6FMkIoAm7oiYldYB2J+/tLj0lp6l1dXoF6ShQvqt
 x23pzR2Uc/FCvxTaPvSmf8usgdgn56Aa08OrDiitZ+o523jMzlaeBlUWBKhbdC2Q
 O9VE2fzHDyPTtdTgzojxp+aMFxRJST3MOZGaLCWUwp7rkuvBEXqSqw/0GIQYs1R2
 0yWSmtuY6GdgasDa3WN9h1NjQuzJnwcYY/6SgO2WD/tVL0/Msr8YMlkuf7f+SYte
 hoRVFQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe387gq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:24:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91977cdfdf6so53187206d6.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415465; x=1792020265; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PyrVazVg2ILwvk/uJX9ZwLiX0Dw0xfAYEtSge0I7qp0=;
 b=QR+YYvTLe4Olhlf+1g6rtKwpoyYKH4Bub3+XsA8kJkFllOUVmYbMExMbgVCLIjzz3k
 r/HB5Vx0p0VEJLekdW6WQ7CO9Q/oe70rxND8xFHeqhy1h7uu78hV3pM921ttVoZgM94l
 nVGMedLsH02m9Y8tdnQuwjK/huG1vQnN8H8wsaFSlcSXsf8R2Yy4qDI7HaXgzVwLsN91
 zxLgcHZbusgJc13oSrf9Y3UxpFlQIjQvDygtDWHKhk5mEmbUQnjT61E7CLx6D9AR0Fou
 4lMJl4sjFZgkkMIGbpcU5C2SFBIKU39AeGwfs11afIjYT8v2YO5PeDyvIQdQ9wACfxxa
 i8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415465; x=1792020265;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PyrVazVg2ILwvk/uJX9ZwLiX0Dw0xfAYEtSge0I7qp0=;
 b=rjEB6z1qPXAz4o7fUNbbpd7d9l1VJBhKqbXNGnwj5xq3uLJdnpHa+mq5EypuADDpKB
 Gw6yfSVEC4+ZfO21Yche/vDjplqmu/pBYQhihIMTlBIu8T8EZy/rmCVYMvkK9rYRnhng
 CeAHKh/Wx4EDB8br5hgw1/T0eegMwKlYGwbWoGCVHun5wmgpNYU1HEAqE7BSzbL++Jdc
 n8kO+MpI49emnpOmF1c0eRue7VCTkVQftHF1NzikHEH0OK/x/Xf8kwNq8Qa+TMFDdLPO
 cld5xREes32ekff2IXnwSG3YzXaJKE8qFyKvBAQ1C+bFcr0mnidAe4fwn4HYjE36YJ2m
 QtTw==
X-Forwarded-Encrypted: i=1;
 AKwUvByNkuzc5NshBuGnf7eA9fL/vMObgg4MltROOFOMeG1x47GNOtctK8jC69FnuGcEtckLz0ROAL1tXz9b@nongnu.org
X-Gm-Message-State: AFuF++loM980myLZiMqYFLopuVI3scNtaygHFhsXQeCWPwlGg60G/2Dq
 okkFHZ9upIClnw8SDi5tC5bCMFItl1rEp55DgGZXgxP4vBd9NLdgduOmx8T4teOLENxbv39W63o
 hxXHga5HpffZBIXNiWPlb8ZBPih4i1O/3Y+VXeJaTOcGMcXN8+4PnG8E4+g==
X-Gm-Gg: AYBFou1AaW2YMx/a0X8lPMtJfpTecZNCisZO/1/dVrHPKe+kyXsDO09U5zPjHm9j5zn
 Shz37jdC/mxyLVfsGFb5Xub25cR2e3MSrQG2JsclqXrQ1rVofVGE3dCidgbw+9q4o0DKJ60k2CZ
 JYEOSGiNn/E7LIW+E5ta0I+G4YnLo3AaGySrkuJyGOS6sPWJfY3fhYveZ/esbKNYybOm43eGfax
 atYBuIXkyM62UL5PaLOtw8CEQD3MjFTKOwFNyA0H3awOh+s7Mhf/C3Og58WxLMitpf66vugmRSW
 /zqJgJisfbew5FcMQEmxWOP8oTt5/cNsW17ggsQFQfAc6qlM9zkHq1Dt3F7c0hIXpmgSvukxDye
 P4HRwKnyvtFHh0LhgqePOhrtTbzlwUMCZo9jevMoa
X-Received: by 2002:a05:620a:4710:b0:93e:6100:2f96 with SMTP id
 af79cd13be357-93e9b7be130mr734851685a.50.1791415465287; 
 Wed, 07 Oct 2026 16:24:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:93e:6100:2f96 with SMTP id
 af79cd13be357-93e9b7be130mr734849085a.50.1791415464835; 
 Wed, 07 Oct 2026 16:24:24 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71bd7961sm7838912f8f.4.2026.10.07.16.24.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:24:23 -0700 (PDT)
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
Subject: [PATCH 07/10] target/riscv: Factor riscv_gdb_get_reg_mxl() out
Date: Thu,  8 Oct 2026 01:23:22 +0200
Message-ID: <20261007232326.66240-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac6d4aa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=v7q07ZOhGuMP-4ww41MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX7jHmpq2iYd0j
 cWKSl8oIJ4uBRSnlYf6C22/s6ptC1nC0RqRd8c8DAlBDBXArV/7q9m45OxvtkfN7VJM3MNRoY1C
 Hbbb2cvUmbnA9MJ80vwB1Y8mz86ffw8=
X-Proofpoint-GUID: _52dGQHv7lawsE7_b8YzUATMxkDao8cY
X-Proofpoint-ORIG-GUID: _52dGQHv7lawsE7_b8YzUATMxkDao8cY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX5ZdryQWdsOD9
 bFGQie/5OmamQ80AGZsMSMeO/WJB4nqk7XgmQg9kUzYjOV9y7Q3gCUHRaXsFOQIXv/6AeGqG/ED
 +1dpuNvXEpWyEoGwItkYrRoFflzUumSaIue8iURuHmbvFpXSMXnuBTn47i3rUQKSBt82+iw7VSm
 ov00Hhe9UUPuLeSDJc+d0frIcHpGLK56MU4cCYZBxR2f9oYAquNCU8is1tZ1DZe3bEVAoP1il2y
 PBBiVnu1Mr/IJ7ablPyj5MXRo/I1ppKtRdT46FlR0gnMj8lLGCQeAMSLYECvH/Zzm09TBREELq2
 UblsaRImi3WziEDpuadt6gihYLrwRbQRTCC7nGxTniENsUG+FplPk8Qtqiwr7Umi8rigDn41LbZ
 Z9XBkdQwKOo45hlp5ipETMPyWKJbn5MMBCqAGlm6QvNhay3rFGXkb+wZQgOW18jIgNSYgaA8mag
 kDfq7X/fDxVTDaQTPJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
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

Move the MXL-based selection of the register width out of
riscv_cpu_gdb_read_register() into a helper, so it can be
reused by the following patch.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/gdbstub.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9abbf5bcdf0..b3c11db5397 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -54,9 +54,25 @@ static uint64_t ldn(CPURISCVState *env, uint8_t *mem_buf, size_t regsz)
     return (mo_endian_env(env) == MO_LE ? ldn_le_p : ldn_be_p)(mem_buf, regsz);
 }
 
-int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+static int riscv_gdb_get_reg_mxl(CPUState *cs,
+                                 GByteArray *buf, uint64_t val)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
+
+    switch (mcc->def->misa_mxl_max) {
+    case MXL_RV32:
+        return gdb_get_reg32(buf, val);
+    case MXL_RV64:
+    case MXL_RV128:
+        return gdb_get_reg64(buf, val);
+    default:
+        g_assert_not_reached();
+    }
+    return 0;
+}
+
+int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+{
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     uint64_t tmp;
@@ -69,16 +85,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         return 0;
     }
 
-    switch (mcc->def->misa_mxl_max) {
-    case MXL_RV32:
-        return gdb_get_reg32(mem_buf, tmp);
-    case MXL_RV64:
-    case MXL_RV128:
-        return gdb_get_reg64(mem_buf, tmp);
-    default:
-        g_assert_not_reached();
-    }
-    return 0;
+    return riscv_gdb_get_reg_mxl(cs, mem_buf, tmp);
 }
 
 int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
-- 
2.55.0


