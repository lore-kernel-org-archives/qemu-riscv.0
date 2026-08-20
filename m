Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D06CC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx9Ae-0006HT-QL; Thu, 20 Aug 2026 16:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AR-00068Y-H5
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AN-0002M7-FU
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:14 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7idv3243040
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=; b=kscPNHkv/YnPK8RE
 S4s9vj9eYf9FAT2+jcP8js2ETP4TlqthKsHJv4112H10Un/XfPrZQgWSz+6yukRB
 jgMg+gaJ24SPB5/DdJxK+a31n0hktzCLGOPrTGFluQlQlLY1i1/R2qNGJiUukQQj
 /UgZZgVlglZ8aYqfVdVK8lRbr5PwZuX/2PjyhJ1DfkPjemY3RxrsJYDHTE9OrGkP
 5rtYSeHUgSrBRXaLYwb1pxq63eNd7beL3BKrOttmJyhJSGOFT3HfoXwbIaA5VuQ3
 0YIG1+TAH8STLDwxkJOhKEIz7n8hAvvELfhjMWYDqhj6Z4PeK/sip1eVtl1vZBGe
 N2q2/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05u5ra-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso4224081cf.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256900; x=1787861700; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=;
 b=OZoLHba9Xn8JzWrN9p+bL1WG5HjVapaCu1pBsjmeWdC9WLNrIgcccsOUpSOoNOmjKf
 hgw8pvmL9HzpoAAnk+P9QnC/KcEU3gD0Yzxe/vsVZs/9oTN5/6WRdueuu/EQqX1SAAs7
 BgOuIA1PnnMeI54URTW8su9oClxOJIz6M5BeWMjbu6vYv2Y1RfXgtqkDIFb+liLS/pos
 CmDtThSPzMjBXtdlIUSvmber5PcBsDevnOn+OXeSoDS0QhQ1FSUxWnnSO3mFxPPtx3z0
 LDPlZkO+gkOtFJj1AAqLCWiSGNhJtuYl5ZA9NNY3VvLGbhLcNrU0SuuzXtmyab1jtyrh
 i9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256900; x=1787861700;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=;
 b=m+TcPZNAohQiqS9JglB778eNMpTdd5pXNCo4BKYJ5fwsnKb4XEKwteL4N8GhPtjEfu
 Bi/8K1QWD9DaaZR2JhpXFqz/0J3z9ViRUiSedpH/5Kwf43XdhPtEy4o1lqezWMTYB/b7
 sY9kQASBKYeqc/S6liIJ5Uk1FF1ChdGbhM6Mb4LJoJZMprwTRax4MMyupilqCIdByw4r
 xnEKLwIybsztxuxM3q8Iey5yQTWp9hfbrvKp1Py441RphC1jguw6SL/aGHPdvQlfBi+v
 EszdXnLRiVBWFUM/ZzBu+zZmzH76aYaKkwTeSYMmJE5zhRD62FUMAfdreU3XAwD+/cnM
 Ctgw==
X-Gm-Message-State: AOJu0YwYgII8ui/bWDvwu/0TOJjMQybAeWS1ZodVOpgfhaZShvfmGdk+
 /2+Q+/MU5gr1MTXA/H6FDpjTTsud0YdgGxOluNO2NHREO/zzE2Qkq6h9BVEHxvDDFyxLNmspIYG
 FH5Y7/Mef8UuKEsQNnQCtRTaFgpvrSz5FIL2RDYforRRJ7jULGB/xFv427A==
X-Gm-Gg: AR+sD12voA5eYiyg/jwOJo7WYCRHfMI2Na8Y3SfFRzOxHVSYv7SkSG9JrSGjUzW8YzB
 +bMPeLe5BW/k3ojSRAM9G0Maf7XKN4650FmJQrUFNOSd1FP64i9L2xeBFLUgyTCalnk/9hS+tZ5
 hehX4aDdjcQJYM74yy5+CciNvM8yQNpQ1Ukbtdb5jQUllg/CEIvEYL0ZRe9lJ6xLXIJ4n7WYi+q
 yMJhEYeKEug0Cgsjcwp5bIJ476eGPoj2U72DM4/9AtJ1ydo+8VVEwBrM7uxycgMQnYe65ErtEJK
 F6V1pRKX9M6B7cTnFxscM04flb3T2ZMKJ4obFh75OersHry4QHl00M+csobVbEZ7ZQ7sG10NzTA
 q1wJicn2Yvg3Y/bx27siy9pbeyxkwea66n4B93G/pRA==
