Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A5606A323
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR0KHfLo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xqifyzo/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj0p-0003od-2Q; Thu, 26 Nov 2026 18:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj0m-0003mc-Rx
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:21 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj0j-0003mg-Nh
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:20 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvnUE060366
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D7XKEWDLW+ifXRRVmGZj4PQhDJgWMVe/UWJ+OSD0TXw=; b=kR0KHfLoz2Hv7Af9
 67j9D43sGxyaBFd2Py2PoF4fkGrQNsvwn96aJ4dioNdzjRiwimEHAkwltsEY68SU
 E0PTE1UuTTcQrnyOETehcCeHuWZf6mRflPGlIvw00QReKBgdrrVmofaR2JoE9XFu
 sJyjiustPs2zbqiL8ly4ehBi0na9R8Fatb+JYsS+qxOcnBm/MGkUN9wy3/tCJMXE
 f14zMvLw0qQ7SR5OriWDPfBN/2hcrqfqi99BOH9iFtdK2M+sFvc7iitClYcHtHSq
 MGjLy+QV5iiyBkyG1A9lWz1a6/jiY9Qws/tkKFdRhYK0cJEx4DvRARkqVqQo8a8Q
 YVVdDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hrfxu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9493e89d4f9so1018089285a.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736175; x=1796340975; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D7XKEWDLW+ifXRRVmGZj4PQhDJgWMVe/UWJ+OSD0TXw=;
 b=Xqifyzo/GOdUR0wdMM6YOR5xUfA2RazP52gQ7Rog8q84ZUZsMK09wgoWu/9doyRAgP
 eHPD8eul3aMvJB4J2z8Gu364xPvrohuMqNUbFt6wuiOaVNwRpLlocIQTCuK0APW2oZpG
 Q8omoXONLL5ZFeWzD8LScQ9vmVnVp7YWXlVRsQbf3VhVRTsxRoXjdJcN6oxH+Lh/TXdO
 xE6WpYAdvItPfceC62kyawnoCGsZKr9obDi0Mw5khC+i+A2K25K2LVHa9LZlWyKcq9o5
 KWh+3cEh5SB9J9VUo6gZVZP/VIqhaMwl5UAPUoaPsxEeMek55DJ3afiA6dOJFcAg2WGk
 YvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736175; x=1796340975;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D7XKEWDLW+ifXRRVmGZj4PQhDJgWMVe/UWJ+OSD0TXw=;
 b=ShxKNvgHwix8BG/S/lTusCYS65cz94+XQlFWDDYVrTMrT7q7/17JdQ0Ttc9Ylk9VUe
 IGAsTtjaD2iAOfa1D8Hx0pBgLg4pvcfL7VMy3uct+FufkfVJsRpCszCzq6uNvHHHT5R7
 92RtKpzmHdKk/TRGlNsVMePXr59HdLId3xUxuw2NOKYW5EiNEmT2rMVHUN4va5eIG9nP
 ei1pN3Vtgjr1YzIjLQ0xuZ2Cm2bz8hv82RIREJbxuHUERk5zRPhPDAhwASQh2/LF2pQO
 MmJMIF+pXXTrz/ObSuh+KLAK3XgXUSbRIZRUZejPpBLCW4ybxsNMfuWJBG1rMvD/3XO1
 W7mA==
X-Forwarded-Encrypted: i=1;
 AL+hErEVnxsIKBVAu7XnSG0cC6G8+PfTxn/RMDKbcVUfS/F7LzPtVD38eihQzw3RzNRQ66kRYIbhxCC0gcFy@nongnu.org
X-Gm-Message-State: APuU4Z+awCJk/UpEZpEQKl08fnV58Z+7MIyxlWDwdIz98BsxlLSrbcf4
 P+ppMXHZyF2f4YMlccD3DGX8ElYoki1slVJ9xmHBb7Hzrivq92xMSNJi1zqyTj5/QypF90asB+t
 4pjWL+wxjOUoTx102u3vHGtylZp6SHuBXJlzcAWuhn7dFcVXS2GDySvoTUA==
X-Gm-Gg: AZFdTZfIm+0aLMqGiJfkuvQK1m+9zndN5z4arVg9BWGQGdlPJsR/eNmIBhm7nt/ZBQA
 vDP4essxkXTpAJvWG9ChIrSDLQhk7cwZWc3b8W1+J0QVs2ZlwgwtqAK+T0REsIQIhBNJlNQHMja
 iBIkwjg0wd+Hx1UXBSnmz+uQkv0So855toUuMBcPMAjqbNnUw5gECUVH8wwc8B6yx7OxiPpFfLn
 g7sJIeIGpQ2AL7M6V9sIt6kKj5a5cDeDCuedphR30yqAs0zafBF0qBms/e9a7s5e1BTpxcycvxc
 vm+0xcT+IKxmcfFzsg3u34LutIVmMlfV6Ez8zCCvtBEewvP2shUPKHoAXKZ3qSEi5srIwXz2jCT
 ZF9q0oh+8qt0eMBMHK/r1NnZEMGnoptdC+RAkNKmcXLuRE1j1Tx1ANoNiSRo6s50NdO3wJkEVyY
 xlvyVNlj9nIKOY4A==
