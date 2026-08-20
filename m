Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB5C5DF8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx99q-0005Ym-Ke; Thu, 20 Aug 2026 16:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99p-0005YG-Ex
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99n-000258-Iw
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK89V04031198
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=; b=TtpABNBi3HVQUY2M
 62KJdbbEqaf9DmpqjB3iapOnhmeHeDI7Woy1jzs4o7KO/lK+fvN6gjR+QrojpfeX
 V8lW7adOVEpV65469o1y0+x64bRmoLJY8CajuLQUny3hK7ku9GovgIti98VgNytE
 SPKuTXGYZsYXZh1oacEZeEufDN+naLNAQ6x1wkbuUQt5+vRqZfUla0UFlGtIGRGG
 8HvWJgnba+lbjPr1/qv86xFVblL94nQz7mle0EKsnga9Aa6Q33stg4++BinoLtxX
 dBUItiUyO5dqM5xb20v/Q/SaO4ONKtD37eRI3rcoItcKJ51DgYA6g8P4g+5P9Rjr
 42wE9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvb3mb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5276aa86d00so2406151cf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256864; x=1787861664; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=ipK4oifMHCgv6ZjwhoNFYb/jG1qRm5IUEOAh8uW+5L2L4PvRaVA7npMC9wBALHflmP
 nF3jjW8H3BSl8A034leNcUSpnUHuebqrCTu3IEh/TJIDoQwek2Rw1XsC8fjxV9xUTbAO
 79/yDMmoGsGZB0ws+1zbqjrfgmhuVMBLc2D2HmbTqgUYC1jCFfUmy3WV+6SGFPBQtFJr
 BJHF4B//+Gl1ad0sT2Ng8+Xz0LKGDyX7L7pex0YHhi13hl+e3OMPTockQodbrgMlSB4z
 a4MRuAWeLh9ngZN+BmboS4Ru1oRlufrW+Ccz2qeiF0DlvN6Z5CkCdh8qoq4mE4zMuXTT
 kT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256864; x=1787861664;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=rvUoo1kCHNpUbf+oXUzE7aMQ9jcjptSSwCpgEZ/AhkTE3bgKPIHkO6HYBd/zhcQp2+
 ggPf7/fk2pjRmsIYS3vzXiVeaX3hv1x94rm/SrI1p3qnLAiczM0og35/NEu/1XaKD4Kf
 ZSre8vY0OR9P9o3gsDVKv3WOMNBoYfzjZCSiXZ8TdhB/h6a/Znr0dqnJDscsxzdkIft2
 rMIA+CF3DbvI6KDUJttVkgmL4UaDDMagWbpocWc+UvPiBCz5ed0DA9sNzRQ2Oq3XNMGp
 A2biBsl6zJakZyyIPc7YNQ7jyDcPXOVAJ4x7aiaNrj+b/XUaX2WLv4hJvUFOGeJsfLcZ
 zNWw==
X-Gm-Message-State: AOJu0YzyqnCLCjUXnroWDr84yatFdYRQ3AMjoswuhKAg/PLl2hwikH8+
 +ytlhe9kH4b3pdovnOxzHqdcR2/a2p5Hsh3N3r27A8EEqBx5wfk5QMl7CYVqgzw4jhUTS2Aru3E
 fyQFq/3ezlnwdW0imu/eRiad0b+v+An2aiOqCILAGouAUFUX5dqQKsvNJzQ==
