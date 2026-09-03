Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D409C61DD3
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 18:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2CDw-000183-5O; Thu, 03 Sep 2026 14:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2CDu-00017T-GN
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 14:31:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2CDs-0001bU-3k
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 14:31:42 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 683G3AMO2088822
 for <qemu-riscv@nongnu.org>; Thu, 3 Sep 2026 18:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mKHlv7O60QF
 kPN7XH622NOuqoTsgivr4tr+IWmeazZc=; b=prDNF1oWOQIIcwl1CIkzYvXKE42
 nqEeFhxyqzl7Ig8QtB7duz+iWo8+IazMZhDTaYBGXv8Z2t/lwZRu19F4e5UwNNMp
 yWL4dRD9K4kbn1lkEPVDpmVu7f6tuSdgw8jdbZ5cqz+UKnK93wWg44Jf+VeDWdHr
 UE4HaQ5gkn6L76T50Od4blEILYM2jgyXCtsjus+6UcVek2qNETvkhplwqvYPOJbJ
 HtBc4Om5e0imyOb4V8XA8Fw3VxRk/twPSCg6JbvdwED2lF+YwG2LNgcu/KV57tIM
 JZQYoool94vWiOT3+FAZQe9FjgYRKunkUnaEdMihS0Rf1r79glOZSiXaMaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b19mu3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 18:31:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90e98e74535so3029856d6.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 11:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788460297; x=1789065097; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mKHlv7O60QFkPN7XH622NOuqoTsgivr4tr+IWmeazZc=;
 b=LTA3gLIcxXCypU8Uo9PiqRvBaB3rQMGVriE818Gsot8RzF5aq8WZlhqUub3kSb4Oju
 ezWOjqZ7P/JvQtflbEsAJ5Q+pVNAKOgoAGtSm3//jR7hLFTICUsBMjAFg6Sui57AkgU+
 SIo9/52Dmd6bT4dlDEzDXNu09QIUC0VEQJxZ2gvWMhHijT4ccLbg51QmXOTMcYLXvVdi
 ijCsCE+A5Mrgs1BsxpUvPxAvrswcJm5UfZKe8d/XVgsYu5jkiFnepQ9Dg8BNrcrZhkzP
 eqXal/vNAo2iRF4i813IrgOKYZ9X6FqS49sAlI8SqyZAuXOx6V2dWa/gHMORqAPa8R/+
 s3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788460297; x=1789065097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mKHlv7O60QFkPN7XH622NOuqoTsgivr4tr+IWmeazZc=;
 b=lveKBCEvRxvOTATiE6iQNhmCJ8s6394WSGB1Hlzcqi+B1hbE6/g68UYHvd7hTLrhpT
 ULTnZDKl5ThuRWKRbih9U6UcVmi7tgV18ifoM+Okd/6HEHU3kmUU3hFrSuZioE649ry4
 Ve8hk8qTDTTH6V0WCWfktVnqDqa+CWjA442FtUCOR40OnOMVfhLI4jdFNJHqVuM119RT
 cC/KtYqL7/3nWvheefMnIZIio8wlMzuAS21itl7TFb9egQQOunLydVnWxK7hGGE/M/dr
 EpVaV825KiEOnB3aQghny672CDYaEJ8HgGldhcpPs71k1gdybF21ndBma816MVEcKjN1
 uCnQ==
X-Gm-Message-State: AFuF++mKkUD4nil+RYrsHPePuL6WViX0vGbArUZakpclolX0AG3RMAjR
 luK5HA7QC4Y8Cc+PvWnJYuonry6SxX9/cXJqYZXaMRTtAx8L5o2cyvkUf0/VKzKYi4tMApv8aMx
 Hh7eOJ24LD281xbZuioqLeO8EPVq8WuJefOadJpD3igHbJIdIRcu0lfLaMg==