X-Received: by 2002:a05:620a:4453:b0:947:7691:731c with SMTP id
 af79cd13be357-949bab47e86mr3886675385a.65.1795736175095; 
 Thu, 26 Nov 2026 15:36:15 -0800 (PST)
X-Received: by 2002:a05:620a:4453:b0:947:7691:731c with SMTP id
 af79cd13be357-949bab47e86mr3886672585a.65.1795736174615; 
 Thu, 26 Nov 2026 15:36:14 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d55sm43222277f8f.5.2026.11.26.15.36.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/24] target/arm: Widen CPUARMTBFlags::flags to 64 bits
Date: Fri, 27 Nov 2026 00:35:39 +0100
Message-ID: <20261126233604.67722-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXyM1sm7M7kV0H
 dBaaTkemBjhDQJGG8F84/XDvyEETD++/+9zNqjtodKjPhaGbS7tXjE8CtzxqY1mYh4cWwiewNo/
 ni3iJAa6pxf73TeodOlTclL4rsPnj30=
X-Proofpoint-GUID: 6_-PIY_Svi8TbvE13uAYDoEJRfVZ1z0e
X-Proofpoint-ORIG-GUID: 6_-PIY_Svi8TbvE13uAYDoEJRfVZ1z0e
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b08c270 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yHur-PbuXrsg72ao36wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX+gR2GKPxPFPY
 0SOZf/L53IcOD3QlwmAnSCfAg4ghbKo45sOICiICp9/RDFu04vGuSSFgYX0r7wdLkGS5kg6tdgL
 TKMpz1cKlNxnqfUwFuG3nJ5/7aeA+//m5EWp5MLRXv1G+ACADdXejPCkJtHM5WlGmKMZwidykkb
 iEoqrNjkYMmAGm5ki40hek8jDeJgt4ctYb9sg6/jafU53XmpM6eeOWSmB1lmaOmv+Ii8v3ToEHs
 Efq1bOO75HtCbOI5z89YyDPXU53ybE0C5F+S+swlvf3EYCYK3qyhOCqnt+b0Zo64sRubOS+YwpV
 HR6GwHHGuXphZjdGOefviuOX10e2VOirSnR08Hw0Pd32HDost8aM+lDdv8142NzGJ7MKLLLtjK/
 eSlZl8Phh033KuRlh+vhGIjQojYt4mU5C15IFu5EDjBVNiXbWNjiHuFl2eC8jjBe8jbBOAvHOdV
 +fIunUx3BNVThSCfOpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the 64-bit field accessors for TBFLAG_ANY and print the value
with PRIx64. Prepare for TranslationBlock::flags becoming 64-bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpu.h        | 12 ++++++------
 target/arm/tcg/hflags.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b2f393f50184..5ee9ebf352fb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -150,7 +150,7 @@ typedef struct ARMPACKey {
 
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
-    uint32_t flags;
+    uint64_t flags;
     uint64_t flags2;
 } CPUARMTBFlags;
 
@@ -2614,12 +2614,12 @@ FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 48, 1)
 FIELD(TBFLAG_A64, MTX, 49, 2)
 
 /*
- * Helpers for using the above. Note that only the A64 accessors use
- * FIELD_DP64() and FIELD_EX64(), because in the other cases the flags
- * word either is or might be 32 bits only.
+ * Helpers for using the above. Note that only the ANY and A64 accessors
+ * use FIELD_DP64() and FIELD_EX64(), because the A32, M32 and AM32
+ * fields all fit in 32 bits.
  */
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
-    ((DST).flags = FIELD_DP32((DST).flags, TBFLAG_ANY, WHICH, VAL))
+    ((DST).flags = FIELD_DP64((DST).flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
     ((DST).flags2 = FIELD_DP64((DST).flags2, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
@@ -2629,7 +2629,7 @@ FIELD(TBFLAG_A64, MTX, 49, 2)
 #define DP_TBFLAG_AM32(DST, WHICH, VAL) \
     ((DST).flags2 = FIELD_DP32((DST).flags2, TBFLAG_AM32, WHICH, VAL))
 
-#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32((IN).flags, TBFLAG_ANY, WHICH)
+#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX64((IN).flags, TBFLAG_ANY, WHICH)
 #define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX64((IN).flags2, TBFLAG_A64, WHICH)
 #define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32((IN).flags2, TBFLAG_A32, WHICH)
 #define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32((IN).flags2, TBFLAG_M32, WHICH)
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index c0b47f484e65..7dbc5759d718 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -753,8 +753,8 @@ static void assert_hflags_rebuild_correctly(CPUARMState *env)
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
         fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x%016" PRIx64 ")"
-                        " rebuilt:(0x%08x,0x%016" PRIx64 ")\n",
+                        "(current:(0x%016" PRIx64 ",0x%016" PRIx64 ")"
+                        " rebuilt:(0x%016" PRIx64 ",0x%016" PRIx64 ")\n",
                 c.flags, c.flags2, r.flags, r.flags2);
         abort();
     }
-- 
2.55.0


