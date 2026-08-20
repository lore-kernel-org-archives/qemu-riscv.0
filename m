Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04E9C5DF82
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 10:49:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0Jl-0000OX-5R; Thu, 20 Aug 2026 06:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Jj-0000FO-R1
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:48:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Ji-0005lj-2g
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:48:15 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA2hwx2932649
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sy4vN/OTGBwXa0UO3cJvv7KQZLmMlNbXWMIg5UlIao0=; b=aznFfAC5gKt/Npt9
 FJzr7TkG0dTSyTJnsVclEmXrnZ030foF3v0h9kw9KULnDBHW5kLbdvyfMp7bt+lz
 CpTAA0bYy9tVM1qWW1RGOrvLw2bjfg0hN8UF+B2kwp0vfOy0sMlhn3K4w7wyQVlR
 kySAW0DvF8Js8AaekVdGy+KiIJk6RlWmUhsNs5ncSXMcrB+Bt3LzvN0B08s3twoI
 ZrQ1loHAqYCcDv3ruxJGrUpHV9hDog8de9Zr/utdNtxEJVYsixoApCkQVOLOE1L0
 2ioVfwBmFeYSIsuoK6pTct7loGQxrwJhbqQlXY0ySjz/sCKCNlO/uo1wx1cPQnFL
 vM0s4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g5wj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:48:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so271744385a.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222882; x=1787827682; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sy4vN/OTGBwXa0UO3cJvv7KQZLmMlNbXWMIg5UlIao0=;
 b=iSc/OVX8dtU3BVTvTgjea6MMMJJJLfY3KCOvXQBwiJ9bp8iM7bIug6855rUNc13ILr
 Zf+h/a1CiW2QLchWchQCDvYOGHyxBkX5cmV327qsFSnyAYUMrhfwI0tDQZcicSPFbKSC
 usT2mFmBzpTlswpSLcKWcfgMm0frE/wLoMT31eFO55B4KgkLUMBJRECw0nhdKSyU3+BR
 4qGpWRO68ey8oOsczSdMHWuQXdyGo73k0FN8ck3gFZRMLeqyL/XkyeRffLB958urCxVB
 zjcSpurOGueRdR3JgYbEaZS6fML34PDQq9CHOtxnkyNLGkKakyaYLZZhVgdPeu07i6I8
 viqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222882; x=1787827682;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sy4vN/OTGBwXa0UO3cJvv7KQZLmMlNbXWMIg5UlIao0=;
 b=h2PUErC5PS/zfjMKuyBxZ9qS0Hht760EiC1XCv3YKPIyW+1Xtr3OzRbp85l0L9WA+0
 Pyy0EdhqKN/BAmJmj/Xld+M2IAPNS7ZqCk9k9qmuEsFaQPhVbjGhXRLGWZj/YlSV8NGs
 JdpIAaHNoqBNr8XG0Z41VMO1rmxuTK03BvBxHJYk4gyE6cgR3CU3sSNqrglkb8k6QLns
 aiwI4EzV0kDquN0nQ+4L7YHHSazmuQEYJiq5MWp8618tt164DxwAMA6vdQHTXSh/bozS
 8qP9zVxXy6W96fiH3sgP913pLc/ypSII7ouk/W8V6zmmS09eujbhj3y2izVJgwtoGxv3
 sVIg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4sO6e2dwZdL/4esW9miQcI00wkKSo3oVne8yKBqLLMW0kMbmCFp/iygmdSgWQB1h3H3SW3jXmL+Bz@nongnu.org
X-Gm-Message-State: AOJu0YwmFT7GAsp3vxY8FyR9usnmql3KISK7S9fWGpGrdG2umJxi/ARt
 0LCCITG9sUZdXOr+736rEVEkGXa3wiOdUq61bUQuTt29IH6LgSnBMK7ROSA1Kju3PqRA2jWze7E
 XMo8e2oWxbshahleascxgjb/wKkz6k+crRmf+JW7YCZsPcgFsFy4b0Jd+8w==
