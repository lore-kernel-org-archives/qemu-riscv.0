Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0307C79F87
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:57:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2a1X-0002xy-2X; Fri, 04 Sep 2026 15:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1V-0002xc-L7
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1T-0007jf-MN
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:29 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684HHhXB1151787
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 19:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=r/8sgL1kmjY
 vrAW1FDVUeoWzEXFnZJUmnqHjOyHtAU0=; b=FcqAkbut/4+Sh7Cue0sVknJPaTW
 krwkrgLDCdPTsziMNnF1VBN83oc8OmhmK2eM+o3omXJ8YBn4usVVwvwJ+KnPJY1M
 ucNFoSb/c55CnWKr2DBLBOdQ/ZHqPrXe7Owr4mU+G6TQCoaJjW7kYZbHRCG1Fkg1
 rTEuCrDwmmUzmaa8gH66ZhEc4KVLvcMUzZgb3K88gxcn6i1HVORWznurqZ8WsE7S
 dVvjABsW0ZuqpBVwsldM34QLa9lWC65LVK36vyg+dAcMB6OpBkEqRstS1Mxl7aQF
 xQwlLXp5utsaDak4EiSibi3U0tC8EUH3W1z06FQxJI33NcT6hc6TAARTWaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ysex1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 19:56:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-530256c61b4so26535921cf.3
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788551784; x=1789156584; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r/8sgL1kmjYvrAW1FDVUeoWzEXFnZJUmnqHjOyHtAU0=;
 b=TlmTI/Bq20ytA/fOnMgXankU0tDRgq2kXeSfckZ9EBiYiON1Eqg4TcfQOQo7srYccF
 5rYeVJrEdgJrBwkTNJprdI5OqbB0jZ56e8W5RYTEjSNao6zZkh36/U67HpAQyqOn5wsh
 VwZCl0F108JlxtnJ7R/Y5ntH3CP5ZJhVgjd7xDGd2fkO1YLbea3hkDyoIbILkYzxDNjA
 ZrK2+PLrNX8z6oe2WXpT+LWKZPis0bgJ4v8PTa+EqMCsufZc3vhBN/ckh90EgLlHBg/h
 SLy/ALFuKASQpg7U6pfn+VKzK8OKyVs4Zv7Btht/g8R+bIpHZztgXxGPnz1yal316/Nz
 9ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788551784; x=1789156584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r/8sgL1kmjYvrAW1FDVUeoWzEXFnZJUmnqHjOyHtAU0=;
 b=KpQfRZkp/2bwppJo3biu2F92KRJQF1j8F7oYlryDHu2z+Xh0DaoWJrBG4tpw8Cqfse
 x3nbGGi1tS4JPMDmanra9ID6fHR54vW8rvQyoiagpCWJx5Pu1xjBzczaY5+1zFlx5RYE
 G+7z9mz4awNZ+HXBi9eeqRhLA6c/ewq05erQdZR8SFG9eHka19UwJit0SOexBM+mqQa8
 CgYMsIDunWY9QesmsfnalVVh6pDE1K4ZGTKkrWyePWZFc/6f8kslvuYs4MZ0JHnSYJhz
 5Dy9Zwz2qgPXE+hjK6BeMMVb6zTELavQVpkAI/ffL/UcgzSLU7a4Eftih34J7eOXdmIb
 ZX3w==
X-Gm-Message-State: AFuF++mfwvierU6ZpeQaWjIM1piu9JTTIAiYl82dQs+slQTmkxYpXnJL
 A5deYu+PzoTJc+lGct/QuUSdmV1NEEawgktGbtkDIX1gKKX4RyQzLlvpOwXkWo6tELpMSjekaJW
 YMFo6k4r1H1fAA9myV4Bnsy0tsslzcwxmEMS9WzlteY4bNCK9ISzli6xqsQ==
X-Gm-Gg: AYBFou2nPpKnFdkuFrApjAGoBDtJNczAfi5NiMxt9YuGL7o9LCseskgXIWwn0mDhfKU
 CPcXa4tlQUq0LUdmbw/nMeIli+AaC5FEny5P2YuJGUCjbU99+dTESOFauKEd18MqfrEH9WX2bEt
 2Ssv3HWefvZucqzWqlBWGMewi5hqBKWJ5L9OK1g3TO81T1R9S3Xmf6KV/GCuAGFAnoSPGK7P8t3
 QLfut0uvWjQ+Dxz53yby6/pL8Nd8L3sMmh60QMmneKMnWGsF8dkAGQEGvwXLZtmDPMH1Puh0Mt7
 mODIqF3xiZ4t3Rvo1lPP56Ab+GEL60XIyzu+c/VelhDaQdiu/XFdJ9pLOQs6NQaINed+SQB2Nx9
 oOzL9YfoSZVG+jouVZV0oPXsQAsajOpGQEDF3