X-Gm-Gg: AR+sD11XFOAKPpZF8aZSPPqyiNrvUVZmi+3K5+sZylG8Ks+QEJm7pgJsMz4Q3SkGaCX
 byo6LFnJYZ/V07byESMAO1i7UHXpnLk6ic6QxvtgngCvSNAD3Jr59iIt5yZHz8yH4T1K1K9VBfW
 rPDxwSxuW82uTkv7kCgOuf0WAzUhH5p4EGBnEjDsccC4VFsQaOBYE0bstXdSV/X3nw6Vgz9m9ya
 uEpStwoNnx0Sw2ufUdDtTsKi9e+2c4P7Z4oQrES8EDEUDS0zlCPJeDc8ucnYxkz820Wychr0UL8
 lTLKM2JdSWqh+VBQqrJqS0T2kEdvTyzAC1EdFhKtNxJ53fSOMoqGOkwUdTFHYW4rN5hYVmS/kk5
 iPtECQbnNkVjl6jmtkWFxKac8XkXHXXIWJaa/YynagA==
X-Received: by 2002:ac8:610a:0:b0:51c:6b6:9d0b with SMTP id
 d75a77b69052e-52df56e48ebmr12102571cf.2.1787256863874; 
 Thu, 20 Aug 2026 13:14:23 -0700 (PDT)
X-Received: by 2002:ac8:610a:0:b0:51c:6b6:9d0b with SMTP id
 d75a77b69052e-52df56e48ebmr12100911cf.2.1787256862673; 
 Thu, 20 Aug 2026 13:14:22 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d297esm3831355e9.2.2026.08.20.13.14.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 03/15] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Thu, 20 Aug 2026 22:13:43 +0200
Message-ID: <20260820201356.29775-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a876020 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX56uszmLIDqX3
 9qDDiq7PccR/sNiSYLo4/PGgLKPzKhrQb2UDgy2Dk9vqNaEV1pFsyprMrN8YhVO+YUsbrKaFgGN
 cXVJagu6MH3jzSRQdgu1vYSostUv3Rz6GRjiMp3F7K8mHqnZTLdFYuasAVnkOhg/24AXBaInfL8
 BhuusykOh5Tmw5iiWhk7lNqnuPfJvWfSx6oQNSMBbkj0jJDCYqwLIddDcvRXWFdL/UvbUxqckS/
 0TXrL/b2q+NnBG9BItSxq8fGcxDtCXGLr6S7ZzPd4cV69EtNwnJYxTZfoBPkkDd+jCSwR08kzZq
 AYcsL29AD2m0Qb5pAuTM0tKoiXPoLVVEeTGpsr7kCoXe8X0ZJ2zKpGw2UpJpiFKowK7hlUpCpx7
 SHZV/YaK4OaaiULUSoAHeL173noQbIIjph1J6i4ZSs3qrUpDcHUCOGhxcoQ7Lk+wQHjbtNx1BqZ
 p5v53r7UjB0wJyWk7CA==
X-Proofpoint-GUID: dDwv687HDK0SLCNvgKVwhnlQBJISwJY6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX+5SVM+7NBvfB
 InWJVSRGKB6NiCQh14P3MVm5/7sf4q7p2hQ+D4iyvsU2vL6lmAt1IwGjTP6DgaUu3DTR8Ia/7h6
 Dfry2rYcxkN0gjeymUMOW2tSir4pEdE=
X-Proofpoint-ORIG-GUID: dDwv687HDK0SLCNvgKVwhnlQBJISwJY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
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

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/avr/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a818db753b2..1e4e839bd83 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -183,7 +183,7 @@ int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
 vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
-static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
+static inline int avr_feature(const CPUAVRState *env, AVRFeature feature)
 {
     return (env->features & (1U << feature)) != 0;
 }
@@ -204,12 +204,12 @@ enum {
     TB_FLAGS_SKIP = 2,
 };
 
-static inline int cpu_interrupts_enabled(CPUAVRState *env)
+static inline int cpu_interrupts_enabled(const CPUAVRState *env)
 {
     return env->sregI != 0;
 }
 
-static inline uint8_t cpu_get_sreg(CPUAVRState *env)
+static inline uint8_t cpu_get_sreg(const CPUAVRState *env)
 {
     return (env->sregC) << 0
          | (env->sregZ) << 1
-- 
2.53.0


