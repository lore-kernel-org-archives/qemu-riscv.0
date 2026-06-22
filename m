Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827FECDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkPj-0002eT-1B; Mon, 22 Jun 2026 15:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOe-0001eQ-7K
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkOc-000215-KM
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:33:27 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVoJt3842519
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=q3VKOG+bLiR
 yfEcN4LKgkHdSXA4OOkMf38y8s29WJto=; b=I8CQH6xL+Q7WdczUlGeikOQMtKj
 l1X+zwdw2TV2O38B+o7P7sjHw6qaF22DmL3sDGrHn+/bDykdQ5JtdiyzD2gy+G7G
 cdats7rYrX063L0EY+ZT2hFDT4suonm6Mx5nDmAme3sj4WsQsd2rygy8c7XHYJc0
 Dp6zc68Xk5uM1q2+WRi0y+GrW/53ZWfouzWCrTisNUYIB32fTWUuXcHjw2lXZgus
 DM9mKHjJQWHNqD6/Vsh4E2CD2MOIUL3jH1nRORvg+SdUJCN/wSQRT2KxP0VrlE30
 +fGjGKGG16wfMgrvvMevZVJSvK+LaRLh/EagEQrF2tyC6owMv5rKBc6Nu1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yht1c6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:33:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-920aa2e130eso718303285a.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156804; x=1782761604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3VKOG+bLiRyfEcN4LKgkHdSXA4OOkMf38y8s29WJto=;
 b=X82bC+lpYC+ivSw/spnMvLzWsXRHmXOcuOBVn+CGa/p6eKFlVnKmWWDyOIeoqTFzt5
 Lqi7NYH2bjMwBpFwd2xOGoIJKwua129bOh/Vwf4NHaoxmCc2Qfw3cgeENq0IiFBqlMQg
 +FoX7azCwr5SlnD8/Yk+fpEYxM0ZCHg2AWYKQH+l/xpj++yxvM9S+jLCi8/CfiR1B6rx
 D12jJMIcxPLewuLOPFcUn6AoROHHYWJXiZdt4xmkFBZiB15dHtFJHNb6qldJ708hq2Vl
 H903BtHEEM1oMyl9CNDemUgVf8ivbwHUYmfXruha/7RyFfl+hHVG39Q5rXAYpKTAkGTW
 V43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156804; x=1782761604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q3VKOG+bLiRyfEcN4LKgkHdSXA4OOkMf38y8s29WJto=;
 b=FVYdtGtwWDm+BfmNfXtbhM+50MIz9/ik1Dcx2alddfRH6lsTtSeQsC2sH3dWra978/
 sYYJISUgfotECWfOZHD6aBfyUkehIk0ACK2ydrwOWkTul9VYbvSv8KQqfjSykVlcVCsp
 aDyLkdrZlzxj1uzvqRb1UHdmt4CRfPW+d3pza4Ojc7inCS9Yo3VPero6hjtzg2NwnliE
 lmz8j+XI+jlx0+W+DojS8C0VSbHpXfpylSPjye9qAJKDOdWPqXsH2xBhBIj7Hega0izA
 dANE5lHdHXOkb6+LPaR1r0xx/G7mVhIjDzm68gp52lO8g7QykMSLHC+nSUe+Tv5hs1GC
 v79A==
X-Gm-Message-State: AOJu0YzdR79mJfx4DBgVbApp1uccvslOerHSj5NDp55oqJrySeMOU+i4
 UpT/voDVzBZ5Wz5Rl2RUH2LLocCmi3vtBGl9IkvacPX38Cjyi3TpjJltQcbjG21nqcnSt552a8t
 ElIJftNsIpBYyOcdkyUM+PIHVAs+qpi07hW+oYFUKxLtw1AsVEHr32VhtdRG/OpQg3Q==
