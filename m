Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BD2CA5FC1
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:46:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByMx-00064C-EW; Wed, 30 Sep 2026 13:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByMs-00063g-8F
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByMq-0000oy-K3
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:21 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfEJI2902248
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bkKhElqUw7cZL8NILDXwH9MO0zNIcqbXKJS2Q28CYMg=; b=g8a3WgZIjlmbN3jZ
 pz/JK1CGjAoIiTL2jVfw0hyqcPcPrh7feLkotGQ42fvfn4bw21guc3j0CLK/z4+s
 LL85R/xvhhC0f+EvzpV/8KRRu8002Bqk+xK0TK58nsF0duMmdLDM7iOWbnaVZnuH
 DRo0BxRgkzY+lidEnLRvBHidlIlMnyFgpX1RC9EYvI0QX5+vSbX8RRvpoT69V+0A
 WgH4/H9RogvB3c0GSLL1RDG9va5RKAQ3ljk1qQP6rqJSgHXstBxmTlEB1PFhR2xy
 4M9MwS/TVFHPxJEnk5ZSjwfSE5hthEI8+OSHAgoQyMb4cAn97sB939YWUawhx20N
 Zdc1Ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2rpg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93c58ee2116so1010125185a.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790318; x=1791395118; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bkKhElqUw7cZL8NILDXwH9MO0zNIcqbXKJS2Q28CYMg=;
 b=iFo2dfTsXjtUbsEAREb5SucrdNuQXyBvgVFRKrfzZT/Hl8CCOAEq/Eoc4r8BbKT0cQ
 vLIkcDIlAe5lL6F03WPh74Hj8+N2YgDXYwn6UV4mZRlAf4uOe0XV4JF6Ej1BWzF6wqRO
 6o83GhFMsUSOSpCs7+en1KFrrA4ymR8umzQNT7zKpwSc57i3V/QXOFDZmmCfq/+6LMBH
 G8+fT0nCDtc+FoAamJT5M5o340S9EryMGCpgZtyw+HHV+KtqcLwGiHftNlDsP9a6hCM5
 zUEpJyMaI2XZhhYaBEUnrDGJNlDgm1uOWIlAfaShCSekBVrbheNlHedoawxRjUL/p3Xk
 ewxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790318; x=1791395118;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bkKhElqUw7cZL8NILDXwH9MO0zNIcqbXKJS2Q28CYMg=;
 b=PygCvITaQ00lJEQ52NQxqUFA16rWI0yoO5dt3vDCTcNVOFVSN16kRP/mwYJmmm7T7+
 KtMDUNBChzSdGS1zMttOXdSzzZZPHv3gwqPky3kiYsLt2rFWeylTuvZFbn3AyYE76aEj
 naYGTq8fQaofIswA9sykY1kURJefqgOSSB9SylZ8nO0kQ52VPJ7FQ8ZgSmxpF84iXqhH
 Pon+abawb/QaKkaDtuis1hRB+Jw0mOcA9+XWVIyFCVMjuAkTgpUiNEHIHhcXJdNgy0hW
 sK5773EiqdBVgl/sLgiY7B9Fuxk9LZTPG7Um63qPQ8HCdASpFzBwM4ycBI5cm/cRCg09
 jSGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxAXfy5QuUfA39E4OQTqSsT+BhlAvXngpnTnsqGXODteRAiOt48DPrz5d8ynKEIIEXVC+w35v8A1m9@nongnu.org
X-Gm-Message-State: AFuF++lIzUs3xiB2crBF9iYQXa1zuO2t4XepMS+XOOPvBiN+qHG8WJ+q
 SyWet7tjFugmtko61nk+57b/RfuKViNaNT96nWYQEvbztPPoAYvfSzvReDSoxxZ/UIx2xdY8RHx
 a51XmLfMJhPOLWT3Z8PHzyBC64XJxIDDF+QuPVHmSh62rBdXfB+8miEQnpA==
