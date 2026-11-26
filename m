Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C554606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SW5xHuun;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BL13qPnS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWhuV-0007q1-Pg; Thu, 26 Nov 2026 17:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWhuT-0007oL-Pz
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 17:25:45 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWhuR-0003of-HA
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 17:25:45 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwM7w161752
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 22:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FoIoiGPuSPe26i9fdJVUr8xYE/el7775Tv/MdM2Txac=; b=SW5xHuunz7uRtcbq
 WfpV2vxH86flk5mhioJslzOD47BJr6TjaIQmugUJnoaUUlnCXfbu7gh4cvwIhn02
 fjS0qYKN4pbwBfweIspX/U1WpHl1TNeAPWk6yyRAIdb0Ww4AVgsLCLXAt+uibFmU
 KbzJvGkvGv5JIRdIKth9rUjOB/7vIq+dmIHyEaan2yIWwYCeY64EETVGrHfq0929
 yRoEvhuovfDrn1lHti9DBgLRcNWYxoxAL1QtYN2Ii24t1wsVuDiuSxn9uzx8qCbf
 wY03uFlKVd+40Z9AZOV+XHGRMbnDHhykRI3JrXjC8EG0UpM6Ji1SBzUADjPRgWlX
 Hxdtkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7gamvd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 22:25:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so1404573485a.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 14:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795731941; x=1796336741; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FoIoiGPuSPe26i9fdJVUr8xYE/el7775Tv/MdM2Txac=;
 b=BL13qPnSBroaxCNkg4SxWTIpUMEzGMtBxUAOLh9ssICuEwyu00raJjlrV6K0GYnCWT
 PKOLtn/LqN4gnym73U4CU9QJObCOBSNdCr2WItE3q/dl6LpgY4R279MN41WcF+nE8+cS
 hhBtlbRUQDNYH+6USPqSs8RVFifHlVAaaSMmBJVQy91o+ol63OIgTFqhRJQn4L6vwRhD
 odxP1ATlKCAzWfz/xLaoDT6DiSmnJqFjRkFSj1in9f/wHvQbwe7MYdS9BdfqGVW8lRLU
 SMLZCI2RuFKAZ7Pw4/t83pFgfQhqQ3LdEa6Ec5A82JXWipMLGXv1Js2dCyzp9DNL1xyd
 F/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795731941; x=1796336741;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FoIoiGPuSPe26i9fdJVUr8xYE/el7775Tv/MdM2Txac=;
 b=s0UVEgsopdBKMuBqhT5U13M25YXxUupsSZgtrW6ijVMcHralkFH70sJ653kX6cVBom
 jl0SvNg8zj3KmcKMCtk/dCITcVlooTDm5H6gH88sCpUloNimPyDf+Ksh2g9TSHl6CCtx
 Hk8qR+mkil6Cd0/gG03VQXZAJMepp4/i/le/OwKjjJ1Md3Z1IZbbY4pxf0MAXhRaJQ0t
 GD9Wieew//jfLSQHJmThJuqar6bj3y6tCDWyFMS58aJC1CtMXLm1eOyqCUANK/7vCexd
 Ir4IDjlX8T/OS5TC/s/7eSYh0pm/skFSxD1kCSK4DDcHkCHV6lErJZrv5I5xAuaA+KYJ
 cdSg==
X-Forwarded-Encrypted: i=1;
 AL+hErE1QfhJ5T0wtQvUZHW7lS6HEroCQyIUtnOTZ60K1+AyilHTix+CmheENk2J/Zg/ISuqCbYQ06Kq6TdH@nongnu.org
X-Gm-Message-State: APuU4Z90tFKQzXoyO1yChQima7L+iZHH35g6fA+3xCfIZ+2xWf8GOX1t
 K11ctngAeE9a9nWHAyLnNNXD1L6qFMw0smNJmwERjtSpq6bdLvJXP0qcMy942DyzJPl67OHrP5L
 NNAhcy1zSj6r103ChLlm6GXFMzik+ci2A9kgN1tmxUV733cE0XmKSEBHLGQ==
