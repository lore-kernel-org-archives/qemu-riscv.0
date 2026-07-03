Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BEC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiIx-0003Gl-Sp; Fri, 03 Jul 2026 14:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHx-0001md-25
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHu-0002NS-5a
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:56 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiVWA545608
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jZaXgUH/3rGreNYPT3bs5MepxGSZa1PaqN2c3deVVls=; b=SCZKZ95ZSH7VEkh0
 /uI+eZ4EuNPnaRnEWvrL/6h3Adm6KPHm9r8f2wHvHpDl34U3Jr2ENpkOzF84qgFS
 K73nxYBXEZp2P503O3J64Rgv8+iYb/c9rrR5aNqIqSIpP6lj2Y7ddYgBLKflUHg9
 ACCOV3J+CW1dOpXQS3h6oZoPrWNyQlPNDGDZJJWlLz+h3PjGV8OMtPARrOJpqfwE
 FgwlQlQA2gN6b7OvBWiRe8KO3I2TmgqzXc396jGL/xaGRG4q4ULzFR/PRQhoH5MY
 fmS6VdhcZK6x3ffJt9n5XztJItUF+c1yNG6ndxLEXUbSNnA8s4cv7D0OcaReFFsa
 i3VyHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btef9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ef81cc115cso18174576d6.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783102002; x=1783706802; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZaXgUH/3rGreNYPT3bs5MepxGSZa1PaqN2c3deVVls=;
 b=Bbur+KB2yVSXMIlWWS2PJ2ZaIgaayXPvpsbatllMwKlzxFvkl1STSyX4g4imLNME7z
 3KJL7ZPsP/KtFsv0o6KBxCPJ0dzERvh/CspgRC+VRrJ38e89JAHOyEpp0C/VMBuE9IvV
 3AP4Y3e/wJBQCulE+guBaMGinxJjN5ky3B7/xrF776D5dLpvDsOzfEQz9mMlrqMrue6N
 weRUkQ8/sMzzRIiT6n/VRZjHQTEIMtrIVAbs1cw9t8m89dhI56wy4klHsYJ10vDeS+ym
 RCIilFaQLM0OKALQTuDtBuBosH9jA5be8fTI6JI8ucQfYwEql1SqXD0tpFv+wVP6aH+T
 ccdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783102002; x=1783706802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jZaXgUH/3rGreNYPT3bs5MepxGSZa1PaqN2c3deVVls=;
 b=EgRYEvzNsedVEcgsgUh8wtS5OQgf8a+NYaNzXQ8KrvUFADxXJmmTmixFmrDnYkV2qI
 CbW7etc278uStBqnj8dCy3ARVUjWOpd5pYirtxUwksDaH3ne2fYBa6SEWfIyUZvVHeWt
 H/ZiXmD286De4KTVbDJQ2Rrtm0jIctf9/rLuw+Zt54dDCh5lYiDvmXKwtBrP02Tzq6SR
 wEkccdAvrMS3sXrfK/AIHUjN4y0reEcKUtQGyd1+Gc+8JyC9VFIaQ6LafrH5rW1KINnr
 7AEkYFIPABuVcVMAwc2gYQTy+4rlfHlVvPVV/x9LGQqT6nQhA/rphS6mgX+tiHi4iuzb
 nZ+Q==
X-Gm-Message-State: AOJu0YwUhyDCA4ZkUHKDaVqKch+f6uf/2WFbKbJGKVcjsSY0EFCUF2wl
 zuLwxFAJdn2qFjp5D40b5/aB02eYDDHZdSxnbHRzWULL7S/bb8Q6m5JoUM6rsdrknMebk1TB84Y
 7CjLyZLnW9MMJ8wPUBGX8vreoTmnOhAtOvfcetssxef5UNJ2LFIuEW1RpCw==
X-Gm-Gg: AfdE7clQSrRlpxxSBraO9jKZKEzs50BhkwjSMBWhLzkvc5lltdkkwGBM0Ros6sxABfg
 Q+7RPgBUoMUGeYLi7wkbjatJQ2Tn2Kgnyneto3CJmyJtPIW2MrA5ULcuGWedkyNUbWwY62kseL4
 St8AlTp+kfdDzk+Q9GkOK5DvGFAzyUqMBbznpv/A7yFOEf6YdJ1SyrCxNmP+y/VMz+qk9c4WFf5
 Eqig2nYTpPgpnGkgEZNh3ikTXArKnsk6EjC72ikTjNMOsbV33pQbamIBYFDNGM03h1FlQvogxv9
 wvxiWgIOX1Nj/dBt881W+KzmKx5SgcyoBpmu/Nc7vSO+9JUuwAOoQy/LNzH5THUwLdV7DxgswR2
 xGB5CGxny2NmfJsfWUQSJhtBcNrfKaqWe6G7ZotUq3RN04w==
X-Received: by 2002:ac8:5fc7:0:b0:51a:8c86:bd2f with SMTP id
 d75a77b69052e-51c4d1a0932mr2191421cf.36.1783102001693; 
 Fri, 03 Jul 2026 11:06:41 -0700 (PDT)
X-Received: by 2002:ac8:5fc7:0:b0:51a:8c86:bd2f with SMTP id
 d75a77b69052e-51c4d1a0932mr2190901cf.36.1783102001163; 
 Fri, 03 Jul 2026 11:06:41 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:40 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 19/24] target/riscv/gdbstub.c: isolate TCG only checks
Date: Fri,  3 Jul 2026 15:05:31 -0300
Message-ID: <20260703180538.3346781-20-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXxRLVqkijJFx+
 DcOZSihw1lKdQpnP5TDiFAUfNwyQY5rSg0tisdDLwD3pw4RjDbHr3v2RzkmBOqlYD6NTFcc/7lY
 e/X5/uCliPp1ZCPuCvgUk2w4LjS4Nb9Tth+SHjRl1ds5L5EsQCVW7WIsZAWXo9EdgDLip3qiDhZ
 9lPDx9dDVibMCUrcTOIG8+fK4vzP4nvM4Q2vURu5rXWhXWdRvrQjIpMcctHuPL3dfyEIZvkBKb0
 6ANYW0ukdyklZMuKAjr5nG/BWcBQRKetCIFYSDoa/uC1w0fd2UOfEMAYly8iQbE3RteupsSNcHJ
 CqhIR+MaJpdeGJgO248UcK1SFEU3fCWTTWJmGp6GjKy+bXLEG74CuUmqKj+iD0pu9U55Tk1RtcB
 aYmW3ETOtqo8MkALtTm+hBMYDl5a9XhujxSIXwYlcpg4+p0/D8b96E54T1C/8/Gr5okKwBAX1oL
 7fUgmGpR6lnwSB63/FA==
X-Proofpoint-ORIG-GUID: -72eajVDmBFEofnLijxa99FeXl88DRdq
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47fa32 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=Muc6iJuzKOfAuMMkZh0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXwLPb/lWDNce9
 8f4c8+ocN2C8JmgD17fHH49IVKmcAEB/A2WhAKKLVkcmy42OH5rlhFNMHaxrJOaMQtBB+W2+Gxz
 wGg2jUmaIgUjzXPI2l8fTwzFHS8+tKk=
X-Proofpoint-GUID: -72eajVDmBFEofnLijxa99FeXl88DRdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
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