X-Received: by 2002:a05:622a:a1b:b0:52b:4f1a:5fde with SMTP id
 d75a77b69052e-52df5864a38mr11140911cf.19.1787256899624; 
 Thu, 20 Aug 2026 13:14:59 -0700 (PDT)
X-Received: by 2002:a05:622a:a1b:b0:52b:4f1a:5fde with SMTP id
 d75a77b69052e-52df5864a38mr11135411cf.19.1787256894914; 
 Thu, 20 Aug 2026 13:14:54 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d3046sm4287185e9.1.2026.08.20.13.14.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v2 07/15] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 22:13:47 +0200
Message-ID: <20260820201356.29775-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UC6VWhp7MdXo5yDui6p0CnUG2zrtm9f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX91roaficZTnl
 ZWEBeiOhRctn19Qfk1AD4boNDbPrrwQgBDoaknFZIqSXBO7caKqfFXC1SPWSYmga5zO/oNFaAy1
 QGrJXY26TAt+yieDIirckGGCS1YLyBV9R2oeLAoilIvB2vIB3EEYTJh0oVbzJZi3c//Y3w1flgk
 Jtjqgvxi+NMBL4vwSyXsqcluiOvGwaP0JMMMrXX/XpTiEaVPvmI3xyEdoy5tdafQy2oGNSd15/a
 /rabPnSTz9s9l/YAHW26Sunyp6oUujTkAPSmrVgbDnfk+IYaRe89iQJCAB6EaEFsRhbBJNWACV5
 xXdTk0xKT2qfI045E/ISjqObw9Wan9a3FRdv0dqJa3Y6nmx2Ye1h6Q+6DVV3R521f6z/uu9oDN3
 DmWTVbN6cv3N+gPqfiUkCkF2QBigVGd6EwGfQbXdZXhvkTchch+7fZgI0eorZeXe4Hm7+lLRXwY
 UkU1OrB7Y3Dq4yDRrMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXxooGpp/BfWMv
 NMU8frwH1ZeXG8ASUyIScn1T2YlcJrFZytIu2VWoJq8MhxC9zxw3S0pnnfBQghU9Q8tKX//61Fi
 ohyknqPrcFacdK46XaMO+FFfizS3T3c=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a876044 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=OdUTIDwS7iTBxe5GiEQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UC6VWhp7MdXo5yDui6p0CnUG2zrtm9f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Add the const qualifier to CPUMIPSState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/mips/cpu.h      |  6 +++---
 target/mips/internal.h | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 319147a948c..6404b342a5d 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1372,19 +1372,19 @@ static inline bool ase_3d_available(const CPUMIPSState *env)
 }
 
 /* Check presence of MSA implementation */
-static inline bool ase_msa_available(CPUMIPSState *env)
+static inline bool ase_msa_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MSAP);
 }
 
 /* Check presence of Loongson CSR instructions */
-static inline bool ase_lcsr_available(CPUMIPSState *env)
+static inline bool ase_lcsr_available(const CPUMIPSState *env)
 {
     return env->lcsr_cpucfg2 & (1 << CPUCFG2_LCSRP);
 }
 
 /* Check presence of multi-threading ASE implementation */
-static inline bool ase_mt_available(CPUMIPSState *env)
+static inline bool ase_mt_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
diff --git a/target/mips/internal.h b/target/mips/internal.h
index c5c286872eb..7dba22300b1 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,7 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
 extern const VMStateDescription vmstate_mips_cpu;
 
-static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_enabled(const CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
         !(env->CP0_Status & (1 << CP0St_EXL)) &&
@@ -180,7 +180,7 @@ static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 }
 
 /* Check if there is pending and not masked out interrupt */
-static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_pending(const CPUMIPSState *env)
 {
     int32_t pending;
     int32_t status;
@@ -247,9 +247,9 @@ static inline void restore_pamask(CPUMIPSState *env)
     }
 }
 
-static inline int mips_vpe_active(CPUMIPSState *env)
+static inline int mips_vpe_active(const CPUMIPSState *env)
 {
-    MIPSCPU *cpu = env_archcpu(env);
+    const MIPSCPU *cpu = env_archcpu(env);
     int active = 1;
 
     /* Check that the VPE is enabled.  */
@@ -281,7 +281,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
     return active;
 }
 
-static inline int mips_vp_active(CPUMIPSState *env)
+static inline int mips_vp_active(const CPUMIPSState *env)
 {
     CPUState *cs;
 
-- 
2.53.0


