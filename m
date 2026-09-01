Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6416BC61DD3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 20:29:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1V6m-0000Qs-Iq; Tue, 01 Sep 2026 16:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1V6l-0000QK-EY
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 16:29:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1V6j-00057P-CI
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 16:29:27 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681KTHf52982853
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 20:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gxbf0LEMUm9FuacbIX2IIiTGQs5x0SdQJ5/psKIbaT8=; b=Wa2p8uEt20EaogN0
 dO3URAYv3wBObwrGYqjxSGBy9E1wVcg4pZIt3KtSrjsSLjr0Fe35P9AWixOGYghL
 qkrqdMesNecjuTAAHvUAlEUT0igg/E152LuQBw6jZbo3ePZSjtSTia7ch2izYagK
 4cbBCXsp8qZ+tw6Hh7np7Qa4HD6M1HcF3FYCJ11H4Y0YjR9daBLXszaVx0++EDZQ
 M1PukHSMYUOgnMaBvwC5aSm8cnhh0om1wo+Jgihz5Z9pJfC6ySQSusMHDdX/3M/N
 H0/DTlLoqb0x7mZ3Ai7H4+/DOCtG1nH4C8ZlxbVvk/Vgy1a3ibsqH2CnRwB+3miq
 GMoIsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k0rjc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 20:29:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-936e393061dso54197385a.2
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788294562; x=1788899362; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gxbf0LEMUm9FuacbIX2IIiTGQs5x0SdQJ5/psKIbaT8=;
 b=Lw8uXf8Wi6In3kzQ3om16IgtAPr07oSYUr3GShkmGzx1X3RngUYsEWsuAc85I08fdZ
 m2V6fd20iAj6Me+5ShE07IVf4g6LiWZm0RUclcqRheVX2yJkKEJXnVT00ouCgu/xDBZj
 w671/V8nKEVVTqdvYg3I8K35Cu5C1IEHoQr6B1C51ENwaozO+PMNFDAWsyT/Rorca4zH
 /XQxJ/8xrKStvmUAbRzeVeY3gRd6ZGMaAFYzxoM1nXmMg05pL11hAqFcv7uIC+6DX8f5
 5FX/OyzFOV5IvSonS3KUna6JIwYZqpLL/Tid+hBri/6NQrXt/nEZSg5tdaSdBroqfz0+
 dPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788294562; x=1788899362;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gxbf0LEMUm9FuacbIX2IIiTGQs5x0SdQJ5/psKIbaT8=;
 b=S4crG+/G1ib9VLGGc049b2cAQJNJSST6bYZ7759ZkIQousFIQnRvO2ZJVIaXGJiydV
 UgaXWUaovyjdRoEPQRZ6ekzK12NuAub2ulQ85b1+T0NGMEkikhhba1cCmCyWRmMGIGak
 zXtPHmtS5Ds8ILm/s965H/OOgsJdXysD9dBVfvCUbCebMIi4uIQeRScoD5uZR9xeb/1h
 R1ZCGrEyqkRawFQ+iro3ChIzsmfxACvBILc+37Mo94qmzNhSxah3hVcRJ46NAB8nwo9d
 ZRY7S40V7FMc2Xem/YA3xtf/lm11z74sh+rI43iDbdhakO/1hWqh4iu+eNxWIYu0urUA
 YueQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqqzauvyKXUiTOdutUG11an46KGewXETTFnBnmyClZqrFRqTJoc0jV3hWP9FEd8ZGDc4B/iCWn8sIGl@nongnu.org
X-Gm-Message-State: AFuF++mbdc22sldu7xjQiyx7Hn18A4SrN5r+bmjo7fEhoAwcgvCc5PdO
 F9kvGGqNTf52i/Yd8VA87vl8mze5ek7tKNyKq3fInrFvwRrBuhtigarOex4dAToVNGwpqkcGvUE
 vfh4QO2Gl+gKZrKx7bbLRM2PNLpCQxus37djPdTrfEVTuLfIeyG2z2cFDLg==