X-Gm-Gg: AYBFou0Ht5gacXX6/EXriD0qEjdMfb6J9YNFp2a180Oecr9mvrcAHAs31fG/7MkiMWv
 W8hbl5E5DAQK/b7GT+KQZUAnWpRdxdJo0CvccBaL6iIac6awvSVrNovcmrAAK/WQxbGZmqymCql
 u3BuYKCX4FKO8blUB7Qcsep5nbFaq5eDFCxQTlJTtlbiH8S3pibcNq/AaBf2nsLiMOf67sATw6q
 YVWspBsC9M54XAbzndSM8SH+3J08nFlUGJZco+PGc2KdyauyNzu8uzDKZtAA80Vf3BJD20C8NnA
 IYp4mnPD4JXdGMvsAcCMUei+peyUITrzWYz/oJb6Cc7PDSjXyJXOSCwYAM5PTEAmX4B/1m362qQ
 wXGmRQH3TnvBX3RiUdR8e12pqRNbhU9jVjdAY
X-Received: by 2002:ad4:5dcd:0:b0:910:4080:dc4f with SMTP id
 6a1803df08f44-9104080f964mr209886d6.4.1788460297183; 
 Thu, 03 Sep 2026 11:31:37 -0700 (PDT)
X-Received: by 2002:ad4:5dcd:0:b0:910:4080:dc4f with SMTP id
 6a1803df08f44-9104080f964mr208646d6.4.1788460296396; 
 Thu, 03 Sep 2026 11:31:36 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91040693aaasm603596d6.34.2026.09.03.11.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 11:31:35 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Icenowy Zheng <uwu@icenowy.me>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 2/5] target/riscv: add riscv-server-ref CPU
Date: Thu,  3 Sep 2026 15:31:22 -0300
Message-ID: <20260903183125.682865-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903183125.682865-1-daniel.barboza@oss.qualcomm.com>
References: <20260903183125.682865-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: onCKmGA62-Xk_Mi2qHWaVKQ0YrV_bqBv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2MiBTYWx0ZWRfX/t0WWKL/0DVZ
 8/pSkiOuSumuD8HGHMMqv8NZL0uGEXohoNm3t7QZZy/dGCKsYmQ3C/zoAXAu+eCBmsXo0ibndlh
 NWa1lpZm6rJkaCwXSFsn/VCZdnnH4As=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2MiBTYWx0ZWRfX+hXU/O8IFM/N
 sYDIRzYQ3O4/NGFuZW3G2KiSuv/x8Tnw39Yt+/ErONnTyYFdwaTYxVyYasUWr0LLwhg/cPjwdYj
 kS3N7mH1vEIKFtQ9i/WZC6lRnpWR5cMk3E+kdyTYyRvt/FMv/nNQ9fBWhZyssULXnezv5resOTb
 E2078DxLF4XD0UlZASUotTWBR6bHY57hw6DbKtPh/bvXZeXtCf6l5LoD/khwcJcS8hK3+/Fiwxb
 4izZpf6HooSJWWacNkvDe2r2hXxJ2cQc6Lwuw7cwSJmeQRUp3Kle3iVNi2Za6o334TKIdc7aseL
 UMXTwynVdUYalVeldNUDTdUnmY3f2qNFx2wbROK0wLj7lNyqmt7zDHwBShm4bvMbl4P+roE9Xih
 pEOvoYlXj7HbBNkZhmNhogRAJ/fa5xRU8MBl6obszxlfmYfA0+Ia/f362Sy1zJG5tQ2RvfJIdb0
 OAPQ/zcA5lbWQ0KTIwg==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a99bd0a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=V1jnuoLLAAAA:20
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8 a=zLUtPzHEVTZWnbMtJKMA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22 a=1qLaeP4TCVy2vqIEy19U:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: onCKmGA62-Xk_Mi2qHWaVKQ0YrV_bqBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030162
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
index 4cc73de793..086bc945ba 100644
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
 
@@ -3757,6 +3781,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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


