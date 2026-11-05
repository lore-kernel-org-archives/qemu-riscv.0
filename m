Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50F5606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6UyE6FR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKjxP/Mc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOx1s-0007pf-5O; Thu, 05 Nov 2026 07:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwz4-0004Lj-Ot
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:30 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwz2-0005ua-RV
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:26 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tdAg1028306
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uTpjVBrkJpT9eIFjhhgmax1Atpbe2mKbRRRpC7Fejyo=; b=C6UyE6FRgU5DvuYZ
 hwpwtP+smF5mRlpsrIhgwl4wdIZeCB0JAEaY0U+GQLO9Qi4dEJ3qozFb45n4fCXE
 3yLiD2OEsC9IOn2ZDg5sa8MG+zTmP3v+rGUm11w0qX42rs3m4PVCZKo4QOpFFJgl
 dn+dBn1cpNl0uNTog/rsHCQ9dGmUzbf9T7at/qUJmgcd5lEKWDJ79btlKlG/9ST/
 T8iYTAaj/r2Ke11Xofn+pXmOFlaZX8m6+SoFbzqE0wnXUq+i50E5inx04wFoCB2C
 DYYYI2Mmf2jesMQF8eJwmaWwToHaeHMkljCjDH46rCFTxsHWb2dJvomcX9XeZihm
 Fx1GHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9uss-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:54:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f32050e72so563466585a.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883263; x=1794488063; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uTpjVBrkJpT9eIFjhhgmax1Atpbe2mKbRRRpC7Fejyo=;
 b=EKjxP/McYgQkuJfceta2JdJWWt/yl/R/3oePfpQIcIwozZlo7p43k8S+gP7UmbkEAH
 8LhSH7HEJFfHMAf1A3vhynTjbFs0KoPlIvgXvzDREN3dW1PloW9L5vbLEQPE2BDXBVJG
 olBXh4KhLZW+/jejWRw4F4TwcfHl2t+83UwU9cIXHfCh1Av+dXSAIA17iJMSpU1cwchg
 2hJBqFwCP2+1jysDMgtjjO+VrmwWclltq7+0aJ9rRP0IY+3gFYNS76Zbj1EYMPayLLBX
 pXLwufncSHh9EY96XykfoUilvkL7aeSBPn8wXYzpu4bG4R4OvHqWkCMlifhsJuj0ap2+
 wcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883263; x=1794488063;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uTpjVBrkJpT9eIFjhhgmax1Atpbe2mKbRRRpC7Fejyo=;
 b=fb0Cgxi5X+Lf7ENFy8PA9zHGbClaeGYWss8Hu/xdE3o3JPowsnjLafoq/DIEg0N2h1
 dk7Vfm//tLGqC2lrY0mRcNpET26ZllztmoY5Ay+pZANJtFazMs4OACroP9OOhiuUVgIV
 QhXYHX6onKv53NSLausmJ+In93tmDDVJofHkMBctPor+toezvklNKTRwpKIHcZdI2IFE
 jCmDqom6jTPpIp2N/Gvf5oL+AkJUtxZZOamsPvFLJhb74mCOWv3TrVPb4SiyDCJgbC61
 +XA+DFo3lqeZGpFE+rDrPoAQhpQX3ebuCp2h7MWjXWzy2/R5u51AhIGQE4Eiy8aiUHf5
 br+Q==
X-Gm-Message-State: APuU4Z/mJ8t1DAzHNdON0hoevT93k3jcabVJ7v9L4I6/ZyiN5LgG+Yio
 NJG6rTVEkGhOskUxjZMwwwAZX8B4/QKAVWFeyQqHpM+2bD3jzKpYunkv224lskzM/+CyBz5gn6n
 mEiI76XeW+5921TF7Bp9Vdkp8Jfjj8nfQOwaHFm2i3xq5jpNjXFSQ8RQPNA==