X-Gm-Gg: AR+sD11Ax5vDvsohLiBedIbvQVbBnIxwFOgza85mSnxFd25IfZWKGFWrpkxpfZrum6I
 jSYePDxnpn+RDq2ZV0F+4pPKjw5oiT6yso9oBSUjU51EnCaRd2vFv15U4FQvNUrUEmfuGQi/cEi
 xtviD+Gm9Jxg87hcYvkwQWO/6OX2hF/JvH0gI0T/crbCWkoR6IUYKrvS8TjnSAD+GNNHlaYfL71
 WO5RAyiSVQ6mvZg6Zsr6p8yUiOem21o9bM5bwW8uu9NSG2k+zvK5Jiv9m/FojS8HGEe3Ota9nO6
 mSwTFh6ufi2wWpQ1KieKDv4tORikA4mESxZpKa/eB9+3PdLK0I8/him7fz6xlv1vFFij2vq131V
 TXSIC/MfvvCP4jCnjDzcNZ6gwg276CwXKNLYs
X-Received: by 2002:a05:620a:a913:b0:92e:6a33:7118 with SMTP id
 af79cd13be357-9395ebe1358mr153769985a.30.1788294562001; 
 Tue, 01 Sep 2026 13:29:22 -0700 (PDT)
X-Received: by 2002:a05:620a:a913:b0:92e:6a33:7118 with SMTP id
 af79cd13be357-9395ebe1358mr153760585a.30.1788294561257; 
 Tue, 01 Sep 2026 13:29:21 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f1ae7f8sm28055785a.18.2026.09.01.13.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 13:29:20 -0700 (PDT)
Message-ID: <bb9345ba-1125-408a-8770-d340a734ddd3@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:29:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] hw/riscv, target/riscv: initial n-trace support
To: Konstantin Semichastnov <antikostya2@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexei Filippov <halip0503@gmail.com>
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE3OSBTYWx0ZWRfXxGVw0PWIwpmx
 kS3hwxKGQc0aZSC3V8mKJ3Xo6neEJxD/bMm0FQvuKktphHHjuLzsNki64xjJF43yOeNR8ititbI
 VIOmKqZL2TbSnX/W7rr0wswCJcpJdCv0UXZgHBrZMYE9NjGUqnqqwhYZZWcT5Vi428IY7/I8bND
 OiDk33RO3fELAwP7j4pnDzxx33vRbtNdbxKxwfsGsCClcsvWo3/3Hb71jB5faEr4DPOfxpECcWF
 bA2Oam+bPFhvLKEoUC/BHfL3UdSF1gHWDUUSZ2SW2Fc0c7rkgq1Qtn0nEyq7DzkTVzeCoZ0zH9v
 UzsVYdudrNfwLA6FFo1FqaFkVofcKWYTgEzslxSB0YNE2925wWLFWjgQCatczqUIXn65S6/F1kg
 WxS++4LDuSZi3PwGujOajX/TJDb/hCsGmrf4UjZhi4I3VQzHYjk7EVa0wmzaiQbra8VH7A1tn85
 o0AqsS5ak7wsCbGrZqg==
X-Proofpoint-GUID: cBGNEMBnMI968drRNYXfxCihTnbizz4t
X-Proofpoint-ORIG-GUID: cBGNEMBnMI968drRNYXfxCihTnbizz4t
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a9735a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=HwFc7jivAAAA:8 a=pGLkceISAAAA:8
 a=OLIL841TmuMiggfAf5YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=DN7SgORnOiO7RqxRx1GC:22 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE3OSBTYWx0ZWRfX6RHLlawBL7ll
 aP/LwaPIkeHuarCB/JGeyHI8p0Wib4Z3dPNyOKdOvsKvpmz6dWPiIdyGNtxaSLZNtHQmd9vonLX
 CjuHNeAe8Ahdatd9nbVxl81f1dZ7yzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010179
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi Konstantin,

