Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77B3C5DF82
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0Ke-0002OV-Ka; Thu, 20 Aug 2026 06:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Ka-0002Dz-UY
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:49:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0KW-0005zj-MO
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:49:08 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA3FiQ3454839
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QJSF2rPYmDquPvZ6e5qTsgWad+K5wpHwQLhcT52dtMI=; b=gPOO4V5oDkQh1ky4
 UGS8tHarhC/S0EZevQrD7G7gvgc1KKA/vzZGae1FBcroF0ewh0kxc2QAjgzxR+ff
 /SW/ld9U0JNpkfFMv9YVNjWCEbUMxFTXts8sKSaa/I1efpr0JjkZqdnFsqrZswJn
 q9YYrW2fZoBktWuqQVMzMGihJPLFWmuw0+pTAqOD3CH8vOSeus0p6Krn+zAnTRb2
 5kEgYmkcpZdeQa315mQ9bgJKPT695J2QMYRKsNiJz8Tw4Ult+OQUxdJE+43i9HT9
 VcA74NLVQZ0GPdN3aK9p2Z05pfya/YmnSi/K0JW5D2SCvytomASPNnS/3dvfwLu1
 v0Z5RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg885sg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:48:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-930b571432fso90949585a.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222933; x=1787827733; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QJSF2rPYmDquPvZ6e5qTsgWad+K5wpHwQLhcT52dtMI=;
 b=jDWvBxG3X7TUOOUXrn0rATqXCrLTNfNA2XpIEQKnY+UxHQbtn6yLNXa/I1O3IFgAgj
 CC7SejcSYb/LZE2Zp6Lnk6cQZJD0UYpaavaNVXsdFPv9QaPtWMp03rtuJlUOkLTpgRrc
 ucqtB859iX719LJLXqgYiiL6+KZ5MztLiww+awnlwrw/czl57neTcBBoaomYoE9skv1R
 BzJ4UmP9J9W/ViR9G4NngT9gtv8ftF7jYxPhrr0vMcXv5iZExHq1E0nh72x3epfeXvcz
 tt0bs17XXbNlUVAtZje6t66Z6rNN+nYLKvRxHgYy+udMHcV3zpu0KM5ogb3Px1XAHdRt
 H78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222933; x=1787827733;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QJSF2rPYmDquPvZ6e5qTsgWad+K5wpHwQLhcT52dtMI=;
 b=lGRGNX/1dJDY7p0IX0CXVQ61d5E5IMHdJ35EHlp5QIV9mXnYpURDYLTDOuC366R2om
 ijRLTLYgGLJKnNPqwDcXKkDJhVl1MZ9TVPXMrDF/c5hi0OCWYvXwLTZEt3knZt04Lw3C
 A5dl3KZ/KFJO1CcqtZHQo2tRXEs/RhpkQBM4vPUwOP01uUh1lEdAYPyxnsn7GRlvGPrL
 robR1JE7Ar2rETo0kg4MEvdNbYoxLlxyROPK+wF4+kztXNySP3EeOjYvzXOacwUF6wCu
 CpcItU6lQcFPKn/rpCIllnb7CrzOw2FG23E0lvFEUTphrj9qjrV9P20P82MXR1Sbe4p3
 lsLw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTUiK8GtptK3mn11PTbw5xjWJD+9venLz8mO/uDv7IZxnYCq0P5KzYc8tKSYmxfRTyupgFdAE/dyZh@nongnu.org
X-Gm-Message-State: AOJu0YxEtMoskXTFzLlyOgFVy7whScWb5A2B++yJWqoIAKOZzwZvhopV
 zwU7cISyaWifmITzqxLx3pFwCkyPQ7GQ/Z0fZel3S4k9yk4FVa+ulCKv+5+kSTAtBgKdrFEM0aN
 K3pgxESWeJR4SuDPLimEgNqH3Zg+Oyr8csSz/2En6YH2bY+30TwieK/tyoA==
