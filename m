Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEECC79FB6
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 21:08:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4PWi-0000xw-9F; Wed, 09 Sep 2026 17:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWg-0000xN-JA
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4PWe-0000WQ-6q
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 17:08:13 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JIE7H2896364
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 21:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=S1lXxqviL5/
 yxkT8bRuVehG/I464kIAL8gID/sBy0xc=; b=epg+rKeuj1VVd2W/I8UNGMsg4P1
 cVCbLLKMP1cDX45IBsWN4YmmOhzY/t0wcU+PqOaavhn11kbaGko5/L3a5PCsuXE/
 HRMaItuOaH/gipPdhpX59k3RUUnA3ap0zguCovgGcjNSav36xfDJofBBy8mgt3Ai
 Iygtf8x5Gabt0Smm24E9Pid+EbUJmEsl58IU6be4aPm89PXOVvPgBsK6IlVaOjL8
 0YtWL0XbkLcSDQ1mdF3VBQLOoBvMxysEycjgLQdhcgpbxVRmAjj4WXeObcksvw8d
 3MWnOng7v3DNv1GOgW3v+QqIOcwgaPdQR482duj1fawpKbKAvElAs4lA7GQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygrjv7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 21:08:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91049eac948so63727206d6.1
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788988090; x=1789592890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S1lXxqviL5/yxkT8bRuVehG/I464kIAL8gID/sBy0xc=;
 b=j8DpMMclukC6aqKPk+WQCL8Rix0kclskmD1IMMUibE1OMNIemFsxaeXybeCKOilQqz
 mofnvXJqXvbz4sezj52hWY1y6BaHMzRCDHd3Bc0tlnwM48nsdu6LUsUpSM2Yt2CMw7Ov
 YI1wjCtRsg0RoQbP8cv/88PjQHlyn7gcj8bEdb1y4lLEfV2NJwXMgLa3wx/ZPX3kLOBf
 oGevtaevlY4InP4dcG8ohk6D6l8XDWwBPF9Vh5vyUsoOU0pd19KADIm26RuD1oDQgbIN
 9S/0tlMDo2Cwu3w9sWTtSmpEfRcs6Xj8QeiJECyqK9rO4BglLg3lcOemBarRtGZQTJka
 kBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788988090; x=1789592890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=S1lXxqviL5/yxkT8bRuVehG/I464kIAL8gID/sBy0xc=;
 b=Md+xGUB+Qx+Vs4btPch8QyEONkKT4aIKl7riYM6F3/QR9vbfAXdGUHR317LtYlfNfk
 J/AxzIO1FiRCXvqp+rtzQIHVDaqs7jAM9cuBXi7JCQn/X1GQBrt/865+/KzRY01esRXQ
 9q8R5L2NCH8iGpzskJey2WcYrcqI3FC+Fq9ljuGn4qgDGaN+yAj7ScRywJSE9WQ4xkQi
 PKHAoZOMPY+kHlR87r79e5c2xFenkElpVyhkjMWMiuwDDfXlmw0J6LZhSNHnRhkLPJ3+
 LA2dhoMlGBjbufM0bhwvkQRPC2n3b8Q5J4BJhzHUvOkF5x4dfi5rIDVkRcPUY4OQHyHM
 ZACA==
X-Gm-Message-State: AFuF++nzLIMW9SbShG2Tif0P/sU9BL7uWdPTyIUoz9cnA0tAtBAgTdvB
 utVY05zu2J6K+KtBqnteAkZzmZOJzyKngS5KcmkDd+G21RThELgZnUW9NrMeiYgbC54uR5wa2P0
 W32atoV9E7LLtO9OS/ZRmXYhoAwB8t4u25USDSkAPx3OkncqJyEu4rtzkUA==