On 8/25/2026 11:22 AM, Konstantin Semichastnov wrote:
> Hi,
> 
> This series continues to implement RISC-V tracing subsystem.
> This work implements RISC-V N-Trace (Nexus-based Trace) [1].
> 
> N-Trace is a different format for tracing (compared to E-Trace [2]),
> and it is based on same underlying interface: RISC-V Trace Control
> Interface Specification [3].
> 
> This is the first patchset of several upcoming patchset series,
> that will ultimately provide full support for N-Trace HTM tracing.
> 
> A design decision was chosen to make the most of the existing
> infrastructure of the trace subsystem.
> 
> Linux kernel driver support is available here:
> 
> https://lore.kernel.org/linux-riscv/20251002060732.100213-1-apatel@ventanamicro.com/
> 
> Patches based on Daniel's Efficient Trace patchset [4],
> which provides support for Trace Control Interface and E-Trace messages
> implementation.


I *really* need to re-send that series.  I'll do that as soon as I clear up pending
work to avoid holding this series back when it's time to merge it.

Since you're using that series as a base I'll keep you in the loop if I make some
drastic changes in it.  I don't think I will - what comes to mind is some TCG side
changes to take advantage of the extra tb_flags we have now.

I remember from those reviews that we were doing changes in that e-trace message code.
I'll keep that code intact, and in case you decide we need changes we can do it as
a follow-up when stuff is already accepted.

Also, please update my email in the CC in the next versions of this work.  That email
is still around but not sure for how long ...


Thanks,
Daniel




> 
> [1] https://docs.riscv.org/reference/nexus-trace/_attachments/RISC-V-N-Trace.pdf
> [2] https://docs.riscv.org/reference/e-trace/_attachments/riscv-trace-spec.pdf
> [3] https://docs.riscv.org/reference/trace-control-interface/_attachments/RISC-V-Trace-Control-Interface.pdf
> [4] https://lore.kernel.org/qemu-riscv/20251111114656.2285048-1-dbarboza@ventanamicro.com
> 
> Based-on: <20251111114656.2285048-1-dbarboza@ventanamicro.com>
> 
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
> Konstantin Semichastnov (13):
>        hw/riscv/trace-encoder: add ntrace enable flag
>        hw/riscv/trace-encoder.c: add trace ntrace/etrace selection logic
>        hw/riscv: add n-trace encoder with ProgTraceSync message
>        hw/riscv/trace-encoder.c: align ntrace messages with ones
>        hw/riscv/trace_encoder, target/riscv: add trace pc history logic
>        hw/riscv: add n-trace IndirectBranchHist rv-trace-message
>        hw/riscv/trace-encoder: add interrupt support to N-Trace encoder
>        hw/riscv: add n-trace ResourceFull rv-trace-message
>        hw/riscv: add n-trace ProgTraceCorrelation rv-trace-message
>        test/qtest/riscv-trace-test: add test-ntrace-simple qtest
>        hw/riscv/trace-encoder.c: add remaining fields to trace-encoder
>        hw/riscv/trace-encoder.c: remaining fields to ram-sink as RO values
>        hw/riscv/trace-encoder: refactor register accesses
> 
>   disas/riscv.c                                  |   2 +-
>   disas/riscv.h                                  |   2 +
>   hw/riscv/rv-trace-messages.c                   | 265 ++++++++++++++++++++
>   hw/riscv/rv-trace-messages.h                   |  10 +
>   hw/riscv/trace-encoder.c                       | 332 +++++++++++++++++++++----
>   hw/riscv/trace-encoder.h                       |  49 +++-
>   hw/riscv/trace-ram-sink.c                      |  22 +-
>   hw/riscv/trace-ram-sink.h                      |   1 +
>   target/riscv/cpu_helper.c                      |  21 +-
>   target/riscv/helper.h                          |   4 +-
>   target/riscv/insn_trans/trans_privileged.c.inc |  10 +-
>   target/riscv/insn_trans/trans_rvi.c.inc        |  15 +-
>   target/riscv/trace_helper.c                    |  23 +-
>   target/riscv/translate.c                       |  19 +-
>   tests/qtest/riscv-trace-test.c                 |  59 ++++-
>   15 files changed, 734 insertions(+), 100 deletions(-)
> ---
> base-commit: 6cedd046f606f155e054375c369bd606313e5f6c
> change-id: 20260825-upstream-ntrace_core-49bff943062d
> 
> Best regards,
> --
> Konstantin Semichastnov <antikostya2@gmail.com>
> 
> 