X-Gm-Gg: AR+sD10LME8vaRUTZ+LCcZul3WOExAnzTGphdmmIhfqNRtR+PFLxgIOX2JiXQyHpfAY
 PhHUhkdM/hRmPefDvNkN3LkJSM/Vio2QYKjUBCw2vxnS/lhxSJKza/YRh54Pvu4tAGKCckdYOQI
 MjVDHfVgvl3wwdgjwVpGAmLMIw/31k7Ui603fP398Z12IJqunRDn47fx43TYHHA1FY/hS2DAN33
 gvMy3u7MS7JjLo52og3eb0/SG1nLDBVHDE0Q26inykMtSXrLB/J6NH2gugnJcU2HVL9IKeXXu6Y
 jHXtc/k34qTbyxvxtdv5IYTp+j4E2zOdQWgUOYioiVaBflPK3zivIUfG95tvfAOGsG9s/uCfSMJ
 hv2+6XRezDk4s3XWYtnUCDfloOP1HbLzT/45RQUbQbw==
X-Received: by 2002:a05:620a:2995:b0:936:ef9c:8bef with SMTP id
 af79cd13be357-9372835bbf7mr524777685a.2.1787222933165; 
 Thu, 20 Aug 2026 03:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:936:ef9c:8bef with SMTP id
 af79cd13be357-9372835bbf7mr524773185a.2.1787222932678; 
 Thu, 20 Aug 2026 03:48:52 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b2af1973sm16984255e9.3.2026.08.20.03.48.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [RFC PATCH 11/13] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
Date: Thu, 20 Aug 2026 12:47:27 +0200
Message-ID: <20260820104730.25462-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXyHvPjkPBrKA4
 lZ7xfQtc8qPrYE4rEz3Kh8l/aasc1gAESSfsciDHn9JKNKUpmce69+GlYPkZPxTDjXY3j0YxAR/
 bkWSnIBiDD9Q/QA2kEg4bpo6aTqKDYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX0bH2lFHKPqrR
 z25rILgYpRtZEPNkrnO80/bXHGbXWjooltqiR+jRVKMnKlWbYwKHdyMZGHgCQSlueyX6wAOEUV7
 R8ic7Ija0QXwUo7Ey+gYV5+sBhxdF89nvVYD6m9RvoDV2cGg/W4fkFhaEzpVUbA57+VNzX3dZxb
 RVpnyF5+Ntabv+iMA96q3sPEI04zIAPXlJ3625QgfC2AH2Ubr1/TRkfrcC8ppWmvbmDjLzKyDCu
 Nk1OgwdElJ4uXw/05WcD9cEwSMFIbpE5ohxJjDVb37Aunm76Wfr7pMy/fxrZX2Mztnv6pktEFB3
 p5lwzplBJbQ1sXcFGdCp9XE0evwxWSNP4G2Jm8lQzpSy71dUOXrKYAvtZ4H7uB8Rqosj3LkG3BW
 GLJN4x3WTktG8uepEIxmYij1240QX3cMpoox5UCms/6RMxxch27ljc7y4tc75x8lHYd8xevZGcI
 6gBvtXs03/p5/dXTnAQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86db95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8cuzm4DnCyvNWT4wVyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hs0muwQMfxKYcOxFFUP_uBfFREt-Pqfy
X-Proofpoint-ORIG-GUID: hs0muwQMfxKYcOxFFUP_uBfFREt-Pqfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
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

Use the recently introduced env_archcpu_const() helper and
qualify @env as being const in hexagon_thread_is_enabled().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/hexagon/cpu.h | 2 +-
 target/hexagon/cpu.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index c50fbb3f72a..e4f120eda17 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
  * @return true if the @a thread_env hardware thread is
  * not stopped.
  */
-bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
+bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
 uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
 void hexagon_cpu_soft_reset(CPUHexagonState *env);
 #endif
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9765716b516..7ae5740899b 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-bool hexagon_thread_is_enabled(CPUHexagonState *env)
+bool hexagon_thread_is_enabled(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu = env_archcpu(env);
+    const HexagonCPU *cpu = env_archcpu_const(env);
     uint32_t modectl;
     uint32_t thread_enabled_mask;
     bool E_bit;
-- 
2.53.0