X-Gm-Gg: AYBFou07PfblyO5CpAafQhxGv2UpDW6C4lTz7jNHEVnNH8g6Ma2ywCeDNyyBrgtUQNx
 NqvJJyJzYCyt6O+ULptoj6v4N8huMAa/XBhgUlCnje2Nwjh/2awQVml+yD7yDf1TOIMoUnfnt36
 vDDpheO5586Cg/mRrQLlaToNfWUkv0En2BHyd0yPYOngDjPSrNXcLcuWrgXsrDPBAEltqs23ZKr
 5lXAedG59P1K0YOTZDvoMF8kVeGmpGK8gJ67/jjvhUAUv4Ua7bcJ3zedDwr5bXVwEBRp63yZjtG
 WKj6VdOX+cg2ViPvpUC1RjXA/gkzNM+8SKrVRGm1ra+IwCYh3maoAtqI+ojdiZyNmenp0zpOlnK
 jYS9Ou360ZbdU+JtOPA9ODkjcz8dPmmbze4sNXThS
X-Received: by 2002:a05:620a:a18d:20b0:93b:d7a1:ba17 with SMTP id
 af79cd13be357-93ca97dfe74mr285206185a.66.1790790318077; 
 Wed, 30 Sep 2026 10:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:a18d:20b0:93b:d7a1:ba17 with SMTP id
 af79cd13be357-93ca97dfe74mr285199985a.66.1790790317553; 
 Wed, 30 Sep 2026 10:45:17 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b06a361eesm544786f8f.37.2026.09.30.10.45.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:45:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 1/7] target/riscv: Document riscv_cpu_update_mip()
Date: Wed, 30 Sep 2026 19:45:01 +0200
Message-ID: <20260930174508.81497-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174508.81497-1-philmd@oss.qualcomm.com>
References: <20260930174508.81497-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX+gIktpp8pa5n
 LhL33CsG4wHyMqiarSJxaoMbvnnnhENloUEHrfk5VbYLqIGk74o++jtPiS9RsCBMN9/h/ZqauPK
 nCzrYCJ9qElT8tfUfjqQrqv3JiWzsrQ=
X-Proofpoint-ORIG-GUID: F73SPH_UoW58xOGtE2tITlveYC850bW1
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd4aaf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kCCY7M0hfMRdwlDYS0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: F73SPH_UoW58xOGtE2tITlveYC850bW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfXzgOw9FfA5GH4
 2fqlvB0VwdqLQxB4swuzb5gShZKxg7ZFEUUGtk1I327kOacz9QrHlS/kBBuJGDnfFngUF+QZF2z
 9KLfPJo9+zoCSqCtDenTbWuFRMoJWyuh1yuR9uXBRk0yudf1ActiVVthrtwPnkFH8XMMQDSUYVs
 n2/HhQXyKZYlfQOyxj+Q5cH0QVf6sFoz43Rl0U9quTu8HpKCtl2K/ja+DO1m/4w+nGk94RHF547
 Fhy6dKI+5BPCemE/X9dPcWvPAkhPbCQD/UTrmbzSi9x7CV75b4Mktfmv3r/Zn1CQ5E5/JSLczTm
 s9pqecqqjTaTncP4gR/1S8t5eOJS1uG2Q2ZDfQoys/HxF+3Zxe1Y7sD8IdeHkuEGdpCe5FDyJu4
 sAl4gzLaDXDMvh/KTGLIc3cCQ9L69b54VMsarRhRKqrZzd31EvO4ayKbW9AdAAq18p167lH+Iwy
 qeXJ6FPACh2TWSfYY6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8c8ffe94cd8..e34c0c676d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -684,6 +684,20 @@ bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+/**
+ * riscv_cpu_update_mip:
+ * @env: CPURISCVState
+ * @mask: Mask of the MIP bits to update
+ * @value: New values for the bits set in @mask.
+ *         Use BOOL_TO_MASK() for boolean values.
+ *
+ * Set or clear the Machine Interrupt Pending register (MIP)
+ * bits selected by @mask.
+ *
+ * Note: VSTIP is not maintained in MIP, so it is ignored here.
+ *
+ * Returns: the value of mip before the update.
+ */
 uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
                               uint64_t value);
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
-- 
2.55.0


