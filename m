Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B198C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMqm-0005lR-ST; Fri, 21 Aug 2026 06:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMql-0005gX-4Q
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:51:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqi-0003kk-Kj
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:51:50 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9Lmhj2539631
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=NX5SNCYfLCCIeXfR
 kT5m/LvpiJoTFUH7Yc0A5CV+QO+VWhgPAEOOmmOppIkyoLZpLBVHP/aGfnkppQKP
 RDF1AYgSkQHqzlAZh4l7fT9vpx99ubFZfGkRZuNrYPGWwzjYY4axRxMiBKK5ukXT
 pX70lCVHV4lmVcIJzpaJs3emslXvd2JKpB11uYh4t3tCTYgIrmKAlJDKIuKclmkM
 n6Qg0Qe7OQqZxoUNMUWjjd8h2lQM1WqMcNgtqJEB5RMTCW0DWY4EwWdjNVNFnwPA
 Yitgd4E0eNGcERyepNE6JiAGxLxSjgl+fLZ7AzQ55Ylc+HGSc6Zt3kUDrVZJQmdn
 iSuOnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fuhh8bg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:51:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e538afe65so106750885a.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309506; x=1787914306; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=Z1mvddq9KQOMY3ckcetSxe1ibtNnA/jd3Ejdg00WONlddwxWHn66OX6hcjXP5Kdtqr
 oibjujRKhvw6fM25JHWUrQQLMVdvdTq/TG1s8d84fSqfJgnlXnumKojsW4IavB8to6pT
 rb7KiVZthu1+QW3FaasBQLFDMUQwCo0GygcmL7W1GgeWcsjkNHnQsF4dmaQK9fCqXFj8
 trsWw9wYVVGDB55vVTuvJiypvHRRGQYC6YRzIEcLA8JeW9/vvM8ZS9CBQ6ucFGBuYq4p
 SSJkwM7s2+1/5XO4Gvnjto+AbnGGlTc+XRIYWl3lUE4sL8W6YyQ0HYRrpmUwaVM/4D39
 S4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309506; x=1787914306;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=Iaya2YZCvYkq2Gs1/+UqimGkLIHs0t0i8YyAd//dcgUJZkdZlRtVDoD4oc5a3rMyWu
 mvboVv/OJb8vuPrXoqt3bK/gwaob6Px5rWDDBCyn9sF6FF6jsolcBX3FC107I/SclHh3
 QLfg2tutS3IciZTxMLNUF7SECsDvEKaMwZsYpIDDK3vp6XI4lyA6aocL5GZzyV6c8ZSA
 VIFsL/4U8Pwv4GHq79bTd26f2+ZEjp3jWAOSUToZz5FuZJqWGLDsb4FoxyjceHmdW94x
 1LYEnZWS7INCnRsU6Sf6Dl6IbaqEwZRSmxWj1TV9enjuMgnlNk3+pYTGo3DJ21/xfmwe
 Jt9g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqiz751Ox30w6vWGiJx12uyuKP9MyHwKBms686OpdSmj/v408o5D1NelBEbCAEV/Tm7Vkc0+RpOProV@nongnu.org
X-Gm-Message-State: AOJu0YwpeTZmMLXn+jXoCHur1krxy0qRzIeLxLUO9mIzpb68RHmGDkT8
 lkBEKaLIp2LfQFE+hf+Y/O+Iipg90WYmPoWFGumsLepXn1Owd7QmDSNy+7PuaWlkVsOjKka++tc
 z+n+bQZCAkAaN4LOitAMA+ym3IW2DtRtTt90oDG4/1O7lyiQ9aOGbmiwQpA==
X-Gm-Gg: AR+sD11Nb2ALzGA+27gS5a4pVkKolrC3gH8LvWAsk7+BGVvYgvUOuOsNowJUZhwtP2y
 Ve75MRkQPd9ogntZ5nBFL7butp4ABuURPC6brlHZgr26nMaCE/5kopQejtWmgyoQ9W3FI84ad3o
 y9MFivN/J8iQrUSCAzr1IIQwMYZZEqEaVv83lYAfzgIvhv1HQi+fg6vg4Gm6KvVW/icC/gKNF7U
 9enB6qtosShw0Hl3Iizp7ESsT1BX8ZWCa/7DF9htnv8G18IvhZ6QneGoWnMuQK1Ncx4EDfJk/FA
 joIzM9KRQuJQD97KxoZY9PpNCVItvA5il3ihqmMpbokyungbXs6zoOTSZ6p/4sUGNTv71vqqpkj
 amNK5FhyatI3XEJz8zZ3/zBbCBu1N8c6TiQl/peXXEA==
X-Received: by 2002:a05:620a:3714:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-9373949dc47mr410248485a.15.1787309506015; 
 Fri, 21 Aug 2026 03:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-9373949dc47mr410245885a.15.1787309505611; 
 Fri, 21 Aug 2026 03:51:45 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9b3eeb1sm13262095e9.2.2026.08.21.03.51.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:51:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v3 13/15] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Fri, 21 Aug 2026 12:49:47 +0200
Message-ID: <20260821104950.32108-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2Is72d1tTDACsFc-SV1X_9NHnknY2lW2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX85XeJMBTWCpH
 S9V/3o9xnouM9dXf90GHNEyF8l2TrSfk/bo//0vw9tN8c1HSq/Fwb2D86yL7u9XOJBsWv09XTGp
 w/4zDCpxm1zfQKJDyKy9XgeGJIOpS6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX1v+k65xXXCbr
 k0X9y5pRm4NNRAFHhci+Hrc/cwluqScw6SJqTfz6FsJRQInR61yBUiZs0DgERyurwdD9JL9k3/E
 yghywreEtnMz1USKKK+1ERWa7lH8pfg0iEWvMx529BKG+IlAzMl0clm/IyhCm4MJ/1TcWpj8Y6A
 97Tayy9Y+t/GkUiwycmP1T+jhykKCSAdgs4E5mplVV1XgMdVHJY8tscWX5lrQ8WOlMPoEHXpkAB
 IAzd7g/8eAlM7eIwQVQ658NWk3SccLlJ43BNUiPQcjNTg2Hef/jt5etw2nRLBQUT+Hp4LXZcieV
 It8+myKIa/t0mWb/TIEwbucx2IlUmtyi2YRqlZqlju0GFVavfCIBzGlTQ/Zic4hKGTO/XEPCQvF
 uKK/SwRj9Ql1/cSEG6uK2VYXlRaBKt/zl6pZVtc0lGeUONBp01zl72iGaRe6bW62jipjZFXhSPj
 8b4IL1EXT6N4iZ7sGJA==
X-Proofpoint-GUID: 2Is72d1tTDACsFc-SV1X_9NHnknY2lW2
X-Authority-Analysis: v=2.4 cv=UtFT8ewB c=1 sm=1 tr=0 ts=6a882dc2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210081
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


