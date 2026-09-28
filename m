Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A1CA5FA3
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:12:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHhM-00010S-PZ; Mon, 28 Sep 2026 16:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHh4-0000uE-91
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHh2-0008Es-7G
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:22 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SJghbt3539517
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yautWqzYZte
 aWyTT/C8qxUQD0UCqJl8f+pO/3XoUkTg=; b=pKYN8lmivkKRKScQjMgk6pmddJ1
 089vhNuba08DJWhfdki4A8xNHS4sE6GR+LR9doAOdtNGVgWyPGI5YAdmk1wp9f+l
 zMGvjR3pzAE2bHJD2WV5QQ/2wEMwaNzMU8nM7mueKdwNtdRvmpSPLd5oZkwMTzkt
 3ViJRVIkxj2aiqwwDm98SUTu3fNZ1dnzjF972QR2ILDz4669y+YGGzMbo8Vg6wlm
 B78b36xIR17j4nID9LuuvpZ3Siy+diHrIo1dV6e85tGriv8lnWhaTk+qR00xt382
 TJG7irWx9LURk9COaCGY5X75GPzarLezwY6qjlo+8C/qjaMPIFLrjCYavKA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu83dp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-915a24a3d50so7934296d6.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 13:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790626277; x=1791231077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yautWqzYZteaWyTT/C8qxUQD0UCqJl8f+pO/3XoUkTg=;
 b=hoNYn+EslP5B/Ackm6pd7pJEHl0eFk78TeMYG3dbelRmhefG2YM3Mht8ObBeX9Yl2X
 cmoyvm3OJDSaVNXYLcLCFzN0swck2FmM8WTMBF5YHAdMtvu7Wbs3cJOzppmdKS69GxTH
 MxORxLGv0Za5PihEqKndf1twdNoFfhxqBly1hRGqj0pJYkNAQqCObQACOuOOWsC7ZGQo
 HZl3iTymyVXgiITVLWZe1Y3ypEyra/o5/EEAbZD+8hbGMz/b6kLmqC3tuXtMGNBonmMf
 NzS2n4uv7+0G6ROKz+bK9DZBsFhqScJRnOw13zAQyl6t3Q5ugKJ+n+iuq6Mf7e50aYQ9
 H4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790626277; x=1791231077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yautWqzYZteaWyTT/C8qxUQD0UCqJl8f+pO/3XoUkTg=;
 b=aqfnK76oNtqvQy5XuIWbGhILed8y1hLhT4GQlHsyiESKlgJdFVgND4AffFTKlz5+uE
 ffkkjfThRSvjMrrUsWyZy1MdSPqV6yvXxvU5nZYh2Z9E4KE6xnNCkfq5rcn9CoaMJck9
 ip0FtGCwDwbVDNfoCPhYwFCMuyak4Udi7YoC2HZ9B+CAHFG2e3OsL08OEzCgztbAcfoP
 OUo3t1f/CveE4NqpFodl3PkQ+36sEnDg1bDRpmj49WUZw950G1hdJLDJ26tenbqmrrh2
 iR+T+pzN0IDZx6K9X85U6qisaB9An4vNDHDRx3YdidGluPfdsJSgUma9AL5QLLT8tQOY
 3TBA==
X-Gm-Message-State: AFuF++mSHy44xYhYpfk6ucT1MlcC2Wp+ZMs3DBG0nFHqI7129pGfi477
 yHpsVZWkvvsDGtO1y3eMG16ZnPwjgBE/dlP1j4X1kJlsNnY5ztcYAUnfDdTeSd9bvqgMXqXPKAO
 V8rnPPZ2kokTqAeDPaokMakDUh2A7Uwv7OtcGevlUMb+bemb5HaSvrvLMUg==
X-Gm-Gg: AYBFou1aKjm6NyFVRKAEfLXImKQdqk5Y3ewTWWlMwdr0cJTXX95XmwC9dPdmJ5kYB/l
 r63MYZvgjL0bFUMX9lt+RybSQ8PNWPxg6icUdHAMwjty4YRUb/FWkoh2JM3+SH4m1uscRKNxNw3
 IfdGIcddwhUbmqKWWAmpyyu3SV3rMPKJGz9pTl+F+z9GM+DBbXSe619skja6VWp1jfr3kQW2Ivx
 2JodQS6fmKgZLQMKrC8ctzvHrj7VGUajf1dF7rCAzdS9YZhUbPzVjL/AVRJZBnF5fn8t+qsZ2pm
 nNWAoOuEGBZN0U7+eYTjbh0oeSsiVyYFW65kv5otR9cnrvECIHoNq095m567niAHW+gi1csVjn4
 x8CzjptrNxlnBSbihBRixVwrlpYa95oYwZuc=
X-Received: by 2002:ad4:4eed:0:b0:8ea:c243:84e0 with SMTP id
 6a1803df08f44-917862dfebdmr9138456d6.1.1790626277349; 
 Mon, 28 Sep 2026 13:11:17 -0700 (PDT)
X-Received: by 2002:ad4:4eed:0:b0:8ea:c243:84e0 with SMTP id
 6a1803df08f44-917862dfebdmr9137856d6.1.1790626276658; 
 Mon, 28 Sep 2026 13:11:16 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-914399d5002sm79815646d6.48.2026.09.28.13.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 13:11:16 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v13 2/5] target/riscv: add riscv-server-ref CPU