X-Gm-Gg: AR+sD11ikgWbcznAkt2KPve6GLK5W5hkqwQcmhNwVZQQ1hYCKTgwsmLp5FHVWyn8+ZQ
 Kd3UbI0rGBKCagp8mbp93jG+OyRlHmxPSkKFr1CdDAe0TFbLv96tLwvFBYdMECQUK7p976r6v/E
 IbHNgGmqYP1WYsFbYMMijKPyzUCfs3QI3N8mPT0cuQh7PEKTvBdIgGXU2UiC0Se6U7eX2KTENWo
 F7PRUF5SOlCOp+I9jYpW7TY9K2tvOCKUJCYX45V8NSo2K3Xc52I7BWPxlobSNi7gDad2W4yLc+w
 vSkdYnkwwGgY5wNakJYIXRlaOfJyT4a5TzlwfFfjECONRHVWG5u5PXnNtmeod7fCcCRz9/vYrtW
 93xdZCt+g4G0b1IIkXjmoLhV6pN5FXHImKFLAVG3Jkw==
X-Received: by 2002:a05:620a:25d3:b0:937:1538:6b93 with SMTP id
 af79cd13be357-9371e6f0580mr985527685a.40.1787222882545; 
 Thu, 20 Aug 2026 03:48:02 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:937:1538:6b93 with SMTP id
 af79cd13be357-9371e6f0580mr985524285a.40.1787222882046; 
 Thu, 20 Aug 2026 03:48:02 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14cf0a3sm11807807f8f.32.2026.08.20.03.48.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:48:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 04/13] target/mips: Constify CPUMIPSState for various cpu_*()
 getters
Date: Thu, 20 Aug 2026 12:47:20 +0200
Message-ID: <20260820104730.25462-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Lk_XLfLAlCyO1Asux746cBpOUbAvXKB1
X-Proofpoint-ORIG-GUID: Lk_XLfLAlCyO1Asux746cBpOUbAvXKB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX+CeBlH9098IE
 Y4ciqrhzJtry40XKldRUhiBwqCXIgi5Bd+AsscM388wDjob8ieuPC4b3022oJudSQYYc6ZVhyj7
 15gDocOzRzobPIeDZDV6IzKIC5ES/JcMrOXjXeWbWbGnXfJYNzONSUS+64KPeRj014NxFgTk4dD
 27P1MaCrY9YpjH1rXvZkHc7GRIKczST51FAZvucIuM5+Ih/6wZsY+tfr74mmPK1UeVRAxMJunRX
 sRk7exMhRhHdyQvyJG0HB8V8C5jYUdlELuG5Uio37QqvUDl/MvQuZ66jvzYnNMNntluh2vD77hE
 gJPPBJZ78hps3xm8urhHn6LZV8PUuBpXurYO6ABBChNFsQkxxABVd0K1mcGyckvaKhGs2qTIgM0
 wUS+5NYSfEWGcXwohyMkpJFcMwwCUoIxhkBXWA/Z/9VUpgiXgRsVdm0Q5U3rcLQH2ACzayL5eqa
 C/MRSwaI1eYqYTpelTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX9ph9Sl5Zki3F
 cefOxd4FMjVpYJJkEpHp8GgcMlCknrqVgdhkg/Dkh2szK3AG3b02K5pgjbRURQfMhhBMgKD4hqb
 jJQwODgLI2jGUE5eESZwgtPLccA8Vy4=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86db63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OdUTIDwS7iTBxe5GiEQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
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

Add the const qualifier to CPUMIPSState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/mips/cpu.h      | 6 +++---
 target/mips/internal.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

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
index c5c286872eb..66e8c599b43 100644
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
@@ -281,7 +281,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
     return active;
 }
 
-static inline int mips_vp_active(CPUMIPSState *env)
+static inline int mips_vp_active(const CPUMIPSState *env)
 {
     CPUState *cs;
 
-- 
2.53.0