X-Received: by 2002:a05:622a:1cca:b0:52e:a24:ee52 with SMTP id
 d75a77b69052e-530544bf2f8mr99810711cf.0.1788551784462; 
 Fri, 04 Sep 2026 12:56:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1cca:b0:52e:a24:ee52 with SMTP id
 d75a77b69052e-530544bf2f8mr99809841cf.0.1788551783823; 
 Fri, 04 Sep 2026 12:56:23 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910406871b6sm29117736d6.32.2026.09.04.12.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 12:56:23 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Icenowy Zheng <uwu@icenowy.me>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 2/5] target/riscv: add riscv-server-ref CPU
Date: Fri,  4 Sep 2026 16:56:07 -0300
Message-ID: <20260904195610.964829-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=baFbluPB c=1 sm=1 tr=0 ts=6a9b2269 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=V1jnuoLLAAAA:20
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8 a=FRSEYCzRAAAA:8
 a=zLUtPzHEVTZWnbMtJKMA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=xVlTc564ipvMDusKsbsT:22
 a=1qLaeP4TCVy2vqIEy19U:22 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: gU9YjrI1wsVm0uahKZNKa9kYIltQPJKd
X-Proofpoint-GUID: gU9YjrI1wsVm0uahKZNKa9kYIltQPJKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfXx7S6A/ikrTpa
 T1FgpTtwefjeoZS2Mv90FFW6X/fcoxNT5dv6+qh9fjMF6BrgD6QYp8ANtMeWg0HHV6I/XTaa5Xw
 bL1RIGADbAU0O/42z+dt+zpz1njCEUMygNPrIfIJtw4WrYl4U/AMMoty3YkSK8t52s+UKmI0goA
 DNSedGhG6fIp5/TztiyNsBC2R2Z3QhlE/iKP6xwg8x8o5h+H3gq1p/LNFwKUXt8i3pPQCMT+hyx
 0ThWzglbPUXymNg+Phcls1cj2lQJBrpa1Ps5q0HIgXaAgBHq2LNhzYVo0MR/5dDatUgsTKHJw8i
 2dXi5xmh97GsLnEz7CIOTXqySxgKLWoP9z5BfmJqGIJPX2cQDPO6hngN2zq93P4Not6HKBK84aN
 i9YkLwRrqymzFbBHFSecZ/5xKZAVyEVQdBFbkbg+7a5nqXaURWs7OMENSaXhoAR7WFU6T1VEpPD
 mcjvilLGX8sk6j+01BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX+BTvqs/Q1E7/
 D+59+NpbQZhnr0S45PbsEs8+JhQjAb21bO3Py7vg0Cbi8cNAqjjMdWfMBTfbGEHxl/1pGq6i10D
 O5QPVLHhB7YJbpyp70Zuof5pyD7tfZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040182
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
triggers are needed users can set any trigger amount with:

-cpu riscv-server-ref,trigger-count=N

Note that N must be <= 128.

[1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc

Suggested-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

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
index 185474a8cf..b5a75fbc1c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2417,11 +2417,35 @@ static RISCVCPUProfile RVA23S64 = {
     }
 };
 
+/*
+ * The riscv-server-ref spec isn't a profile per se but its
+ * CPU definition can be modelled as a profile that extends
+ * RVA23, with additional things on top of it, and allowing
+ * future CPUs to derive from it via
+ * ".profile = &RVServerRef1_0;".
+ */
+static RISCVCPUProfile RVServerRef1_0 = {
+    .s_parent = &RVA23S64,
+    .name = "rvserver-ref-1.0",
+    .satp_mode = VM_1_10_SV48,
+    .ext_offsets = {
+        CPU_CFG_OFFSET(ext_zkr),
+        CPU_CFG_OFFSET(ext_sdtrig),
+        CPU_CFG_OFFSET(ext_ssaia),
+        CPU_CFG_OFFSET(ext_ssccfg),
+        /* ssstrict is always enabled for PRIV_VER_1_12 */
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
 
@@ -3759,6 +3783,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #endif
     ),
 
+    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
+        .profile = &RVServerRef1_0,
+        .misa_mxl_max = MXL_RV64,
+        .cfg.max_satp_mode = VM_1_10_SV57,
+        .num_triggers = 11,
+    ),
+
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV57,
-- 
2.43.0