Date: Mon, 28 Sep 2026 17:11:03 -0300
Message-ID: <20260928201107.2049458-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
References: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfX6lzYf2G/WFUP
 YAp8Tq2R1/4P6tk2bHwogbd5ykCvhKtDyxdI6T1LmVzy7dP8Qwo1pwG6Y0BGiSta78uSwcuTC6c
 2X0K7Wd6Tj+nZi7IAQmy+EN1ZCNVMKSXNLyJp5V3vgfyah+vBj4Gt8+g+DHqGi68Vq6vF5HjOt6
 2FVr5Uo7tY7i2T0skjSYh2Ed3pD7Pe+MSlAJlm3Wyw8DKKr5MyYt85JcSsXFMq15zInaBlnqQ/z
 RBkhFe3lUXA3TYrJUTrQqWjjb1v5XdMUjRvD9XCEj0N8T3yzWIaZWqFbiN79666pfhe9deB3XdB
 VztSyCbqbKP3dhecV/SgWQWYFXgayw0gKq/jFhfUddzMfgdIg5HLq+WRU2WpaIf7d41FyxplLGI
 iyTBT9465rUAflgJBAgxUnNg7OqBIWnJiNcFhQalhJvnVTam4pAraNE9fO8NnRwHVuA1vBRnI93
 RNMTdVXS7aWKegV/g6w==
X-Proofpoint-GUID: aBq0IGU_f0De7x_CBG8CTl_geYWyXs1n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfX2X68K0xClvNJ
 qdlf8lpNhTBEagH0eYpYDIiEDrUEqUb+U0Ttq8SYYu+Sc0YUx6fdqi+eS0g/u8+gvNqJFYrk07q
 /oXpa4Hy+hXZlfHFS1hguep/nQ4Cxdc=
X-Proofpoint-ORIG-GUID: aBq0IGU_f0De7x_CBG8CTl_geYWyXs1n
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abac9e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=V1jnuoLLAAAA:20
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8 a=FRSEYCzRAAAA:8
 a=zLUtPzHEVTZWnbMtJKMA:9 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22
 a=1qLaeP4TCVy2vqIEy19U:22 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280080
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

The harts requirements of RISC-V server platform [1] require RVA23 ISA
profile support and others.

We're going for a profile-based implementation, instead of a regular CPU
that can inherit RVA23, to allow future CPUs to use it internally as a
starting base for their own extension sets.  There's also a new
'rvserver-ref-1.0' flag that can be used to set the extensions in the
command line for other CPUs, which can be used for testing/debugging
purposes.

Note that for all intents and purposes "riscv-server-ref" is a regular
CPU and no, we're not trying to set a precedent of calling the riscv
server platform spec a profile.

[1] defines in rule SEE_020 that we must support at least 11 debug
triggers (4 for insn address, 4 for insn load/store, 1 for icount,
one for int, one for excp).  We're going for the minimum.  If more
triggers are needed users can set any trigger amount (N <= 1024)
with:

-cpu riscv-server-ref,num-triggers=N

[1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc

Suggested-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 1a28f1369c..61234842e3 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -42,6 +42,7 @@
 #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
 #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
 #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
+#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 766b9424d5..408b412c7b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2428,11 +2428,37 @@ static RISCVCPUProfile RVA23S64 = {
     }
 };
 
+/*
+ * This riscv-server-ref entry isn't a profile per se but its
+ * CPU definition can be modelled as a profile that extends
+ * RVA23, with additional things on top of it, and allowing
+ * future CPUs to derive from it via
+ * ".profile = &RVServerRef1_0;".
+ */
+static RISCVCPUProfile RVServerRef1_0 = {
+    .s_parent = &RVA23S64,
+    .name = "riscv-server-ref-1.0",
+    .satp_mode = VM_1_10_SV48,
+    .priv_spec = PRIV_VERSION_1_13_0,
+    .ext_offsets = {
+        CPU_CFG_OFFSET(ext_zkr),
+        CPU_CFG_OFFSET(ext_sdext),
+        CPU_CFG_OFFSET(ext_sdtrig),
+        CPU_CFG_OFFSET(ext_ssaia),
+        CPU_CFG_OFFSET(ext_ssccfg),
+        /* ssstrict is always enabled for PRIV_VER_1_12+ */
+
+        RISCV_PROFILE_EXT_LIST_END
+    }
+};
+
+
 RISCVCPUProfile *riscv_profiles[] = {
     &RVA22U64,
     &RVA22S64,
     &RVA23U64,
     &RVA23S64,
+    &RVServerRef1_0,
     NULL,
 };
 
@@ -3770,6 +3796,14 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #endif
     ),
 
+    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
+        .profile = &RVServerRef1_0,
+        .misa_mxl_max = MXL_RV64,
+        .cfg.max_satp_mode = VM_1_10_SV57,
+        .cfg.pmu_mask = MAKE_64BIT_MASK(3, 6),
+        .num_triggers = 11,
+    ),
+
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV57,
-- 
2.43.0


