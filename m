Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C52C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua11-0003hC-Ri; Thu, 13 Aug 2026 14:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0K-0002m7-6R
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0H-0002CN-M2
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:11 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTIZs3177142
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8agxJTIsSpKLfDGc1usrfc1YNaxVZOAKA/A8ADkj078=; b=W2IloqFSb1jzcQUA
 hzNfC++VvnGkvXpFWcFo+lwZ81M2zW0z/z4hTdmgBqJGQu5jf/GqRsdwlDGFMR7c
 +4+VolF0RCI4s9wW5sgkHeNMpAss6Hd8s5Q4V2enuDqYqblKrhaOUKOaO1hvrmd/
 6PNjhPnQAFo2PnK4qktqYzPx+yYDO9zk6lCum6AdlgwCfEf91ichE7b5tVfEms20
 IIKMbzrlnOmofR9RZIS9nseeb4kSBW9B3IRdg5MNTaXfkoIU89TcxWPE9BV5ci2f
 8H2a4ftDokNQPm681wb6YJVzPzTWvDKb99oiN+d2fLTaCIdr7zuHQXBckVPe1NeQ
 znsdDQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1f94h9qn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51ebdfceddcso2476371cf.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645077; x=1787249877; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8agxJTIsSpKLfDGc1usrfc1YNaxVZOAKA/A8ADkj078=;
 b=Zr+4pcAcR5L8rs8V+YY2bophBwY5eNgJOZ1sr4YiOntBsu9fXNRLDCPCW20QENun8P
 O1IIHfjiPWAAEKNY68MYd/zNvrGZ7fbyATP58jl7XhzdXGcO+0pNj38SViT3Zf80RlQU
 yR7eUJMi4m8CirJub/xwpCmxs0hbvcNOOKp94XZO/y1O29HgOTbtcaiNq64VS76tOVge
 VO0mFrzhxBE2bs3iD6Q2ubgJfwn1jGeBVShjrJwpRQjzk1HkwXeLU1RcBcPLy6lnkO6m
 oc7IPuMpWGRmMW9RBjW7csadPbfkC8JS+gBtW3QBo9H0R2C5tfyUwTyrnGg9g4lQL5Gr
 91bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645077; x=1787249877;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8agxJTIsSpKLfDGc1usrfc1YNaxVZOAKA/A8ADkj078=;
 b=Qzo7rjCConFrwFKCkNaMvDewQGtp3x27AJLIES+J4S6LcOmVyw+3nY1AORNBwREXIZ
 C4s/TrvdChoOWQEqOjObK9NutyJu31r0jIgKOhJ9IsWvBkso+Qlcnqk3SU2XvjyFC78P
 WHSEgAXr44UWVNAcoddwYOX8rsNBUhItZeI5FzOUMnBrtI1M4lFywk9/EteLZj7a5p62
 El8NYNjzfkZdBomjeb8LVztEBGemHEOlz2lPotypPqMXfSXB+3VftSKA3PwugwMUub3g
 tC9oH0HeQMfD5EV1HhCCB5rgAPdx3TFLo+/IO6kjiuy6/3Ln7Fb0QyyYFdpPWy89S0Wo
 gCug==
X-Forwarded-Encrypted: i=1;
 AHgh+RreTPfc43qEVkDgxic8KcxysQE1cjxy+FSPuV9s9y129KgdrqTdVx8vSjX5PHXF7MPCLLvOBxrsuG12@nongnu.org
X-Gm-Message-State: AOJu0Yxvp2qSahAwEo/9fk/uZg5JZmlJeowTbIUZPcVx6QRIUNPFaKqc
 mbucKy8YLtzYVa4YPl0nW7DLY1cSKQLbPR5pIJ3nhn5ENlNHbLOA4IbqyWl9BV6p+y9xzr7se4q
 lJ1/xnoOVb/JgzWQpvNi7pNzej2ToiURzxBD+fPfyp4d82CpagdbfjIOIiA==
X-Gm-Gg: AR+sD13ne6pYBt2P6ahrF31Vog3sb5mkRgVQPicJfDAtpnpBZbIT/JlzEhvLfD5WZMf
 vZZDS91AoIao0g+eurl2+cRVx9WFacJlL96i34/cZET1XCPAklRi5Da6+4uMCQp0/sltrhCYO1Y
 tnTDGiLUt2NZOQcAOWDXk+jtBtArvCWnER270OYWJiP7SRyyOhysPOu1ln2v/2DZm5gfqdLbS8Q
 UNpiLCHDloKRgzsdutbWYIMb0H/hqca18gpYh8NAY+vHDX/ni+NdhO0cLzYI+EWFcGVieBLR52/
 WOb0WIyE7Xiariyix7TXscYE1vPBcHq4tnrZw9a1tkFARSP878pWnZ7Vn3iU+rQgWgUY1yEvO0e
 TGxPC+zr5Ef11uL9QlVd93EPLUaA6zQYpnbj/ZBLwKg==
