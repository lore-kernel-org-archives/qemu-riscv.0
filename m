Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77727606A326
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErdCIeTe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj8r0mqH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPOJb-0005Zu-0U; Fri, 06 Nov 2026 13:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPOJW-0005Z1-Id
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 13:05:25 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPOJT-0000Ow-6v
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 13:05:22 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A6HsxH34112106
 for <qemu-riscv@nongnu.org>; Fri, 6 Nov 2026 18:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tcMWvYme3+YGeK1YfM37cDjLBAz/jJM+qVu1QTX+mx4=; b=ErdCIeTeeNmhzTm/
 5PilaY+1HYHj/7DgIoodKC/O2qi6UB5cJCrVUtbG0Dr8Nfg+ZJX0PCSA2ecJeAja
 wUcYQvKymnEXDXBFdly6UV0LcGZNjaVwW7ojKbZ+316aEGvg50s9sVKNdPhsevcb
 xpG0i+6JZMfefcScUWcorNYbz2KHAqArGW6SRiBZgk7RIC+C+2rOfC+kr9h3Y1Jn
 xAwP0hePr76YKoWL+uO9b/wH5pCL1l/E7qcZP3Ia8utVll+6+2f24m/nndJUlc+k
 +wHjn4rx1BymvHH7gQm5oEP7ANgv0FpT6pJLlCvoDlW6UqMPP7HEbCO58IT8VPnL
 3wMKdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9m0t0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 18:05:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3700be873ebso684332eec.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793988316; x=1794593116; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tcMWvYme3+YGeK1YfM37cDjLBAz/jJM+qVu1QTX+mx4=;
 b=Sj8r0mqHQigGZ+aWdsBpftEXHCpNu8wzAmvDTK7w9b0tOTyqCAiiwHf79iCSyXZ3DO
 yL/6EeWy9x+BRHKxmU7spHudcG3Skj3dXkTCXChxLuzpbfLuiwQ4ltqU0ITQ8USdZYfP
 Nm79wnNDcoz73ZcUV85Y2dO/IBAoBr7re6jAJfA0bSO+cReAJZ6WtLCbH7H8Qzj85PGb
 aWuwLE5h/WRhXFQ9qSkOyfEaPxBYTtcGZjewGcS8gFG8bCNajCSYf4i6B2Llom2O66d4
 k1BE3CdhFJlShsHElvSF2EdZtkjs81oc5mF1ba/hn4wY6LCeilVyln3MF9mcuh+Nrv23
 zZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793988316; x=1794593116;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tcMWvYme3+YGeK1YfM37cDjLBAz/jJM+qVu1QTX+mx4=;
 b=dblEnGnGh0SbXef/ho7vcrVdqkeur7uVH0qLHlFTB7VDRlxjr74Eaw4pPst7gTIGwY
 DUNSJuCxJ32l5v1fgN0h5GZYPAn7qcWJQhfsJ1e1zMskVGkCgEHbXzZVtQGzrj0vxovD
 nwV8O1gVB29VvTvBN0i2nl2mAywK2KLDJ0b3kxprVIREzBFA7UaZs/2m9JZSrcVfbGqo
 nlpZQHcjmf6FXGcouhbuNF+S3ToGl7PEFAEwNH3mheuPBaZg8K6aHU5HQ1Bgq36nWR2g
 NkUZVFnyXR8rg28tlbALsTED/V0WtoE0jAftX/qFlzYMVYSdjcSMgGWuUnC58MHEyfxD
 jmYg==
X-Forwarded-Encrypted: i=1;
 AL+hErE36HdxR6tq5MnsqxdAhNoxZdIa4cx8J+Xb1pNEjcJiSGvV1EKmdkpI1KYRdP3LKmGSKIhxjQAuVL7m@nongnu.org
X-Gm-Message-State: APuU4Z9mUd6tckLD2EMFd3u+IPUZODRBXXuD2AQW6jHqEyhFbrj2EYsN
 odgG+m5GTgk1virGI6LkrPqLTnzRshDkbRJXoivdbzfnuxoqDyh5JBTF2mclQav7hYho3pi5nXP
 4WqEqyGp8jjGqVjrA80EZIyuhCtPVYbOm4PwQncIqoRdlQk94ohRlgFkTsg==
X-Gm-Gg: AYBFou2p6TxtIIbcdCGgRWJX0y/9/UClqr4/GgnE1V51uhQzT4yOr9pKwzgi6Gql2Ym
 YdVqavPcQaiM5o/WoarNcC5bei2vFF/UpguzgE8j6d0RWrIZWUXoizeVBCeNFFF75sJxqdEYs1A
 1gVNj79Wvw566YopP4bUMbkuBUTCESHOzd/2NhjcBz1E+ZUrr7NTJv3q1sT6ncZdWCTwaB/gt4P
 u/4AwH0Ww/T9ukMMe+yhxYEZjMDfDTUQYJYXuHZcc19l2kPojELGQ/WnJmJvgfrcG7m5W34SVbf
 ltIF1lr85XDABr+E9Q1fZQfYVF6R61z8GHXH6YCac6+wmO0wYTciRescHCcaIzaLnjiLT2RbQML
 cc5zC5wqIaxFVv2N7XLpaWhL8S/23RVitU2MLiWvBGEaqRbZvPi5R6hNVzXFhc22MlfJqChowrr
 EM1Dbs8XqE1u4LcO3sZUtgSt85OyKyklamMGyhtlbUqA==