X-Gm-Gg: AYBFou32pm4GZUQpSAgnWexIGi8JKxAlWo1VbBLeUUckUI2hZfoDGP0VGeHVZ2TSj0g
 WLRFNtm4s2EAhi+3V9Bp3EXFBzRQmSA8CEWaTpafKWiDo3w2DhPSsW98TVlgak2Kq3ku9fY5ZsQ
 p+Lr6lq8IZjTtWwNvWzyUxVQMnLZZ0H7acQNQL7ZPeKCFMGWIfboNsfvxZ4KoCfaXD81gZQ3n4M
 vRKVYEReRgfaUWFPD0PWDJO6q71Wmq5WjBTFwUk6Z/v80DGouq+qSV4/iofwm6RPeBg7f8Ac+gG
 6Gq0+cXF9bKG+zyDwNH7B+wzOY15wETjE/H75aSCK70Q7HwlgYy8kWg9LurLx15E8SJB2slkOpO
 6h6n/Y9TcsN2engmCP10etBAKavvi9kf5x1BvSiVxW32ENYZPq/mqlZ37mnpSkeabZN4IAPY/vH
 vbAd/a8r+8WO2kcxqRaI8/o+2htNjWoA==
X-Received: by 2002:a05:620a:2989:b0:939:de48:e41f with SMTP id
 af79cd13be357-9442167723amr3380677185a.31.1793883263154; 
 Thu, 05 Nov 2026 04:54:23 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:939:de48:e41f with SMTP id
 af79cd13be357-9442167723amr3380673085a.31.1793883262685; 
 Thu, 05 Nov 2026 04:54:22 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55abd3b67sm1819881a12.3.2026.11.05.04.54.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:54:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 14/17] target/m68k: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:59 +0100
Message-ID: <20261105125203.40320-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tP9y5sI_4qwVdSfHLqasVYS7jMnBZdWO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX/nBDDInHcI96
 UyTtQJZVkdgMLGTPeZmnHHXVHxBRh7O3FSwDfcA4Arx1Oa6kpovrJ8BsihlkbC5RJ0yDyP9Clla
 pYEGTkmept12O8xHTkOg/TRAEVaQ2/g=
X-Proofpoint-ORIG-GUID: tP9y5sI_4qwVdSfHLqasVYS7jMnBZdWO
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec7c7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fo4PYDHW-kc5XFuih_cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX10BM0CI6XHDb
 bb5mpiVAwmavvjzFGvUYzucFuA7VCDy19g+1ouiJVRIiWK4/iNsiMD+6zC7YvIO6a4qw5pjW5mL
 MBin9p35/71FwKumEGDC68D722FKys4vm8Yby8XmIXzaKJWYoRcvO9ZQ62i+G8dp3ludV6lfPkx
 RP0AXz2t+klYuotd7Xg+TUlL3ALbl2QgQ7XWcdg5q0arlnPGH98Nvq4Z+4kLH9sABDQkc+BSC2D
 8OeRGqEmiY7iA9qSFc9A2Q89GDZuUZYYqcJ5JAneMeQ0cZmLPa3RKuLNRX26lPvc4hOxj3BObDz
 Px7fZkd8/LR+IKhUluCwL98EsVeVkXoHMV26aLrUQ/9ppu/VnjRwlv2idJzg+qx/+35yxibqBDB
 xy3UbtjtrWrHivYdwVUwtlSzypkr8q/z0d4KgKSXNVWSx47CvSqfzxn2oWiuCEyMTyN4+PUs0jE
 Mc4I0feNBBYYOL+cU6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Replace sprintf() by safer snprintf() to format register
name, silencing -Wdeprecated-declarations produced by Apple
clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/m68k/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 138c89d3e531..f955aae649d3 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -77,17 +77,17 @@ void m68k_tcg_init(void)
 
     p = cpu_reg_names;
     for (i = 0; i < 8; i++) {
-        sprintf(p, "D%d", i);
+        snprintf(p, 3, "D%d", i);
         cpu_dregs[i] = tcg_global_mem_new(tcg_env,
                                           offsetof(CPUM68KState, dregs[i]), p);
         p += 3;
-        sprintf(p, "A%d", i);
+        snprintf(p, 3, "A%d", i);
         cpu_aregs[i] = tcg_global_mem_new(tcg_env,
                                           offsetof(CPUM68KState, aregs[i]), p);
         p += 3;
     }
     for (i = 0; i < 4; i++) {
-        sprintf(p, "ACC%d", i);
+        snprintf(p, 5, "ACC%d", i);
         cpu_macc[i] = tcg_global_mem_new_i64(tcg_env,
                                          offsetof(CPUM68KState, macc[i]), p);
         p += 5;
-- 
2.55.0