X-Gm-Gg: AZFdTZdsqXttKxsEjbmBx7jp+ZgbfO0v67t/p+fC4inuNHqX//KfQ/Sn4FpjH7aWOVP
 mQtH4L9nwcR36ediBLbJLbZJJB2ms6hzF9JtuQcGd5AY8G9zzfHfDuSboNMVrE3azab+NE8QCtO
 MVKXnF9D7jJuPwPVlMlUF/YUnc1u0JEEcI1uXfojTIY5Li5OldEuuyJvI8FHlXlsFruQOZ/gyYF
 OAt8Q7CbW2JZSCuBBZHoS25psT4hOoutFdwO4bPLBGchBAWP0uz810qX6yNFSU10MROLHeDjF9b
 ljU1wpYhHPiF6g0pUjF3XuxmL/3vvvMMGQT9Ec38A/vxHHlj2iSFjgtOLkh/3UceFddxW88EVBV
 HeLgp+ljopv1Cjsyqj8DvaXCbE9No9oeUSz+ydJ1DZ4vUr/JRnOcZg67bwTWwKdkdUU8GpPR78l
 Jt3gnjTgo8+rZY5w==
X-Received: by 2002:a05:620a:4491:b0:939:a0f3:6aef with SMTP id
 af79cd13be357-949ba95e8e4mr4002752485a.23.1795731941542; 
 Thu, 26 Nov 2026 14:25:41 -0800 (PST)
X-Received: by 2002:a05:620a:4491:b0:939:a0f3:6aef with SMTP id
 af79cd13be357-949ba95e8e4mr4002748685a.23.1795731941085; 
 Thu, 26 Nov 2026 14:25:41 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b10b1ebsm44425705f8f.33.2026.11.26.14.25.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 14:25:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, TANG Tiancheng <lyndra@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 1/3] accel/tcg: Factor icount_running_cpu() out
Date: Thu, 26 Nov 2026 23:25:28 +0100
Message-ID: <20261126222530.62175-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126222530.62175-1-philmd@oss.qualcomm.com>
References: <20261126222530.62175-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eXo8cscFR-jCQy6KmhSssGy3XUU2galJ
X-Proofpoint-GUID: eXo8cscFR-jCQy6KmhSssGy3XUU2galJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4OCBTYWx0ZWRfXy/FYmD9XViVo
 HWXPK7DdrC8AdN1nhj3sP8JVesreS21SjRFyYFte1AGYsCFrhS1LTKUR9DS5vXGZsx1eF9LdOum
 ufIcXyEnzE/2RR4nCKmudKmD2oNvEiwz1vlf6Z2uFCFNQXt0G+2U1+LxTTy1Nhk6Qy3/+CsLd+q
 A8hQzd2mmu7Pa0mxYVpppQKYknK8SDL9f+57+Bi4TFJWe+4un1FmZO+8/3ms3XnWBo1EQvjJkVE
 LwLq4eq1hhRKIH0rmdNjnrQ6ukKp/SqGO53j3SrQJ+PPtTwJNXb1U9DO/q4fwOpOy09TMSOSKgu
 URz5bg4URsaSwtN6w4+jqlgK6kdkUvlpfCjxKVimkX4tpMM5+rzK/OIq7rcNq67do2x27fYLrBQ
 TT2oovda6VxauWXtjNp7xEWQdgNB8diYbVk7ojCsZxk/ZPfR4D5cgIXXEja854puvWEuJQ+ZIXp
 ZinmgqOXtIgfNIiNRZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4OCBTYWx0ZWRfXw2bV3SlWkVTy
 ofIrUvmWuffqaDGRmWH5j12wtiQQeNEjev323lA3//DsnVNK0gLesGrYHtczbCZ/iiorP1+0eC2
 N7eCc+Kb9VgPfgB1cwntSs63LLjLJZo=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08b1e6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=f-NT7oDAcE9xrb1U978A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extract the running vCPU check from icount_get_raw_locked(),
to reuse it in a following commit.

No functional change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/tcg/icount-common.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index b1b6c005fe71..a11f2397489b 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -104,15 +104,26 @@ void icount_update(CPUState *cpu)
                          &timers_state.vm_clock_lock);
 }
 
-static int64_t icount_get_raw_locked(void)
+/* Return the running vCPU of this thread, if any, checking it may do I/O */
+static CPUState *icount_running_cpu(void)
 {
     CPUState *cpu = current_cpu;
 
-    if (cpu && cpu->running) {
-        if (!cpu->neg.can_do_io) {
-            error_report("Bad icount read");
-            exit(1);
-        }
+    if (!cpu || !cpu->running) {
+        return NULL;
+    }
+    if (!cpu->neg.can_do_io) {
+        error_report("Bad icount read");
+        exit(1);
+    }
+    return cpu;
+}
+
+static int64_t icount_get_raw_locked(void)
+{
+    CPUState *cpu = icount_running_cpu();
+
+    if (cpu) {
         /* Take into account what has run */
         icount_update_locked(cpu);
     }
-- 
2.55.0