X-Received: by 2002:a05:7300:ea83:b0:36a:37:1404 with SMTP id
 5a478bee46e88-36f78ea36dfmr4322835eec.13.1793988315919; 
 Fri, 06 Nov 2026 10:05:15 -0800 (PST)
X-Received: by 2002:a05:7300:ea83:b0:36a:37:1404 with SMTP id
 5a478bee46e88-36f78ea36dfmr4322791eec.13.1793988315252; 
 Fri, 06 Nov 2026 10:05:15 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36fa651e6b1sm18554425eec.3.2026.11.06.10.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 10:05:13 -0800 (PST)
Message-ID: <1825f706-5013-4f0f-bf2f-4dc2413bc3f9@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:05:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Register accel-$cpu_type for all targets
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106023936.772-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f3DM_DhLevJXaGMXa6b5LmL2-u5t6bo6
X-Proofpoint-GUID: f3DM_DhLevJXaGMXa6b5LmL2-u5t6bo6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MiBTYWx0ZWRfXwnLguneMscHK
 zztfR6fM+5tvncAXyGAjhnKtM4Ct88u0mcRCleAEhNKniWVSr0E3MDSal1OmybUNrUq+wOKx9ZF
 0s6XP88lcDyZdeoiAKV9b79qU7FRAPY=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aee16dc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5vwi3AZKjZg2J1XA_hsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MiBTYWx0ZWRfX1g/UXUbdfd/e
 ddLRa1iYoZ7dPyEIqYLu48ktLNIzO5pAz7iyVNKUuJUON5Pv+HXBtsYXZBhEq9+sbVA4m1Sf1H9
 fYB1fbG9d3YWgCelRdMPZONI0T6SubYsh6LRZeTw9f+FwTAFGVmJd6uKITynV3eFyw1k+LF78Cq
 i4wLQbc1xsYa8frPzxqplPLADqnzFlJEc6qMHmXQpMzfBkRRg1hjYYGEBPRO0iIQwks0sggPD5S
 iLrICR8MG4bttp8u0hU7A92b8j/KUqe0o2dH1tUGO7+XUX8pM6EX2zAT7MkF8bzqtnoWf4dNI11
 ra7hHBMC/ORg0F6rZe17aXsf77Bruc4jQ3z8E5gydwgmXSF0rr/ipEWuUWi6gCYl9b0U3SXvIxy
 tCVqv8vTgak6FO5R7f0Y/9xB2VKx4/PzB0J4jBWHq4h7vzO70N71gTOqyEX1bZTbNTUZi9k6DEh
 sQiL6cvuyjrxFIYob5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 6:39 PM, Yonggang Luo wrote:
> A multi-target system binary links more than one target.
> accel_cpu_register_type() creates the abstract parent accel-$cpu_type for each
> target that has an AccelCPU subclass. ARM, i386, RISC-V, and PowerPC call it.
> Other targets have no such subclass, and machine init skips a missing class.
> 
> test-multi-target already instantiates every QOM type, so this series adds no
> parent check.
> 
> This is an alternative to gating accelerator CPU types with is_available. The
> RISC-V TCG and KVM gates are reverted here as redundant.
> 
> v4: https://lore.kernel.org/qemu-devel/20261105183310.1614-1-luoyonggang@gmail.com/
> 
> Changes v4 -> v5:
> 
> - Drop test_accel_cpu_parent(). test_qom_types_are_unique() already instantiates
>   every QOM type
> 
> Yonggang Luo (3):
>   accel: register CPU parent only for AccelCPU subclasses
>   Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu to riscv
>     targets"
>   Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu to riscv
>     targets"
> 
>  accel/accel-common.c       | 6 ++----
>  include/accel/accel-cpu.h  | 2 ++
>  target/arm/cpu.c           | 2 ++
>  target/i386/cpu.c          | 2 ++
>  target/ppc/cpu_init.c      | 2 ++
>  target/riscv/cpu.c         | 8 ++++++++
>  target/riscv/kvm/kvm-cpu.c | 2 --
>  target/riscv/tcg/tcg-cpu.c | 1 -
>  8 files changed, 18 insertions(+), 7 deletions(-)
> 

Thanks Yonggang, I'll pull this as part of multi-target once the trunk
reopens.

Regards,
Pierrick