X-Gm-Gg: AYBFou2yIzg3ColjxhcXI5QKB4I6RTFkB1+jvu1xvKOjSsSiFt/1+BuYXFbOfCiIY64
 mpSg5Ea4ENJm5PngdH+SZLGxKjkDPxwyT1NzWMlV2NPnXZKHmR5UzsrGeAMAwihwXwcO8ox/L3U
 C55GiYvamWnum2uwTIHSRVu6QWRsC3JbxvlCxoUkA95RromSQRA4XNbEzGUeCip3yUUTc4xDpP7
 3CqTbRsZjZ5E6CruJ4DKKD853Iu+gquWEhjnOD0V31reicg0VKumksTk65gTA31QJmpr829bx+z
 xP3FeI/W278zxcsNGMlxY0+/3J8Z4P1lbrx24BEv0eHPnkyv/mWkCkMlnL+Lmo2p2vwD5OuIIfX
 WSyNPRFRCHIr+DExEyCb6BC77TjaoC3f9EXBq
X-Received: by 2002:a05:6214:d88:b0:910:6f9c:5b8 with SMTP id
 6a1803df08f44-9106f9c072emr67009306d6.9.1788988089492; 
 Wed, 09 Sep 2026 14:08:09 -0700 (PDT)
X-Received: by 2002:a05:6214:d88:b0:910:6f9c:5b8 with SMTP id
 6a1803df08f44-9106f9c072emr67008836d6.9.1788988089032; 
 Wed, 09 Sep 2026 14:08:09 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040646d59sm151811336d6.8.2026.09.09.14.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 14:08:07 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Icenowy Zheng <uwu@icenowy.me>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v11 2/5] target/riscv: add riscv-server-ref CPU
Date: Wed,  9 Sep 2026 18:07:52 -0300
Message-ID: <20260909210756.1767711-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX96Rwy9TeIhzC
 z7MGwFUB+NDptyeF7/+oJySIUL5aa9yLnj0WOtnIydsuE4EYcMLT981PwRVtuOKubTOVopsKeZ/
 oVgj5XvpDBI4XLZNCOTNm97Jku6oM9T11eCJfim7LzI6UVnL92vhWHhSSNA1qZdmVp67WywF1C0
 16wpopvMtH6wGJ3MU5qi3yCkd4zXVHvVR5T3FoXkw7yQjpgNXz7+E6jXVdnXQZVoh7aAo2Q6vIA
 fAiQTuNd357Blp9K2N6G454WT1mkWRi+LcsxfcYUSbj0NrVZlJLUTNfCaRjyJ+CsZCRwZf+1usI
 FMuEutoMnMV1I7cnnPU3S61juQ6ev932yDa/ivfywQIaoRaT5oLIkeUyjRLiqtI6UCAckT+e7S3
 0KlRytZ9DLn3nMhBciApb8MB4mnDezLlEH/bl9HCbjTqm8GtsUtMToeRF8LWTPBNFXLB/10vQws
 xNNalIjQXUtbmD2rJRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfX6SdIEFKINiaM
 ebdFRqO82HAWV/UxAczdPKa9jVXpFyG4gNZ1gwINiYLfcx1cpY5bHBRnGX1N1ixyCe0NBijsjHP
 lgzgCXsqxVYkb6B6fAyCz+hpMyo6cVU=
X-Proofpoint-ORIG-GUID: leGVBPpa1e-kuIjZpgZg7Ts1Jld8HGO3
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa1caba cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=V1jnuoLLAAAA:20
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8 a=FRSEYCzRAAAA:8
 a=zLUtPzHEVTZWnbMtJKMA:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=xVlTc564ipvMDusKsbsT:22
 a=1qLaeP4TCVy2vqIEy19U:22 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: leGVBPpa1e-kuIjZpgZg7Ts1Jld8HGO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090236
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
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

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
index 773aeba8da..0b0b8e0a99 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2424,11 +2424,36 @@ static RISCVCPUProfile RVA23S64 = {
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
+    .ext_offsets = {
+        CPU_CFG_OFFSET(ext_zkr),
+        CPU_CFG_OFFSET(ext_sdext),
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
 
@@ -3766,6 +3791,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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


