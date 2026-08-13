Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1784C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:20:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua1O-0005Ji-Lp; Thu, 13 Aug 2026 14:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua13-0003rW-V5
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua12-0002Ik-FU
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:57 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DH8gud304738
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iZ4CQeHz0iJrXPv/eT7hao6uyv4DFIFygNCZO9k79Qg=; b=Zf/LpJWyOil0GNtz
 GRXsvvUH9b6DPhWH8Su/QEP2fUsUChulGo7bBXRQ9026kAMnrHuvNj6t6MI+Jb1w
 21zVNxSX8kjkWRW3IRFRzP4cvXZukRrrWAosh/pYdmlMxbZhc0Zzi3nzkW+zOD9A
 hG6/U5SXBpzBIT7Y3ibo5Ptz4e1NKViVUTJZ2bKTPE7NLKqXMOTZbnhQXDcfBxXE
 cbAEdqtFP5o7jecRctFwW08J9etnwAoi3Hz7xSEWJYO813aQPbbmImIb8r7fPRiq
 mwa7KRf8kumLiH96qsR2ojg9YoehPXV74ib8m/t7kR7YfRXxnn2G+8RfHpQj1EJ0
 Ts6P1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2nga1j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9349c5af52bso34572985a.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645122; x=1787249922; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iZ4CQeHz0iJrXPv/eT7hao6uyv4DFIFygNCZO9k79Qg=;
 b=TtDLTHomkne33VOMbjOoOaHyjVF7lzyvoDcFF426mjGXZff0wqFzUj/BOnp73g/WyW
 cs9xoaBMuW0CdmbeeHOclrVcBo+Bh02Pe5IUDWvxiJm6Ju9OGTEWofdzj1K2qHWwPdDj
 ZC3o8FRRuYNd2n3Qdbjtv4+SCQUXbQyn86BoKKRtWUrCHE0eWceThHl+KgXGMxBmuAA8
 XAngZJ8S24A2HrJuOpMCRPTi6RZC1klYklKL2MBYrnQeFVk0kjEVhKPDN0Vn5skUkYjV
 o7HdAxMZQ2Cntfso2nCTXw5ilG6ZCRbiL21bpFm7/I8zjXjpvyIuYba0jMLYnjAcRwhh
 q0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645122; x=1787249922;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iZ4CQeHz0iJrXPv/eT7hao6uyv4DFIFygNCZO9k79Qg=;
 b=kmMCncmx+Ikz8oRuureQjpTSx3o95fMIKwmeB6zwv1RCLwrQEVf3YUoG8ke7GCmcEi
 hLSCi/yryME9WqclKMS9+eYBGI42kQkamWGEGckW7EWxUnhnkScP3kt1ORYU0PL+wrUU
 /oKlkn+E3QBEpoj0M5f5SO16JENFbWJXZitgogipxXkFgQWue7hLLBVLGwArBvW+HpJu
 WLO4KcBZUVmhbRK1ewGUmUD9Rfd5TlRnuY2IJAMpiAjlM2Wp4KS7VZxkKc4zJFzWMnNS
 c31/NgjNapjhrOjzVKqwOysThxJszeAvFP5q2erPD/dqYEwE28DUxsGuHDyHLiIhr6dH
 YERg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLejGumowD3kUl57s2R39M3VxPju5VbxVZFVmKAIQBnG3GQTR6BeOFz3wWKLwdBcGozxC+9/QsHXdW@nongnu.org
X-Gm-Message-State: AOJu0Yyw7IEYzqhtlRwntre7uQO1CNmS0ew26e9vbgcY7dKlCF0T4Srd
 SzYIUHUg3lrjva3kv6eHwGseaoTqowFWpq+w8UoJnrCXpWcsVVDGKO8W7X6KUbQ80XREZ4xXlDC
 gojHF30hL2SLxRMzICiWTp3qggQpD22o7BHFwlS7uxy7iY9/W/BTYvkBhaQ==