X-Gm-Gg: AfdE7clnK96awUP5IdMKlQHzMMWBrq7JYbrXmlsFHYiBv8/aMy+GNu7NwhNDdxcx15i
 y0d0iXeEPUdEhlu7PLLymPg+9P3hc+fT7e1AALACb127hemw+n7oNog5jJS0ZxvqwT3zqSEd48J
 K2h0nxy0lRLvC2bPWmHybqhJrYX7e496KZXxhnoYCcKfDqK7VYoT4BP1yPM7tEwR+kzFh4CNuZE
 fOnLUfM/XTuDAo5BoHwngKk61Q4w/NQ4G7km0Qz7UnKGHAxWVDsz//y1p0o6iaTrqoPt3yixqat
 WLxHjkRa+iw6fWjWzmPqvpoMa/o7/GV3vCpDvL9nlmCJw1cWQVX5KMV8BlUsYItCDOw6cWcc/3f
 RmhDQ6hmuoCHCefiHFSfiteg+8YAZOICFfGzCHltyFrr9mA==
X-Received: by 2002:a05:620a:2725:b0:914:ca66:841f with SMTP id
 af79cd13be357-9208f256a65mr2472363785a.6.1782156782275; 
 Mon, 22 Jun 2026 12:33:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:914:ca66:841f with SMTP id
 af79cd13be357-9208f256a65mr2472143485a.6.1782156765168; 
 Mon, 22 Jun 2026 12:32:45 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:44 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 19/24] target/riscv/gdbstub.c: isolate TCG only checks
Date: Mon, 22 Jun 2026 16:31:35 -0300
Message-ID: <20260622193141.1449724-20-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXxlbU/TIdJa45
 qhliDVd0noIrqKo2a89DpkJQk8mL+lN03zKeI5djo5KZ/mrDWNuJPgZDfKUNBHJrRHTPbo0wkum
 PlyhVQmABJ7RivJpb0ToVZjXzvf1yDI=
X-Proofpoint-ORIG-GUID: W4aWi5WHjrst8pSBC3I5D3Sf80Ped9uA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXzbE0LDxC12yu
 wdUXT8YQQB03rNCDwtl6fWgtF6iPqUkwSturmZLpLaWy45htuk6YSNWmppZqDLe9kOYTMPzFh3Q
 iS67qdFB13H4+OPDAfOizxxCCdFIroM5+HZudlqFpMihqM/j3rPfnvOwVFjeOVcuFoutuFf6zUE
 OqlrvNEUHv7G02B4vLN/j8Zs13y7Mk6KO8jDiZs+lWYiSHy1Rc22WlWDrY7zRXT8Gn0mKUZRe4w
 nT8FCfJ+mlMpO22UDVOPW4TWimGLpvg6+myL2bXVCmQn+Jra0ferylb5+W79A35XMHakUjyFl5A
 vVgKC1FRVybZugR21zGW6CboR4lSz4WEVSXtZzuiZUI0iee1g6mOt7P8clGklDol3xOrv/qeGJQ
 /M18YYk9kkTAi5QiDW0EkujVfA/Vd7YOUfrXdygp8qi/PTpn/7IwUD2S174i1GkaTFK25gg9CLO
 UaY+LeXeWx/GRzwx1YQ==
X-Proofpoint-GUID: W4aWi5WHjrst8pSBC3I5D3Sf80Ped9uA
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a398e05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=m8F5ZJ-s4jyFCOPQnU8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220189
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The following functions are TCG only and are broken, if they were ever
usable in the first place, with KVM:

- riscv_gdb_(get|se)t_csr
- riscv_gdb_(get|set)_virtual
- riscv_gen_dynamic_csr_feature

Gate everything with TCG enabled to at least get them out of the way to
enable --disable-tcg.

As a note for the future: other archs have distincts gdbstub files for
each accelerator.  There's a strong case for RISC-V to do the same.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/gdbstub.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index f0a5e0d86f..9abbf5bcdf 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -164,6 +164,7 @@ static int riscv_gdb_set_vector(CPUState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
+#ifdef CONFIG_TCG
 static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -294,6 +295,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 
     return &cpu->dyn_csr_feature;
 }
+#endif /* CONFIG_TCG */
 
 static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 {
@@ -336,7 +338,6 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     if (env->misa_ext & RVD) {
@@ -351,6 +352,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  riscv_gdb_set_vector,
                                  ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs));
     }
+
+#ifdef CONFIG_TCG
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
+
     switch (mcc->def->misa_mxl_max) {
     case MXL_RV32:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
@@ -371,4 +376,5 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
                                  riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs));
     }
+#endif
 }
-- 
2.43.0