X-Received: by 2002:ac8:7f89:0:b0:51b:ecbb:206f with SMTP id
 d75a77b69052e-52d73de0b68mr77221011cf.32.1786645077151; 
 Thu, 13 Aug 2026 11:17:57 -0700 (PDT)
X-Received: by 2002:ac8:7f89:0:b0:51b:ecbb:206f with SMTP id
 d75a77b69052e-52d73de0b68mr77220031cf.32.1786645076558; 
 Thu, 13 Aug 2026 11:17:56 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777cd05sm5859245e9.2.2026.08.13.11.17.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:55 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 10/16] accel/kvm: Clarify use of @r variable in vcpu thread
 loop
Date: Thu, 13 Aug 2026 20:16:33 +0200
Message-ID: <20260813181640.6537-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX1pUgPHmWjQto
 7CNtoQMzLCEu8B12Bdoj+XJXECxdKIu957mGKfwVRDM43LrSKIpl6aiIx+glPNCfjEj3E2B9Q8Y
 vfB1MZK/KT4pgU1oYu9Wrcgq9i3ysTM=
X-Authority-Analysis: v=2.4 cv=VYDH+lp9 c=1 sm=1 tr=0 ts=6a7e0a56 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9RVOebA3_GiVrJoGtMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: S85VdjntTqliayClcer53ULoKX7UxsoJ
X-Proofpoint-ORIG-GUID: S85VdjntTqliayClcer53ULoKX7UxsoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXw7idAdzedQtP
 I4pYgullyx8TPLtzCeSzA8jYjbX7sfcPeqttXUK8yteZlmu2NbR9wEkaAM0ojMYLYNAHoMf+jIJ
 LXgGwxzCNvUS+Mac6gE+ywU33b4ttWwcpjBFF/4aB3i8drTbAv7WUXVaSimAFkoMwkYvw6BohQl
 NN7IcxshJwT6LCRclmQzLKyBIhTI+lLnrWOex2ZyuTJw5WKoAhSaZFPO9716NvuVHORasIEAtK2
 0fgBZRrFSqfL1XWwDQLTg8uXZEzTrcbNfRHMkymDbhg/8hBTxRgy4r1EGH1b0GxzDaj/YUYfUve
 P7T38MWnGzIayCWbRpfSsygOrt9/N8VLieeT19rU3zD8lNqYtzisAp3zaQXrC08fdyFsff67ZCT
 fn/+hrun8vFWWOiZvG2asDUz+WHkyPQZWuVJwJt4jwokKjI5qk+dtIVPpgdnPfApuYYTNo1Mo0R
 lgExjhgT8wnAPUFOOpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
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

@r is used for 2 distinct concepts:

- kvm_init_vcpu() returns an errno. However we don't consume
  it, besides it is called with &error_fatal. Drop the
  unused returned value.

- kvm_cpu_exec() returns an exception code. Reduce the variable
  scope and rename @r as @excp to clarify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/kvm/kvm-accel-ops.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 73ff93aab67..06f56773324 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -31,7 +31,6 @@
 static void *kvm_vcpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-    int r;
 
     rcu_register_thread();
 
@@ -40,7 +39,7 @@ static void *kvm_vcpu_thread_fn(void *arg)
     cpu->thread_id = qemu_get_thread_id();
     current_cpu = cpu;
 
-    r = kvm_init_vcpu(cpu, &error_fatal);
+    kvm_init_vcpu(cpu, &error_fatal);
     kvm_init_cpu_signals(cpu);
 
     /* signal CPU creation */
@@ -52,8 +51,10 @@ static void *kvm_vcpu_thread_fn(void *arg)
         qemu_process_cpu_events(cpu);
 
         if (cpu_can_run(cpu)) {
-            r = kvm_cpu_exec(cpu);
-            if (r == EXCP_DEBUG) {
+            int excp;
+
+            excp = kvm_cpu_exec(cpu);
+            if (excp == EXCP_DEBUG) {
                 cpu_handle_guest_debug(cpu);
             }
         }
-- 
2.53.0