X-Gm-Gg: AR+sD139LlG8g77V3Hprm6mqzmMmHnDzN8x89PtBMBBVRzJxewu+H9raR9np8IfW2yO
 r4mYxGnSiB3Bo4RLmQNgpzWqbl/TcNUBwj37OxzzKlVMq9/WMrDam4Rd6QK1qnayYXyZLT5zTy1
 /uQ9cjQ6FO5PpwnvlAWrcFFPdjFwbVk606f+OtgNnRZeU17hc0auz5pZHkSPmxpxHOd1Kgx6Psk
 FNeA1roAcuhqVkto18yW1ZGNUH0Oa7lui7imZjs1S3saqbkacXmZZ4usUTOA24edMkvXxdTKEDw
 J4H/XRtjs+zO65Eim9NGFsqGSoviurvD0Dj6sBrn4j1/7htUNiMzcn3hq1bcF7ndaC4ThaLbW9k
 FtkuGUuWAfMf3Jl4tcf2gCGWeOiTEeb6SDHJy3SbKYQ==
X-Received: by 2002:ac8:588d:0:b0:51c:103:fb56 with SMTP id
 d75a77b69052e-52d73c6fae8mr83158591cf.15.1786645121524; 
 Thu, 13 Aug 2026 11:18:41 -0700 (PDT)
X-Received: by 2002:ac8:588d:0:b0:51c:103:fb56 with SMTP id
 d75a77b69052e-52d73c6fae8mr83156831cf.15.1786645120303; 
 Thu, 13 Aug 2026 11:18:40 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982129643sm73839635e9.4.2026.08.13.11.18.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>
Subject: [PATCH 16/16] target/arm/whpx: Fix argument order typo in memory
 access error message
Date: Thu, 13 Aug 2026 20:16:39 +0200
Message-ID: <20260813181640.6537-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ApXeGu9P c=1 sm=1 tr=0 ts=6a7e0a82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=sWKEhP36mHoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=CJsRysG5a4fyhNKOOSkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OvMxh5Kpr3sN0jqlhiTxlOxZljyMZLGZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXw2vWM1vr9pYJ
 UFO9bepLBRzPvW5sKGnhh9T5F3C6N93ILpp7HssmBNxt/c0o7LznVvZ9ChiusQOeV2MpfYLeBKG
 kPSPPTrn89v99IGC1kVHmo2i+7EGJ/w=
X-Proofpoint-GUID: OvMxh5Kpr3sN0jqlhiTxlOxZljyMZLGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX44osN8gsjpLX
 89sg1QLu3K1bXYkOX8D+WJJHCptAYA8OlMFtOxE4dpSbLcOfRxMn8m70HA9X9joQlgm2tClMfLB
 4KVRrBbeIJG1E7QPyM3RzCQATW1BR5ryeSQuGexVF7NcRBGVX3x/DhgtbPVeZb8yq00ZSZR75uG
 zLH6GUJ9mJqFrIHVM3sa80KQIK1YH41u6rRs7YlnwNKtvDU5qHMjqyqbyoBCvM5qWpiaKUgmZnG
 yYyHr+yq9xanlVK3A3m2icCarEeZEN0AuIeUO1RoNHcUYmvczdFx1B45A2NfZuSlHUyAG++2uOz
 RUdIPMjcoLhGz679nJoNlMnjlvVC1KibS91F3Hs0g0/+3lgcJwnlSyJLjP+NObBR3zYOiPMe9+i
 I1U/52E5rDe3wYozordcg7PB+/lBZBcoYvg5D6i26J8FxysMM/Iz/ivKOyFekCm8xOu7Wt794kx
 rzs4dRt14miG7+jZhLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

The format string expects "Gva = ... Gpa = ..." but we provide
these addresses swapped, causing confusing misaligned debug output.
Re-order by swapping back.

Fixes: 59432082cef ("whpx: add arm64 support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/whpx/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 5e4c25bb7d5..e59580d54ee 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -442,8 +442,8 @@ int whpx_vcpu_run(CPUState *cpu)
                 error_report("WHPX: cached access to unmapped memory"
                 "Pc = 0x%llx Gva = 0x%llx Gpa = 0x%llx",
                 vcpu->exit_ctx.MemoryAccess.Header.Pc,
-                vcpu->exit_ctx.MemoryAccess.Gpa,
-                vcpu->exit_ctx.MemoryAccess.Gva);
+                vcpu->exit_ctx.MemoryAccess.Gva,
+                vcpu->exit_ctx.MemoryAccess.Gpa);
                 break;
             }
 
-- 
2.53.0


